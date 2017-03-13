require 'rails_helper'
require 'ffaker'


RSpec.describe MeetingResultsController, type: :controller do

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
        expect( assigns(:managed_teams) ).to all be_a( Team )
      end
      it "assigns a list of managed team IDs" do
        expect( assigns(:managed_team_ids) ).to be_an( Array )
        expect( assigns(:managed_team_ids) ).to all be_a( Fixnum )
        expect( assigns(:managed_team_ids) ).to all be > 0
      end
      it "assigns a list of editable 'stuff' (an array of Hash items)" do
        expect( assigns(:editable_stuff) ).to be_an( Array )
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

    # TODO Test context: logged user & manager, but a team manager of teams without MIRs available on the Meeting
  end
  #-- -------------------------------------------------------------------------
  #++


  describe 'POST #update_passages' do
    context "for a logged-in user, with a valid request (user is a team manager and the meeting exists)," do
      before :each do
        # XXX We rely directly on the existing seeds to speed up this test:
        #     Alternatively, we could:
        # - Choose/Create a user
        # - Create managed affiliations if missing
        # - Choose an existing Meeting with passages
        # - (Assert the user/manager should manage teams that have MIRs loaded for the meeting, otherwise nothing should be rendered)
        login_user( User.find(2) )
        post :update_passages, params: { id: 15202 }
      end
      it "accepts the request" do
        expect( response.status ).to redirect_to( meeting_results_edit_passages_path(15202, locale: I18n.default_locale) )
      end
      # TODO
    end


    context "for an unlogged user," do
      it "redirects to the Login page" do
        post :update_passages, params: { id: 15202 }
        expect(response).to redirect_to( "/users/sign_in" )
      end
    end


    context "for a logged-in generic user (NOT a team manager)," do
      before :each do
        login_user()
      end
      it "redirects to meetings/current page" do
        post :update_passages, params: { id: 15202 }
        expect(response).to redirect_to( meetings_current_path )
      end
    end

    # TODO Test context: logged user & manager, but a team manager of teams without MIRs available on the Meeting
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
        expect( assigns(:managed_teams) ).to all be_a( Team )
      end
      it "assigns a list of managed team IDs" do
        expect( assigns(:managed_team_ids) ).to be_an( Array )
        expect( assigns(:managed_team_ids) ).to all be_a( Fixnum )
        expect( assigns(:managed_team_ids) ).to all be > 0
      end

      # TODO
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

    # TODO Test context: logged user & manager, but a team manager of teams without MRRs available on the Meeting
  end
  #-- -------------------------------------------------------------------------
  #++



  describe "GET #update_relay_swimmers" do
    context "for a logged-in user, with a valid request (user is a team manager and the meeting exists)," do
      before :each do
        # XXX We rely directly on the existing seeds to speed up this test:
        #     Alternatively, we could:
        # - Choose/Create a user
        # - Create managed affiliations if missing
        # - Choose an existing Meeting with passages
        # - (Assert the user/manager should manage teams that have MIRs loaded for the meeting, otherwise nothing should be rendered)

        login_user( User.find(2) )
        post :update_relay_swimmers, params: { id: 15202 }
      end

      it "accepts the request" do
        expect( response.status ).to redirect_to( meeting_results_edit_relay_swimmers_path(15202, locale: I18n.default_locale) )
      end

      # TODO
    end


    context "for an unlogged user," do
      it "redirects to the Login page" do
        post :update_relay_swimmers, params: { id: 15202 }
        expect(response).to redirect_to( "/users/sign_in" )
      end
    end


    context "for a logged-in generic user (NOT a team manager)," do
      before :each do
        login_user()
      end
      it "redirects to meetings/current page" do
        post :update_relay_swimmers, params: { id: 15202 }
        expect(response).to redirect_to( meetings_current_path )
      end
    end

    # TODO Test context: logged user & manager, but a team manager of teams without MRRs available on the Meeting
  end
  #-- -------------------------------------------------------------------------
  #++
end
