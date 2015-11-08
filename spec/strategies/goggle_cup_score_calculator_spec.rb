require 'spec_helper'


describe GoggleCupScoreCalculator, type: :strategy do
  before :each do
    @fix_goggle_cup = create(:goggle_cup)
    @fix_swimmer    = create(:swimmer)

    # Data forced from seeds
    @fix_pool_type  = PoolType.only_for_meetings[ ((rand * 100) % PoolType.only_for_meetings.count).to_i ]
    @fix_event_type = EventType.are_not_relays[ ((rand * 100) % EventType.are_not_relays.count).to_i ]
  end

  context "with requested parameters" do
    subject { GoggleCupScoreCalculator.new( @fix_goggle_cup, @fix_swimmer, @fix_pool_type, @fix_event_type ) }

    describe "#get_goggle_cup_standard," do
      it "responds to get_goggle_cup_standard methods" do
        expect(subject).to respond_to(:get_goggle_cup_standard)
      end
      it "returns a time standard instance if the request goggle cup standard exists" do
        create(:goggle_cup_standard,
          goggle_cup_id: @fix_goggle_cup.id,
          swimmer_id: @fix_swimmer.id,
          event_type_id: @fix_event_type.id,
          pool_type_id: @fix_pool_type.id
        ) if subject.get_goggle_cup_standard.nil?
        expect( subject.get_goggle_cup_standard ).to be_an_instance_of( GoggleCupStandard )
      end
      it "returns nil if the request goggle cup standard doesnt exists" do
        wrong_pool_type = PoolType.where(is_suitable_for_meetings: false).first
        score_1000 = GoggleCupScoreCalculator.new( @fix_goggle_cup, @fix_swimmer, wrong_pool_type, @fix_event_type )
        expect( score_1000.get_goggle_cup_standard ).to be_nil
      end
    end
    #-- -----------------------------------------------------------------------

    describe "#get_goggle_cup_score," do
      before :each do
        @fix_time_swam = Timing.new(((rand * 99) % 99).to_i + 1, ((rand * 59) % 59).to_i + 1, ((rand * 10) % 10).to_i)
        create(:goggle_cup_standard,
          goggle_cup_id: @fix_goggle_cup.id,
          swimmer_id: @fix_swimmer.id,
          event_type_id: @fix_event_type.id,
          pool_type_id: @fix_pool_type.id
        ) if subject.get_goggle_cup_standard.nil?
      end
      it "responds to get_goggle_cup_score methods" do
        expect(subject).to respond_to(:get_goggle_cup_score)
      end
      it "returns a numeric value" do
        expect( subject.get_goggle_cup_score(@fix_time_swam) ).to be >= 0
      end
      #-- -----------------------------------------------------------------------

      context "goggle cup standard present" do
        it "checks for correct calculation for goggle cup standard present better than time swam" do
          worst_time_swam = Timing.new(subject.get_goggle_cup_standard.get_timing_instance.to_hundreds + 150)
          expect( subject.get_goggle_cup_score(worst_time_swam) ).to be < @fix_goggle_cup.max_points
        end
        it "checks for correct calculation for goggle cup standard present worst than time swam" do
          better_time_swam = Timing.new(subject.get_goggle_cup_standard.get_timing_instance.to_hundreds - 150)
          expect( subject.get_goggle_cup_score(better_time_swam) ).to be > @fix_goggle_cup.max_points
        end
        it "checks for correct calculation for goggle cup standard present equal to time swam" do
          same_time_swam = Timing.new(subject.get_goggle_cup_standard.get_timing_instance.to_hundreds)
          expect( subject.get_goggle_cup_score(same_time_swam) ).to eq(@fix_goggle_cup.max_points)
        end
      end
      #-- -----------------------------------------------------------------------

      context "goggle cup standard not present" do
        it "checks for correct calculation for no goggle cup standard present" do
          wrong_pool_type = PoolType.where(is_suitable_for_meetings: false).first
          score_1000 = GoggleCupScoreCalculator.new( @fix_goggle_cup, @fix_swimmer, wrong_pool_type, @fix_event_type )
          expect( score_1000.get_goggle_cup_score(@fix_time_swam) ).to eq(@fix_goggle_cup.max_points)
        end
        it "creates a new goggle cup standard" do
          wrong_pool_type = PoolType.where(is_suitable_for_meetings: false).first
          score_1000 = GoggleCupScoreCalculator.new( @fix_goggle_cup, @fix_swimmer, wrong_pool_type, @fix_event_type )
          expect( score_1000.get_goggle_cup_standard ).to be_nil
          score_1000.get_goggle_cup_score(@fix_time_swam)
          expect( score_1000.get_goggle_cup_standard ).to be_an_instance_of( GoggleCupStandard )
        end
      end
      #-- -----------------------------------------------------------------------
    end
    #-- -----------------------------------------------------------------------

    describe "#set_goggle_cup_standard," do
      before :each do
        @fix_time_swam = Timing.new(((rand * 99) % 99).to_i + 1, ((rand * 59) % 59).to_i + 1, ((rand * 10) % 10).to_i)
      end
      it "responds to set_goggle_cup_standard methods" do
        expect(subject).to respond_to(:set_goggle_cup_standard)
      end
      it "returns true" do
        expect( subject.set_goggle_cup_standard(@fix_time_swam) ).to be true
      end

      context "goggle cup standard doesn't exist" do
        before :each do
          wrong_pool_type = PoolType.where(is_suitable_for_meetings: false).first
          @fix_new_standard = GoggleCupScoreCalculator.new( @fix_goggle_cup, @fix_swimmer, wrong_pool_type, @fix_event_type )
        end

        it "goggle cup standard doesn't exists" do
          expect( @fix_new_standard.get_goggle_cup_standard ).to be_nil
        end
        it "creates a new goggle cup standard" do
          expect( @fix_new_standard.set_goggle_cup_standard(@fix_time_swam) ).to be true
        end
        it "goggle cup standard created is a GoggleCupStandard instance" do
          @fix_new_standard.set_goggle_cup_standard(@fix_time_swam)
          expect( @fix_new_standard.get_goggle_cup_standard ).to be_an_instance_of( GoggleCupStandard )
        end
        it "goggle cup standard is equal to time swam" do
          @fix_new_standard.set_goggle_cup_standard(@fix_time_swam)
          expect( @fix_new_standard.get_goggle_cup_standard.get_timing_instance.to_hundreds ).to be @fix_time_swam.to_hundreds
        end
      end

      context "goggle cup standard already exists" do
        before :each do
          @fix_time_swam = Timing.new(((rand * 99) % 99).to_i + 1, ((rand * 59) % 59).to_i + 1, ((rand * 10) % 10).to_i)
          create(:goggle_cup_standard,
            goggle_cup_id: @fix_goggle_cup.id,
            swimmer_id: @fix_swimmer.id,
            event_type_id: @fix_event_type.id,
            pool_type_id: @fix_pool_type.id
          ) if subject.get_goggle_cup_standard.nil?
        end

        it "goggle cup standard exists" do
          expect( subject.get_goggle_cup_standard ).to be_an_instance_of( GoggleCupStandard )
        end
        it "updates the goggle cup standard" do
          expect( subject.set_goggle_cup_standard(@fix_time_swam) ).to be true
        end
        it "goggle cup standard is equal to time swam" do
          subject.set_goggle_cup_standard(@fix_time_swam)
          expect( subject.get_goggle_cup_standard.get_timing_instance.to_hundreds ).to be @fix_time_swam.to_hundreds
        end
      end
    end
    #-- -----------------------------------------------------------------------
  end
  #-- -----------------------------------------------------------------------
    
  context "Goggle cup time standard definition" do
    # Leega
    # Use existing swimmers with results to test those features
    #
    let(:goggle_cup)     { create(:goggle_cup, season_year: Date.today.year) }
    let(:active_swimmer) { Meeting.has_results.sort{ rand - 0.5 }[0].meeting_individual_results.sort{ rand - 0.5 }[0].swimmer }

    subject { GoggleCupScoreCalculator.new( goggle_cup, @fix_swimmer, @fix_pool_type, @fix_event_type ) }

    describe "#oldest_swimmer_result," do
      it "returns a date" do
        expect( subject.oldest_swimmer_result( active_swimmer ) ).to be_an_instance_of( Date )
      end
      it "returns a date not greater than other one of swimmer results" do
        expect( subject.oldest_swimmer_result( active_swimmer ) ).to be <= active_swimmer.meeting_individual_results.sort{ rand - 0.5 }[0].get_scheduled_date
      end
    end
    #-- -----------------------------------------------------------------------

    describe "#get_periods_to_scan," do
      it "returns an array" do
        expect( subject.get_periods_to_scan( active_swimmer ) ).to be_a_kind_of( Array )
      end
      it "returns an array of dates" do
        expect( subject.get_periods_to_scan( active_swimmer ) ).to all(be_a_kind_of( Date ))
      end
      it "returns a sorted array of dates" do
        dates = subject.get_periods_to_scan( active_swimmer )
        elem = 1
        while elem < dates.size do
          expect( dates[elem] ).to be < dates[elem - 1]
          elem = elem + 1
        end
      end
      it "returns an array of dates with only one element older than oldest_swimer_result" do
        oldest_swimmer_result = subject.oldest_swimmer_result( active_swimmer )
        older_dates = 0
        subject.get_periods_to_scan( active_swimmer ).each do |date|
          older_dates += 1 if date <= oldest_swimmer_result
        end
        expect( older_dates ).to eq( 1 )
      end
    end
    #-- -----------------------------------------------------------------------
    
    describe "#find_swimmer_goggle_cup_standard," do
      it "returns an array" do
        expect( subject.find_swimmer_goggle_cup_standard( active_swimmer ) ).to be_a_kind_of( Array )
      end
      it "returns an array of hashes" do
        expect( subject.get_periods_to_scan( active_swimmer ) ).to all(be_a_kind_of( Hash ))
      end
      it "returns an array cointaining at least one element" do
        expect( subject.find_swimmer_goggle_cup_standard( active_swimmer ).size ).to be >= 1
      end
      
    end   
    #-- -----------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++
end
