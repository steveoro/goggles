# encoding: utf-8

require 'rails_helper'
require 'common/format'

describe TeamStatsDAO, type: :model do

  let(:team)                { Team.first(300).sample }
  let(:meeting_date)        { Date.today() }
  let(:meeting_id)          { (rand * 10000).to_i }
  let(:meeting_description) { 'Fucking meeting n° ' + ( rand * 50 ).to_i.to_s }
  let(:federation_code)     { FederationType.all.sample.code }
  let(:meeting_count)       { (rand * 300).to_i + 1 }

  let(:first_meeting)       { TeamStatsDAO::MeetingTeamStatsDAO.new( meeting_date - 100, meeting_id, meeting_description + '_older', federation_code ) }
  let(:last_meeting)        { TeamStatsDAO::MeetingTeamStatsDAO.new( meeting_date + 100, meeting_id + 100, meeting_description + '_newer', federation_code ) }

  context "MeetingTeamStatsDAO subelement," do

    subject { TeamStatsDAO::MeetingTeamStatsDAO.new( meeting_date, meeting_id, meeting_description, federation_code ) }

    it_behaves_like( "(the existance of a method)", [
      :meeting_date, :meeting_id, :meeting_description, :federation_code
    ] )

    describe "when initialized with parameters" do
      it "returns given values" do
        detail = TeamStatsDAO::MeetingTeamStatsDAO.new( meeting_date, meeting_id,  meeting_description, federation_code )
        expect( detail.meeting_date ).to eq( meeting_date )
        expect( detail.meeting_id ).to eq( meeting_id )
        expect( detail.meeting_description ).to eq( meeting_description )
        expect( detail.federation_code ).to eq( federation_code )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "DetailTeamStatsDAO subelement," do

    subject { TeamStatsDAO::DetailTeamStatsDAO.new() }

    it_behaves_like( "(the existance of a method returning numeric values)", [
      :meters_swam, :time_swam, :disqualifications,
    ] )

    describe "when initialized without parameters" do
      it "returns zero for all methods" do
        expect( subject.meters_swam ).to eq( 0 )
        expect( subject.time_swam ).to eq( 0 )
        expect( subject.disqualifications ).to eq( 0 )
      end
    end

    describe "when initialized with parameters" do
      it "returns given values" do
        meters_swam       = (rand * 100).to_i
        time_swam         = (rand * 100).to_i
        disqualifications = (rand * 10).to_i
        detail = TeamStatsDAO::DetailTeamStatsDAO.new( meters_swam, time_swam,  disqualifications)
        expect( detail.meters_swam ).to eq( meters_swam )
        expect( detail.time_swam ).to eq( time_swam )
        expect( detail.disqualifications ).to eq( disqualifications )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "DataTeamStatsDAO subelement," do

    subject { TeamStatsDAO::DataTeamStatsDAO.new() }

    it_behaves_like( "(the existance of a method returning numeric values)", [
      :meetings_count
    ] )

    it_behaves_like( "(the existance of a method)", [
      :first_meeting_dao, :last_meeting_dao, :individuals, :relays
    ] )

    describe "when iniatlized without parameters" do
      it "sets zero or nil elements" do
        expect( subject.meetings_count ).to eq( 0 )
        expect( subject.first_meeting_dao ).to be_nil
        expect( subject.last_meeting_dao ).to be_nil
        expect( subject.individuals ).to be_an_instance_of( TeamStatsDAO::DetailTeamStatsDAO )
        expect( subject.individuals.meters_swam ).to eq ( 0 )
        expect( subject.relays ).to be_an_instance_of( TeamStatsDAO::DetailTeamStatsDAO )
        expect( subject.relays.meters_swam ).to eq ( 0 )
      end
    end

    describe "#when initialized with given parameters" do
      it "returns given parameters" do
        data = TeamStatsDAO::DataTeamStatsDAO.new( meeting_count, first_meeting,  last_meeting )
        expect( data.meetings_count ).to eq( meeting_count )
        expect( data.first_meeting_dao ).to eq( first_meeting )
        expect( data.last_meeting_dao ).to eq( last_meeting )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "TeamStatsDAO general element," do

    subject { TeamStatsDAO.new( team ) }

    it_behaves_like( "(the existance of a method)", [
      :team, :federations, :summary
    ] )

    it_behaves_like( "(the existance of a method returning numeric values)", [
      :get_meetings_count,
      :get_meters_swam, :get_disqualifications,
      :get_relay_meters_swam, :get_relay_disqualifications,
    ])

    describe "#team" do
      it "returns a team" do
        expect( subject.team ).to be_an_instance_of( Team )
      end
      it "contains the given parameter" do
        expect( subject.team ).to eq( team )
      end
    end

    describe "#federation" do
      it "is an hash" do
        expect( subject.federations ).to be_a_kind_of( Hash )
      end
      it "is an empty hash" do
        expect( subject.federations.size ).to eq( 0 )
      end
    end

    describe "#summary" do
      it "is a DataTeamStatsDAO" do
        expect( subject.summary ).to be_a_instance_of( TeamStatsDAO::DataTeamStatsDAO )
      end
      it "has an empty meeting counter" do
        expect( subject.summary.meetings_count ).to eq( 0 )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- -------------------------------------------------------------------------
#++
