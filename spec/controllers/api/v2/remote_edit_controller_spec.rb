require 'rails_helper'

RSpec.describe Api::V2::RemoteEditController, type: :controller, api: true do

  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = create( :user )
  end

  let(:mrr_sample)    { MeetingRelayResult.limit(200).sample }
  let(:ta)            { TeamAffiliation.where( team_id: mrr_sample.team_id, season_id: mrr_sample.season.id ).first }
  let(:swimmer)       { ta.badges.sample.swimmer }
  let(:min)           { (0..1).to_a.sample }
  let(:sec)           { (0..59).to_a.sample }
  let(:hun)           { (0..59).to_a.sample }
  let(:reaction)      { (0..99).to_a.sample }
  let(:timing_text)   { "#{ min }'#{ sec }\"#{ hun }" }
  let(:reaction_text) { "0\"#{ reaction }" }

  let(:passage)       { Passage.includes(:meeting_individual_result).limit(100).sample }
  let(:destroyable_passage) { Passage.order(created_at: :asc).limit(100).sample }
  #-- -------------------------------------------------------------------------
  #++


  shared_examples_for "valid JSON request but with incomplete required parameters" do
    it "returns a JSON 'error' result" do
      expect( response.status ).to eq( 400 )
      result = JSON.parse(response.body)
      expect( result['result'] ).to eq('error')
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "POST #update_relay_swimmer" do

    context "for an unlogged user making a non-JSON request," do
      it "redirects to the login page" do
        post( :update_relay_swimmer,
          params: {
            u: @user.email,
            t: @user.authentication_token,
            mrr: mrr_sample.id, s: swimmer.id, o: 1, time: timing_text
          }
        )
        # [Steve A.]
        # NOTE that the path below assumes that the Core Engine including
        # the Devise routes is mounted to "/". (Otherwise is should be changed
        # to something like "/mounting_path/users/sign_in").
        # Keep in mind also that:
        #   new_user_session_path( locale='XX' ) => '/users/sign_in?locale=XX'
        expect( response ).to be_a_redirect
        expect( response ).to redirect_to( '/users/sign_in' )
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    context "for an logged-in user w/ an incomplete JSON request (missing MRR)," do
      before(:each) do
        login_user(@user)
        post( :update_relay_swimmer, format: :json,
          params: {
            u: @user.email, t: @user.authentication_token,
            s: swimmer.id, o: 1, time: timing_text
          }
        )
      end
      it_behaves_like "valid JSON request but with incomplete required parameters"
    end

    context "for an logged-in user w/ an incomplete JSON request (missing relay_order)," do
      before(:each) do
        login_user(@user)
        post( :update_relay_swimmer, format: :json,
          params: {
            u: @user.email, t: @user.authentication_token,
            mrr: mrr_sample.id, s: swimmer.id, time: timing_text
          }
        )
      end
      it_behaves_like "valid JSON request but with incomplete required parameters"
    end


    context "for an logged-in user w/ a valid JSON request (full data => CREATE or UPDATE)," do
      before(:each) do
        login_user(@user)
        post( :update_relay_swimmer, format: :json,
          params: {
            u: @user.email, t: @user.authentication_token,
            mrr: mrr_sample.id, s: swimmer.id, o: 1, time: timing_text, r: reaction_text
          }
        )
      end

      it "returns http success with a JSON 'ok' result" do
        expect( response ).to have_http_status(:success)
        result = JSON.parse(response.body)
        expect( result['result'] ).to eq('ok')
      end
      it "persists the specified values into the MeetingRelaySwimmer row specified by the keys (creating it when not existing)" do
        mrs = MeetingRelaySwimmer.where(
          meeting_relay_result_id: mrr_sample.id,
          swimmer_id:  swimmer.id,
          relay_order: 1
        ).first
        expect( mrs ).to be_a( MeetingRelaySwimmer )
        expect( mrs.get_timing_instance.to_hundreds ).to eq( TimingParser.parse( timing_text ).to_hundreds )
        expect( mrs.reaction_time ).to eq( TimingParser.parse( reaction_text ).to_hundreds / 100.0 )
        expect( mrs.badge_id ).to be > 0
        expect( mrs.stroke_type_id ).to be > 0
      end
    end


    context "for an logged-in user w/ a valid JSON request (valid keys but no swimmer_id => DELETE)," do
      let(:mrs_deletable) { MeetingRelaySwimmer.order(created_at: :asc).limit(100).sample }

      before(:each) do
        login_user(@user)
        post( :update_relay_swimmer, format: :json,
          params: {
            u: @user.email, t: @user.authentication_token,
            mrr: mrs_deletable.meeting_relay_result_id, o: mrs_deletable.relay_order
          }
        )
      end

      it "returns http success with a JSON 'ok' result" do
        expect( response ).to have_http_status(:success)
        result = JSON.parse(response.body)
        expect( result['result'] ).to eq('ok')
      end
      it "deletes any existing MeetingRelaySwimmer row specified by the keys" do
        expect( MeetingRelaySwimmer.find_by_id( mrs_deletable.id ) ).to be nil
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++



  describe "POST #update_passage" do

    context "for an unlogged user making a non-JSON request," do
      it "redirects to the login page" do
        post( :update_passage,
          params: {
            u: @user.email,
            t: @user.authentication_token,
            p: passage.id, time: timing_text, r: reaction_text,
            mpg: passage.meeting_program_id,  pt: passage.passage_type_id,
            s: passage.swimmer_id, te: passage.team_id,
            mir: passage.meeting_individual_result_id
          }
        )
        # [Steve A.]
        # NOTE that the path below assumes that the Core Engine including
        # the Devise routes is mounted to "/". (Otherwise is should be changed
        # to something like "/mounting_path/users/sign_in").
        # Keep in mind also that:
        #   new_user_session_path( locale='XX' ) => '/users/sign_in?locale=XX'
        expect( response ).to be_a_redirect
        expect( response ).to redirect_to( '/users/sign_in' )
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    context "for an logged-in user w/ an incomplete JSON request (missing both passage & timing)," do
      before(:each) do
        login_user(@user)
        post( :update_passage, format: :json,
          params: {
            u: @user.email,
            t: @user.authentication_token,
            r: reaction_text,
            mpg: passage.meeting_program_id,  pt: passage.passage_type_id
          }
        )
      end
      it_behaves_like "valid JSON request but with incomplete required parameters"
    end


    context "for an logged-in user w/ a valid request (full data => CREATE or UPDATE)," do
      before(:each) do
        login_user(@user)
        post( :update_passage, format: :json,
          params: {
            u: @user.email,
            t: @user.authentication_token,
            p: passage.id, time: timing_text, r: reaction_text,
            mpg: passage.meeting_program_id,  pt: passage.passage_type_id,
            s: passage.swimmer_id, te: passage.team_id,
            mir: passage.meeting_individual_result_id
          }
        )
      end

      it "returns http success with a JSON 'ok' result" do
        expect( response ).to have_http_status(:success)
        result = JSON.parse(response.body)
        expect( result['result'] ).to eq('ok')
      end
      it "persists the specified values into the MeetingRelaySwimmer row specified by the keys (creating it when not existing)" do
        edited_passage = Passage.find_by_id( passage.id )
        expect( edited_passage ).to be_a( Passage )
# DEBUG
#        puts "\r\n- edited_passage.get_timing: #{ edited_passage.get_timing } vs. #{ timing_text }"
#        puts "- edited_passage / to 100s : #{ edited_passage.get_timing_instance.to_hundreds } vs. #{ TimingParser.parse( timing_text ).to_hundreds }"
        # Timing will be converted to delta-timing depending on its value, so we check both values with an OR:
        expect( min ).to eq( edited_passage.minutes ).or eq( edited_passage.minutes_from_start )
        expect( sec ).to eq( edited_passage.seconds ).or eq( edited_passage.seconds_from_start )
        expect( hun ).to eq( edited_passage.hundreds ).or eq( edited_passage.hundreds_from_start )
        expect( edited_passage.reaction_time ).to eq( TimingParser.parse( reaction_text ).to_hundreds / 100.0 )
        # These should never change:
        expect( edited_passage.passage_type_id ).to eq( passage.passage_type_id )
        expect( edited_passage.meeting_program_id ).to eq( passage.meeting_program_id )
        expect( edited_passage.meeting_individual_result_id ).to eq( passage.meeting_individual_result_id )
        expect( edited_passage.swimmer_id ).to eq( passage.swimmer_id )
        expect( edited_passage.team_id ).to eq( passage.team_id )
      end
    end


    context "for an logged-in user w/ an valid JSON request but no timing (=> DELETE)," do
      let(:destroyable_passage) { Passage.order(created_at: :asc).limit(100).sample }
      before(:each) do
        login_user(@user)
        post( :update_passage, format: :json,
          params: {
            u: @user.email,
            t: @user.authentication_token,
            p: destroyable_passage.id
          }
        )
      end

      it "returns http success with a JSON 'ok' result" do
        expect( response ).to have_http_status(:success)
        result = JSON.parse(response.body)
        expect( result['result'] ).to eq('ok')
      end
      it "deletes any existing Passage row specified by the keys" do
        expect( Passage.find_by_id( destroyable_passage.id ) ).to be nil
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++



  describe "POST #update_event_reservation" do

    context "for an logged-in user w/ a valid request," do
      before(:each) { login_user(@user) }

      xit "returns http success" do
        post( :update_event_reservation, format: :json,
          params: {
            u: @user.email,
            s: existing_data_import_session.id
          }
        )
        expect( response ).to have_http_status(:success)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++



  describe "POST #update_relay_reservation" do

    context "for an logged-in user w/ a valid request," do
      before(:each) { login_user(@user) }

      xit "returns http success" do
        post( :update_relay_reservation, format: :json,
          params: {
            u: @user.email,
            s: existing_data_import_session.id
          }
        )
        expect( response ).to have_http_status(:success)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
