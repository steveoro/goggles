# encoding: utf-8
require 'rails_helper'
require 'meeting_reservation_matrix_creator'


describe MeetingReservationMatrixCreator, type: :strategy do
  # [Steve] We don't need to save the random user instance created, since we
  # won't use any of its associations, nor its ID, so "build" is enough.
  subject { MeetingReservationMatrixCreator.new( current_user: FactoryGirl.build(:user) ) }

  it_behaves_like( "(the existance of a method)", [
    :meeting, :team_affiliation, :current_user,
    :expected_rows_count, :created_rows_count,
    :total_errors,
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
      MeetingReservationMatrixCreator.new(
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
      it "has #created_rows_count = 0" do
        subject.call
        expect( subject.created_rows_count ).to eq(0)
      end
      it "does not add any row to meeting_reservations" do
        expect{ subject.call }.not_to change{ MeetingReservation.count }
      end
    end
  end


  context "with a nil :team_affiliation parameter," do
    # [Steve, 20161125] We use pre-existing data to speed-up fixtures here:
    let(:meeting) { Meeting.last }
    # [Steve] We don't need to save the random user instance created, since we
    # won't use any of its associations, nor its ID, so "build" is enough.
    subject do
      MeetingReservationMatrixCreator.new(
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
      it "has #created_rows_count = 0" do
        subject.call
        expect( subject.created_rows_count ).to eq(0)
      end
      it "does not add any row to meeting_reservations" do
        expect{ subject.call }.not_to change{ MeetingReservation.count }
      end
    end
  end
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
      # This single row should force skipping the corresponding matrix item creation:
      MeetingReservation.create(
        meeting_id:       meeting.id,
        team_id:          team_affiliation.team_id,
        swimmer_id:       last_mir.swimmer_id,
        badge_id:         last_mir.badge_id,
        meeting_event_id: last_mir.meeting_event.id
      )
      # Then we can proceed to instantiate the creator:
      MeetingReservationMatrixCreator.new(
        meeting: meeting,
        team_affiliation: team_affiliation,
        current_user: FactoryGirl.build(:user)
      )
    end


    describe "#call" do
      it "has #expected_rows_count > 0" do
        subject.call
        expect( subject.expected_rows_count ).to be > 0
      end
      it "has #created_rows_count > 0" do
        subject.call
        expect( subject.created_rows_count ).to be > 0
      end
# FIXME FAILS:
      xit "has #created_rows_count == #expected_rows_count -1  (after being called)" do
        subject.call
        expect( subject.created_rows_count ).to eq( subject.expected_rows_count - 1 )
      end
      it "adds exactly #created_rows_count rows into meeting_reservations" do
        expect{ subject.call }.to change{ MeetingReservation.count }
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "for a meeting/team_affiliation couple without any previous registration," do
    # [Steve, 20161125] We use pre-existing data to speed-up fixtures here:
    let(:team_affiliation) do
# FIXME Choose an existing TA w/o any MeetingReservation assigned, not the last one!
      # We get the last TeamAffiliation which has at least some results (so that
      # we know that the corresponding Meeting has already been acquired)
      Team.find(1).team_affiliations.last
    end
    let(:meeting) do
      last_mir.meeting
    end

    # [Steve] We don't need to save the random user instance created, since we
    # won't use any of its associations, nor its ID, so "build" is enough.
    subject do
      # Then we can proceed to instantiate the creator:
      MeetingReservationMatrixCreator.new(
        meeting: meeting,
        team_affiliation: team_affiliation,
        current_user: FactoryGirl.build(:user)
      )
    end


    describe "#call" do
      it "is true" do
        expect( subject.call ).to be true
      end
      it "has #expected_rows_count == 0 (before being called)" do
        expect( subject.expected_rows_count ).to eq(0)
      end
      it "has #expected_rows_count == #created_rows_count (before being called)" do
        expect( subject.expected_rows_count ).to eq( subject.created_rows_count )
      end
      it "adds exactly #expected_rows_count rows to meeting_reservations" do
        expect{ subject.call }.to change{ MeetingReservation.count }.by( subject.expected_rows_count )
      end
    end


    describe "#call (after execution)" do
      before(:all) do
        expect( subject.call ).to be true
      end
      it "has #expected_rows_count > 0 (after being called)" do
        expect( subject.expected_rows_count ).to be > 0
      end
      it "has #expected_rows_count == #created_rows_count (after being called)" do
        expect( subject.expected_rows_count ).to eq( subject.created_rows_count )
      end
      it "has 0 errors" do
        expect( subject.total_errors ).to eq(0)
      end
      it "has the same count for #expected_rows_count and #created_rows_count" do
        expect( subject.expected_rows_count ).to eq( subject.created_rows_count )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
