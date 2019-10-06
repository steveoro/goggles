require 'rails_helper'

RSpec.describe TeamManagementController, type: :controller do

  let(:team) { create(:team) }

  context "for a unlogged user," do
    [:edit_team, :edit_affiliation, :edit_badges, :edit_lap_template].each do |method_name|
      describe "GET #" + method_name.to_s do
        it "redirects to the login page" do
          get method_name.to_sym, params: { id: team.id }
          expect(response).to redirect_to( "/users/sign_in" )
        end
      end
    end

    [:update_team].each do |method_name|
      describe "PUT #" + method_name.to_s do
        it "redirects to the login page" do
          put method_name.to_sym, params: { id: team.id }
          expect(response).to redirect_to( "/users/sign_in" )
        end
      end
    end

    [:update_affiliation, :create_badge, :update_badges, :update_app_template].each do |method_name|
      describe "POST #" + method_name.to_s do
        it "redirects to the login page" do
          post method_name.to_sym, params: { id: team.id }
          expect(response).to redirect_to( "/users/sign_in" )
        end
      end
    end
  end
  #-- -----------------------------------------------------------------------
  #++


  context "for a logged user without a team," do
    before :each do
      login_user()
      request.env["HTTP_REFERER"] = root_path()
    end

    [:edit_team, :edit_affiliation, :edit_badges, :edit_lap_template].each do |method_name|
      describe "GET #" + method_name.to_s do
        # [Steve, 20181125] TODO FAILS due to wrong routing
        # (you cannot define a route with a parameter and invoke it without)
        xit "redirects to the root page" do
          get method_name.to_sym
          expect(response).to redirect_to( root_path() )
        end
      end
    end

    [:update_team].each do |method_name|
      describe "PUT #" + method_name.to_s do
        # [Steve, 20181125] TODO FAILS due to wrong routing
        # (you cannot define a route with a parameter and invoke it without)
        xit "redirects to the root page" do
          put method_name.to_sym
          expect(response).to redirect_to( root_path() )
        end
      end
    end

    [:update_affiliation, :create_badge, :update_badges, :update_app_template].each do |method_name|
      describe "POST #" + method_name.to_s do
        it "redirects to the root page" do
          post method_name.to_sym
          expect(response).to redirect_to( root_path() )
        end
      end
    end
  end
  #-- -----------------------------------------------------------------------
  #++


  context "for a logged-in non team-manager user with team," do
    before :each do
      login_user()
    end

    [:edit_team, :edit_affiliation, :edit_lap_template].each do |method_name|
      describe "GET #" + method_name.to_s do
        it "redirects to the team radio page" do
          get method_name.to_sym, params: { id: team.id }
          expect(response).to redirect_to( team_radio_path(id: team.id) )
        end
      end
    end

    [:update_team].each do |method_name|
      describe "PUT #" + method_name.to_s do
        it "redirects to the team radio page" do
          put method_name.to_sym, params: { id: team.id }
          expect(response).to redirect_to( team_radio_path(id: team.id) )
        end
      end
    end

    [:update_affiliation, :create_badge, :update_app_template].each do |method_name|
      describe "POST #" + method_name.to_s do
        it "redirects to the team radio page" do
          post method_name.to_sym, params: { id: team.id }
          expect(response).to redirect_to( team_radio_path(id: team.id) )
        end
      end
    end
  end
  #-- -----------------------------------------------------------------------
  #++


  context "for a logged-in team-manager user without team," do
    before :each do
      login_user()
      request.env["HTTP_REFERER"] = root_path()
    end

    let(:team_affiliation) { create( :team_affiliation, team_id: team.id ) }
    let(:team_manager) do
      team_manager = create( :team_manager,
        team_affiliation: team_affiliation, user_id: current_user.id
      )
      expect( team_manager ).to be_a( TeamManager )
      team_manager
    end

    [:edit_team, :edit_affiliation, :edit_lap_template].each do |method_name|
      describe "GET #" + method_name.to_s do
        # [Steve, 20181125] TODO FAILS due to wrong routing
        # (you cannot define a route with a parameter and invoke it without)
        xit "redirects to the root page" do
          get method_name.to_sym
          expect(response).to redirect_to( root_path() )
        end
      end
    end

    [:update_team].each do |method_name|
      describe "PUT #" + method_name.to_s do
        # [Steve, 20181125] TODO FAILS due to wrong routing
        # (you cannot define a route with a parameter and invoke it without)
        xit "redirects to the root page" do
          put method_name.to_sym
          expect(response).to redirect_to( root_path() )
        end
      end
    end

    [:update_affiliation, :update_app_template].each do |method_name|
      describe "POST #" + method_name.to_s do
        it "redirects to the root page" do
          post method_name.to_sym
          expect(response).to redirect_to( root_path() )
        end
      end
    end
  end
  #-- -----------------------------------------------------------------------
  #++


  context "for a logged-in team-manager user and a valid team," do
    let(:team_affiliation) { create( :team_affiliation, team_id: team.id ) }
    let(:team_manager) do
      team_manager = create( :team_manager,
        team_affiliation: team_affiliation
      )
      expect( team_manager ).to be_a( TeamManager )
      expect( team_manager.team_affiliation.team_id ).to eq( team.id )
      team_manager
    end

    before :each do
      login_user(team_manager.user)
    end

    describe "GET #edit_team" do
      it "returns http success" do
        get :edit_team, params: { id: team_manager.team_affiliation.team_id }
        expect(response).to have_http_status(:success)
      end
    end

    # [Steve, 20181125] TODO FAILS due to team manageability constraints
    # - Team must exist
    # - Season must exist
    # - Team Manager must exist
    # - TM must be enabled to manage Team in Season
    describe "PUT #update_team" do
      xit "returns http success" do
        put :update_team, params: { id: team.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit_affiliation" do
      it "returns http success" do
        get :edit_affiliation, params: { id: team.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST #update_affiliation" do
      it "returns http success" do
        post :update_affiliation, params: { id: team.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET #edit_lap_template" do
      it "returns http success" do
        get :edit_lap_template, params: { id: team.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe "POST #update_app_template" do
      it "returns http success" do
        post :update_app_template, params: { id: team.id }
        expect(response).to have_http_status(:success)
      end
    end
  end
  #-- -----------------------------------------------------------------------
  #++
end
