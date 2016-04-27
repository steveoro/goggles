require 'spec_helper'
require 'wrappers/timing'


describe TeamBestFinder, type: :strategy do

  let(:season_type)     { SeasonType.where("code in ('MASCSI', 'MASFIN')").sort{ rand - 0.5 }[0] }
  let(:season)          { season_type.seasons.has_results[(rand * (season_type.seasons.has_results.count - 1)).to_i] }
  let(:active_team)     { season.teams.has_many_results.count > 0 ? season.teams.has_many_results[(rand * (season.teams.has_many_results.count - 1)).to_i] : Team.find(1) }
  let(:gender)          { GenderType.individual_only[(rand * (GenderType.individual_only.count - 1)).to_i] }
  let(:pool)            { PoolType.only_for_meetings[(rand * (PoolType.only_for_meetings.count - 1)).to_i] }
  let(:event)           { EventType.are_not_relays.for_fin_calculation[(rand * (EventType.are_not_relays.for_fin_calculation.count - 1)).to_i] }
  let(:category)        { season.category_types.are_not_relays[(rand * (season.category_types.are_not_relays.count - 1)).to_i] }
  let(:fin_season)      { SeasonType.find_by_code('MASFIN').seasons[(rand * (season_type.seasons.count - 1)).to_i] }
  let(:fix_team)        { Team.find(1) }
  let(:fix_tbf)         { TeamBestFinder.new( fix_team ) }
  let(:fix_mir)         { active_team.meeting_individual_results.is_not_disqualified[(rand * (active_team.meeting_individual_results.is_not_disqualified.count - 1)).to_i] }

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
      :find_category_by_code,
      :category_needs_split?,
      :get_category_to_split_into,
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

  describe "#find_category_by_code," do
    it "returns a category type or nil" do
      expect( subject.find_category_by_code( category.code ) ).to be_an_instance_of( CategoryType ).or be nil
    end
    it "returns nil for a wrong category code" do
      expect( subject.find_category_by_code( 'WRONG_CAT' ) ).to be nil
    end
    it "returns a category type with the given code if present" do
      element = subject.distinct_categories.rindex{ |e| e.code == category.code }
      if element
        expect( subject.find_category_by_code( category.code ) ).to be_an_instance_of( CategoryType )
        expect( subject.find_category_by_code( category.code ).code ).to eq( category.code )
      else
        expect( subject.find_category_by_code( category.code ) ).to be nil
      end
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

  describe "#get_category_to_split_into," do
    it "returns a category type" do
      expect( subject.get_category_to_split_into( fix_mir ) ).to be_an_instance_of( CategoryType )
    end
    it "returns the same category if split not needed" do
      m45_mir = fix_team.meeting_individual_results.for_category_code('M45')[(rand * (fix_team.meeting_individual_results.for_category_code('M45').count - 1)).to_i]
      expect( m45_mir.category_type.code ).to eq( 'M45' )
      expect( fix_tbf.get_category_to_split_into( m45_mir ).code ).to eq( 'M45' )
      m30_mir = fix_team.meeting_individual_results.for_category_code('M30')[(rand * (fix_team.meeting_individual_results.for_category_code('M30').count - 1)).to_i]
      expect( m30_mir.category_type.code ).to eq( 'M30' )
      expect( fix_tbf.get_category_to_split_into( m30_mir ).code ).to eq( 'M30' )
    end
    it "returns a different category if split needed" do
      over_mir = fix_team.meeting_individual_results.for_category_code('OVER')[(rand * (fix_team.meeting_individual_results.for_category_code('OVER').count - 1)).to_i]
      expect( over_mir.category_type.code ).to eq( 'OVER' )
      expect( fix_tbf.get_category_to_split_into( over_mir ).code ).not_to eq( 'OVER' )
      s50_mir = fix_team.meeting_individual_results.for_category_code('50S')[(rand * (fix_team.meeting_individual_results.for_category_code('50S').count - 1)).to_i]
      expect( s50_mir.category_type.code ).to eq( '50S' )
      expect( fix_tbf.get_category_to_split_into( s50_mir ).code ).not_to eq( '50S' )
    end
    it "returns the correct category if split needed" do
      over_mir = fix_team.meeting_individual_results.for_category_code('OVER')[(rand * (fix_team.meeting_individual_results.for_category_code('OVER').count - 1)).to_i]
      split_cat = fix_tbf.get_category_to_split_into( over_mir )
      swimmer_age = over_mir.get_swimmer_age
      expect( over_mir.category_type.age_begin ).to be <= swimmer_age 
      expect( over_mir.category_type.age_end ).to be >= swimmer_age 
      expect( split_cat.age_begin ).to be <= swimmer_age 
      expect( split_cat.age_end ).to be >= swimmer_age 
      s50_mir = fix_team.meeting_individual_results.for_category_code('50S')[(rand * (fix_team.meeting_individual_results.for_category_code('50S').count - 1)).to_i]
      split_cat = fix_tbf.get_category_to_split_into( s50_mir )
      swimmer_age = s50_mir.get_swimmer_age
      expect( s50_mir.category_type.age_begin ).to be <= swimmer_age 
      expect( s50_mir.category_type.age_end ).to be >= swimmer_age 
      expect( split_cat.age_begin ).to be <= swimmer_age 
      expect( split_cat.age_end ).to be >= swimmer_age 
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
      fix_gender   = fix_mir.gender_type
      fix_pool     = fix_mir.pool_type
      fix_event    = fix_mir.event_type
      fix_category = fix_mir.category_type
      expect( subject.get_team_best_individual_result( fix_gender, fix_pool, fix_event, fix_category.code ) ).to be_an_instance_of( MeetingIndividualResult )
    end
    it "returns the best meeting individual result for event with results" do
      results = []
      new_team = create( :team )
      mp = create( :meeting_program )
      fix_gender   = mp.gender_type
      fix_pool     = mp.pool_type
      fix_event    = mp.event_type
      fix_category = mp.category_type
      result_num = ( rand * 10 ).to_i + 5
      (1..result_num).each do
        results << create( :meeting_individual_result, meeting_program: mp, team: new_team ).get_timing_instance.to_hundreds
      end
      results.sort!

      # DEBUG
      #expect( results.size ).to eq( result_num )
      #puts results.inspect
      # DEBUG
      
      new_tbf = TeamBestFinder.new( new_team )
      new_best = new_tbf.get_team_best_individual_result( fix_gender, fix_pool, fix_event, fix_category.code )
      expect( new_best ).to be_an_instance_of( MeetingIndividualResult )
      expect( new_best.get_timing_instance.to_hundreds ).to eq( results[0] )
      expect( new_best.get_timing_instance.to_hundreds ).to be <= results[( rand * ( result_num - 2 ) ).to_i + 1]
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
