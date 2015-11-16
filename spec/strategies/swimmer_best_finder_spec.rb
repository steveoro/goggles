require 'spec_helper'
require 'wrappers/timing'


describe SwimmerBestFinder, type: :strategy do

  context "with requested parameters" do
    let(:csi_season_type) { SeasonType.find_by_code('MASCSI') }
    let(:csi_season)      { csi_season_type.seasons.is_ended.sort{ rand - 0.5 }[0] }
    let(:active_team)     { csi_season.teams.sort{ rand - 0.5 }[0] }
    let(:active_swimmer)  { active_team.badges.for_season( csi_season ).sort{ rand - 0.5 }[0].swimmer }

    subject { SwimmerBestFinder.new( active_swimmer ) }

    it_behaves_like( "(the existance of a method)", [
      :swimmer 
    ] )

    describe "#parameters," do
      it "are the given parameters" do
        expect( subject.swimmer ).to eq( active_swimmer )
      end
    end
    #-- -----------------------------------------------------------------------
    
    describe "#get_closed_seasons_involved_into, " do
      it "returns an array" do
        expect( subject.get_closed_seasons_involved_into ).to be_a_kind_of( ActiveRecord::Relation )
      end
      it "returns an array of seasons" do
        expect( subject.get_closed_seasons_involved_into ).to all(be_an_instance_of( Season ))
      end
      it "returns an array of ended seasons" do
        subject.get_closed_seasons_involved_into.each do |season|
          expect( season.is_season_ended_at ).to be true
        end
      end
      it "returns an array of sorted seasons" do
        seasons = subject.get_closed_seasons_involved_into
        elem = 1
        while elem < seasons.size do
          expect( seasons[elem].begin_date ).to be <= seasons[elem - 1].begin_date
          elem = elem + 1
        end
      end
      it "returns an array of seasons of given season type" do
        subject.get_closed_seasons_involved_into( csi_season_type ).each do |season|
          expect( season.season_type.code ).to eq( csi_season_type.code )
        end
      end
      it "returns an array of seasons same season type if given" do
        expect( subject.get_closed_seasons_involved_into( csi_season_type ).map{ |s| s.season_type.code }.uniq.count ).to eq( 1 )
      end
      it "returns an array of seasons of different season types if any" do
        fix_swimmer = Swimmer.find(23)
        fix_sbf     = SwimmerBestFinder.new( fix_swimmer )
        expect( fix_sbf.get_closed_seasons_involved_into.map{ |s| s.season_type.code }.uniq.count ).to be > 1
      end
    end
    #-- -----------------------------------------------------------------------
    
    describe "#get_involved_season_last_best_for_event," do
      it "returns a timing instance if event already swam" do
        fix_swimmer = Swimmer.find(23)
        fix_sbf     = SwimmerBestFinder.new( fix_swimmer )
        fix_event   = EventType.find_by_code('50FA')
        fix_pool    = PoolType.find_by_code('25')
        expect( fix_sbf.get_involved_season_last_best_for_event( fix_sbf.get_closed_seasons_involved_into, fix_event, fix_pool ) ).to be_an_instance_of( Timing )
      end
      it "returns nil if event not already swam" do
        fix_swimmer = Swimmer.find(23)
        fix_sbf     = SwimmerBestFinder.new( fix_swimmer )
        fix_event   = EventType.find_by_code('100MI')
        fix_pool    = PoolType.find_by_code('50')
        expect( fix_sbf.get_involved_season_last_best_for_event( fix_sbf.get_closed_seasons_involved_into, fix_event, fix_pool ) ).to be_nil        
      end
      it "returns nil if event not already swam in the correct season type" do
        fix_swimmer = Swimmer.find(23)
        fix_sbf     = SwimmerBestFinder.new( fix_swimmer )
        fix_event   = EventType.find_by_code('200FA')
        fix_pool    = PoolType.find_by_code('25')
        expect( fix_sbf.get_involved_season_last_best_for_event( fix_sbf.get_closed_seasons_involved_into( csi_season_type ), fix_event, fix_pool ) ).to be_nil        
      end
      it "returns a time swam in the past season if any" do
        fix_swimmer = Swimmer.find(23)
        fix_sbf     = SwimmerBestFinder.new( fix_swimmer )
        fix_event   = EventType.find_by_code('200MI')
        fix_pool    = PoolType.find_by_code('25')
        fix_seasons = csi_season_type.seasons.is_ended_before( Date.new(2015, 11, 15) ).sort_season_by_begin_date('DESC')
        expect( fix_swimmer.meeting_individual_results.is_not_disqualified.for_season( fix_seasons.first ).for_pool_type( fix_pool ).for_event_type( fix_event ).count ).to be > 0
        expect( fix_sbf.get_involved_season_last_best_for_event( fix_seasons, fix_event, fix_pool ) ).to eq( fix_swimmer.meeting_individual_results.is_not_disqualified.for_season( fix_seasons.first ).for_pool_type( fix_pool ).for_event_type( fix_event ).sort_by_timing('ASC').first.get_timing_instance )
      end
      it "returns a time swam in an older season if not swimmed in the past one" do
        fix_swimmer = Swimmer.find(23)
        fix_sbf     = SwimmerBestFinder.new( fix_swimmer )
        fix_event   = EventType.find_by_code('400MI')
        fix_pool    = PoolType.find_by_code('50')
        fix_seasons = csi_season_type.seasons.is_ended_before( Date.new(2015, 11, 15) ).sort_season_by_begin_date('DESC')
        expect( fix_swimmer.meeting_individual_results.is_not_disqualified.for_season( fix_seasons.first ).for_pool_type( fix_pool ).for_event_type( fix_event ).count ).to eq( 0 )
        expect( fix_sbf.get_involved_season_last_best_for_event( fix_seasons, fix_event, fix_pool ) ).to be_an_instance_of( Timing )
      end
      it "returns a time swam if swam before or nil if not" do
        event = EventsByPoolType.not_relays.sort{ rand - 0.5 }[0]
        if active_swimmer.meeting_individual_results.is_not_disqualified.for_closed_seasons.for_pool_type( event.pool_type ).for_event_type( event.event_type ).count > 0
          expect( subject.get_involved_season_last_best_for_event( subject.get_closed_seasons_involved_into, event.event_type, event.pool_type ) ).to be_an_instance_of( Timing )
        else
          expect( subject.get_involved_season_last_best_for_event( subject.get_closed_seasons_involved_into, event.event_type, event.pool_type ) ).to be nil
        end 
      end
    end
    #-- -----------------------------------------------------------------------

    describe "#get_involved_season_last_best_for_key," do
      it "returns a time swam if swam before or nil if not" do
        event = EventsByPoolType.not_relays.sort{ rand - 0.5 }[0]
        if active_swimmer.meeting_individual_results.is_not_disqualified.for_closed_seasons.for_pool_type( event.pool_type ).for_event_type( event.event_type ).count > 0
          expect( subject.get_involved_season_last_best_for_key( subject.get_closed_seasons_involved_into, event.get_key ) ).to be_an_instance_of( Timing )
        else
          expect( subject.get_involved_season_last_best_for_key( subject.get_closed_seasons_involved_into, event.get_key ) ).to be nil
        end 
      end
    end
    #-- -----------------------------------------------------------------------

    describe "#get_season_type_best_for_event," do
      it "returns a timing instance if event already swam" do
        fix_swimmer = Swimmer.find(23)
        fix_sbf     = SwimmerBestFinder.new( fix_swimmer )
        fix_event   = EventType.find_by_code('50FA')
        fix_pool    = PoolType.find_by_code('25')
        expect( fix_sbf.get_season_type_best_for_event( csi_season_type, fix_event, fix_pool ) ).to be_an_instance_of( Timing )
      end
      it "returns nil if event not already swam" do
        fix_swimmer = Swimmer.find(23)
        fix_sbf     = SwimmerBestFinder.new( fix_swimmer )
        fix_event   = EventType.find_by_code('100MI')
        fix_pool    = PoolType.find_by_code('50')
        expect( fix_sbf.get_season_type_best_for_event( csi_season_type, fix_event, fix_pool ) ).to be_nil        
      end
      it "returns a time swam if swam before or nil if not" do
        event = EventsByPoolType.not_relays.sort{ rand - 0.5 }[0]
        if active_swimmer.meeting_individual_results.is_not_disqualified.for_season_type( csi_season_type ).for_closed_seasons.for_pool_type( event.pool_type ).for_event_type( event.event_type ).count > 0
          expect( subject.get_season_type_best_for_event( csi_season_type, event.event_type, event.pool_type ) ).to be_an_instance_of( Timing )
        else
          expect( subject.get_season_type_best_for_event( csi_season_type, event.event_type, event.pool_type ) ).to be nil
        end 
      end
    end
    #-- -----------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++

  context "without requested parameters" do
    it "raises an exception for wrong swimmer parameter" do
      expect{ SwimmerBestFinder.new }.to raise_error( ArgumentError )
      expect{ SwimmerBestFinder.new( 'Wrong type parameter' ) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
