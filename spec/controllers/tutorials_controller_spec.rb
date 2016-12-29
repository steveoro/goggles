require 'rails_helper'

RSpec.describe TutorialsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #features" do
    it "returns http success" do
      get :features
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #registration" do
    it "returns http success" do
      get :registration
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #radio" do
    it "returns http success" do
      get :radio
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #meetings" do
    it "returns http success" do
      get :meetings
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #passages" do
    it "returns http success" do
      get :passages
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #reservations" do
    it "returns http success" do
      get :reservations
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #goggle_cups" do
    it "returns http success" do
      get :goggle_cups
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #scoring" do
    it "returns http success" do
      get :scoring
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #pools" do
    it "returns http success" do
      get :pools
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #trainings" do
    it "returns http success" do
      get :trainings
      expect(response).to have_http_status(:success)
    end
  end

end
