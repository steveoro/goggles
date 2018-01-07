require 'rails_helper'


describe Api::V1::SwimmersController, type: :controller, api: true do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create( :user )
  end


  it_behaves_like( "(Ap1-V1-Controllers, #index & #show actions)", "swimmers" )


  describe '[GET swimmers/index]' do
    context "with a matching :q filtering parameter," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, params: { q: 'stef' }
      end
      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )
      it "returns at least a match with the existing seeds" do
        result = JSON.parse(response.body)
        expect( result.first['complete_name'] ).to match(/stef/i)
      end
    end


    context "with a matching :t ARRAY filtering parameter," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, params: { t: [1] }
      end
      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )
      it "returns at least a match with the existing seeds" do
        result = JSON.parse(response.body)
        id = result.first['id']
        swimmer = Swimmer.find_by_id( id )
        expect( swimmer ).to be_a( Swimmer )
        expect( swimmer.badges.first.team_id ).to eq(1)
        expect( swimmer.badges.last.team_id ).to eq(1)
      end
    end


    context "with a matching :t SINGLE filtering parameter," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, params: { t: 1 }
      end
      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )
      it "returns at least a match with the existing seeds" do
        result = JSON.parse(response.body)
        id = result.first['id']
        swimmer = Swimmer.find_by_id( id )
        expect( swimmer ).to be_a( Swimmer )
        expect( swimmer.badges.first.team_id ).to eq(1)
        expect( swimmer.badges.last.team_id ).to eq(1)
      end
    end


    context "with a matching :s filtering parameter," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, params: { s: 1 }
      end
      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )
      it "returns several matches with the existing seeds" do
        result = JSON.parse(response.body)
        expect( result.size ).to be > 210
      end
    end


    context "with both matching :q AND :t (ARRAY) filtering parameters," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, params: { q: 'allor', t: [1] }
      end
      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )
      it "returns at least a match for the name (with the existing seeds)" do
        result = JSON.parse(response.body)
        expect( result.first['complete_name'] ).to match(/allor/i)
      end
      it "returns at least a match for the team (with the existing seeds)" do
        result = JSON.parse(response.body)
        id = result.first['id']
        swimmer = Swimmer.find_by_id( id )
        expect( swimmer ).to be_a( Swimmer )
        expect( swimmer.badges.first.team_id ).to eq(1)
        expect( swimmer.badges.last.team_id ).to eq(1)
      end
    end


    context "with both matching :q AND :s filtering parameters," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, params: { q: 'liga', s: 1 }
      end
      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )
      it "returns the exact match for the name (with the existing seeds)" do
        result = JSON.parse(response.body)
        expect( result.first['complete_name'] ).to match(/liga/i)
      end
      it "returns the exact match for the specified filters (with the existing seeds)" do
        result = JSON.parse(response.body)
        expect( result.size ).to eq(1)
        id = result.first['id']
        swimmer = Swimmer.find_by_id( id )
        expect( swimmer ).to be_a( Swimmer )
        expect( swimmer.badges.first.season_id ).to eq(1)
      end
    end


    context "with both matching :s AND :t (ARRAY) filtering parameters," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, params: { s: 1, t: [1] }
      end
      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )
      it "returns all the matches for the specified season and team (with the existing seeds)" do
        result = JSON.parse(response.body)
        expect( result.size ).to eq(26)
      end
    end


    context "with matching :q, :s AND :t (ARRAY) filtering parameters," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, params: { q: 'liga', s: 1, t: [1] }
      end
      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )
      it "returns the exact match for the name (with the existing seeds)" do
        result = JSON.parse(response.body)
        expect( result.first['complete_name'] ).to match(/liga/i)
      end
      it "returns the exact match for the specified filters (with the existing seeds)" do
        result = JSON.parse(response.body)
        expect( result.size ).to eq(1)
        id = result.first['id']
        swimmer = Swimmer.find_by_id( id )
        expect( swimmer ).to be_a( Swimmer )
        expect( swimmer.badges.first.team_id ).to eq(1)
        expect( swimmer.badges.first.season_id ).to eq(1)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET swimmers/show]' do
    context "with valid & custom parameters and credentials," do
      before :each do
        @swimmer = create(:swimmer)
        get :show, format: :json, params: { id: @swimmer.id, user_email: @user.email, user_token: @user.authentication_token }
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON hash representing the requested instance" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] ).to eq( @swimmer.id )
        expect( result['complete_name'] ).to eq( @swimmer.complete_name )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  let(:user)    { FactoryBot.create(:user) }
  let(:swimmer) { FactoryBot.create(:swimmer) }
  #-- -------------------------------------------------------------------------
  #++


  describe '[PUT tag_for_user/:id]' do

    context "with a non-JSON request," do
      it "refuses the request" do
        put :tag_for_user, params: { id: swimmer.id, user_email: user.email, user_token: user.authentication_token }
        expect(response.status).to eq( 406 )
      end
      it "doesn't changes the list of tags by users" do
        expect {
          put :tag_for_user, params: { id: swimmer.id, user_email: user.email, user_token: user.authentication_token }
          swimmer.reload
        }.not_to change{ swimmer.tags_by_user_list.count }
      end
    end

    context "with a JSON request, a not existing id but valid credentials," do
      it "handles the request with 'unprocessable entity' error result (422)" do
        put :tag_for_user, format: :json, params: { id: 0, user_email: user.email, user_token: user.authentication_token }
        expect(response.status).to eq( 422 )
      end
      it "returns a JSON result of 'success' as false" do
        put :tag_for_user, format: :json, params: { id: 0, user_email: user.email, user_token: user.authentication_token }
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end
    end

    context "with a JSON request, an existing id and valid credentials," do
      it "handles successfully the request" do
        put :tag_for_user, format: :json, params: { id: swimmer.id, user_email: user.email, user_token: user.authentication_token }
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON result of 'success' as true" do
        put :tag_for_user, format: :json, params: { id: swimmer.id, user_email: user.email, user_token: user.authentication_token }
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( true )
      end
      it "updates the list of tags_by_user for the specified meeting" do
        expect( swimmer.tags_by_user_list.include?("u#{ user.id }") ).to be false
        expect {
          put :tag_for_user, format: :json, params: { id: swimmer.id, user_email: user.email, user_token: user.authentication_token }
          swimmer.reload
        }.to change{ swimmer.tags_by_user_list.count }.by(1)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
