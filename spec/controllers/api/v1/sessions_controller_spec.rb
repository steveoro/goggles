require 'spec_helper'
require 'json'


describe Api::V1::SessionsController do


  describe '[GET api/v1/sessions/create]' do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = create( :user )
    end

    context "with invalid credentials or invalid request" do
      it "returns a JSON success=false response for a missing password" do
        get :create, format: :json, user_password: @user.password
        expect(response.status).to eq( 400 )
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end

      it "returns a JSON success=false response for a missing email" do
        get :create, format: :json, user_email: @user.email
        expect(response.status).to eq( 400 )
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end

      it "returns a JSON success=false response for a non-JSON request" do
        get :create, user_email: @user.email, user_password: @user.password
        expect(response.status).to eq( 406 )
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end
    end
    # -------------------------------------------------------------------------

    context "with valid credentials" do
      before :each do
        get :create, format: :json, user_email: @user.email, user_password: @user.password
        expect(response.status).to eq( 200 )
        @result = JSON.parse(response.body) 
      end

      it "handles successfully the request" do
        expect( @result['success'] ).to eq( true )
      end

      it "returns the logged-in user name" do
        expect( @result['user_name'] ).to eq( @user.name )
      end

      it "returns the authorization token" do
        expect( @result['user_token'] ).to eq( @user.authentication_token )
      end
    end
  end
  # ===========================================================================



  describe '[GET api/v1/sessions/destroy]' do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = create( :user )
    end

    context "with invalid credentials or invalid request" do
      it "returns a JSON success=false response for a missing user token" do
        get :destroy, format: :json
        expect(response.status).to eq( 404 )
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end

      it "returns a JSON success=false response for a wrong user token" do
        get :destroy, format: :json, user_token: 'this_is_fake'
        expect(response.status).to eq( 404 )
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end

      it "returns a JSON success=false response for a non-JSON request" do
        get :destroy, user_token: @user.authentication_token
        expect(response.status).to eq( 406 )
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end
    end
    # -------------------------------------------------------------------------

    context "with valid credentials" do
      before :each do
        @old_auth_token = @user.authentication_token
        get :destroy, format: :json, user_token: @user.authentication_token
        expect(response.status).to eq( 200 )
      end

      it "handles successfully the request" do
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( true )
      end

      it "refreshes the authorization token" do
        @user.reload
        expect( @old_auth_token != @user.authentication_token ).to be_true
      end
    end
  end
  # ===========================================================================
end
