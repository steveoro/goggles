require 'spec_helper'
require 'json'


describe Api::V1::NewsFeedsController do

  describe '[GET api/v1/for_user]' do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = create( :user )
    end

    context "with a non-JSON request" do
      before :each do
        get :for_user, id: 1, user_email: @user.email, user_token: @user.authentication_token
      end

      it "refuses the request" do
        expect(response.status).to eq( 406 )
      end
    end

    context "with valid parameters and credentials" do
      it "handles successfully the request" do
        get :for_user, format: :json, id: 1, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 200 )
      end

      it "returns an array of feeds" do
        create( :news_feed, user: @user )
        get :for_user, format: :json, id: 1, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(1)
      end
    end
  end
  # ---------------------------------------------------------------------------
  # ===========================================================================
end
