require 'rails_helper'


describe RelaySwimmersCombiner, type: :strategy do

  let(:fix_season)           { Season.find( 181 ) }
  let(:fix_team)             { Team.find( 1 ) }
  let(:s4x50sl_meeting)      { Meeting.find( 18104 ) }
  let(:s4x50sl_relay)        { s4x50sl_meeting.meeting_events.joins(:event_type).where("event_types.is_a_relay").first }
  let(:m4x50mx_meeting)      { Meeting.find( 18102 ) }
  let(:m4x50mx_relay)        { m4x50mx_meeting.meeting_events.joins(:event_type).where("event_types.is_a_relay").first }
  let(:male)                 { GenderType.find_by_code( 'M' ) }
  let(:female)               { GenderType.find_by_code( 'F' ) }
  let(:leega_badge)          { Swimmer.find( 23 ).badges.where(["season_id = ?", fix_season.id]).first }
  let(:team_badge)           { fix_team.badges.where(["season_id = ?", fix_season.id]).sample }
  let(:new_badge)            { create( :badge, season: fix_season, category_type: fix_season.category_types.sample ) }
  
  subject { RelaySwimmersCombiner.new(fix_team, s4x50sl_relay) }

  describe "[a well formed instance]" do
    it "sets given team" do
      expect( subject.team ).to be_an_instance_of( Team )
      expect( subject.team.id ).to eq( fix_team.id )
    end
    it "sets given meeting_event" do
      expect( subject.meeting_event ).to be_an_instance_of( MeetingEvent )
      expect( subject.meeting_event.id ).to eq( s4x50sl_relay.id )
    end

    it_behaves_like( "(the existance of a method returning numeric values)", [
      :default_points 
    ])
    
    it_behaves_like( "(the existance of a method returning an array)", [
      :retreive_swimmers 
    ])
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#retreive_swimmers" do
    it "returns a non empty array for Reggio Emilia 2019" do
      expect( subject.retreive_swimmers().size ).to be > 0 
    end
    it "returns an array cotaining numbers" do
      expect( subject.retreive_swimmers() ).to all( be > 0 ) 
    end
    it "returns an array cotaining swimmers ids" do
      swimmers_ids = subject.retreive_swimmers()
      swimmers_ids.each do |swimmer_id|
        expect( Swimmer.find(swimmer_id)).to be_an_instance_of( Swimmer )
      end
    end
    it "returns only males swimmers if no gender specified" do
      swimmers_ids = subject.retreive_swimmers()
      swimmers_ids.each do |swimmer_id|
        expect( Swimmer.find(swimmer_id).gender_type_id ).to eq( male.id )
      end
    end
    it "returns only males swimmers if male gender specified" do
      swimmers_ids = subject.retreive_swimmers(male.id)
      swimmers_ids.each do |swimmer_id|
        expect( Swimmer.find(swimmer_id).gender_type_id ).to eq( male.id )
      end
    end
    it "returns only females swimmers if female gender specified" do
      swimmers_ids = subject.retreive_swimmers(female.id)
      swimmers_ids.each do |swimmer_id|
        expect( Swimmer.find(swimmer_id).gender_type_id ).to eq( female.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
      
  describe "#find_suggested_time" do
    it "returns a timing istance if default set and no results present" do
      expect( subject.find_suggested_time( new_badge.swimmer, new_badge, true ) ).to be_an_instance_of( Timing ) 
    end
    it "returns nil if no results and default not set" do
      expect( subject.find_suggested_time( new_badge.swimmer, new_badge, false ) ).to be_nil 
    end
    it "returns always a timing istance if default set" do
      expect( subject.find_suggested_time( team_badge.swimmer, team_badge, true ) ).to be_an_instance_of( Timing ) 
    end
    it "returns a timing istance if default not set but results present" do
      expect( subject.find_suggested_time( leega_badge.swimmer, leega_badge, false ) ).to be_an_instance_of( Timing ) 
    end
  end
  #-- -------------------------------------------------------------------------
  #++
      
  describe "#load_phases_suggested_times" do
    it "returns an array" do
      expect( subject.load_phases_suggested_times(team_badge.swimmer_id)).to be_a_kind_of( Array )
    end
    it "returns an array with one element for 4x50SL" do
      expect( subject.load_phases_suggested_times(team_badge.swimmer_id).size ).to eq( 1 )
    end
    it "returns 4 elements for leega in a mixed relay" do
      rsc = RelaySwimmersCombiner.new(fix_team, m4x50mx_relay)
      expect( rsc.load_phases_suggested_times(leega_badge.swimmer_id).size ).to eq( 4 )
    end
    it "returns from 1 up to 4 elements for any team swimmer in a mixed relay" do
      rsc = RelaySwimmersCombiner.new(fix_team, m4x50mx_relay)
      elements = rsc.load_phases_suggested_times(team_badge.swimmer_id).size
      expect( elements ).to be >= 1
      expect( elements ).to be <= 4
    end
  end
  #-- -------------------------------------------------------------------------
  #++



end
