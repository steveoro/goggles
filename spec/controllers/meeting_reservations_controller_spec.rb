require 'rails_helper'


RSpec.describe MeetingReservationsController, type: :controller do
  let(:team_manager) do
    # Choose the first, random team manager, whose affiliation has
    # at least a meeting with a far-fetched header date:
    TeamManager.all
      .select{ |tm| tm.team_affiliation.season.end_date > Date.today + 1 }
      .sample
  end

  let(:random_manageable_meeting) do
    create(
      :meeting,
      season: team_manager.team_affiliation.season,
      header_date: Date.today + 7
    )
  end

  let(:manageable_and_unreserved_meeting_id) do
    meeting = random_manageable_meeting
    meeting_session = create(
      :meeting_session,
      meeting: meeting,
      scheduled_date: Date.today + 7
    )
    create( :meeting_event_individual, meeting_session: meeting_session )
    expect( meeting.meeting_individual_results.count ).to eq(0)
    expect( meeting.meeting_reservations.count ).to eq(0)
    meeting.id
  end

  let(:team_manager_with_results) do
    # Choose the first, random team manager, whose affiliation has
    # at least a meeting with an old header date and some results:
    TeamManager.all
      .select{ |tm|
        ( tm.team_affiliation.season.meetings.where("header_date < ?", Date.today - 30).count > 0 ) &&
        ( tm.team_affiliation.season.meetings.any?{|m| m.meeting_individual_results.count > 0 } )
      }
      .sample
  end

  let(:unmanageable_meeting_with_results) do
    meeting = team_manager_with_results.team_affiliation.season
      .meetings
      .select{ |m| (m.meeting_reservations.count == 0) && (m.meeting_individual_results.count > 0) }
      .sample
    expect( meeting.meeting_individual_results.count ).to be > 0
    expect( meeting.meeting_reservations.count ).to eq(0)
    meeting
  end

  let(:team_manager_with_results_and_res) do
    # Choose a random team manager, whose affiliation's team has
    # at least a meeting with (some) results acquired and some reservation headers:
    team_manager = TeamManager.all
      .select{ |tm|
        MeetingEventReservation.where( team_id: tm.team_affiliation.team_id )
          .any?{ |res| res.meeting.meeting_individual_results.count > 0 }
      }
      .sample
    expect( team_manager ).to be_a( TeamManager )
    team_manager
  end

  let(:old_managed_meeting_with_results) do
    reservation = MeetingEventReservation.where( team_id: team_manager_with_results_and_res.team_affiliation.team_id )
      .select( :meeting_id ).distinct.to_a
      .select{ |res| res.meeting.meeting_individual_results.count > 0 }
      .sample
    expect( reservation ).to be_a( MeetingEventReservation )
    expect( reservation.meeting ).to be_a( Meeting )
    expect( reservation.meeting.meeting_individual_results.count ).to be > 0
    reservation.meeting
  end

  let(:random_reservation)          { MeetingEventReservation.where( is_doing_this: true ).limit(1000).sort{rand - 0.5}.first }
  let(:meeting_with_reservation_id) { random_reservation.meeting_id }
  let(:team_manager_with_resevations) do
    TeamManager.where( team_affiliation_id: random_reservation.badge.team_affiliation_id )
      .sample
  end
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

    describe "POST #update_events" do
      context "for an unlogged user with invalid parameters," do
        it "redirects to the Login page" do
          post :update_events
          expect(response).to redirect_to( "/users/sign_in" )
        end
      end

      context "for a logged-in generic user," do
        before :each do
          login_user()
        end
        it "redirects to the Login page" do
          post :update_events, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end

      context "for a logged-in valid user manager," do
        before :each do
          login_user( team_manager.user )
        end
        it "redirects to #edit_events" do
          post :update_events, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to redirect_to( meeting_reservations_edit_events_path(id: manageable_and_unreserved_meeting_id) )
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

    describe "POST #update_relays" do
      context "for an unlogged user with invalid parameters," do
        it "redirects to the Login page" do
          post :update_relays
          expect(response).to redirect_to( "/users/sign_in" )
        end
      end

      context "for a logged-in generic user," do
        before :each do
          login_user()
        end
        it "redirects to the Login page" do
          post :update_relays, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end

      context "for a logged-in valid user manager," do
        before :each do
          login_user( team_manager.user )
        end
        it "redirects to #edit_events" do
          post :update_relays, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to redirect_to( meeting_reservations_edit_relays_path(id: manageable_and_unreserved_meeting_id) )
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
            login_user( team_manager_with_resevations.user )
          end
          it "returns http success" do
            get :show, params: { id: meeting_with_reservation_id }
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
            login_user( team_manager_with_resevations.user )
            get :printout_event_sheet, params: { id: meeting_with_reservation_id }
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
      login_user( team_manager_with_results.user )
    end

    describe "GET #edit_events" do
      context "for a logged-in user manager," do
        it "redirects to meetings/current page" do
# DEBUG
#          puts "\r\n--- team_manager_with_results: #{ team_manager_with_results.inspect }"
#          puts "\r\n--- unmanageable_meeting_with_results.id: #{ unmanageable_meeting_with_results.id }"
          get :edit_events, params: { id: unmanageable_meeting_with_results.id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "GET #edit_relays" do
      context "for a logged-in user manager," do
        it "redirects to meetings/current page" do
          get :edit_relays, params: { id: unmanageable_meeting_with_results.id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "GET #show" do
      context "for a logged-in user manager," do
        it "sets the flash error to :invalid_team_manager_or_no_swimmer" do
          get :show, params: { id: unmanageable_meeting_with_results.id }
          expect(flash[:error]).to include( I18n.t('meeting.errors.invalid_team_manager_or_no_swimmer') )
        end
        it "redirects to meetings/current page" do
          get :show, params: { id: unmanageable_meeting_with_results.id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "GET #printout_event_sheet" do
      context "for a logged-in user manager," do
        it "sets the flash error to :invalid_team_manager_or_no_swimmer" do
          get :printout_event_sheet, params: { id: unmanageable_meeting_with_results.id }
          expect(flash[:error]).to include( I18n.t('meeting.errors.invalid_team_manager_or_no_swimmer') )
        end
        it "redirects to meetings/current page" do
          get :printout_event_sheet, params: { id: unmanageable_meeting_with_results.id }
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
#          puts "\r\n--- unmanageable_meeting_with_results.id: #{ unmanageable_meeting_with_results.id }"
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
