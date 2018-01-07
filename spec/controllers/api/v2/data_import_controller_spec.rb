require 'rails_helper'

RSpec.describe Api::V2::DataImportController, type: :controller, api: true do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create( :user )
  end

  let(:existing_meeting_with_results) { Meeting.has_results.sample }

  describe "POST #start" do

    context "for an unlogged user," do
      it "redirects to the login page" do
        post( :start,
          params: {
            u: @user.email,
            t: @user.authentication_token,
            m: existing_meeting_with_results.id,
            e: "p"
          }
        )
        # [Steve A.]
        # NOTE that the path below assumes that the Core Engine including
        # the Devise routes is mounted to "/". (Otherwise is should be changed
        # to something like "/mounting_path/users/sign_in").
        # Keep in mind also that:
        #   new_user_session_path( locale='XX' ) => '/users/sign_in?locale=XX'
        expect( response ).to be_a_redirect
        expect( response ).to redirect_to( '/users/sign_in' )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    context "for an logged-in user w/ a valid request," do
      before(:each) { login_user(@user) }

      it "returns http success" do
        post( :start, format: :json,
          params: {
            u: @user.email,
            t: @user.authentication_token,
            m: existing_meeting_with_results.id,
            e: "p"
          }
        )
        expect( response ).to have_http_status(:success)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  let(:existing_data_import_session) do
    # TODO
    nil
  end


  describe "POST #edit" do

    context "for an logged-in user w/ a valid request," do
      before(:each) { login_user(@user) }

      xit "returns http success" do
        post( :edit, format: :json,
          params: {
            u: @user.email,
            s: existing_data_import_session.id,
            f: "meeting_individual_result_id",
            v: existing_meeting_with_results.meeting_individual_results.sample.id
          }
        )
        expect( response ).to have_http_status(:success)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "POST #commit" do

    context "for an logged-in user w/ a valid request," do
      before(:each) { login_user(@user) }

      xit "returns http success" do
        post( :commit, format: :json,
          params: {
            u: @user.email,
            s: existing_data_import_session.id
          }
        )
        expect( response ).to have_http_status(:success)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
