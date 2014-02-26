require 'spec_helper'
require 'date'
require 'common/format'


describe UserTrainingStoriesController do

  describe "GET index" do
#    it "has a 200 status code" do
#      get :index
#      expect(response.status).to eq(200)
#    end

    it "redirects to the Login page" do
      get :index
      expect(response).to redirect_to( '/users/sign_in' )
      follow_redirect!
      expect(response).to render_template('/users/sessions/new')
    end
  end
  # ---------------------------------------------------------------------------

end
