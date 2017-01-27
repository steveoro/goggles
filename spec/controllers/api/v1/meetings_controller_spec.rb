require 'rails_helper'


describe Api::V1::MeetingsController, type: :controller, api: true do
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create( :user )
  end


  it_behaves_like( "(Ap1-V1-Controllers, #index & #show actions)", "meetings" )


  describe '[GET #index]' do
    context "without a :code_like filtering parameter," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, params: { user_email: @user.email, user_token: @user.authentication_token }
      end
      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns the list of all Meetings" do
        result_array = JSON.parse(response.body)
        expect( result_array.size ).to eq( Meeting.count )
      end
    end


    context "with a :code_like filtering parameter," do
      before :each do
        # Assert: we rely on the pre-loaded seeds here
        get :index, format: :json, params: { code_like: 'csi', user_email: @user.email, user_token: @user.authentication_token }
      end

      it_behaves_like( "(Ap1-V1-Controllers, success returning an Array of Hash)" )

      it "returns at least a match with the existing seeds" do
        result = JSON.parse(response.body)
        expect( result.first['code'] ).to match(/csi/i)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET #show]' do
    context "with a valid :id parameter," do
      before :each do
        @meeting_id = Meeting.select(:id).all.map{ |row| row.id }.flatten.uniq.sort{ rand - 0.5 }[0]
        # Assert: we rely on the pre-loaded seeds here
        get :show, format: :json, params: { id: @meeting_id, user_email: @user.email, user_token: @user.authentication_token }
      end

      it "handles successfully the request" do
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON Hash" do
        result = JSON.parse(response.body)
        expect( result ).to be_an_instance_of( Hash )
      end
      it "returns the correct match with the existing seeds" do
        result = JSON.parse(response.body)
        expect( result['id'] ).to eq( @meeting_id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # XXX We rely directly on the existing seeds to speed up these test.

  let(:team_manager) do
    # Choose the first, random team manager, whose affiliation has
    # at least a meeting with a far-fetched header date:
    TeamManager.all
      .select{ |tm| tm.team_affiliation.season.meetings.where("header_date > ?", Date.today + 1).count > 0 }
      .sort{ rand - 0.5 }.first
  end

  let(:random_meeting) do
    meeting = team_manager.team_affiliation.season
      .meetings
      .sort{rand - 0.5}.first
    expect( meeting ).to be_a( Meeting )
    meeting
  end
  let(:user) { FactoryGirl.create(:user) }
  #-- -------------------------------------------------------------------------
  #++


  describe '[PUT tag_for_user/:id]' do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    context "with a non-JSON request," do
      it "refuses the request" do
        put :tag_for_user, params: { id: random_meeting.id, user_email: user.email, user_token: user.authentication_token }
        expect(response.status).to eq( 406 )
      end
      it "doesn't changes the list of tags by users" do
        expect {
          put :tag_for_user, params: { id: random_meeting.id, user_email: user.email, user_token: user.authentication_token }
          random_meeting.reload
        }.not_to change{ random_meeting.tags_by_user_list.count }
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
        put :tag_for_user, format: :json, params: { id: random_meeting.id, user_email: user.email, user_token: user.authentication_token }
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON result of 'success' as true" do
        put :tag_for_user, format: :json, params: { id: random_meeting.id, user_email: user.email, user_token: user.authentication_token }
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( true )
      end
      it "updates the list of tags_by_user for the specified meeting" do
        expect( random_meeting.tags_by_user_list.include?("u#{ user.id }") ).to be false
        expect {
          put :tag_for_user, format: :json, params: { id: random_meeting.id, user_email: user.email, user_token: user.authentication_token }
          random_meeting.reload
        }.to change{ random_meeting.tags_by_user_list.count }.by(1)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[PUT tag_for_team/:id]' do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    context "with a non-JSON request," do
      it "refuses the request" do
        put :tag_for_team, params: { id: random_meeting.id, t: team_manager.team_affiliation_id, user_email: user.email, user_token: user.authentication_token }
        expect(response.status).to eq( 406 )
      end
      it "doesn't changes the list of tags by users" do
        expect {
          put :tag_for_team, params: { id: random_meeting.id, t: team_manager.team_affiliation_id, user_email: user.email, user_token: user.authentication_token }
          random_meeting.reload
        }.not_to change{ random_meeting.tags_by_team_list.count }
      end
    end

    context "with a JSON request, a not existing id but valid credentials," do
      it "handles the request with 'unprocessable entity' error result (422)" do
        put :tag_for_team, format: :json, params: { id: 0, t: team_manager.team_affiliation_id, user_email: user.email, user_token: user.authentication_token }
        expect(response.status).to eq( 422 )
      end
      it "returns a JSON result of 'success' as false" do
        put :tag_for_team, format: :json, params: { id: 0, t: team_manager.team_affiliation_id, user_email: user.email, user_token: user.authentication_token }
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( false )
      end
    end

    context "with a JSON request, an existing id and valid credentials," do
      it "handles successfully the request" do
        put :tag_for_team, format: :json, params: { id: random_meeting.id, t: team_manager.team_affiliation_id, user_email: user.email, user_token: user.authentication_token }
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON result of 'success' as true" do
        put :tag_for_team, format: :json, params: { id: random_meeting.id, t: team_manager.team_affiliation_id, user_email: user.email, user_token: user.authentication_token }
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( true )
      end
      it "updates the list of tags_by_team for the specified meeting" do
        expect( random_meeting.tags_by_team_list.include?("ta#{ team_manager.team_affiliation_id }") ).to be false
        expect {
          put :tag_for_team, format: :json, params: { id: random_meeting.id, t: team_manager.team_affiliation_id, user_email: user.email, user_token: user.authentication_token }
          random_meeting.reload
        }.to change{ random_meeting.tags_by_team_list.count }.by(1)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
