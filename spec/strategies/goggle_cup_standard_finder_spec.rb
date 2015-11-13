require 'spec_helper'
require 'wrappers/timing'


describe GoggleCupStandardFinder, type: :strategy do

  context "with requested parameters" do
    # Leega
    # Use existing team and swimmer with results to test those features
    #
    let(:csi_season)     { SeasonType.find_by_code('MASCSI').seasons.is_ended.sort{ rand - 0.5 }[0] }
    let(:active_team)    { csi_season.teams.uniq.sort{ rand - 0.5 }[0] }
    let(:goggle_cup)     { create( :goggle_cup, season_year: Date.today.year, team: active_team ) }
    let(:active_swimmer) { goggle_cup.team.swimmers.has_results.uniq.sort{ rand - 0.5 }[0] }

    subject { GoggleCupStandardFinder.new( goggle_cup ) }

    it_behaves_like( "(the existance of a method)", [
      :goggle_cup, 
      :swimmers, :get_involved_swimmers, :create_goggle_cup_standards, :delete_goggle_cup_standards,
      :sql_diff_text_log
    ] )

    describe "#parameters," do
      it "are the given parameters" do
        expect( subject.goggle_cup ).to eq( goggle_cup )
      end
    end
    #-- -----------------------------------------------------------------------

    describe "#get_involved_swimmers," do
      it "returns an array" do
        expect( subject.get_involved_swimmers ).to be_a_kind_of( Array )
      end
      it "returns an array of swimmers" do
        expect( subject.get_involved_swimmers ).to all( be_an_instance_of( Swimmer ) )
      end
      it "returns no more than total team swimmers" do
        expect( subject.get_involved_swimmers.size ).to be <= goggle_cup.team.swimmers.count
      end
    end
    #-- -----------------------------------------------------------------------

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
      it "returns an hash" do
        expect( subject.find_swimmer_goggle_cup_standard( active_swimmer ) ).to be_a_kind_of( Hash )
      end
      it "returns an hash containing at least one element" do
        expect( subject.find_swimmer_goggle_cup_standard( active_swimmer ).size ).to be >= 1
      end
      it "returns an hash containg instance of timing" do
        subject.find_swimmer_goggle_cup_standard( active_swimmer ).each_value do |standard_time|
          expect( standard_time ).to be_an_instance_of( Timing )
        end
      end
      it "returns an hash containg events by pool types as keys" do
        subject.find_swimmer_goggle_cup_standard( active_swimmer ).each_key do |event_key|
          expect( EventsByPoolType.find_by_key( event_key ) ).to be_an_instance_of( EventsByPoolType )
        end
      end
      it "returns a timing instance for an event swam" do
        swam_mir = active_swimmer.meeting_individual_results.sort_by_date.first
        swam_event_by_pool_type = "#{swam_mir.event_type.code}-#{swam_mir.pool_type.code}"  # Should use events_by_pool_type.get_key
        expect( subject.find_swimmer_goggle_cup_standard( active_swimmer )[ swam_event_by_pool_type ] ).to be_an_instance_of( Timing ) 
      end
      it "returns no more than goggle cup standard already presents for a stored goggle cup" do
        # Should use a stored goggle cup
        stored_goggle_cup = GoggleCup.is_closed_now.sort{ rand - 0.5 }[0]
        #involved_swimmer  = stored_goggle_cup.swimmers.has_results.uniq.sort{ rand - 0.5 }[0]
        involved_swimmer  = Swimmer.find(23)
        finder = GoggleCupStandardFinder.new( stored_goggle_cup )
        expect( finder.find_swimmer_goggle_cup_standard( involved_swimmer ).count ).to be <= stored_goggle_cup.goggle_cup_standards.for_swimmer( involved_swimmer ).count 
      end
      it "returns the same goggle cup standard already presents for a stored goggle cup" do
        # Should use a stored goggle cup
        stored_goggle_cup = GoggleCup.is_closed_now.sort{ rand - 0.5 }[0]
        #involved_swimmer  = stored_goggle_cup.swimmers.has_results.uniq.sort{ rand - 0.5 }[0]
        involved_swimmer  = Swimmer.find(23)
        finder = GoggleCupStandardFinder.new( stored_goggle_cup )
        finder.find_swimmer_goggle_cup_standard( involved_swimmer ).each_pair do |found_key, found_standard|
          event_by_pool_type = EventsByPoolType.find_by_key( found_key )
          expect( found_standard ).to eq( stored_goggle_cup.goggle_cup_standards.for_swimmer( involved_swimmer ).for_event_and_pool( event_by_pool_type ).first.get_timing_instance )
        end 
      end
    end   
    #-- -----------------------------------------------------------------------
    
    describe "#delete_goggle_cup_standards," do
      it "appends text to sql diff" do
        previous_size = subject.sql_diff_text_log.size
        subject.delete_goggle_cup_standards
        expect( subject.sql_diff_text_log.size ).to be > previous_size
      end
      it "deletes all goggle cup standard times presents" do
        # Should use goggle cup with standard times presents
        goggle_cup_with_standards = create( :goggle_cup_with_standards, team: active_team )
        expect( goggle_cup_with_standards.goggle_cup_standards.count ).to be > 0
        finder = GoggleCupStandardFinder.new( goggle_cup_with_standards )
        finder.delete_goggle_cup_standards
        expect( goggle_cup_with_standards.goggle_cup_standards.count ).to eq( 0 )
      end
    end   
    #-- -----------------------------------------------------------------------

    describe "#create_goggle_cup_standards," do
      it "appends text to sql diff" do
        previous_size = subject.sql_diff_text_log.size
        subject.create_goggle_cup_standards
        expect( subject.sql_diff_text_log.size ).to be > previous_size
      end
      it "creates at least one goggle_cup_standard for each swimmer involved" do
        subject.delete_goggle_cup_standards
        subject.create_goggle_cup_standards
        expect( goggle_cup.goggle_cup_standards.count ).to be >= subject.swimmers.count
      end
    end   
    #-- -----------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++

  context "without requested parameters" do
    it "raises an exception for wrong goggle_cup parameter" do
      expect{ GoggleCupStandardFinder.new }.to raise_error( ArgumentError )
      expect{ GoggleCupStandardFinder.new( 'Wrong type parameter' ) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
