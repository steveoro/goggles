require 'spec_helper'


describe ScoreCalculator do
  before :each do
    @fix_swimmer = create(:swimmer)

    # Leega
    # FIXME Data forced for FIN current season
    @fix_season = Season.get_last_season_by_type( 'MASFIN' )
    @fix_pool_type = PoolType.only_for_meetings.find( ((rand * 2) % 2).to_i + 1 )
    @fix_event_type = EventType.are_not_relays.find( ((rand * 20) % 20).to_i + 1 ) 
  end

  context "with requested parameters" do
    subject { ScoreCalculator.new( @fix_swimmer, @fix_season, @fix_pool_type, @fix_event_type ) }

    describe "[get_swimmer_gender]" do
      it "respond to get_swimmer_gender methods" do
        expect( subject.get_swimmer_gender ).to respond_to
      end
      it "returns a gender_type istance" do
        expect( subject.get_swimmer_gender ).to be_an_instance_of( GenderType )
      end
    end
    #-- -----------------------------------------------------------------------

    describe "[get_swimmer_category]" do
      it "respond to get_swimmer_category methods" do
        expect( subject.get_swimmer_category ).to respond_to
      end
      it "returns a category_type istance" do
        expect( subject.get_swimmer_category ).to be_an_instance_of( CategoryType )
      end
    end
    #-- -----------------------------------------------------------------------

    describe "[get_fin_score] with a valid timing" do
      before :each do
        @fix_time_swam = Timing.new(((rand * 99) % 99).to_i + 1, ((rand * 59) % 59).to_i + 1, ((rand * 10) % 10).to_i)
      end
      it "respond to get_fin_score methods" do
        expect( subject.get_fin_score(@fix_time_swam) ).to respond_to
      end
      it "returns a numeric value" do
        expect( subject.get_fin_score(@fix_time_swam) ).to be >= 0
      end
    end
    #-- -----------------------------------------------------------------------
    
    xit "check for correct calculation for no time standrd present"
    xit "check for correct calculation for time standrd present better than timing"
    xit "check for correct calculation for time standrd present worst than timing"
    xit "check for correct calculation for time standrd present equal to timing"
  end
  #-- -------------------------------------------------------------------------
  #++
end
