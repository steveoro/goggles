require 'spec_helper'


describe Api::V1::TeamsController do


  describe '[GET api/v1/count_meetings]' do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = create( :user )
    end

    context "with a non-JSON request" do
      before :each do
        get :count_meetings, id: 1, user_email: @user.email, user_token: @user.authentication_token
      end

      it "refuses the request" do
        expect(response.status).to eq( 406 )
      end
    end

    context "with valid parameters and credentials" do
      before :each do
        get :count_meetings, format: :json, id: 1, user_email: @user.email, user_token: @user.authentication_token
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end

      it "returns a positive integer for a team with meetings" do
        result_count = response.body.to_i 
        expect( result_count > 0 ).to be_true
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe '[GET api/v1/count_results]' do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = create( :user )
    end

    context "with valid parameters and credentials" do
      before :each do
        get :count_results, format: :json, id: 1, user_email: @user.email, user_token: @user.authentication_token
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end

      it "returns a positive integer for a team with results" do
        result_count = response.body.to_i 
        expect( result_count > 0 ).to be_true
      end
    end
  end


  describe '[GET api/v1/count_details]' do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = create( :user )
    end

    context "with valid parameters and credentials" do
      before :each do
        get :count_details, format: :json, id: 1, user_email: @user.email, user_token: @user.authentication_token
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end

      it "returns a non-empty verbose description of the meetings and the results" do
        expect( response.body ).not_to be_empty
        expect( response.body ).to include( I18n.t('meeting.total_attended_meetings') )
        expect( response.body ).to include( I18n.t('meeting.total_results_short') )
      end
    end
  end
  # ===========================================================================
end
