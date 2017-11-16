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


  let(:future_ending_season) do
    season = create( :season,
      begin_date: Date.parse("#{ DateTime.now.year }-10-01"),
      end_date:   Date.parse("#{ DateTime.now.year+1 }-09-01")
    )
    expect( season ).to be_a( Season )
    season
  end
  let(:future_ending_ta) do
    ta = create( :team_affiliation,
      season: future_ending_season
    )
    expect( ta ).to be_a( TeamAffiliation )
    ta
  end
  let(:future_manageable_meeting) do
    meeting = create( :meeting,
      season: future_ending_season
    )
    expect( meeting ).to be_a( Meeting )
    meeting
  end
  let(:team_manager) do
    team_manager = create( :team_manager,
      team_affiliation: future_ending_ta
    )
    expect( team_manager ).to be_a( TeamManager )
    team_manager
  end

  let( :untagged_meeting ) do
    meeting_session = create(
      :meeting_session,
      meeting: future_manageable_meeting,
      scheduled_date: future_manageable_meeting.header_date
    )
    expect( meeting_session ).to be_a( MeetingSession )
    create( :meeting_event_individual, meeting_session: meeting_session )
    expect( future_manageable_meeting.meeting_individual_results.count ).to eq(0)
    expect( future_manageable_meeting.meeting_reservations.count ).to eq(0)
    future_manageable_meeting
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
        put :tag_for_user, params: { id: untagged_meeting.id, user_email: user.email, user_token: user.authentication_token }
        expect(response.status).to eq( 406 )
      end
      it "doesn't changes the list of tags by users" do
        expect {
          put :tag_for_user, params: { id: untagged_meeting.id, user_email: user.email, user_token: user.authentication_token }
          untagged_meeting.reload
        }.not_to change{ untagged_meeting.tags_by_user_list.count }
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
        put :tag_for_user, format: :json, params: { id: untagged_meeting.id, user_email: user.email, user_token: user.authentication_token }
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON result of 'success' as true" do
        put :tag_for_user, format: :json, params: { id: untagged_meeting.id, user_email: user.email, user_token: user.authentication_token }
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( true )
      end
      it "updates the list of tags_by_user for the specified meeting" do
        expect( untagged_meeting.tags_by_user_list.include?("u#{ user.id }") ).to be false
        expect {
          put :tag_for_user, format: :json, params: { id: untagged_meeting.id, user_email: user.email, user_token: user.authentication_token }
          untagged_meeting.reload
        }.to change{ untagged_meeting.tags_by_user_list.count }.by(1)
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
        put :tag_for_team, params: { id: untagged_meeting.id, t: team_manager.team_affiliation_id, user_email: user.email, user_token: user.authentication_token }
        expect(response.status).to eq( 406 )
      end
      it "doesn't changes the list of tags by users" do
        expect {
          put :tag_for_team, params: { id: untagged_meeting.id, t: team_manager.team_affiliation_id, user_email: user.email, user_token: user.authentication_token }
          untagged_meeting.reload
        }.not_to change{ untagged_meeting.tags_by_team_list.count }
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
        put :tag_for_team, format: :json, params: { id: untagged_meeting.id, t: team_manager.team_affiliation_id, user_email: user.email, user_token: user.authentication_token }
        expect(response.status).to eq( 200 )
      end
      it "returns a JSON result of 'success' as true" do
        put :tag_for_team, format: :json, params: { id: untagged_meeting.id, t: team_manager.team_affiliation_id, user_email: user.email, user_token: user.authentication_token }
        result = JSON.parse(response.body)
        expect( result['success'] ).to eq( true )
      end
      it "updates the list of tags_by_team for the specified meeting" do
        expect( untagged_meeting.tags_by_team_list.include?("ta#{ team_manager.team_affiliation_id }") ).to be false
        expect {
          put :tag_for_team, format: :json, params: { id: untagged_meeting.id, t: team_manager.team_affiliation_id, user_email: user.email, user_token: user.authentication_token }
          untagged_meeting.reload
        }.to change{ untagged_meeting.tags_by_team_list.count }.by(1)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe '[GET download]' do
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end
    let( :test_addr ) { "https://www.google.com/" }

    context "with a non-JSON request," do
      it "redirects the request" do
        get :download, params: { url: test_addr }
        expect( response ).to be_a_redirect
      end
    end

    context "with a JSON request and nil or invalid credentials," do
      it "handles the request with 'anauthorized' error result (401)" do
        get :download, format: :json, params: { url: test_addr }
        expect(response.status).to eq( 401 )
      end
    end

# FIXME
    context "with a JSON request and valid credentials," do
      xit "handles successfully the request" do
        get :download, format: :json, params: { url: test_addr, body_id: "body", user_email: user.email, user_token: user.authentication_token }
        expect(response.status).to eq( 200 )
      end
      xit "returns a JSON result of 'success' as true and the request payload as 'data'" do
        get :download, format: :json, params: { url: test_addr, body_id: "body", user_email: user.email, user_token: user.authentication_token }
        result = JSON.parse( response.body )
# DEBUG
        puts "\r\n------------8<-----------\r\n#{ result.inspect }\r\n------------8<-----------"
        expect( result['success'] ).to eq( true )
        expect( result['data'] ).to be_present
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
