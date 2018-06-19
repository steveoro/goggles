# encoding: utf-8
require 'rails_helper'
require 'team_manager_validator'


describe TeamManagerValidator, type: :strategy do
  # These are assumed NOT to have any reservations and to be currently "closed":
  let(:old_meeting)               { Meeting.find_by_id( [13101, 13102, 13103, 13105, 14101, 14102, 14103, 14104, 14105, 15101, 15102, 15103, 15104, 15105].sample ) }
  let(:old_unmanageable_meeting)  { Meeting.find_by_id( [16232, 16231, 16236, 16237, 16358, 16233, 16300, 16239, 16243, 16242, 16245, 16246, 16247, 16316].sample ) }

  # For one of these we will add temporarilty a reservation row:
  let(:meeting_with_reservation)  { Meeting.find_by_id( [12101, 12102, 16101].sample ) }
  # This will be a user that has attended to one of the above meeting:
  let(:user_for_reservation)      { User.find_by_id( [1, 2].sample ) }

  # This meeting is assumed to be far-fetched in the future, without reservations (yet)
  let(:new_meeting)   { create(:meeting, header_date: Date.today + 10.days) }
  # Team manager for the above meeting
  let(:team_manager)  do
    create(
      :team_manager,
      team_affiliation: create(:team_affiliation, season: new_meeting.season )
    )
  end


  describe "self.can_manage?" do
    context "with a nil current user and a valid Meeting," do
      it "returns false" do
        expect(
          TeamManagerValidator.can_manage?( nil, new_meeting )
        ).to be false
      end
    end
    context "with a valid user/team-manager but a nil Meeting," do
      it "returns false" do
        expect(
          TeamManagerValidator.can_manage?( team_manager.user, nil )
        ).to be false
      end
    end
    context "with a valid user/team-manager that can manage an old meeting (with results already acquired)," do
      it "returns true" do
        expect(
          TeamManagerValidator.can_manage?( User.find(2), old_meeting )
        ).to be true
      end
    end
    context "with a valid user/team-manager that can manage a new, future meeting with no results," do
      it "returns true" do
        expect(
          TeamManagerValidator.can_manage?( team_manager.user, new_meeting )
        ).to be true
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "self.is_reservation_manageable?" do
    context "for a nil meeting," do
      it "returns false" do
        expect( TeamManagerValidator.is_reservation_manageable?(nil) ).to be false
      end
    end
    context "for an old meeting with results already acquired," do
      it "returns false" do
        expect( TeamManagerValidator.is_reservation_manageable?(old_meeting) ).to be false
      end
    end
    context "for a new, future meeting with no results," do
      it "returns true" do
        expect( TeamManagerValidator.is_reservation_manageable?(new_meeting) ).to be true
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "self.any_manageable_results_for?" do
    context "with a nil current user and a valid Meeting," do
      it "returns false" do
        expect(
          TeamManagerValidator.any_manageable_results_for?( nil, new_meeting )
        ).to be false
      end
    end
    context "with a valid user/team-manager but a nil Meeting," do
      it "returns false" do
        expect(
          TeamManagerValidator.any_manageable_results_for?( team_manager.user, nil )
        ).to be false
      end
    end
    context "with a valid user/team-manager that can manage the season of an old meeting (with results already acquired) BUT with no managed team results," do
      it "returns false" do
        expect(
          TeamManagerValidator.any_manageable_results_for?( User.find(2), old_unmanageable_meeting )
        ).to be false
      end
    end
    context "with a valid user/team-manager that can manage an old meeting (with results already acquired)," do
      it "returns true" do
        expect(
          TeamManagerValidator.any_manageable_results_for?( User.find(2), old_meeting )
        ).to be true
      end
    end
    context "with a valid user/team-manager that can manage a new, future meeting with no results," do
      it "returns false" do
        expect(
          TeamManagerValidator.any_manageable_results_for?( team_manager.user, new_meeting )
        ).to be false
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "self.any_reservations_for?" do
    context "with a nil current user and a valid Meeting," do
      it "returns false" do
        expect(
          TeamManagerValidator.any_reservations_for?( nil, new_meeting )
        ).to be false
      end
    end
    context "with a valid user/team-manager but a nil Meeting," do
      it "returns false" do
        expect(
          TeamManagerValidator.any_reservations_for?( team_manager.user, nil )
        ).to be false
      end
    end
    context "with a valid goggler and an old meeting (with results but no reservations)," do
      it "returns false" do
        expect(
          TeamManagerValidator.any_reservations_for?( User.find(1), old_meeting )
        ).to be false
      end
    end

    context "with a valid goggler and a new, future meeting with no results but at least a reservation for the goggler," do
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

      it "returns true" do
        expect(
          TeamManagerValidator.any_reservations_for?( user_for_reservation, meeting_with_reservation )
        ).to be true
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
