require 'rails_helper'
require 'json'


RSpec.describe Api::V2::SessionsController, type: :controller do
  include ControllerMacros

  let(:user) { FactoryGirl.create(:user) }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  describe '[POST api/v2/sessions/create]' do
    # A non-valid "SIGN-IN" request:
    context "with invalid credentials or invalid request" do
      it "returns a JSON error result for a missing password" do
        post( :create, format: :json, p: user.password )
        expect( response.status ).to eq( 400 )
        result = JSON.parse(response.body)
        expect( result['result'] ).to eq( Api::V2::SessionsController::RESULT_ERROR )
      end
      it "returns a JSON error result for a missing email" do
        post( :create, format: :json, p: user.password )
        expect( response.status ).to eq( 400 )
        result = JSON.parse(response.body)
        expect( result['result'] ).to eq( Api::V2::SessionsController::RESULT_ERROR )
      end
      it "returns a JSON error result for a wrong password" do
        post( :create, format: :json, u: user.email, p: "fake" ) # (surely a too-short password to be correct standing to our current validations)
        expect( response.status ).to eq( 401 )
        result = JSON.parse(response.body)
        expect( result['result'] ).to eq( Api::V2::SessionsController::RESULT_ERROR )
      end
      it "returns a JSON error result for a non-JSON request" do
        post( :create, u: user.email, p: user.password )
        expect( response.status ).to eq( 406 )
        result = JSON.parse(response.body)
        expect( result['result'] ).to eq( Api::V2::SessionsController::RESULT_ERROR )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    # A "SIGN-UP" request made with SIGN-IN must return error.
    context "with valid non-existing (yet) credentials" do
      before :each do
        @new_fixture_email    = FactoryGirl.build(:user).email
        @new_fixture_password = "password"
        @user_count_before    = User.count
        post( :create, format: :json, u: @new_fixture_email, p: @new_fixture_password )
        expect( response.status ).to eq( 401 )
        @result = JSON.parse(response.body)
      end

      it "handles the request with an error result" do
        expect( @result['result'] ).to eq( Api::V2::SessionsController::RESULT_ERROR )
      end
      it "returns a nil authorization 'token' field" do
        expect( @result['token'] ).to be nil
      end
      it "returns a nil logged-in 'user' field" do
        expect( @result['user'] ).to be nil
      end
      it "doesn't add a new user row" do
        expect( User.count ).to eq( @user_count_before )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    shared_examples_for "successful POST SIGN_IN request" do
      it "handles successfully the request" do
        expect( @result['result'] ).to eq( Api::V2::SessionsController::RESULT_OK )
      end
      it "returns the authorization token" do
        expect( @result['token'] ).not_to be nil
        expect( @result['token'] ).to eq( user.authentication_token )
      end
      it "returns the logged-in user name" do
        expect( @result['user_name'] ).to eq( user.name )
      end
      it "returns a log-in message" do
        expect( @result['message'] ).to eq( I18n.t("api.log_in_successful") )
      end
    end

    # A valid, standard "SIGN-IN" request:
    context "with an HTTP POST & valid credentials" do
      before :each do
        post( :create, format: :json, params: { u: user.email, p: user.password } )
        expect( response.status ).to eq( 200 )
        @result = JSON.parse(response.body)
      end
      it_behaves_like "successful POST SIGN_IN request"
    end

    # A valid "SIGN-IN" request made with XHR (via AJAX call):
    context "with an XHR POST & valid credentials" do
      before :each do
        xhr( :post, :create, format: :json, params: { u: user.email, p: user.password } )
        expect( response.status ).to eq( 200 )
        @result = JSON.parse(response.body)
      end
      it_behaves_like "successful POST SIGN_IN request"
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET api/v2/sessions/destroy]' do
    context "with invalid credentials or invalid request" do
      it "returns a JSON success=false response for a missing user token" do
        post( :destroy, format: :json )
        expect(response.status).to eq( 404 )
        result = JSON.parse(response.body)
        expect( result['result'] ).to eq( Api::V2::SessionsController::RESULT_ERROR )
      end
      it "returns a JSON success=false response for a wrong user token" do
        post( :destroy, format: :json, t: "this_is_fake" )
        expect(response.status).to eq( 404 )
        result = JSON.parse(response.body)
        expect( result['result'] ).to eq( Api::V2::SessionsController::RESULT_ERROR )
      end
      it "redirects to root_path a non-JSON request" do
        post( :destroy, t: user.authentication_token )
        expect(response.status).to eq( 406 )
        result = JSON.parse(response.body)
        expect( result['result'] ).to eq( Api::V2::SessionsController::RESULT_ERROR )
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    context "with valid credentials" do
      before :each do
        # Force creation of a new token:
        post( :create, format: :json, u: user.email, p: user.password )
        expect( response.status ).to eq( 200 )
        result = JSON.parse(response.body)
        expect( result['token'] ).not_to be nil
        user.reload
        @old_auth_token = user.authentication_token # result['token']
        post( :destroy, format: :json, t: user.authentication_token )
        expect( response.status ).to eq( 200 )
      end

      it "handles successfully the request" do
        result = JSON.parse(response.body)
        expect( result['result'] ).to eq( Api::V2::SessionsController::RESULT_OK )
      end

      it "refreshes the authorization token" do
        user.reload
        expect( @old_auth_token != user.authentication_token ).to be true
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
