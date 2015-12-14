require 'spec_helper'
require 'common/format'


describe Api::V1::UserTrainingStoriesController, :type => :controller do
  before(:all) do # Force the creation of the required rows:
    @user = FactoryGirl.create( :user )
    @user_training_story = FactoryGirl.create( :user_training_story, swam_date: Format.a_iso_date(Date.today), user_id: @user.id )
  end

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  it_behaves_like( "(Ap1-V1-Controllers, #index & #show actions)", "user_training_stories" )

  describe 'GET #index' do
    context "with :swam_date_like filtering parameter" do
      before(:each) do
        get :index, swam_date_like: Format.a_iso_date(Date.today), format: :json, user_email: @user.email, user_token: @user.authentication_token
      end

      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least a match with the created fixture" do
        result = JSON.parse(response.body)
        expect( result.first['id'] ).to eq( @user_training_story.id )
      end
    end

    context "with a valid request but for an unlogged user," do
      it "refuses the request with unauthorized status" do
        get :index, format: :json
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
    end
  end

  describe 'GET #show/:id' do
    context "with a valid request but for an unlogged user," do
      it "refuses the request with unauthorized status" do
        get :show, format: :json, id: @user_training_story.id
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe 'POST #create/:user_training_story' do
    let(:post_attributes) { FactoryGirl.attributes_for(:user_training_story, user_id: @user.id) }

    context "with a non-JSON request," do
      it "refuses the request" do
        post :create, user_training_story: post_attributes, user_email: @user.email, user_token: @user.authentication_token
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 406 ) # 406 = not acceptable
      end
      it "doesn't add a new row" do
        expect {
          post :create, user_training_story: post_attributes, user_email: @user.email, user_token: @user.authentication_token
        }.not_to change{ UserTrainingStory.count }
      end
    end

    context "with a valid request but for an unlogged user," do
      it "refuses the request with unauthorized status" do
        post :create, format: :json, user_training_story: post_attributes
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
      it "doesn't add a new row" do
        expect {
          post :create, format: :json, user_training_story: post_attributes
        }.not_to change{ UserTrainingStory.count }
      end
    end

    context "with non-valid attributes," do
      let(:invalid_post_attributes) { FactoryGirl.attributes_for(:user_training_story, user_id: @user.id, total_training_time: nil) }

      it "handles successfully the request" do
        post :create, format: :json, user_training_story: invalid_post_attributes, user_email: @user.email, user_token: @user.authentication_token
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 422 )
      end
      it "returns a valid JSON Hash with a nil 'id' member" do
        post :create, format: :json, user_training_story: invalid_post_attributes, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] ).to be_nil
      end
      it "doesn't add a new row" do
        expect {
          post :create, format: :json, user_training_story: invalid_post_attributes, user_email: @user.email, user_token: @user.authentication_token
        }.not_to change{ UserTrainingStory.count }
      end
    end

    context "with a valid request and credentials" do
      it "handles successfully the request" do
        post :create, format: :json, user_training_story: post_attributes, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 201 ) # 201 = created
      end
      it "returns a valid JSON Hash with a valid, positive, 'id' member" do
        post :create, format: :json, user_training_story: post_attributes, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] > 0 ).to be true
      end
      it "adds a new row" do
        expect {
          post :create, format: :json, user_training_story: post_attributes, user_email: @user.email, user_token: @user.authentication_token
        }.to change{ UserTrainingStory.count }.by(1)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe 'GET #edit/:id' do
    context "with a non-JSON request" do
      it "refuses the request" do
        get :edit, id: @user_training_story.id, user_email: @user.email, user_token: @user.authentication_token
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 406 ) # 406 = not acceptable
      end
    end

    context "with a valid request but for an unlogged user," do
      it "refuses the request with unauthorized status" do
        get :edit, format: :json, id: @user_training_story.id
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
    end

    context "with valid parameters and credentials" do
      before(:each) do
        get :edit, id: @user_training_story.id, format: :json, user_email: @user.email, user_token: @user.authentication_token
      end
      it "handles successfully the request" do
        expect( response ).to be_a_success # 200 = success
      end
      it "returns a JSON hash representing the requested instance" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] ).to eq( @user_training_story.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe 'PUT #update/:id' do
    before(:all) do # Force the creation of the required rows:
      @updatable_row = FactoryGirl.create( :user_training_story, user_id: @user.id, total_training_time: 91 )
      @put_attributes = FactoryGirl.attributes_for(:user_training_story, user_id: @user.id, total_training_time: 123)
      @invalid_put_attributes = FactoryGirl.attributes_for(:user_training_story, user_id: @user.id, total_training_time: nil)
    end

    context "with a non-JSON request," do
      before(:each) do
        put :update, id: @updatable_row.id, user_training_story: @put_attributes, user_email: @user.email, user_token: @user.authentication_token
      end
      it "refuses the request" do
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 406 ) # 406 = not acceptable
      end
      it "returns a false 'success' status flag" do
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end
      it "doesn't update the existing row" do
        @updatable_row.reload
        expect( @updatable_row.total_training_time ).not_to eq( @put_attributes[:total_training_time] )
      end
    end

    context "with a valid request but for an unlogged user," do
      before(:each) do
        put :update, format: :json, id: @updatable_row.id, user_training_story: @put_attributes
      end
      it "refuses the request with unauthorized status" do
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
      it "doesn't update the existing row" do
        @updatable_row.reload
        expect( @updatable_row.total_training_time ).not_to eq( @put_attributes[:total_training_time] )
      end
    end

    context "with non-valid attributes," do
      before(:each) do
        put :update, format: :json, id: @updatable_row.id, user_training_story: @invalid_put_attributes, user_email: @user.email, user_token: @user.authentication_token
      end
      it "refuses the request" do
        expect( response ).not_to be_a_success # 400 = bad request
        expect(response.status).to eq( 400 ) # 400 = bad request
      end
      it "returns a false 'success' status flag" do
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end
      it "doesn't update the existing row" do
        @updatable_row.reload
        expect( @updatable_row.total_training_time ).not_to eq( @invalid_put_attributes[:total_training_time] )
      end
    end

    context "with a valid request and credentials" do
      before(:each) do
        put :update, format: :json, id: @updatable_row.id, user_training_story: @put_attributes, user_email: @user.email, user_token: @user.authentication_token
      end
      it "handles successfully the request" do
        expect( response ).to be_a_success # 200 = success
      end
      it "returns a true 'success' status flag" do
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( true )
      end
      it "updates the existing row" do
        expect( @updatable_row.total_training_time ).not_to eq( @put_attributes[:total_training_time] )
        @updatable_row.reload
        expect( @updatable_row.total_training_time ).to eq( @put_attributes[:total_training_time] )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end