require 'spec_helper'
require 'wrappers/timing'


describe GoggleCupStandardFinder, type: :strategy do

  context "with requested parameters" do
    # Leega
    # Use existing team and swimmer with results to test those features
    #
    let(:active_team)    { Meeting.has_results.sort{ rand - 0.5 }[0].meeting_individual_results.sort{ rand - 0.5 }[0].team }
    let(:goggle_cup)     { create( :goggle_cup, season_year: Date.today.year, team: active_team ) }
    let(:active_swimmer) { goggle_cup.team.meeting_individual_results.sort{ rand - 0.5 }[0].swimmer }

    subject { GoggleCupStandardFinder.new( goggle_cup ) }

    it_behaves_like( "(the existance of a method)", [
      :goggle_cup, 
      :swimmers, :get_involved_swimmers, :create_goggle_cup_standards, :delete_goggle_cup_standards
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
      it "returns an hash containg istance of timing" do
        subject.find_swimmer_goggle_cup_standard( active_swimmer ).each_value do |standard_time|
          expect( standard_time ).to be_an_instance_of( Timing )
        end
      end
      it "returns a timing istance for an event swam" do
        swam_mir = active_swimmer.meeting_individual_results.sort_by_date.first
        swam_event_by_pool_type = "#{swam_mir.event_type.code}-#{swam_mir.pool_type.code}"  # Should use events_by_pool_type.get_key
        expect( subject.find_swimmer_goggle_cup_standard( active_swimmer )[ swam_event_by_pool_type ] ).to be_an_instance_of( Timing ) 
      end
      
    end   
    #-- -----------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++

  context "without requested parameters" do
    it "raises an exception for wrong goggle_cup parameter" do
      expect{ GoggleCupStandardFinder.new }.to raise_error( ArgumentError )
      expect{ GoggleCupStandardFinder.new( 'Wront type parameter' ) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
