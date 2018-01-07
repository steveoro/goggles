# encoding: utf-8
require 'rails_helper'
require 'meeting_event_reservation_matrix_creator'


describe MeetingEventReservationMatrixCreator, type: :strategy do

  it_behaves_like "MeetingReservationMatrixProcessor (not checking results after #call)", MeetingEventReservationMatrixCreator
  #-- -------------------------------------------------------------------------
  #++

  context "for a meeting/team_affiliation couple with at least an existing registration," do
    # [Steve, 20161125] We use pre-existing data to speed-up fixtures here:
    let(:team_affiliation) do
      # We get the last TeamAffiliation which has at least some results (so that
      # we know that the corresponding Meeting has already been acquired)
      Team.find(1).team_affiliations.joins(:meeting_individual_results).last
    end
    let(:last_mir) do
      team_affiliation.meeting_individual_results.last
    end
    let(:meeting) do
      last_mir.meeting
    end

    # [Steve] We don't need to save the random user instance created, since we
    # won't use any of its associations, nor its ID, so "build" is enough.
    subject do
      # Then we can proceed to instantiate the creator:
      MeetingEventReservationMatrixCreator.new(
        meeting: meeting,
        team_affiliation: team_affiliation,
        current_user: FactoryBot.build(:user)
      )
    end

    describe "#call (after execution)" do
      before(:each) do
        expect( subject.call ).to be true
      end
      it "has #expected_rows_count > 0 (after being called)" do
        expect( subject.expected_rows_count ).to be > 0
      end
      it "has 0 errors" do
        expect( subject.total_errors ).to eq(0)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "for a meeting/team_affiliation couple without any previous registration," do
    # [Steve, 20161125] We use pre-existing data to speed-up fixtures here:
    let(:rnd_csi_meeting_id_with_no_reservations) { [10101, 11101, 12101, 13101, 14101].sort{rand - 0.5}.first }
    let(:meeting) { Meeting.find( rnd_csi_meeting_id_with_no_reservations ) }
    let(:team_affiliation) do
      TeamAffiliation.where( season_id: meeting.season_id, team_id: 1 ).first
    end

    # [Steve] We don't need to save the random user instance created, since we
    # won't use any of its associations, nor its ID, so "build" is enough.
    subject do
      # Then we can proceed to instantiate the creator:
      MeetingEventReservationMatrixCreator.new(
        meeting: meeting,
        team_affiliation: team_affiliation,
        current_user: FactoryBot.build(:user)
      )
    end

    describe "#call" do
      it "is true" do
        expect( subject.call ).to be true
      end
      it "has #expected_rows_count > 0 (before being called)" do
        expect( subject.expected_rows_count ).to be > 0
      end
      it "has #processed_rows == 0 (before being called)" do
        expect( subject.processed_rows ).to eq(0)
      end
    end

    describe "#call (after execution)" do
      before(:each) do
        expect( subject.call ).to be true
      end
      it "has #expected_rows_count > 0 (after being called)" do
        expect( subject.expected_rows_count ).to be > 0
      end
      it "has the same count for #expected_rows_count and #processed_rows" do
        expect( subject.expected_rows_count ).to eq( subject.processed_rows )
      end
      it "has 0 errors" do
        expect( subject.total_errors ).to eq(0)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
