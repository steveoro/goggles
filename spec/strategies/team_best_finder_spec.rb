require 'spec_helper'
require 'wrappers/timing'


describe TeamBestFinder, type: :strategy do

  let(:season_type)     { SeasonType.where("code in ('MASCSI', 'MASFIN')").sort{ rand - 0.5 }[0] }
  let(:season)          { season_type.seasons[(rand * (season_type.seasons.count - 1)).to_i] }
  let(:active_team)     { season_type.teams[(rand * (season_type.teams.count - 1)).to_i] }
  let(:gender)          { GenderType.individual_only[(rand * (GenderType.individual_only.count - 1)).to_i] }
  let(:pool)            { PoolType.only_for_meetings[(rand * (PoolType.only_for_meetings.count - 1)).to_i] }
  let(:event)           { EventType.are_not_relays.for_fin_calculation[(rand * (EventType.are_not_relays.for_fin_calculation.count - 1)).to_i] }
  let(:category)        { season.category_types.are_not_relays[(rand * (season.category_types.are_not_relays.count - 1)).to_i] }
  let(:fin_season)      { SeasonType.find_by_code('MASFIN').seasons[(rand * (season_type.seasons.count - 1)).to_i] }
  let(:fix_team)        { Team.find(1) }
  let(:fix_tbf)         { TeamBestFinder.new( fix_team ) }

  subject { TeamBestFinder.new( active_team ) }

  context "with requested parameters" do
    it_behaves_like( "(the existance of a method)", [
      :team,
      :distinct_categories,
      :gender_types,
      :pool_types,
      :event_types,
      :set_genders,
      :set_pools,
      :set_events,
      :retrieve_distinct_categories,
      :category_needs_split?,
      :has_individual_result?,
      :get_team_best_individual_result
    ] )

    describe "#parameters," do
      it "are the given parameters" do
        expect( subject.team ).to eq( active_team )
        expect( subject.distinct_categories.size ).to be > 0
      end
    end

    describe "#gender_types," do
      it "are the default pool types" do
        expect( subject.gender_types.count ).to eq( 2 )
        expect( subject.gender_types ).to include( GenderType.find_by_code('M'))
        expect( subject.gender_types ).to include( GenderType.find_by_code('F'))
      end
    end

    describe "#pool_types," do
      it "are the default pool types" do
        expect( subject.pool_types.count ).to eq( 2 )
        expect( subject.pool_types ).to include( PoolType.find_by_code('25'))
        expect( subject.pool_types ).to include( PoolType.find_by_code('50'))
      end
    end

    describe "#event_types," do
      it "are the default event types" do
        expect( subject.event_types.count ).to eq( 18 )
        expect( subject.event_types ).to include( EventType.find_by_code('100MI'))
        expect( subject.event_types ).to include( EventType.find_by_code('1500SL'))
        expect( subject.event_types ).not_to include( EventType.find_by_code('25SL'))
      end
    end
    #-- -----------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#set_genders," do
    it "sets gender_types attribute" do
      subject.set_genders( gender )
      expect( subject.gender_types ).to be gender
    end
    it "sets default gender types if no arguments" do
      subject.set_genders( gender )
      subject.set_genders
      expect( subject.gender_types.count ).to eq( 2 )
      expect( subject.gender_types ).to include( GenderType.find_by_code('M'))
      expect( subject.gender_types ).to include( GenderType.find_by_code('F'))
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#set_pools," do
    it "sets pool_types attribute" do
      subject.set_pools( pool )
      expect( subject.pool_types ).to be pool
    end
    it "sets default pool types if no arguments" do
      subject.set_pools( pool )
      subject.set_pools
      expect( subject.pool_types.count ).to eq( 2 )
      expect( subject.pool_types ).to include( PoolType.find_by_code('25'))
      expect( subject.pool_types ).to include( PoolType.find_by_code('50'))
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#set_events," do
    it "sets event_types attribute" do
      subject.set_events( event )
      expect( subject.event_types ).to be event
    end
    it "sets default event types if no arguments" do
      subject.set_events( event )
      subject.set_events
      expect( subject.event_types.count ).to eq( 18 )
      expect( subject.event_types ).to include( EventType.find_by_code('100MI'))
      expect( subject.event_types ).to include( EventType.find_by_code('1500SL'))
      expect( subject.event_types ).not_to include( EventType.find_by_code('25SL'))
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#retrieve_distinct_categories," do
    it "returns an array" do
      expect( subject.retrieve_distinct_categories ).to be_an_instance_of( Array )
    end
    it "returns an array of category types" do
      expect( subject.retrieve_distinct_categories ).to all(be_an_instance_of( CategoryType ))
    end
    it "returns a non empty array of category types for team with results" do
      expect( subject.retrieve_distinct_categories.size ).to be > 0
    end
    it "returns an array of category with distinct codes" do
      distinct_categories = subject.retrieve_distinct_categories
      distinct_categories.each do |category_type|
        expect( distinct_categories.count{ |e| e.code == category_type.code } ).to eq( 1 ) 
      end 
    end
    it "returns an array of category with at least OVER, SEN, M60, 50S for Ober Ferrari" do
      fix_cat  = fix_tbf.retrieve_distinct_categories 
      expect( fix_cat.size ).to be >= 4 
      expect( fix_cat.size ).to be <= 25 
      expect( fix_cat.rindex{ |e| e.code == 'OVER' } ).to be > 0 
      expect( fix_cat.rindex{ |e| e.code == 'SEN' } ).to be > 0 
      expect( fix_cat.rindex{ |e| e.code == 'M60' } ).to be > 0 
      expect( fix_cat.rindex{ |e| e.code == '50S' } ).to be > 0 
    end
  end
  #-- -----------------------------------------------------------------------

  describe "#category_needs_split?," do
    it "returns a boolean" do
      expect( subject.category_needs_split?( category ) ).to eq( true ).or eq( false )
    end
    it "returns true for undivided categories" do
      fix_category = CategoryType.find_by_code('50S')
      expect( fix_tbf.category_needs_split?( fix_category ) ).to eq( true )
    end
    it "returns true for CSI grouped categories as OVER" do
      fix_category = CategoryType.find_by_code('OVER')
      expect( fix_tbf.category_needs_split?( fix_category ) ).to eq( true )
    end
    it "returns false for standard FIN categories for multiple season types" do
      fin_category = fin_season.category_types.are_not_relays.where("code like 'M%'")[(rand * (fin_season.category_types.are_not_relays.where("code like 'M%'").count - 1)).to_i]
      expect( fix_tbf.category_needs_split?( fin_category ) ).to eq( false )
    end
    it "returns true for non standard FIN categories (U25) for multiple season types" do
      u25_category = fin_season.category_types.are_not_relays.where("code like 'U%'")[(rand * (fin_season.category_types.are_not_relays.where("code like 'U%'").count - 1)).to_i]
      expect( fix_tbf.category_needs_split?( u25_category ) ).to eq( true )
    end
    it "returns false for non standard FIN categories (U25) for only FIN season types" do
      u25_category = fin_season.category_types.are_not_relays.where("code like 'U%'")[(rand * (fin_season.category_types.are_not_relays.where("code like 'U%'").count - 1)).to_i]
      fix_tbf.distinct_categories.delete_if{ |e| e.code = 'M20' }
      expect( fix_tbf.distinct_categories.rindex{ |e| e.code == 'M20' } ).to be nil 
      expect( fix_tbf.category_needs_split?( u25_category ) ).to eq( false )
    end
    it "returns true for CSI grouped categories (OVER) for multiple season types" do
      over_category = CategoryType.find_by_code('OVER')
      expect( fix_tbf.category_needs_split?( over_category ) ).to eq( true )
    end
    it "returns false for CSI grouped categories (OVER) for only CSI season types" do
      over_category = CategoryType.find_by_code('OVER')
      fix_tbf.distinct_categories.delete_if{ |e| e.age_begin > 55 || e.code == 'M55' }
      expect( fix_tbf.distinct_categories.rindex{ |e| e.code == 'OVER' } ).to be > 0 
      expect( fix_tbf.category_needs_split?( over_category ) ).to eq( false )
    end
  end
  #-- -----------------------------------------------------------------------

  describe "#has_individual_result?," do
    it "returns a boolean" do
      expect( subject.has_individual_result?( gender, pool, event, category.code ) ).to eq( true ).or eq( false )
    end
    it "returns false for event without results" do
      fix_pool = PoolType.find_by_code('50')
      fix_event = EventType.find_by_code('100MI')
      expect( subject.has_individual_result?( gender, fix_pool, fix_event, category.code ) ).to be false
    end
    it "returns true for event with results" do
      fix_mir = active_team.meeting_individual_results.is_not_disqualified[(rand * (active_team.meeting_individual_results.is_not_disqualified.count - 1)).to_i]
      fix_gender   = fix_mir.gender_type
      fix_pool     = fix_mir.pool_type
      fix_event    = fix_mir.event_type
      fix_category = fix_mir.category_type
      expect( subject.has_individual_result?( fix_gender, fix_pool, fix_event, fix_category.code ) ).to be true
    end
  end
  #-- -----------------------------------------------------------------------

  describe "#get_team_best_individual_result," do
    it "returns a meeting individual result or nil" do
      expect( subject.get_team_best_individual_result( gender, pool, event, category.code ) ).to be_an_instance_of( MeetingIndividualResult ).or be_nil
    end
    it "returns nil for event without results" do
      fix_pool = PoolType.find_by_code('50')
      fix_event = EventType.find_by_code('100MI')
      expect( subject.get_team_best_individual_result( gender, fix_pool, fix_event, category.code ) ).to be_nil
    end
    it "returns a meeting individual result for event with results" do
      fix_mir = active_team.meeting_individual_results.is_not_disqualified[(rand * (active_team.meeting_individual_results.is_not_disqualified.count - 1)).to_i]
      fix_gender   = fix_mir.gender_type
      fix_pool     = fix_mir.pool_type
      fix_event    = fix_mir.event_type
      fix_category = fix_mir.category_type
      expect( subject.get_team_best_individual_result( fix_gender, fix_pool, fix_event, fix_category.code ) ).to be_an_instance_of( MeetingIndividualResult )
    end
  end
  #-- -----------------------------------------------------------------------

  context "without requested parameters" do
    it "raises an exception for wrong swimmer parameter" do
      expect{ TeamBestFinder.new }.to raise_error( ArgumentError )
      expect{ TeamBestFinder.new( 'Wrong type parameter' ) }.to raise_error( ArgumentError )
    end
    it "raises an exception for team without results" do
      expect{ TeamBestFinder.new( create( :team ) ) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
