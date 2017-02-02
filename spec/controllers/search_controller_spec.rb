require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "[GET #smart]" do
    it "returns http success" do
      get :smart
      expect(response).to have_http_status(:success)
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "[GET XHR #smart]" do
    it "returns http success" do
      get :smart, xhr: true, params: { q: 'CILLONI' }
      expect(response).to have_http_status(:success)
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "[GET #smart_with_captcha]" do
    # We do not enable the captcha config for the test environment.
    # So a redirect to the "standard" searcg should take place in this case:
    it "returns http success" do
      get :smart_with_captcha
      expect(response).to redirect_to( search_smart_path() )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "[GET XHR #smart_with_captcha]" do
    # We do not enable the captcha config for the test environment.
    # So a redirect to the "standard" searcg should take place in this case:
    it "redirects to #smart for the test environment" do
      get :smart_with_captcha, xhr: true, params: { q: 'CILLONI' }
      expect(response).to redirect_to( search_smart_path(q: 'CILLONI') )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
