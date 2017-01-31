require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #smart" do
    it "returns http success" do
      get :smart
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #smart_with_captcha" do
    it "returns http success" do
      get :smart_with_captcha
      expect(response).to have_http_status(:success)
    end
  end

end
