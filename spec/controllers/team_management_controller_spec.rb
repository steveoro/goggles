require 'rails_helper'

RSpec.describe TeamManagementController, type: :controller do

  describe "GET #edit_team" do
    it "returns http success" do
      get :edit_team
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #update_team" do
    it "returns http success" do
      post :update_team
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit_affiliation" do
    it "returns http success" do
      get :edit_affiliation
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #update_affiliation" do
    it "returns http success" do
      post :update_affiliation
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit_badges" do
    it "returns http success" do
      get :edit_badges
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create_badge" do
    it "returns http success" do
      post :create_badge
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update_badges" do
    it "returns http success" do
      get :update_badges
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit_lap_template" do
    it "returns http success" do
      get :edit_lap_template
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #update_app_template" do
    it "returns http success" do
      post :update_app_template
      expect(response).to have_http_status(:success)
    end
  end

end
