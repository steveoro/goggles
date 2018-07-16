require 'rails_helper'
require 'ffaker'


RSpec.describe MeetingResultsController, type: :controller do

  let(:uneditable_meeting_id_for_team_1) { [16281, 16291, 16288, 16338, 16296].sort{0.5 - rand}.first }

  describe 'GET #edit_passages' do
    context "for a logged-in user, with a valid request (user is a team manager and the meeting exists)," do
      before :each do
        # XXX We rely directly on the existing seeds to speed up this test:
        #     Alternatively, we could:
        # - Choose/Create a user
        # - Create managed affiliations if missing
        # - Choose an existing Meeting with passages
        # - (Assert the user/manager should manage teams that have MIRs loaded for the meeting, otherwise nothing should be rendered)
        login_user( User.find(2) )
        get :edit_passages, params: { id: 15202 }
      end

      it "accepts the request" do
        expect( response ).to be_a_success
      end
      it "assigns a meeting" do
        expect( assigns(:meeting) ).to be_a( Meeting )
      end
      it "assigns a list of managed teams" do
        expect( assigns(:managed_teams) ).to be_an( Array )
        expect( assigns(:managed_teams).size ).to be > 0
        expect( assigns(:managed_teams) ).to all be_a( Team )
      end
      it "assigns a list of managed team IDs" do
        expect( assigns(:managed_team_ids) ).to be_an( Array )
        expect( assigns(:managed_team_ids) ).to all be_a( Fixnum )
        expect( assigns(:managed_team_ids) ).to all be > 0
      end
      it "assigns a non-empty set of editable 'stuff' (an array of Hash items)" do
        expect( assigns(:editable_stuff) ).to be_an( Array )
        expect( assigns(:editable_stuff).size ).to be > 0
        expect( assigns(:editable_stuff) ).to all be_an( Hash )
      end
    end


    context "for an unlogged user," do
      it "redirects to the Login page" do
        get :edit_passages, params: { id: 15202 }
        expect(response).to redirect_to( "/users/sign_in" )
      end
    end


    context "for a logged-in generic user (NOT a team manager)," do
      before :each do
        login_user()
      end
      it "redirects to meetings/current page" do
        get :edit_passages, params: { id: 15202 }
        expect(response).to redirect_to( meetings_current_path )
      end
    end


    context "for a logged-in team manager, but w/o editable results on the meeting," do
      before :each do
        login_user( User.find(2) )
        get :edit_passages, params: { id: uneditable_meeting_id_for_team_1 }
      end
      it "accepts the request" do
        expect( response ).to be_a_success
      end
      it "assigns a meeting" do
        expect( assigns(:meeting) ).to be_a( Meeting )
      end
      it "assigns a list of managed teams" do
        expect( assigns(:managed_teams) ).to be_an( Array )
        expect( assigns(:managed_teams).size ).to be > 0
        expect( assigns(:managed_teams) ).to all be_a( Team )
      end
      it "assigns a list of managed team IDs" do
        expect( assigns(:managed_team_ids) ).to be_an( Array )
        expect( assigns(:managed_team_ids) ).to all be_a( Fixnum )
        expect( assigns(:managed_team_ids) ).to all be > 0
      end
      it "assigns an EMPTY set of editable 'stuff' (an array of Hash items)" do
        expect( assigns(:editable_stuff) ).to be_an( Array )
        expect( assigns(:editable_stuff).size ).to eq(0)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++



  describe "GET #edit_relay_swimmers" do
    context "for a logged-in user, with a valid request (user is a team manager and the meeting exists)," do
      before :each do
        # XXX We rely directly on the existing seeds to speed up this test:
        #     Alternatively, we could:
        # - Choose/Create a user
        # - Create managed affiliations if missing
        # - Choose an existing Meeting with passages
        # - (Assert the user/manager should manage teams that have MIRs loaded for the meeting, otherwise nothing should be rendered)
        login_user( User.find(2) )
        get :edit_relay_swimmers, params: { id: 15202 }
      end

      it "accepts the request" do
        expect( response ).to be_a_success
      end
      it "assigns a meeting" do
        expect( assigns(:meeting) ).to be_a( Meeting )
      end
      it "assigns a list of managed teams" do
        expect( assigns(:managed_teams) ).to be_an( Array )
        expect( assigns(:managed_teams).size ).to be > 0
        expect( assigns(:managed_teams) ).to all be_a( Team )
      end
      it "assigns a list of managed team IDs" do
        expect( assigns(:managed_team_ids) ).to be_an( Array )
        expect( assigns(:managed_team_ids) ).to all be > 0
        expect( assigns(:managed_team_ids) ).to all be_a( Fixnum )
      end
      it "assigns a non-empty set of MRRs" do
        expect( assigns(:mrrs).count ).to be > 0
        expect( assigns(:mrrs) ).to all be_a( MeetingRelayResult )
      end
      it "assigns a non-empty relay_swimmer_hash" do
        expect( assigns(:relay_swimmer_hash) ).to be_an( Hash )
        expect( assigns(:relay_swimmer_hash).values.flatten ).to all be_a( MeetingRelaySwimmer )
      end
    end


    context "for an unlogged user," do
      it "redirects to the Login page" do
        get :edit_relay_swimmers, params: { id: 15202 }
        expect(response).to redirect_to( "/users/sign_in" )
      end
    end


    context "for a logged-in generic user (NOT a team manager)," do
      before :each do
        login_user()
      end
      it "redirects to meetings/current page" do
        get :edit_relay_swimmers, params: { id: 15202 }
        expect(response).to redirect_to( meetings_current_path )
      end
    end


    context "for a logged-in team manager, but w/o editable results on the meeting," do
      before :each do
        login_user( User.find(2) )
        get :edit_relay_swimmers, params: { id: uneditable_meeting_id_for_team_1 }
      end
      it "accepts the request" do
        expect( response ).to be_a_success
      end
      it "assigns a meeting" do
        expect( assigns(:meeting) ).to be_a( Meeting )
      end
      it "assigns a list of managed teams" do
        expect( assigns(:managed_teams) ).to be_an( Array )
        expect( assigns(:managed_teams).size ).to be > 0
        expect( assigns(:managed_teams) ).to all be_a( Team )
      end
      it "assigns a list of managed team IDs" do
        expect( assigns(:managed_team_ids) ).to be_an( Array )
        expect( assigns(:managed_team_ids) ).to all be_a( Fixnum )
        expect( assigns(:managed_team_ids) ).to all be > 0
      end
      it "assigns an EMPTY set of MRRs" do
        expect( assigns(:mrrs).count ).to eq(0)
      end
      it "assigns a EMPTY relay_swimmer_hash" do
        expect( assigns(:relay_swimmer_hash) ).to be_an( Hash )
        expect( assigns(:relay_swimmer_hash).size ).to eq(0)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
