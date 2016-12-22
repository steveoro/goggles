require 'rails_helper'


# Specs in this file have access to a helper object that includes
# the MeetingReservationsHelper. For example:
#
# describe MeetingReservationsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe MeetingReservationsHelper, type: :helper do
  include Devise::Test::ControllerHelpers
  include ERB::Util

  subject { helper }

  context "[implemented methods]" do
    it_behaves_like( "(the existance of a method)",
      [
        :link_to_event_sheet_printout
      ]
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#link_to_event_sheet_printout()" do
    # These are assumed NOT to have any reservations and to be ccrrently "closed":
    let(:old_meeting)   { Meeting.find_by_id( [13101, 13102, 13103, 13105, 14101, 14102, 14103, 14104, 14105, 15101, 15102, 15103, 15104, 15105].sort{rand * 0.5}.first ) }

    # For one of these we will add temporarilty a reservation row:
    let(:meeting_with_reservation)  { Meeting.find_by_id( [12101, 12102, 16101].sort{rand * 0.5}.first ) }
    # This will be a user that has attended to one of the above meeting:
    let(:user_for_reservation)      { User.find_by_id( [1, 2].sort{rand * 0.5}.first ) }

    # This meeting is assumed to be far-fetched in the future, without reservations (yet)
    let(:new_meeting)   { create(:meeting, header_date: Date.today + 10.days) }
    # Team manager for the above meeting
    let(:team_manager)  do
      create(
        :team_manager,
        team_affiliation: create(:team_affiliation, season: new_meeting.season )
      )
    end


    context "when given a nil meeting and current user," do
      subject { helper.link_to_event_sheet_printout( nil, nil ) }

      it "returns nil" do
        expect( subject ).to be nil
      end
    end


    context "when given a nil meeting," do
      subject { helper.link_to_event_sheet_printout( build(:user), nil ) }

      it "returns nil" do
        expect( subject ).to be nil
      end
    end


    context "when given a nil current_user," do
      subject { helper.link_to_event_sheet_printout( nil, old_meeting ) }

      it "returns nil" do
        expect( subject ).to be nil
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    context "when given valid parameters," do
      shared_examples_for "correctly rendering the event sheet PDF link button" do
        it "is not nil" do
          expect( subject ).not_to be_nil
        end
        it "returns a non-empty text" do
          expect( subject.size ).to be > 0
        end
        it "contains the image name" do
          expect( subject ).to include('page_white_acrobat')
        end
      end


      context "[params: meeting closed W/O reservations and a valid user]," do
        subject { helper.link_to_event_sheet_printout( user_for_reservation, old_meeting ) }
        it "returns nil" do
          expect( subject ).to be nil
        end
      end

      context "[params: new meeting (open) W/O reservations and a valid user]," do
        subject { helper.link_to_event_sheet_printout( team_manager.user, new_meeting ) }
        it "returns nil" do
          expect( subject ).to be nil
        end
      end


      context "[params: meeting WITH an existing reservation and a valid user (for the reservation)]," do
        before(:each) do
          enabled_badge = user_for_reservation.swimmer.badges.includes(:team_affiliation)
                            .find{|b| b.team_affiliation.season_id == meeting_with_reservation.season_id }
          MeetingReservation.create(
            meeting_id: meeting_with_reservation.id,
            team_id:    enabled_badge.team_id,
            swimmer_id: user_for_reservation.swimmer_id,
            badge_id:   enabled_badge.id,
            user_id:    user_for_reservation.id
          )
        end
        subject { helper.link_to_event_sheet_printout( user_for_reservation, meeting_with_reservation ) }

        it_behaves_like "correctly rendering the event sheet PDF link button"

        it "contains the path to the printout action" do
          expect( subject ).to include( meeting_reservations_printout_event_sheet_path(id: meeting_with_reservation.id) )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
end
