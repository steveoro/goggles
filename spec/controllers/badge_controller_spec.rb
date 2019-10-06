require 'rails_helper'

RSpec.describe BadgeController, type: :controller do
  context "for a unlogged user," do
    describe "GET #new" do
      it "redirects to the login page" do
        get :new, params: { id: 1 }
        expect(response).to redirect_to('/users/sign_in')
      end
    end
    describe "GET #create" do
      it "redirects to the login page" do
        get :create, params: { id: 1 }
        expect(response).to redirect_to('/users/sign_in')
      end
    end
    describe "GET #edit" do
      it "redirects to the login page" do
        get :edit, params: { id: 1 }
        expect(response).to redirect_to('/users/sign_in')
      end
    end
    describe "GET #update" do
      it "redirects to the root path" do
        get :update, params: { id: 1 }
        expect(response).to redirect_to('/users/sign_in')
      end
    end
  end
  #-- -----------------------------------------------------------------------
  #++

  context "for a logged-in, unauthorized team manager" do
    # Create a couple of new Teams with different seasons types:
    let(:team_1)             { create(:team) }
    let(:season_1)           { create(:season, season_type: SeasonType.where(code: 'AGOCSI').first) }
    let(:team_affiliation_1) { create(:team_affiliation, season: season_1, team_id: team_1.id) }
    let(:team_2)             { create(:team) }
    let(:season_2)           { create(:season, season_type: SeasonType.where(code: 'AGOUISP').first) }
    let(:team_affiliation_2) { create(:team_affiliation, season: season_2, team_id: team_2.id) }
    # Make the Team manager belong to just a season type so that it won't be authorized to the other one:
    let(:team_manager) do
      team_manager = create(:team_manager, team_affiliation: team_affiliation_2)
      expect( team_manager ).to be_a( TeamManager )
      expect( team_manager.team_affiliation.team_id ).to eq( team_2.id )
      expect( team_manager.team_affiliation.team_id ).not_to eq( team_1.id )
      expect(TeamManagerValidator.can_manage_team?(team_manager.user, team_1)).to be false
      team_manager
    end

    before :each do
      login_user(team_manager.user)
    end

    describe "GET #new" do
      it "redirects to the team radio path" do
        get :new, params: { id: team_1.id }
        expect(response).to redirect_to(team_radio_path(id: team_1.id))
      end
    end
    describe "GET #create" do
      it "redirects to the team radio path" do
        get :create, params: { id: team_1.id }
        expect(response).to redirect_to(team_radio_path(id: team_1.id))
      end
    end
    describe "GET #edit" do
      it "redirects to the team radio path" do
        get :edit, params: { id: team_1.id }
        expect(response).to redirect_to(team_radio_path(id: team_1.id))
      end
    end
    describe "GET #update" do
      it "redirects to the team radio path" do
        get :update, params: { id: team_1.id }
        expect(response).to redirect_to(team_radio_path(id: team_1.id))
      end
    end
  end
  #-- -----------------------------------------------------------------------
  #++

  context "for a logged-in, authorized team manager," do
    let(:team)             { create(:team) }
    let(:team_affiliation) { create(:team_affiliation, team_id: team.id) }
    let(:team_manager) do
      team_manager = create(:team_manager, team_affiliation: team_affiliation)
      expect( team_manager ).to be_a( TeamManager )
      expect( team_manager.team_affiliation.team_id ).to eq( team.id )
      team_manager
    end

    before :each do
      login_user(team_manager.user)
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, params: { id: team.id }
        expect(response).to have_http_status(:success)
      end
    end
    describe "GET #create" do
      it "returns http success" do
        get :create, params: { id: team.id }
        expect(response).to have_http_status(:success)
      end
    end
    describe "GET #edit" do
      it "returns http success" do
        get :edit, params: { id: team.id }
        expect(response).to have_http_status(:success)
      end
    end
    describe "GET #update" do
      it "returns http success" do
        get :update, params: { id: team.id }
        expect(response).to have_http_status(:success)
      end
    end
  end
  #-- -----------------------------------------------------------------------
  #++
end
