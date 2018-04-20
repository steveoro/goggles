require 'rails_helper'
require 'common/format'


describe Api::V1::PassagesController, type: :controller, api: true do
  before(:all) do # Force the creation of the required rows:
    @user = create( :user )
    mir = create( :meeting_individual_result_with_passages )
    @fixture_row = mir.passages.first
  end

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  #-- -------------------------------------------------------------------------
  #++


  describe 'GET #index' do
    context "with a non-JSON request" do
      before :each do
        get :index, params: { user_email: @user.email, user_token: @user.authentication_token }
      end
      it "refuses the request" do
        expect(response.status).to eq( 406 )
      end
    end

    context "with valid parameters and credentials" do
      before :each do
        get :index, format: :json, params: { team_id: @fixture_row.team_id, meeting_id: @fixture_row.meeting.id, user_email: @user.email, user_token: @user.authentication_token }
      end

      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least a match with the created fixture" do
        result = JSON.parse(response.body)
        expect( result.map{ |row_hash| row_hash['id'] } ).to include( @fixture_row.id )
      end
    end

    context "with a valid request but for an unlogged user," do
      it "refuses the request with unauthorized status" do
        get :index, format: :json, params: { team_id: @fixture_row.team_id, meeting_id: @fixture_row.meeting.id }
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
    end
  end

  describe 'GET #show/:id' do
    context "with a non-JSON request" do
      before :each do
        get :show, params: { id: @fixture_row.id, user_email: @user.email, user_token: @user.authentication_token }
      end
      it "refuses the request" do
        expect(response.status).to eq( 406 )
      end
    end

    context "with valid parameters and credentials" do
      before :each do
        get :show, format: :json, params: { id: @fixture_row.id, user_email: @user.email, user_token: @user.authentication_token }
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON hash representing the requested instance" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] ).to eq( @fixture_row.id )
      end
    end

    context "with a valid request but for an unlogged user," do
      it "refuses the request with unauthorized status" do
        get :show, format: :json, params: { id: @fixture_row.id }
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe 'POST #create/:passage' do
    before(:all) do # Force the creation of the required rows:
      mir_1 = FactoryBot.create( :meeting_individual_result_with_passages )
      mir_2 = FactoryBot.create( :meeting_individual_result_with_passages )
      @post_attributes = mir_1.passages.first.attributes.reject{ |k,v| ['id'].include?(k.to_s) }
      # Let's create invalid update attributes by rejecting required attributes:
      @invalid_post_attributes = @post_attributes.reject{ |k,v| ['id', 'seconds', 'minutes'].include?(k.to_s) }
      @invalid_post_attributes['hundreds'] = nil
    end

    context "with a non-JSON request," do
      it "refuses the request" do
        post :create, params: { passage: @post_attributes, user_email: @user.email, user_token: @user.authentication_token }
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 406 ) # 406 = not acceptable
      end
      it "doesn't add a new row" do
        expect {
          post :create, params: { passage: @post_attributes, user_email: @user.email, user_token: @user.authentication_token }
        }.not_to change{ Passage.count }
      end
    end

    context "with a valid request but for an unlogged user," do
      it "refuses the request with unauthorized status" do
        post :create, format: :json, params: { passage: @post_attributes }
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
      it "doesn't add a new row" do
        expect {
          post :create, format: :json, params: { passage: @post_attributes }
        }.not_to change{ Passage.count }
      end
    end

    context "with non-valid attributes," do
      it "handles successfully the request" do
        post :create, format: :json, params: { passage: @invalid_post_attributes, user_email: @user.email, user_token: @user.authentication_token }
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 422 )
      end
      it "returns an empty body" do
        post :create, format: :json, params: { passage: @invalid_post_attributes, user_email: @user.email, user_token: @user.authentication_token }
        expect( response.body ).to be_an_instance_of( String )
        expect( response.body ).to eq("null")
      end
      it "doesn't add a new row" do
        expect {
          post :create, format: :json, params: { passage: @invalid_post_attributes, user_email: @user.email, user_token: @user.authentication_token }
        }.not_to change{ Passage.count }
      end
    end

    context "with a valid request and credentials" do
# FIXME ROUTE CLASH
      xit "handles successfully the request" do
        post :create, format: :json, params: { passage: @post_attributes, user_email: @user.email, user_token: @user.authentication_token }
        expect(response.status).to eq( 201 ) # 201 = created
      end
# FIXME ROUTE CLASH
      xit "returns a valid JSON Hash with a valid, positive, 'id' member" do
        post :create, controller: :passages, action: :create, format: :json, params: { passage: @post_attributes, user_email: @user.email, user_token: @user.authentication_token }
        post api_v1_passages_create_path(
          format: :json,
          params: { passage: @post_attributes, user_email: @user.email, user_token: @user.authentication_token }
        )
#        post :create, format: :json, passage: @post_attributes, user_email: @user.email, user_token: @user.authentication_token
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] > 0 ).to be true
      end
# FIXME ROUTE CLASH
      xit "adds a new row" do
        expect {
          post :create, format: :json, params: { passage: @post_attributes, user_email: @user.email, user_token: @user.authentication_token }
        }.to change{ Passage.count }
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe 'GET #edit/:id' do
    context "with a non-JSON request" do
      it "refuses the request" do
        get :edit, params: { id: @fixture_row.id, user_email: @user.email, user_token: @user.authentication_token }
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 406 ) # 406 = not acceptable
      end
    end

    context "with a valid request but for an unlogged user," do
      it "refuses the request with unauthorized status" do
        get :edit, format: :json, params: { id: @fixture_row.id }
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
    end

    context "with valid parameters and credentials" do
      before(:each) do
        get :edit, format: :json, params: { id: @fixture_row.id, user_email: @user.email, user_token: @user.authentication_token }
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
    before(:each) do # Force the creation of the required rows:
      mir_1 = FactoryBot.create( :meeting_individual_result_with_passages )
      mir_2 = FactoryBot.create( :meeting_individual_result_with_passages )
      @updatable_row = mir_1.passages.first
      @put_attributes = mir_2.passages.first.attributes.reject{ |k,v| ['id'].include?(k.to_s) }
      # Make sure the update attributes are at least a little bit different:
      @put_attributes['position'] = @updatable_row.position + 1 if ( @updatable_row.position == @put_attributes['position'] )
      @put_attributes['hundreds_from_start'] = @updatable_row.hundreds_from_start + 1 if ( @updatable_row.hundreds_from_start == @put_attributes['hundreds_from_start'] )
      # Let's create invalid update attributes by rejecting required attributes:
      @invalid_put_attributes = @put_attributes.reject{ |k,v| ['id', 'seconds', 'minutes'].include?(k.to_s) }
      @invalid_put_attributes['hundreds'] = nil
    end

    context "with a non-JSON request," do
      before(:each) do
        put :update, params: { id: @updatable_row.id, passage: @put_attributes, user_email: @user.email, user_token: @user.authentication_token }
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
        expect( @updatable_row.position ).not_to eq( @put_attributes['position'] )
        expect( @updatable_row.hundreds_from_start ).not_to eq( @put_attributes['hundreds_from_start'] )
      end
    end

    context "with a valid request but for an unlogged user," do
      before(:each) do
        put :update, format: :json, params: { id: @updatable_row.id, passage: @put_attributes }
      end
      it "refuses the request with unauthorized status" do
        expect( response ).not_to be_a_success
        expect(response.status).to eq( 401 ) # 401 = unauthorized
      end
      it "doesn't update the existing row" do
        @updatable_row.reload
        expect( @updatable_row.position ).not_to eq( @put_attributes['position'] )
        expect( @updatable_row.hundreds_from_start ).not_to eq( @put_attributes['hundreds_from_start'] )
      end
    end

    context "with non-valid attributes," do
      before(:each) do
        put :update, format: :json, params: { id: @updatable_row.id, passage: @invalid_put_attributes, user_email: @user.email, user_token: @user.authentication_token }
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
        expect( @updatable_row.position ).not_to eq( @put_attributes['position'] )
        expect( @updatable_row.hundreds_from_start ).not_to eq( @put_attributes['hundreds_from_start'] )
      end
    end

    context "with a valid request and credentials" do
      before(:each) do
        expect( @updatable_row.position ).not_to eq( @put_attributes['position'] )
        expect( @updatable_row.hundreds_from_start ).not_to eq( @put_attributes['hundreds_from_start'] )
        put :update, format: :json, params: { id: @updatable_row.id, passage: @put_attributes, user_email: @user.email, user_token: @user.authentication_token }
      end
      it "handles successfully the request" do
        expect( response ).to be_a_success # 200 = success
      end
      it "returns a true 'success' status flag" do
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( true )
      end
      it "updates the existing row" do
        @updatable_row.reload
        expect( @updatable_row.position ).to eq( @put_attributes['position'] )
        expect( @updatable_row.hundreds_from_start ).to eq( @put_attributes['hundreds_from_start'] )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[DELETE destroy/:id]' do
    before :each do
      mir = FactoryBot.create( :meeting_individual_result_with_passages )
      @deletable_row = mir.passages.first
    end

    context "with a non-JSON request" do
      before(:each) do
        delete :destroy, params: { id: @deletable_row.id, user_email: @user.email, user_token: @user.authentication_token }
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
        delete :destroy, format: :json, params: { id: @deletable_row.id }
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
        delete :destroy, format: :json, params: { id: 0, user_email: @user.email, user_token: @user.authentication_token }
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
        delete :destroy, format: :json, params: { id: @deletable_row.id, user_email: @user.email, user_token: @user.authentication_token }
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON result of 'success' as true" do
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( true )
      end
      it "deletes the specified row" do
        expect( Passage.find_by_id( @deletable_row.id ) ).to be nil
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
