require 'rails_helper'

RSpec.describe Api::V2::DataImportControllerController, type: :controller do

  describe "GET #start" do
    it "returns http success" do
      get :start
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #commit" do
    it "returns http success" do
      get :commit
      expect(response).to have_http_status(:success)
    end
  end

end
