require 'rails_helper'


RSpec.describe MeetingReservationsController, type: :controller do
  # *** FUTURE proof ***
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

  let(:manageable_and_unreserved_meeting_id) do
    meeting_session = create(
      :meeting_session,
      meeting: future_manageable_meeting,
      scheduled_date: Date.today + 7
    )
    expect( meeting_session ).to be_a( MeetingSession )
    create( :meeting_event_individual, meeting_session: meeting_session )
    expect( future_manageable_meeting.meeting_individual_results.count ).to eq(0)
    expect( future_manageable_meeting.meeting_reservations.count ).to eq(0)
    future_manageable_meeting.id
  end
  #-- -------------------------------------------------------------------------
  #++

  # *** PRESENT / PAST proof ***

  # These are assumed NOT to have any reservations and to be currently "closed":
  let(:old_unmanageable_meeting)  { Meeting.find_by_id( [16232, 16231, 16236, 16237, 16358, 16233, 16300, 16239, 16243, 16242, 16245, 16246, 16247, 16316].sample ) }
  let(:team_manager_for_old_season) do
    ta = old_unmanageable_meeting.season.team_affiliations.first
    # Choose the first, random team manager, whose affiliation entered in the old meeting chosen above:
    # at least a meeting with an old header date and some results:
    team_manager = TeamManager.where(team_affiliation_id: 2451).sample
    expect( team_manager ).to be_a( TeamManager )
    team_manager
  end



  let(:reservation_for_meeting_with_results) do
    reservation = MeetingEventReservation.is_reserved
      .includes(:meeting).joins(:meeting)
      .where('meetings.are_results_acquired = ?', true).sample
# DEBUG
#    puts "\r\n** reservation_for_meeting_with_results **\r\n- reservation: #{ reservation.inspect }"
#    puts "- meeting: #{ reservation.meeting.inspect }"
    expect( reservation ).to be_a( MeetingEventReservation )
    expect( reservation.meeting ).to be_a( Meeting )
    expect( reservation.meeting.meeting_individual_results.count ).to be > 0
    reservation
  end

  let(:old_managed_meeting_with_results) do
    # XXX This yields a redirection because TM#9's team did not come to this event, although registered (Simone DelRio / CSI Prova6)
#    return Meeting.find(16106)
    reservation_for_meeting_with_results.meeting
  end

  let(:team_manager_with_results_and_res) do
    # XXX This yields a redirection because TM#9's team did not come to this event, although registered (Simone DelRio / CSI Prova6)
#    return TeamManager.find(9)
    tm = reservation_for_meeting_with_results.badge.team_affiliation.team_managers.sample
    expect( TeamManagerValidator.can_manage?( tm.user, old_managed_meeting_with_results ) ).to be true
    tm
  end


  let(:random_reservation)                { MeetingEventReservation.last(100).sample }
  let(:meeting_with_reservation)          { random_reservation.meeting }
  # Team manager for the above meeting
  let(:team_manager_with_reservations)    { random_reservation.badge.team_affiliation.team_managers.last }
  #-- -------------------------------------------------------------------------
  #++


  context "for any future, MANAGEABLE meeting," do

    describe "GET #edit_events" do
      context "for an unlogged user with invalid parameters," do
        it "redirects to the Login page" do
          get :edit_events
          expect(response).to redirect_to( "/users/sign_in" )
        end
      end

      context "for a logged-in generic user," do
        before :each do
          login_user()
        end
        it "redirects to meetings/current page" do
          get :edit_events, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end

      context "for a logged-in valid user manager," do
        before :each do
          login_user( team_manager.user )
        end
        it "returns http success" do
          get :edit_events, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to have_http_status(:success)
        end
      end

      # TODO Add more tests
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "GET #edit_relays" do
      context "for an unlogged user with invalid parameters," do
        it "redirects to the Login page" do
          get :edit_relays
          expect(response).to redirect_to( "/users/sign_in" )
        end
      end

      context "for a logged-in generic user," do
        before :each do
          login_user()
        end
        it "redirects to meetings/current page" do
          get :edit_relays, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end

      context "for a logged-in valid user manager," do
        before :each do
          login_user( team_manager.user )
        end
        it "returns http success" do
# DEBUG
#          puts "\r\n--- team_manager: #{ team_manager.inspect }"
#          puts "\r\n--- manageable_and_unreserved_meeting_id: #{ manageable_and_unreserved_meeting_id }"
          get :edit_relays, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to have_http_status(:success)
        end
      end

      # TODO Add more tests
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "GET #show" do
      context "for an unlogged user with invalid parameters," do
        it "redirects to the Login page" do
          get :show
          expect(response).to redirect_to( "/users/sign_in" )
        end
      end

      context "for a logged-in generic user," do
        before :each do
          login_user()
        end
        it "redirects to meetings#current" do
          get :show, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end

      context "for a logged-in valid user manager," do
        context "when there's no reservation data available," do
          before :each do
            login_user( team_manager.user )
            get :show, params: { id: manageable_and_unreserved_meeting_id }
          end
          it "sets the flash error to :no_result_to_show" do
            expect( flash[:error] ).to eq( I18n.t(:no_result_to_show) )
          end
          it "redirects to meetings#current" do
            expect(response).to redirect_to( meetings_current_path )
          end
        end

        context "when there are reservations available," do
          before :each do
            login_user( team_manager_with_reservations.user )
          end
          it "returns http success" do
            get :show, params: { id: meeting_with_reservation.id }
            expect( response ).to have_http_status(:success)
          end
        end
      end

      # TODO Add more tests
    end
    #-- -------------------------------------------------------------------------
    #++


    describe "GET #printout_event_sheet" do
      context "for an unlogged user with invalid parameters," do
        it "redirects to the Login page" do
          get :printout_event_sheet
          expect(response).to redirect_to( "/users/sign_in" )
        end
      end

      context "for a logged-in generic user," do
        before :each do
          login_user()
        end
        it "redirects to meetings#current" do
          get :printout_event_sheet, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end

      context "for a logged-in valid user manager," do
        context "when there's no reservation data available," do
          before :each do
            login_user( team_manager.user )
            get :printout_event_sheet, params: { id: manageable_and_unreserved_meeting_id }
          end
          it "sets the flash error to :no_detail_to_process" do
            expect(flash[:error]).to eq( I18n.t(:no_detail_to_process) )
          end
          it "redirects to meetings#current" do
            expect(response).to redirect_to( meetings_current_path )
          end
        end

        context "when there are reservations available," do
          it "returns http success and receives a PDF file" do
            login_user( team_manager_with_reservations.user )
            get :printout_event_sheet, params: { id: meeting_with_reservation.id }
            expect( response ).to have_http_status(:success)
            expect( response.body ).to include("%PDF")
          end
        end
      end
    end
    #-- -------------------------------------------------------------------------
    #++


    describe "GET #relayometer" do
      context "for an unlogged user with invalid parameters," do
        it "redirects to the Login page" do
          get :relayometer
          expect(response).to redirect_to( "/users/sign_in" )
        end
      end

      context "for a logged-in generic user," do
        before :each do
          login_user()
        end
        it "redirects to meetings/current page" do
          get :relayometer, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end

      context "for a logged-in valid user manager," do
        before :each do
          login_user( team_manager.user )
        end
        it "returns http success" do
          get :relayometer, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to have_http_status(:success)
        end
      end

      # TODO Add more tests
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "POST #relayometer" do
      context "for an unlogged user with invalid parameters," do
        it "redirects to the Login page" do
          post :relayometer
          expect(response).to redirect_to( "/users/sign_in" )
        end
      end

      context "for a logged-in generic user," do
        before :each do
          login_user()
        end
        it "redirects to meetings/current page" do
          post :relayometer, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end

      context "for a logged-in valid user manager," do
        before :each do
          login_user( team_manager.user )
        end
        it "returns http success" do
          post :relayometer, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to have_http_status(:success)
        end
      end

      # TODO Add more tests
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  # (Here, we'll just check the most 'dangerous' case: a user manager that tries
  # to mess around with closed meetings when there's no reason for it.)
  context "for any OLD, already CLOSED (& UNMANAGEABLE) meeting w/o no existing reservations," do
    before :each do
      login_user( team_manager_for_old_season.user )
    end

    describe "GET #edit_events" do
      context "for a logged-in user manager," do
        it "redirects to meetings/current page" do
# DEBUG
#          puts "\r\n--- team_manager: #{ team_manager_for_old_season.inspect }"
#          puts "\r\n--- old_unmanageable_meeting.id: #{ old_unmanageable_meeting.id }"
          get :edit_events, params: { id: old_unmanageable_meeting.id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "GET #edit_relays" do
      context "for a logged-in user manager," do
        it "redirects to meetings/current page" do
          get :edit_relays, params: { id: old_unmanageable_meeting.id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "GET #show" do
      context "for a logged-in user manager," do
        it "sets the flash error to :invalid_team_manager_or_no_swimmer" do
# DEBUG
#          puts "\r\n--- team_manager_with_results: #{ team_manager_for_old_season.inspect }"
#          puts "\r\n--- old_unmanageable_meeting.id: #{ old_unmanageable_meeting.id }"
          get :show, params: { id: old_unmanageable_meeting.id }
          expect(flash[:error]).to include( I18n.t('meeting.errors.invalid_team_manager_or_no_swimmer') )
        end
        it "redirects to meetings/current page" do
          get :show, params: { id: old_unmanageable_meeting.id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "GET #printout_event_sheet" do
      context "for a logged-in user manager," do
        it "sets the flash error to :invalid_team_manager_or_no_swimmer" do
          get :printout_event_sheet, params: { id: old_unmanageable_meeting.id }
          expect(flash[:error]).to include( I18n.t('meeting.errors.invalid_team_manager_or_no_swimmer') )
        end
        it "redirects to meetings/current page" do
          get :printout_event_sheet, params: { id: old_unmanageable_meeting.id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end


  context "for any OLD, already CLOSED (but MANAGED) meeting," do
    before :each do
      login_user( team_manager_with_results_and_res.user )
    end

    describe "GET #edit_events" do
      context "for a logged-in user manager," do
        it "sets the flash error to :meeting_already_closed" do
          get :edit_events, params: { id: old_managed_meeting_with_results.id }
          expect(flash[:error]).to include( I18n.t('meeting.errors.meeting_already_closed') )
        end
        it "redirects to the #show page" do
# DEBUG
#          puts "\r\n--- team_manager_with_results: #{ team_manager_with_results.inspect }"
#          puts "\r\n--- old_unmanageable_meeting.id: #{ old_unmanageable_meeting.id }"
          get :edit_events, params: { id: old_managed_meeting_with_results.id }
          expect(response).to redirect_to( meeting_reservations_show_path( id: old_managed_meeting_with_results.id ) )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "GET #edit_relays" do
      context "for a logged-in user manager," do
        it "sets the flash error to :meeting_already_closed" do
          get :edit_relays, params: { id: old_managed_meeting_with_results.id }
          expect(flash[:error]).to include( I18n.t('meeting.errors.meeting_already_closed') )
        end
        it "redirects to the #show page" do
          get :edit_relays, params: { id: old_managed_meeting_with_results.id }
          expect(response).to redirect_to( meeting_reservations_show_path( id: old_managed_meeting_with_results.id ) )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "GET #show" do
      context "for a logged-in user manager," do
        it "accepts the request" do
          get :show, params: { id: old_managed_meeting_with_results.id }
          expect(response).to have_http_status(:success)
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "GET #printout_event_sheet" do
      context "for a logged-in user manager," do
        it "accepts the request" do
# DEBUG
#          puts "\r\n--- team_manager_with_results: #{ team_manager_with_results_and_res.inspect }"
#          puts "\r\n--- old_managed_meeting_with_results.id: #{ old_managed_meeting_with_results.id }"
          expect( old_managed_meeting_with_results.meeting_individual_results.count ).to be > 0
          get :printout_event_sheet, params: { id: old_managed_meeting_with_results.id }
          expect(response).to have_http_status(:success)
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
