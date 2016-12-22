require 'rails_helper'

RSpec.describe MeetingReservationsController, type: :controller do
  # XXX We rely directly on the existing seeds to speed up this test:
  #     Alternatively, we could:
  # - Choose/Create a user
  # - Create managed affiliations if missing
  # - Choose an existing Meeting that can handle reservations
  # - (Assert the user/manager should manage season with that reservations
  let(:user_manager) { User.find(2) } # (Leega user can currently manage at least a couple of seasons)

  let(:random_manageable_meeting_id) do
    user_manager.team_managers
      .map do |tm|                    # Get all the affiliations that have results:
        tm.team_affiliation.meeting_individual_results
          .map{ |mir| mir.meeting }.uniq
      end.flatten
        .compact.map{ |meeting| meeting.id }
          .uniq.sort{rand - 0.5}.first
    # FIXME some MIRs have been reported to have a nil Meeting! Check out the list
    # above without .compact !
    # Like this:
    # $> User.find(2).team_managers.map{|tm| tm.team_affiliation.meeting_individual_results.map{|mir| mir.meeting }.uniq }.flatten.map{ |meeting| meeting.class.name }
  end


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

    context "for a logged-in valid user," do
      before :each do
        login_user( user_manager )
      end
      it "returns http success" do
        get :edit_events, params: { id: random_manageable_meeting_id }
        expect(response).to have_http_status(:success)
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
        login_user( user_manager )
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
        login_user( user_manager )
      end
      it "returns http success" do
        get :edit_relays, params: { id: random_manageable_meeting_id }
        expect(response).to have_http_status(:success)
      end
    end
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
      it "redirects to meetings/current page" do
        get :printout_event_sheet, params: { id: random_manageable_meeting_id }
        expect(response).to redirect_to( meetings_current_path )
      end
    end

    context "for a logged-in valid user," do
      before :each do
        login_user( user_manager )
      end
      it "returns http success" do
        get :printout_event_sheet, params: { id: random_manageable_meeting_id }
        expect(response).to have_http_status(:success)
      end
      it "receives a PDF file" do
        get :printout_event_sheet, params: { id: random_manageable_meeting_id }
        expect( response.body).to include("%PDF")
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
