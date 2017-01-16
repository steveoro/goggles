require 'rails_helper'


RSpec.describe MeetingReservationsController, type: :controller do
  # XXX We rely directly on the existing seeds to speed up this test:
  #     Alternatively, we could:
  # - Choose/Create a user
  # - Create managed affiliations if missing
  # - Choose an existing Meeting that can handle reservations
  # - (Assert the user/manager should manage season with that reservations

  let(:team_manager) do
    # Choose the first, random team manager, whose affiliation has
    # at least a meeting with a far-fetched header date:
    TeamManager.all
      .select{ |tm| tm.team_affiliation.season.meetings.where("header_date > ?", Date.today + 1).count > 0 }
      .sort{ rand - 0.5 }.first
  end

  let(:random_manageable_meeting_id) do
    team_manager.team_affiliation.season
      .meetings.where("header_date > ?", Date.today + 1)
      .sort{rand - 0.5}.first
      .id
  end

  let(:team_manager_with_results) do
    # Choose the first, random team manager, whose affiliation has
    # at least a meeting with an old header date and some results:
    TeamManager.all
      .select{ |tm|
        ( tm.team_affiliation.season.meetings.where("header_date < ?", Date.today - 30).count > 0 ) &&
        ( tm.team_affiliation.season.meetings.any?{|m| m.meeting_individual_results.count > 0 } )
      }
      .sort{ rand - 0.5 }.first
  end

  let(:unmanageable_meeting_with_results) do
    team_manager.team_affiliation.season
      .meetings
      .select{ |m| (m.meeting_reservations.count == 0) && (m.meeting_individual_results.count > 0) }
      .sort{rand - 0.5}
      .first
  end

  let(:random_reservation) { MeetingReservation.all.sort{rand - 0.5}.first }
  let(:meeting_with_reservation_id) do
    MeetingReservation.all.sort{rand - 0.5}.first.meeting_id
  end
  let(:team_manager_with_resevations) do
    TeamManager.where( team_affiliation_id: random_reservation.badge.team_affiliation_id )
      .sort{ rand - 0.5 }.first
  end

  context "for any future, manageable meeting," do
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
          get :edit_events, params: { id: random_manageable_meeting_id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end

      context "for a logged-in user manager," do
        before :each do
          login_user( team_manager.user )
        end
        it "returns http success" do
          get :edit_events, params: { id: random_manageable_meeting_id }
          expect(response).to have_http_status(:success)
        end
      end
    end
  end


  context "for any old, already closed meeting without any existing reservations," do
    context "for a logged-in user manager," do
      before :each do
        login_user( team_manager_with_results.user )
      end
      it "redirects to meetings/current page" do
# DEBUG
#        puts "\r\n--- team_manager_with_results: #{ team_manager_with_results.inspect }"
#        puts "\r\n--- unmanageable_meeting_with_results.id: #{ unmanageable_meeting_with_results.id }"
        get :edit_events, params: { id: unmanageable_meeting_with_results.id }
        expect(response).to redirect_to( meetings_current_path )
      end
    end
  end
  #-- -------------------------------------------------------------------------
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
        post :update_events, params: { id: random_manageable_meeting_id }
        expect(response).to redirect_to( meetings_current_path )
      end
    end

    context "for a logged-in valid user," do
      before :each do
        login_user( team_manager.user )
      end
      it "redirects to #edit_events" do
        post :update_events, params: { id: random_manageable_meeting_id }
        expect(response).to redirect_to( meeting_reservations_edit_events_path(id: random_manageable_meeting_id) )
      end

      # TODO Add more tests
    end
  end
  #-- -------------------------------------------------------------------------
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
        get :edit_relays, params: { id: random_manageable_meeting_id }
        expect(response).to redirect_to( meetings_current_path )
      end
    end

    context "for a logged-in valid user," do
      before :each do
        login_user( team_manager.user )
      end
      it "returns http success" do
        get :edit_relays, params: { id: random_manageable_meeting_id }
        expect(response).to have_http_status(:success)
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
        get :printout_event_sheet, params: { id: random_manageable_meeting_id }
        expect(response).to redirect_to( meetings_current_path )
      end
    end


    context "for a logged-in valid user manager," do
      context "when there's no reservation data available and the meeting is unmanageable" do
        before :each do
          login_user( team_manager_with_results.user )
        end
        it "redirects to meetings#current" do
          get :printout_event_sheet, params: { id: unmanageable_meeting_with_results.id }
          expect(response).to redirect_to( meetings_current_path )
        end
      end

      let(:manageable_and_unreserved_meeting_id) do
        team_manager.team_affiliation.season
          .meetings.where("header_date > ?", Date.today + 1)
          .select{ |m| m.meeting_reservations.count == 0 }
          .sort{rand - 0.5}.first
          .id
      end

      context "when there's no reservation data available (but the meeting is manageable)," do
        before :each do
          login_user( team_manager.user )
        end
        it "redirects to #edit_events" do
          get :printout_event_sheet, params: { id: manageable_and_unreserved_meeting_id }
          expect(response).to redirect_to( meeting_reservations_edit_events_url(id: manageable_and_unreserved_meeting_id) )
        end
      end

      context "when there are reservations available" do
        before :each do
          login_user( team_manager_with_resevations.user )
        end

        it "returns http success and receives a PDF file" do
          get :printout_event_sheet, params: { id: meeting_with_reservation_id }
          expect( response ).to have_http_status(:success)
          expect( response.body ).to include("%PDF")
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
