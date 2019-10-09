require 'rails_helper'

RSpec.describe BadgeController, type: :controller do
  context "for a unlogged user," do
    describe "POST #create" do
      it "redirects to the login page" do
        post :create, params: { team_id: 1 }
        expect(response).to redirect_to('/users/sign_in')
      end
    end
    describe "PUT #update" do
      it "redirects to the root path" do
        put :update, params: { badge_id: 1 }
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
    let(:badge_1)            { create(:badge, team_affiliation: team_affiliation_1, season: season_1, team_id: team_1.id) }
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

    describe "POST #create" do
      it "redirects to the team radio path" do
        post :create, params: { team_id: team_1.id }
        expect(response).to redirect_to(team_radio_path(id: team_1.id))
      end
    end
    describe "PUT #update" do
      it "redirects to the team radio path" do
        put :update, params: { badge_id: badge_1.id }
        expect(response).to redirect_to(team_radio_path(id: team_1.id))
      end
    end
  end
  #-- -----------------------------------------------------------------------
  #++

  context "for a logged-in, authorized team manager," do
    let(:team)             { create(:team) }
    let(:team_affiliation) { create(:team_affiliation, team_id: team.id, season_id: Season.select(:id).all.sample.id) }
    let(:swimmer)          { create(:swimmer) }
    let(:team_manager) do
      team_manager = create(:team_manager, team_affiliation: team_affiliation)
      expect( team_manager ).to be_a( TeamManager )
      expect( team_manager.team_affiliation.team_id ).to eq( team.id )
      team_manager
    end

    before :each do
      login_user(team_manager.user)
    end

    describe "POST #create" do
      context "given valid parameters," do
        let(:create_params) { { team_id: team.id, season_id: team_affiliation.season_id, swimmer_id: swimmer.id } }

        it "returns http success" do
          post :create, params: create_params
          expect(flash['info']).to eq(I18n.t('badge.management.creation_successful'))
          expect(response).to redirect_to( team_current_swimmers_path(id: team.id) )
        end
      end
    end

    describe "PUT #update" do
      context "given valid parameters," do
        let(:updated_number) { 'EMI-Fake-1' }
        let(:existing_badge) { Badge.select(:id).last(100).sample }
        let(:update_params)  { { badge_id: existing_badge.id, number: updated_number } }

        it "returns http success" do
          put :update, params: update_params
          puts "\r\n"
          puts flash.inspect
          expect(flash['info']).to eq(I18n.t('badge.management.update_successful'))
          expect(response).to redirect_to( team_current_swimmers_path(id: existing_badge.team_id) )
        end
      end
    end
  end
  #-- -----------------------------------------------------------------------
  #++
end
