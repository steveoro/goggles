require 'spec_helper'


describe ScoreCalculator, type: :strategy do
  before :each do
    @fix_swimmer = create(:swimmer)

    # Leega
    # FIXME Data forced for FIN current season
    @fix_season        = Season.get_last_season_by_type( 'MASFIN' )
    @fix_gender_type   = @fix_swimmer.gender_type
    @fix_category_type = @fix_swimmer.get_category_type_for_season( @fix_season.id )
    @fix_pool_type     = PoolType.only_for_meetings.find( ((rand * 2) % 2).to_i + 1 )
    @fix_event_type    = EventType.are_not_relays.find( ((rand * 20) % 20).to_i + 1 )
  end

  context "with requested parameters for given swimmer" do
    subject { ScoreCalculator.new( @fix_season, @fix_gender_type, @fix_category_type, @fix_pool_type, @fix_event_type ) }

    describe "#get_time_standard," do
      it "responds to get_time_standard methods" do
        expect(subject).to respond_to(:get_time_standard)
      end
      it "returns a time standard istance if the request time standard exists" do
        create(:time_standard,
          season_id: @fix_season.id,
          gender_type_id: @fix_gender_type.id,
          category_type_id: @fix_category_type.id,
          event_type_id: @fix_event_type.id,
          pool_type_id: @fix_pool_type.id
        ) if subject.get_time_standard.nil?
        expect( subject.get_time_standard ).to be_an_instance_of( TimeStandard )
      end
    end
    #-- -----------------------------------------------------------------------

    describe "#get_fin_score," do
      before :each do
        @fix_time_swam = Timing.new(((rand * 99) % 99).to_i + 1, ((rand * 59) % 59).to_i + 1, ((rand * 10) % 10).to_i)
        create(:time_standard,
          season_id: @fix_season.id,
          gender_type_id: @fix_gender_type.id,
          category_type_id: @fix_category_type.id,
          event_type_id: @fix_event_type.id,
          pool_type_id: @fix_pool_type.id
        ) if subject.get_time_standard.nil?
      end
      it "responds to get_fin_score methods" do
        expect(subject).to respond_to(:get_fin_score)
      end
      it "returns a numeric value" do
        expect( subject.get_fin_score(@fix_time_swam) ).to be >= 0
      end
      #-- -----------------------------------------------------------------------

      it "checks for correct calculation for no time standard present" do
        wrong_pool_type = PoolType.where(is_suitable_for_meetings: false).first
        score_1000 = ScoreCalculator.new( @fix_season, @fix_gender_type, @fix_category_type, wrong_pool_type, @fix_event_type )
        expect( score_1000.get_fin_score(@fix_time_swam) ).to eq(1000)
      end
      it "checks for correct calculation for time standard present better than time swam" do
        worst_time_swam = Timing.new(subject.get_time_standard.get_timing_instance.to_hundreds + 150)
        expect( subject.get_fin_score(worst_time_swam) ).to be < 1000
      end
      it "checks for correct calculation for time standard present worst than time swam" do
        better_time_swam = Timing.new(subject.get_time_standard.get_timing_instance.to_hundreds - 150)
        expect( subject.get_fin_score(better_time_swam) ).to be > 1000
      end
      it "checks for correct calculation for time standard present equal to time swam" do
        same_time_swam = Timing.new(subject.get_time_standard.get_timing_instance.to_hundreds)
        expect( subject.get_fin_score(same_time_swam) ).to eq(1000)
      end
      #-- -----------------------------------------------------------------------
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
