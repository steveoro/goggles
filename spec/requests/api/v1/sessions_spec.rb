require 'spec_helper'

# [Steve, 20140409] To have methods like "last_response" in each test:
# (but mainly used only by rspec_api_blueprint gem)
RSpec.configure do |config|
  config.include Rack::Test::Methods
end


# This will auto-generate API-blueprint docs under /api_docs/sessions.txt:
#
describe 'Sessions Requests' do
  before :each do
    @user = create( :user )
  end

  describe 'GET api/v1/sessions/create' do
    it "creates a new logged-in user session" do
      get api_v1_sessions_create_path( format: :json, user_email: @user.email, user_password: @user.password )
    end
  end
  # ---------------------------------------------------------------------------

  describe 'GET api/v1/sessions/destroy' do
    it "destroys a logged-in user session" do
      get api_v1_sessions_destroy_path( format: :json, user_token: @user.authentication_token )
    end
  end
  # ---------------------------------------------------------------------------
end
