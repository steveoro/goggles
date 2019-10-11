require 'rails_helper'


describe Api::V1::TeamsController, type: :controller, api: true do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create( :user )
  end


  describe '[GET team/count_meetings]' do
    context "with a non-JSON request," do
      before :each do
        get :count_meetings, params: { id: 1, user_email: @user.email, user_token: @user.authentication_token }
      end
      it "refuses the request" do
        expect(response.status).to eq( 406 )
      end
    end

    context "with invalid credentials," do
      before :each do
        get :count_details, format: :json, params: { id: 1 }
      end
      it "refuses the request" do
        expect(response.status).to eq(401) # Unauthorized
      end
    end

    context "with valid parameters and credentials," do
      before :each do
        get :count_meetings, format: :json, params: { id: 1, user_email: @user.email, user_token: @user.authentication_token }
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a positive integer for a team with meetings" do
        result_count = response.body.to_i
        expect( result_count > 0 ).to be true
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET team/count_results]' do
    context "with a non-JSON request," do
      before :each do
        get :count_results, params: { id: 1, user_email: @user.email, user_token: @user.authentication_token }
      end
      it "refuses the request" do
        expect(response.status).to eq( 406 )
      end
    end

    context "with invalid credentials," do
      before :each do
        get :count_details, format: :json, params: { id: 1 }
      end
      it "refuses the request" do
        expect(response.status).to eq(401) # Unauthorized
      end
    end

    context "with valid parameters and credentials," do
      before :each do
        get :count_results, format: :json, params: { id: 1, user_email: @user.email, user_token: @user.authentication_token }
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a positive integer for a team with results" do
        result_count = response.body.to_i
        expect( result_count > 0 ).to be true
      end
    end
  end


  describe '[GET team/count_details]' do
    context "with a non-JSON request," do
      before :each do
        get :count_details, params: { id: 1, user_email: @user.email, user_token: @user.authentication_token }
      end
      it "refuses the request" do
        expect(response.status).to eq( 406 )
      end
    end

    context "with invalid credentials," do
      before :each do
        get :count_details, format: :json, params: { id: 1 }
      end
      it "refuses the request" do
        expect(response.status).to eq(401) # Unauthorized
      end
    end

    context "with valid parameters and credentials," do
      before :each do
        get :count_details, format: :json, params: { id: 1, user_email: @user.email, user_token: @user.authentication_token }
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


  describe '[GET team/get_affiliation]' do
    context "with a non-JSON request," do
      before :each do
        get :get_affiliation, params: { id: 1, season_id: 181 }
      end
      it "refuses the request" do
        expect(response.status).to eq( 406 )
      end
    end

    context "with valid parameters," do
      before :each do
        get :get_affiliation, format: :json, params: { id: 1, season_id: 181 }
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a valid TeamAffiliation for the specified Team & Season IDs" do
        result = JSON.parse(response.body)
        expect(result).to be_an(Hash)
        expect(result['id']).to eq(TeamAffiliation.find_by(season_id: 181, team_id: 1).id)
      end
    end

    context "with a non existing season/team combination," do
      before :each do
        get :get_affiliation, format: :json, params: { id: 0, season_id: 0 }
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON-parsable nil result" do
        result = JSON.parse(response.body)
        expect(result).to be nil
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET team/current_swimmers]' do
    context "with a non-JSON request," do
      before :each do
        get :current_swimmers, params: { id: 1 }
      end
      it "refuses the request" do
        expect(response.status).to eq( 406 )
      end
    end

    context "with valid parameters and credentials," do
      before :each do
        login_user()
        get :current_swimmers, format: :json, params: { id: 1 }
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a non-empty body" do
        expect( response.body ).not_to be_empty
      end

      it "returns a JSON array" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of( Array )
      end
    end
  end
  # ===========================================================================


  it_behaves_like( "(Ap1-V1-Controllers, #index & #show actions)", "teams" )


  describe '[GET teams/index]' do
    context "with :q filtering parameter," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, params: { q: 'OBER', user_email: @user.email, user_token: @user.authentication_token }
      end

      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least a match with the existing seeds" do
        result = JSON.parse(response.body)
        expect( result.first['name'] ).to match(/OBER/)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe '[GET teams/show]' do
    context "with valid & custom parameters and credentials," do
      before :each do
        @team = create(:team)
        get :show, format: :json, params: { id: @team.id, user_email: @user.email, user_token: @user.authentication_token }
      end
      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON hash representing the requested instance" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of(Hash)
        expect( result['id'] ).to eq( @team.id )
        expect( result['name'] ).to eq( @team.name )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
