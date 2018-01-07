# encoding: utf-8
require 'rails_helper'
require 'meeting_relay_reservation_matrix_creator'


describe MeetingRelayReservationMatrixCreator, type: :strategy do

  it_behaves_like "MeetingReservationMatrixProcessor (not checking results after #call)", MeetingRelayReservationMatrixCreator
  #-- -------------------------------------------------------------------------
  #++

  context "for a meeting/team_affiliation couple with at least an existing registration," do
    # [Steve, 20161125] We use pre-existing data to speed-up fixtures here:
    let(:rand_mrr)          { MeetingRelayResult.limit(200).sort{rand - 0.5}.first }
    let(:team_affiliation)  { rand_mrr.team_affiliation }
    let(:meeting)           { rand_mrr.meeting }
    # Since the swimmer is currently not linked to the MRR, we can chose a random one for this fixture:
    let(:rand_badge)        { rand_mrr.team_affiliation.badges.sort{rand - 0.5}.first }

    # [Steve] We don't need to save the random user instance created, since we
    # won't use any of its associations, nor its ID, so "build" is enough.
    subject do
      # This single row should force skipping the corresponding matrix item creation:
      create(
        :meeting_relay_reservation,
        meeting_id:       meeting.id,
        team_id:          team_affiliation.team_id,
        swimmer_id:       rand_badge.swimmer_id,
        badge_id:         rand_badge.id,
        meeting_event_id: rand_mrr.meeting_event.id
      )
      # Then we can proceed to instantiate the creator:
      MeetingRelayReservationMatrixCreator.new(
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
      # Since we have created a single. pre-existing row, the creator strategy
      # should create the expected rows minus 1:
      it "has #processed_rows == #expected_rows_count-1 (after being called)" do
# DEBUG
#        puts "\r\n- subject.expected_rows_count..: #{ subject.expected_rows_count }"
#        puts     "- subject.processed_rows...: #{ subject.processed_rows }"
#        puts     "- subject.total_errors.........: #{ subject.total_errors }"
        expect( subject.processed_rows ).to eq( subject.expected_rows_count - 1 )
      end
      it "has 0 errors" do
        expect( subject.total_errors ).to eq(0)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  def fix_choose_random_meeting_and_return_creator
    # [Steve, 20161125] We use pre-existing data to speed-up fixtures here:
    # (Usually all CSI meetings have at least 1 relay event)
    rnd_csi_meeting_id_with_no_reservations = [10101, 11101, 12101, 13101, 14101].sort{rand - 0.5}.first
    meeting = Meeting.find( rnd_csi_meeting_id_with_no_reservations )
    team_affiliation = TeamAffiliation.where( season_id: meeting.season_id, team_id: 1 ).first
    # Remove any possible pre-existing relay registration from the fixture, just in case:
    MeetingRelayReservation.delete_all
    # Then we can proceed to instantiate the creator:
    MeetingRelayReservationMatrixCreator.new(
      meeting: meeting,
      team_affiliation: team_affiliation,
      current_user: FactoryBot.build(:user)
    )
  end

  context "for a meeting/team_affiliation couple without any previous registration," do
    before(:all) do
      @subject = fix_choose_random_meeting_and_return_creator()
      expect( @subject.call ).to be true
    end

    describe "#call (after execution)" do
      it "has #expected_rows_count > 0 (after being called)" do
        expect( @subject.expected_rows_count ).to be > 0
      end
      it "has the same count for #expected_rows_count and #processed_rows" do
        expect( @subject.expected_rows_count ).to eq( @subject.processed_rows )
      end
      it "has 0 errors" do
        expect( @subject.total_errors ).to eq(0)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
