require 'spec_helper'
require 'json'


describe Api::V1::NewsFeedsController do

  describe '[GET for_user/:id]' do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = create( :user )
    end

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
        get :for_user, format: :json, id: @user.id, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(0)
      end
      it "returns a non-empty result when there are unread feeds" do
        create( :news_feed, user_id: @user.id )
        get :for_user, format: :json, id: @user.id, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Array)
        expect( result.size ).to eq(1)
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe '[POST create/:news_feed]' do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = create( :user )
      @news_feed = NewsFeed.new( attributes_for(:news_feed, user_id: @user.id) ).attributes.to_json
    end

    context "with a non-JSON request" do
      it "refuses the request" do
        post :create, news_feed: @news_feed, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 406 )
      end
      it "doesn't add a news feed" do
        expect {
          post :create, news_feed: @news_feed, user_email: @user.email, user_token: @user.authentication_token
        }.not_to change{ NewsFeed.count } 
      end
    end

    context "with a non valid news_feed parameter" do
      before :each do
        @invalid_news_feed = NewsFeed.new( attributes_for(:news_feed, user_id: @user.id, title: nil, id: nil) ).attributes.to_json
      end
      it "handles successfully the request" do
        post :create, format: :json, news_feed: @invalid_news_feed, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 200 )
      end
      it "returns a valid JSON Hash with a nil 'id' member" do
        post :create, format: :json, news_feed: @invalid_news_feed, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] ).to be_nil
      end
      it "doesn't add a news feed" do
        expect {
          post :create, format: :json, news_feed: @invalid_news_feed, user_email: @user.email, user_token: @user.authentication_token
        }.not_to change{ NewsFeed.count } 
      end
    end

    context "with valid parameters and credentials" do
      it "handles successfully the request" do
        post :create, format: :json, news_feed: @news_feed, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 200 )
      end
      it "returns a valid JSON Hash with a valid, positive, 'id' member" do
        post :create, format: :json, news_feed: @news_feed, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] > 0 ).to be true
      end
      it "adds a news-feed row" do
        expect {
          post :create, format: :json, news_feed: @news_feed, user_email: @user.email, user_token: @user.authentication_token
        }.to change{ NewsFeed.count }.by(1)
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe '[PUT read/:id]' do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = create( :user )
      @news_feed = create( :news_feed, user_id: @user.id )
    end

    context "with a non-JSON request" do
      it "refuses the request" do
        put :read, id: @news_feed.id, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 406 )
      end
      it "doesn't set as read the news feed" do
        expect {
          put :read, id: @news_feed.id, user_email: @user.email, user_token: @user.authentication_token
          @news_feed.reload
        }.not_to change{ @news_feed.is_read } 
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
        put :read, format: :json, id: @news_feed.id, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON result of 'success' as true" do
        put :read, format: :json, id: @news_feed.id, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( true )
      end
      it "updates the specified news-feed row" do
        expect {
          put :read, format: :json, id: @news_feed.id, user_email: @user.email, user_token: @user.authentication_token
          @news_feed.reload
        }.to change{ @news_feed.is_read }.to( true )
      end
    end
  end
  # ---------------------------------------------------------------------------


  describe '[DELETE destroy/:id]' do
    before :each do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = create( :user )
      @news_feed = create( :news_feed, user_id: @user.id )
    end

    context "with a non-JSON request" do
      it "refuses the request" do
        delete :destroy, id: @news_feed.id, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 406 )
      end
      it "doesn't delete the news feed" do
        expect {
          delete :destroy, id: @news_feed.id, user_email: @user.email, user_token: @user.authentication_token
        }.not_to change{ NewsFeed.count } 
      end
    end

    context "with a not existing id and valid credentials" do
      it "handles the request with 'unprocessable entity' error result (422)" do
        delete :destroy, format: :json, id: 0, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 422 )
      end
      it "returns a JSON result of 'success' as false" do
        delete :destroy, format: :json, id: 0, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end
      it "doesn't delete the specified news-feed row" do
        expect {
          delete :destroy, format: :json, id: 0, user_email: @user.email, user_token: @user.authentication_token
        }.not_to change{ NewsFeed.count }
      end
    end

    context "with an existing id and valid credentials" do
      it "handles successfully the request" do
        delete :destroy, format: :json, id: @news_feed.id, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON result of 'success' as true" do
        delete :destroy, format: :json, id: @news_feed.id, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( true )
      end
      it "deletes the specified news-feed row" do
        expect {
          delete :destroy, format: :json, id: @news_feed.id, user_email: @user.email, user_token: @user.authentication_token
        }.to change{ NewsFeed.count }.by(-1)
      end
    end
  end
  # ---------------------------------------------------------------------------
end
