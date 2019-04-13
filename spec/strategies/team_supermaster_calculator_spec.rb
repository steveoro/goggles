require 'rails_helper'


describe TeamSupermasterCalculator, type: :strategy do

  let(:fix_team_affiliation) { TeamAffiliation.find( 5197 ) }  # CSI Nuoto Ober Ferrari - 182
  let(:fin_Ober_season)      { TeamAffiliation.where("team_id = 1 and season_id in (152, 162, 172, 182)").sample }  # CSI Nuoto Ober Ferrari FIN season

  let(:fix_team)             { fix_team_affiliation.team }
  let(:fix_season )          { fix_team_affiliation.season }

  let(:rnd_meeting_id )      { [18201, 18202, 18205, 18224].sample }
  let(:rnd_date)             { Date.today() - (rand * 300).to_i }
  let(:rnd_event_type_code)  { EventType.are_not_relays.sample.code }
  let(:rnd_minutes )         { (rand * 5).to_i }
  let(:rnd_seconds )         { (rand * 59).to_i }
  let(:rnd_hundreds )        { (rand * 99).to_i }
  let(:rnd_time_swam)        { Timing.new(rnd_hundreds, rnd_seconds, rnd_minutes) }
  let(:sql_time_swam )       { rnd_minutes.to_s + ':' + rnd_seconds.to_s + ':' + rnd_hundreds.to_s }
  let(:rnd_standard_points ) { 500.00 + (rand * 510).to_i + ((rand * 99).to_i / 100) }
  let(:rnd_sql_response )    { rnd_standard_points.to_s + ";" + sql_time_swam + ";" + rnd_meeting_id.to_s + ";" + rnd_date.to_s }

  let(:leega)             { Swimmer.find( 23 ) }
  let(:steve)             { Swimmer.find( 142 ) }

  subject { TeamSupermasterCalculator.new(fix_team_affiliation) }

  describe "[a well formed instance]" do
    it "assigns team_affiliation as given parameter" do
      expect( subject.team_affiliation ).to eq( fix_team_affiliation )
    end
    it "assigns team as given parameter" do
      expect( subject.team ).to eq( fix_team_affiliation.team )
    end
    it "assigns season as given parameter" do
      expect( subject.season ).to eq( fix_team_affiliation.season )
    end
    it "determines u25 min year based on season" do
      expect( subject.u25_year ).to eq( fix_team_affiliation.season.end_date.year() -25 )
    end
    it "determines min date for M25 first year valid meetings" do
      expect( subject.min_m25_date ).to eq( Date.new( fix_team_affiliation.season.end_date.year(), 1, 1 ) )
    end
    it "creates a false swimmer result getter flag" do
      expect( subject.got_swimmer_results ).to eq( false )
    end
    it "creates an empty team_supermaster_dao" do
      expect( subject.team_supermaster_dao.size ).to eq( 0 )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#get_swimmer_results" do
    it "returns an array" do
      expect( subject.get_swimmer_results() ).to be_a_kind_of( Array )
    end
    it "sets got_swimmer_results to true" do
      expect( subject.got_swimmer_results ).to eq( false )
      subject.get_swimmer_results()
      expect( subject.got_swimmer_results ).to eq( true )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#extract_event_detail" do
    it "returns an hash" do
      expect( subject.extract_event_detail( rnd_sql_response ) ).to be_an_instance_of( Hash )
    end
    it "returns an hash which responds to specific keys" do
      details_hash = subject.extract_event_detail( rnd_sql_response )
      expect( details_hash[:standard_points] ).not_to be nil
      expect( details_hash[:time_swam] ).not_to be nil
      expect( details_hash[:meeting_id] ).not_to be nil
      expect( details_hash[:scheduled_date] ).not_to be nil
    end
    it "returns an hash which contains valid values" do
      details_hash = subject.extract_event_detail( rnd_sql_response )
      expect( details_hash[:standard_points] ).to be > 0
      expect( details_hash[:time_swam] ).to be_an_instance_of( Timing )
      expect( Meeting.find( details_hash[:meeting_id] ) ).to be_an_instance_of( Meeting )
      expect( details_hash[:scheduled_date] ).to be_an_instance_of( Date )
    end
    it "returns an hash which contains given sql concat values" do
      details_hash = subject.extract_event_detail( rnd_sql_response )
      expect( details_hash[:standard_points] ).to eq( rnd_standard_points )
      expect( details_hash[:time_swam] ).to eq( rnd_time_swam )
      expect( details_hash[:meeting_id] ).to eq( rnd_meeting_id )
      expect( details_hash[:scheduled_date] ).to eq( rnd_date )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#parse_swimmer_results" do
    it "returns a number" do
      expect( subject.parse_swimmer_results() ).to be >= 0
    end
    it "got swimmer results" do
      expect( subject.got_swimmer_results ).to eq( false )
      subject.parse_swimmer_results()
      expect( subject.got_swimmer_results ).to eq( true )
    end
    it "populates team_supermaster_dao array" do
      expect( subject.team_supermaster_dao.size ).to eq( 0 )
      swimmer_count = subject.parse_swimmer_results()
      expect( swimmer_count ).to be > 10
      expect( swimmer_count ).to be < 50
      expect( subject.team_supermaster_dao.size ).to eq( swimmer_count )
    end
    it "populates team_supermaster_dao array with SupermasterTeamSwimmerDAO elements" do
      swimmer_count = subject.parse_swimmer_results()
      expect( subject.team_supermaster_dao ).to all(be_an_instance_of( SupermasterTeamSwimmerDAO ) )
    end
    it "finds results for Steve and Leega in Ober Ferrari FIN seasons" do
      tsc = TeamSupermasterCalculator.new(fin_Ober_season)
      swimmer_count = tsc.parse_swimmer_results()
      expect( swimmer_count ).to be > 5
      expect( swimmer_count ).to be < 50
      expect( tsc.team_supermaster_dao.index{|sd| sd.swimmer_id == leega.id } ).to be >= 0
      expect( tsc.team_supermaster_dao.index{|sd| sd.swimmer_id == steve.id } ).to be >= 0
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
