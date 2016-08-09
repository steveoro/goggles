require 'rails_helper'
require 'json'


describe Api::V1::NewsFeedsController, :type => :controller do
  before(:all) do # Force the creation of the required rows:
    @user = FactoryGirl.create( :user )
  end

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET for_user/:id]' do
    context "with a non-JSON request" do
      before :each do
        get :for_user, id: @user.id, user_email: @user.email, user_token: @user.authentication_token
      end
      it "refuses the request" do
        expect(response.status).to eq( 406 )
      end
    end

    context "with valid parameters and credentials" do
      it "handles successfully the request" do
        get :for_user, format: :json, id: @user.id, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON array (empty when there are no feeds)" do
        get :for_user, format: :json, id: 0, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(0)
      end
      it "returns a non-empty result when there are unread feeds" do
        create( :news_feed, user_id: @user.id )
        get :for_user, format: :json, id: @user.id, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to be >= 1
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[PUT read/:id]' do
    before(:each) do # Force the creation of the required row:
      @updatable_row = FactoryGirl.create( :news_feed, user_id: @user.id )
    end

    context "with a non-JSON request" do
      it "refuses the request" do
        put :read, id: @updatable_row.id, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 406 )
      end
      it "doesn't set as read the news feed" do
        expect( @updatable_row.is_read ).to be false
        put :read, id: @updatable_row.id, user_email: @user.email, user_token: @user.authentication_token
        @updatable_row.reload
        expect( @updatable_row.is_read ).to be false
      end
    end

    context "with a not existing id and valid credentials" do
      it "handles the request with 'unprocessable entity' error result (422)" do
        put :read, format: :json, id: 0, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 422 )
      end
      it "returns a JSON result of 'success' as false" do
        put :read, format: :json, id: 0, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end
    end

    context "with an existing id and valid credentials" do
      it "handles successfully the request" do
        put :read, format: :json, id: @updatable_row.id, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON result of 'success' as true" do
        put :read, format: :json, id: @updatable_row.id, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( true )
      end
      it "updates the specified news-feed row" do
        expect {
          put :read, format: :json, id: @updatable_row.id, user_email: @user.email, user_token: @user.authentication_token
          @updatable_row.reload
        }.to change{ @updatable_row.is_read }.to( true )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[DELETE destroy/:id]' do
    before(:each) do
      @deletable_row = FactoryGirl.create( :news_feed, user_id: @user.id )
    end

    context "with a non-JSON request" do
      it "refuses the request" do
        delete :destroy, id: @deletable_row.id, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 406 )
      end
      it "doesn't delete the specified row" do
        expect {
          delete :destroy, id: @deletable_row.id, user_email: @user.email, user_token: @user.authentication_token
        }.not_to change{ NewsFeed.count }
      end
    end

    context "with a valid request but for an unlogged user," do
      before(:each) do
        delete :destroy, format: :json, id: @deletable_row.id
      end
      it "refuses the request with unauthorized status" do
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
      it "doesn't delete the specified row" do
        @deletable_row.reload
        expect( @deletable_row.destroyed? ).to be false
      end
    end

    context "with a not existing id and valid credentials" do
      before(:each) do
        delete :destroy, format: :json, id: 0, user_email: @user.email, user_token: @user.authentication_token
      end
      it "handles the request with 'unprocessable entity' error result (422)" do
        expect(response.status).to eq( 422 )
      end
      it "returns a JSON result of 'success' as false" do
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end
      it "doesn't delete the specified row" do
        @deletable_row.reload
        expect( @deletable_row.destroyed? ).to be false
      end
    end

    context "with an existing id and valid credentials" do
      before(:each) do
        delete :destroy, format: :json, id: @deletable_row.id, user_email: @user.email, user_token: @user.authentication_token
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON result of 'success' as true" do
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( true )
      end
      it "deletes the specified row" do
        expect( NewsFeed.find_by_id( @deletable_row.id ) ).to be nil
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
