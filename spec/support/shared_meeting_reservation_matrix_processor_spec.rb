# encoding: utf-8
require 'rails_helper'
require 'meeting_reservation_matrix_processor'


shared_examples_for "MeetingReservationMatrixProcessor (not checking results after #call)" do |subject_class|
  # [Steve] We don't need to save the random user instance created, since we
  # won't use any of its associations, nor its ID, so "build" is enough.
  subject { subject_class.new( current_user: FactoryGirl.build(:user) ) }

  it_behaves_like( "(the existance of a method)", [
    :meeting, :team_affiliation, :current_user,
    :processed_rows, :total_errors,
    :expected_rows_count,
    :call
  ] )
  #-- -------------------------------------------------------------------------
  #++


  context "with a nil :meeting parameter," do
    # [Steve, 20161125] We use pre-existing data to speed-up fixtures here:
    let(:team_affiliation) do
      # We get the last TeamAffiliation which has at least some results (so that
      # we know that the corresponding Meeting has already been acquired)
      Team.find(1).team_affiliations.last
    end
    # [Steve] We don't need to save the random user instance created, since we
    # won't use any of its associations, nor its ID, so "build" is enough.
    subject do
      subject_class.new(
        team_affiliation: team_affiliation,
        current_user: FactoryGirl.build(:user)
      )
    end

    describe "#call" do
      it "returns false" do
        expect( subject.call ).to be false
      end
      it "sets #total_errors = 1" do
        subject.call
        expect( subject.total_errors ).to eq(1)
      end
      it "has #processed_rows = 0" do
        subject.call
        expect( subject.processed_rows ).to eq(0)
      end
      it "does not add any row to meeting_reservations" do
        expect{ subject.call }.not_to change{ MeetingReservation.count }
      end
      it "does not add any row to meeting_event_reservations" do
        expect{ subject.call }.not_to change{ MeetingEventReservation.count }
      end
      it "does not add any row to meeting_relay_reservations" do
        expect{ subject.call }.not_to change{ MeetingRelayReservation.count }
      end
    end
  end


  context "with a nil :team_affiliation parameter," do
    # [Steve, 20161125] We use pre-existing data to speed-up fixtures here:
    let(:meeting) { Meeting.last }
    # [Steve] We don't need to save the random user instance created, since we
    # won't use any of its associations, nor its ID, so "build" is enough.
    subject do
      subject_class.new(
        meeting: meeting,
        current_user: FactoryGirl.build(:user)
      )
    end

    describe "#call" do
      it "returns false" do
        expect( subject.call ).to be false
      end
      it "sets #total_errors = 1" do
        subject.call
        expect( subject.total_errors ).to eq(1)
      end
      it "has #processed_rows = 0" do
        subject.call
        expect( subject.processed_rows ).to eq(0)
      end
      it "does not add any row to meeting_reservations" do
        expect{ subject.call }.not_to change{ MeetingReservation.count }
      end
      it "does not add any row to meeting_event_reservations" do
        expect{ subject.call }.not_to change{ MeetingEventReservation.count }
      end
      it "does not add any row to meeting_relay_reservations" do
        expect{ subject.call }.not_to change{ MeetingRelayReservation.count }
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "for a valid meeting/team_affiliation couple," do
    # [Steve, 20161125] We use pre-existing data to speed-up fixtures here:
    # (Using MRRs instead of MIRs allows us to select a Meeting that has surely also a Relay event)
    let(:rand_mrr)          { MeetingRelayResult.limit(200).sort{rand - 0.5}.first }
    let(:team_affiliation)  { rand_mrr.team_affiliation }
    let(:meeting)           { rand_mrr.meeting }
    # Since the swimmer is currently not linked to the MRR, we can chose a random one for this fixture:
    let(:rand_badge)        { rand_mrr.team_affiliation.badges.sort{rand - 0.5}.first }

    # [Steve] We don't need to save the random user instance created, since we
    # won't use any of its associations, nor its ID, so "build" is enough.
    subject do
      subject_class.new(
        meeting: meeting,
        team_affiliation: team_affiliation,
        current_user: FactoryGirl.build(:user)
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
  end
  #-- -------------------------------------------------------------------------
  #++
end
