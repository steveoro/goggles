require 'rails_helper'
require 'common/format'


describe Api::V1::UserTrainingsController, :type => :controller do
  before(:all) do # Force the creation of the required rows:
    @user = FactoryGirl.create( :user )
    @fixture_row = FactoryGirl.create( :user_training, user_id: @user.id )
  end

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  #-- -------------------------------------------------------------------------
  #++

  it_behaves_like( "(Ap1-V1-Controllers, #index & #show actions)", "user_trainings" )


  describe 'GET #index' do
    context "with :user_id filtering parameter" do
      before(:each) do
        get :index, user_id: @user.id, format: :json, user_email: @user.email, user_token: @user.authentication_token
      end

      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least a match with the created fixture" do
        result = JSON.parse(response.body)
        expect( result.map{|h| h['id']} ).to include( @fixture_row.id )
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
        get :show, format: :json, id: @fixture_row.id
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe 'POST #create/:user_training' do
    let(:post_attributes) { FactoryGirl.attributes_for(:user_training, user_id: @user.id) }

    context "with a non-JSON request," do
      it "refuses the request" do
        post :create, user_training: post_attributes, user_email: @user.email, user_token: @user.authentication_token
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 406 ) # 406 = not acceptable
      end
      it "doesn't add a new row" do
        expect {
          post :create, user_training: post_attributes, user_email: @user.email, user_token: @user.authentication_token
        }.not_to change{ UserTraining.count }
      end
    end

    context "with a valid request but for an unlogged user," do
      it "refuses the request with unauthorized status" do
        post :create, format: :json, user_training: post_attributes
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
      it "doesn't add a new row" do
        expect {
          post :create, format: :json, user_training: post_attributes
        }.not_to change{ UserTraining.count }
      end
    end

    context "with non-valid attributes," do
      let(:invalid_post_attributes) { FactoryGirl.attributes_for(:invalid_user_training) }

      it "refuses the request" do
        post :create, format: :json, user_training: invalid_post_attributes, user_email: @user.email, user_token: @user.authentication_token
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 422 )
      end
      it "returns a valid JSON Hash with a nil 'id' member" do
        post :create, format: :json, user_training: invalid_post_attributes, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] ).to be_nil
      end
      it "doesn't add a new row" do
        expect {
          post :create, format: :json, user_training: invalid_post_attributes, user_email: @user.email, user_token: @user.authentication_token
        }.not_to change{ UserTraining.count }
      end
    end

    context "with a valid request and credentials" do
      it "handles successfully the request" do
        post :create, format: :json, user_training: post_attributes, user_email: @user.email, user_token: @user.authentication_token
        expect(response.status).to eq( 201 ) # 201 = created
      end
      it "returns a valid JSON Hash with a valid, positive, 'id' member" do
        post :create, format: :json, user_training: post_attributes, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] > 0 ).to be true
      end
      it "adds a new row" do
        expect {
          post :create, format: :json, user_training: post_attributes, user_email: @user.email, user_token: @user.authentication_token
        }.to change{ UserTraining.count }.by(1)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe 'GET #edit/:id' do
    context "with a non-JSON request" do
      it "refuses the request" do
        get :edit, id: @fixture_row.id, user_email: @user.email, user_token: @user.authentication_token
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 406 ) # 406 = not acceptable
      end
    end

    context "with a valid request but for an unlogged user," do
      it "refuses the request with unauthorized status" do
        get :edit, format: :json, id: @fixture_row.id
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
    end

    context "with valid parameters and credentials" do
      before(:each) do
        get :edit, id: @fixture_row.id, format: :json, user_email: @user.email, user_token: @user.authentication_token
      end
      it "handles successfully the request" do
        expect( response ).to be_a_success # 200 = success
      end
      it "returns a JSON hash representing the requested instance" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] ).to eq( @fixture_row.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe 'PUT #update/:id' do
    before(:all) do # Force the creation of the required rows:
      @updatable_row = FactoryGirl.create( :user_training, user_id: @user.id )
      @put_attributes = FactoryGirl.attributes_for(:user_training, user_id: @user.id, description: "Another description (UPDATED)")
      @invalid_put_attributes = FactoryGirl.attributes_for(:invalid_user_training)
    end

    context "with a non-JSON request," do
      before(:each) do
        put :update, id: @updatable_row.id, user_training: @put_attributes, user_email: @user.email, user_token: @user.authentication_token
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
        expect( @updatable_row.description ).not_to eq( @put_attributes[:description] )
      end
    end

    context "with a valid request but for an unlogged user," do
      before(:each) do
        put :update, format: :json, id: @updatable_row.id, user_training: @put_attributes
      end
      it "refuses the request with unauthorized status" do
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
      it "doesn't update the existing row" do
        @updatable_row.reload
        expect( @updatable_row.description ).not_to eq( @put_attributes[:description] )
      end
    end

    context "with non-valid attributes," do
      before(:each) do
        put :update, format: :json, id: @updatable_row.id, user_training: @invalid_put_attributes, user_email: @user.email, user_token: @user.authentication_token
      end
      it "refuses the request" do
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 400 ) # 400 = bad request
      end
      it "returns a false 'success' status flag" do
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end
      it "doesn't update the existing row" do
        @updatable_row.reload
        expect( @updatable_row.description ).not_to eq( @invalid_put_attributes[:description] )
      end
    end

    context "with a valid request and credentials" do
      before(:each) do
        put :update, format: :json, id: @updatable_row.id, user_training: @put_attributes, user_email: @user.email, user_token: @user.authentication_token
      end
      it "handles successfully the request" do
        expect( response ).to be_a_success # 200 = success
      end
      it "returns a true 'success' status flag" do
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( true )
      end
      it "updates the existing row" do
        expect( @updatable_row.description ).not_to eq( @put_attributes[:description] )
        @updatable_row.reload
        expect( @updatable_row.description ).to eq( @put_attributes[:description] )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[DELETE destroy/:id]' do
    before :each do
      @deletable_row = FactoryGirl.create( :user_training, user_id: @user.id )
    end

    context "with a non-JSON request" do
      before(:each) do
        delete :destroy, id: @deletable_row.id, user_email: @user.email, user_token: @user.authentication_token
      end
      it "refuses the request" do
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 406 ) # 406 = not acceptable
      end
      it "returns a false 'success' status flag" do
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end
      it "doesn't delete the specified row" do
        @deletable_row.reload
        expect( @deletable_row.destroyed? ).to be false
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
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 422 ) # 422 = unprocessable entity
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
        expect( UserTraining.find_by_id( @deletable_row.id ) ).to be nil
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
