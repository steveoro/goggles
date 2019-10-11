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
      context "given invalid parameters (except team)," do
        let(:create_params) { { team_id: team.id, season_id: 0, swimmer_id: swimmer.id } }

        it "accepts the request but displays the error" do
          post :create, params: create_params
          expect(flash['error']).to eq(I18n.t('badge.management.errors.invalid_swimmer_season_or_team'))
          expect(response).to redirect_to( team_current_swimmers_path(id: team.id) )
        end
      end

      context "given valid parameters," do
        let(:create_params) { { team_id: team.id, season_id: team_affiliation.season_id, swimmer_id: swimmer.id } }

        it "accepts the request, creating the new badge" do
          orig_count = Badge.count
          post :create, params: create_params
          # Check response:
          expect(response).to redirect_to( team_current_swimmers_path(id: team.id) )
          expect(flash['info']).to eq(I18n.t('badge.management.creation_successful'))
          expect(Badge.count).to eq(orig_count + 1) # just 1 badge must have been created
          # Check created badge:
          allegedly_created_badge = Badge.last
          expect(allegedly_created_badge.team_id).to eq(team.id)
          expect(allegedly_created_badge.season_id).to eq(team_affiliation.season_id)
          expect(allegedly_created_badge.swimmer_id).to eq(swimmer.id)
        end
      end
    end

    describe "PUT #update" do
      context "given invalid parameters (except team)," do
        let(:update_params)  { { badge_id: 0 } }

        it "redirects to the root path" do
          put :update, params: update_params
          expect(flash['error']).to include(I18n.t(:invalid_action_request))
          expect(response).to redirect_to( root_path )
        end
      end

      context "given valid parameters," do
        let(:updated_number) { 'EMI-Fake-1' }
        let(:existing_badge) do
          create(
            :badge,
            team_id: team_manager.team_affiliation.team_id,
            season_id: team_manager.team_affiliation.season_id,
            swimmer_id: swimmer.id,
            team_affiliation_id: team_manager.team_affiliation.id,
          )
        end
        let(:update_params)  { { badge_id: existing_badge.id, number: updated_number } }

        it "accepts the request, updating the existing badge" do
          expect(existing_badge).to be_a(Badge).and be_valid
          orig_count = Badge.count
          put :update, params: update_params
          # Check response:
          expect(response).to redirect_to( team_current_swimmers_path(id: existing_badge.team_id) )
          expect(flash['info']).to eq(I18n.t('badge.management.update_successful'))
          expect(Badge.count).to eq(orig_count) # no other badges added
          # Check updated badge:
          allegedly_updated_badge = Badge.find_by(id: existing_badge.id)
          expect(allegedly_updated_badge.team_id).to eq(existing_badge.team_id)
          expect(allegedly_updated_badge.season_id).to eq(existing_badge.season_id)
          expect(allegedly_updated_badge.swimmer_id).to eq(existing_badge.swimmer_id)
          expect(allegedly_updated_badge.number).to eq(updated_number)
        end
      end
    end
  end
  #-- -----------------------------------------------------------------------
  #++
end
