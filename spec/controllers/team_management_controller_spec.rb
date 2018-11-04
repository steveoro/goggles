require 'rails_helper'

RSpec.describe TeamManagementController, type: :controller do

  let(:team)               { create( :team ) }

  context "for a non logged user," do
    [:edit_team, :update_team, :edit_affiliation, :update_affiliation, :edit_badges, :create_badge, :update_badges, :edit_lap_template, :update_app_template].each do |method_name|
      describe "GET #" + method_name.to_s do
        it "redirect to the login page" do
          get method_name.to_sym, params: { id: team.id }
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

    [:edit_team, :update_team, :edit_affiliation, :update_affiliation, :edit_badges, :create_badge, :update_badges, :edit_lap_template, :update_app_template].each do |method_name|
      describe "GET #" + method_name.to_s do
        it "redirect to the root page" do
          get method_name.to_sym
          expect( response ).to redirect_to( root_path() )
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

    [:edit_team, :update_team, :edit_affiliation, :update_affiliation, :edit_badges, :create_badge, :update_badges, :edit_lap_template, :update_app_template].each do |method_name|
      describe "GET #" + method_name.to_s do
        it "redirect to the login page" do
          get method_name.to_sym, params: { id: team.id }
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

    [:edit_team, :update_team, :edit_affiliation, :update_affiliation, :edit_badges, :create_badge, :update_badges, :edit_lap_template, :update_app_template].each do |method_name|
      describe "GET #" + method_name.to_s do
        it "redirect to the root page" do
          get method_name.to_sym
          expect( response ).to redirect_to( root_path() )
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
  
    describe "POST #update_team" do
      it "returns http success" do
        post :update_team, params: { id: team.id }
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
  
    describe "GET #edit_badges" do
      it "returns http success" do
        get :edit_badges, params: { id: team.id }
        expect(response).to have_http_status(:success)
      end
    end
  
    describe "POST #create_badge" do
      it "returns http success" do
        post :create_badge, params: { id: team.id }
        expect(response).to have_http_status(:success)
      end
    end
  
    describe "GET #update_badges" do
      it "returns http success" do
        get :update_badges, params: { id: team.id }
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

end
