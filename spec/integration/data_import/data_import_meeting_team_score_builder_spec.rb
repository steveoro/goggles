# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/services/data_import_entity_builder'
require_relative '../../../app/data_import/v2/services/data_import_meeting_team_score_builder'
require_relative '../../../app/data_import/v2/services/data_import_team_builder'
require_relative '../../../app/data_import/v2/services/data_import_swimmer_builder'
require_relative '../../../app/data_import/v2/services/data_import_badge_builder'


describe V2::DataImportMeetingTeamScoreBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Non-existing (totally random) fixture params.:
  let(:meeting)               { create( :meeting ) }
  let(:season)                { meeting.season }
  let(:detail_row_idx)        { (rand * 50).to_i }  # Used to compute the esteemed heat begin time
  let(:detail_rows_size)      { (rand * 40).to_i }  # Used to compute the esteemed heat number
  let(:random_score)          { (rand * 1000).to_i }
  # NOTE:
  # detail_row[:fields] => [
  #   :team_name, :result_score, :result_position
  # ]
  let(:rand_detail_row) do
    {
      import_text: FFaker::Lorem.paragraph[0..250],
      fields: {
        team_name:        build( :data_import_team ).name,
        result_score:     random_score.to_s,
        result_position:  (1 + (rand * 20).to_i % 20).to_s
      }
    }
  end
  #-- -------------------------------------------------------------------------
  #++


  shared_examples_for( "(build process successfull)" ) do
    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end
  end


  context "after a self.build() with NO matching primary entity (and NO MRR nor DI_MRR)," do
    subject do
      V2::DataImportMeetingTeamScoreBuilder.build_from_parameters(
        data_import_session,
        season,
        meeting,
        rand_detail_row, detail_row_idx, detail_rows_size,
        true # force_team_or_swimmer_creation
      )
    end

    it_behaves_like( "(build process successfull)" )

    it "creates a new secondary entity row" do
      expect{ subject }.to change{ DataImportMeetingTeamScore.count }.by(1)
    end
    it "doesn't create any primary entity row" do
      expect{ subject }.not_to change{ MeetingTeamScore.count }
    end
    it "creates a new DataImportTeam row" do
      expect{ subject }.to change{ DataImportTeam.count }.by(1)
    end

    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeetingTeamScore )
      end
    end
    describe "#result_id" do
      it "returns a positive ID since the resulting row is a data-import entity" do
        expect( subject.result_id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_id ).to eq( subject.result_row.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  shared_examples_for( "NO matching primary entity (but existing MRR or DI-MRR)" ) do
    it_behaves_like( "(build process successfull)" )

    it "creates a new secondary entity row" do
      expect{ subject }.to change{ DataImportMeetingTeamScore.count }.by(1)
    end
    it "doesn't create any primary entity row" do
      expect{ subject }.not_to change{ MeetingTeamScore.count }
    end
    it "doesn't create any additional Team row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ Team.count }.by(1)
    end
    it "doesn't create any DataImportTeam row" do
      expect{ subject }.not_to change{ DataImportTeam.count }
    end

    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeetingTeamScore )
      end
    end
    describe "#result_id" do
      it "returns a positive ID when the resulting row is a data-import entity" do
        expect( subject.result_id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_id ).to eq( subject.result_row.id )
      end
    end
  end


  # Non-existing (totally random) fixture params.:
  let(:mrr) do
    create( :meeting_relay_result )
  end
  let(:mrr_detail_row) do
    {
      import_text: FFaker::Lorem.paragraph[0..250],
      fields: {
        team_name:        mrr.team.name,
        result_score:     mrr.standard_points.to_s,
        result_position:  mrr.rank
      }
    }
  end


  context "after a self.build() with NO matching primary entity (but existing MeetingRelayResult)," do
    subject do
      V2::DataImportMeetingTeamScoreBuilder.build_from_parameters(
        data_import_session,
        mrr.meeting.season,
        mrr.meeting,
        mrr_detail_row, detail_row_idx, detail_rows_size,
        false # force_team_or_swimmer_creation
      )
    end
    it_behaves_like( "NO matching primary entity (but existing MRR or DI-MRR)" )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Non-existing (totally random) fixture params.:
  let(:di_mrr) do
    create( :data_import_meeting_relay_result, data_import_session: data_import_session )
  end
  let(:di_mrr_detail_row) do
    {
      import_text: FFaker::Lorem.paragraph[0..250],
      fields: {
        team_name:        di_mrr.team.name,
        result_score:     di_mrr.standard_points.to_s,
        result_position:  di_mrr.rank
      }
    }
  end


  context "after a self.build() with NO matching primary entity (but existing DataImportMeetingRelayResult)," do
    subject do
      V2::DataImportMeetingTeamScoreBuilder.build_from_parameters(
        data_import_session,
        di_mrr.meeting.season,
        di_mrr.meeting,
        di_mrr_detail_row, detail_row_idx, detail_rows_size,
        false # force_team_or_swimmer_creation
      )
    end
    it_behaves_like( "NO matching primary entity (but existing MRR or DI-MRR)" )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Existing or matching entities:
  let(:primary_ts_with_mrrs) do
    create( :meeting_team_score_with_relay_results )
  end
  let(:primary_detail_row) do
    {
      import_text: FFaker::Lorem.paragraph[0..250],
      fields: {
        team_name:        primary_ts_with_mrrs.team.name,
        # [Steve, 20141017] For the search of an existing MeetingTeamScore the actual
        # score value is ignored (the examples should not create a new ranking row):
        result_score:     primary_ts_with_mrrs.meeting_relay_points.to_s,
        result_position:  primary_ts_with_mrrs.rank
      }
    }
  end


  context "after a self.build() with a matching primary entity (w/ MeetingRelayResults)," do
    subject do
      V2::DataImportMeetingTeamScoreBuilder.build_from_parameters(
        data_import_session,
        primary_ts_with_mrrs.meeting.season,
        primary_ts_with_mrrs.meeting,
        primary_detail_row, detail_row_idx, detail_rows_size,
        false # force_team_or_swimmer_creation
      )
    end

    it_behaves_like( "(build process successfull)" )

    it "doesn't create any additional primary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ MeetingTeamScore.count }.by(1)
    end
    it "doesn't create any secondary entity row" do
      expect{ subject }.not_to change{ DataImportMeetingTeamScore.count }
    end
    it "doesn't create any additional Team row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ Team.count }.by(1)
    end
    it "doesn't create any DataImportTeam row" do
      expect{ subject }.not_to change{ DataImportTeam.count }
    end

    describe "#result_row" do
      it "returns a primary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( MeetingTeamScore )
      end
    end
    describe "#result_id" do
      it "returns a negative ID since the resulting row is a primary entity" do
        expect( subject.result_id ).to be < 0
      end
      it "is the ID of the resulting row (with a minus sign)" do
        expect( subject.result_id ).to eq( -subject.result_row.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Existing or matching entities:
  let(:secondary_ts_with_mrrs) do
    create( :data_import_meeting_team_score_with_relay_results, data_import_session: data_import_session )
  end
  let(:secondary_detail_row) do
    {
      import_text: FFaker::Lorem.paragraph[0..250],
      fields: {
        team_name:        secondary_ts_with_mrrs.team.name,
        # [Steve, 20141017] For the search of an existing MeetingTeamScore the actual
        # score value is ignored (the examples should not create a new ranking row):
        result_score:     secondary_ts_with_mrrs.meeting_relay_points.to_s,
        result_position:  secondary_ts_with_mrrs.rank
      }
    }
  end


  context "after a self.build() with a matching secondary entity (w/ DataImportMeetingRelayResults)," do
    subject do
      V2::DataImportMeetingTeamScoreBuilder.build_from_parameters(
        data_import_session,
        secondary_ts_with_mrrs.meeting.season,
        secondary_ts_with_mrrs.meeting,
        secondary_detail_row, detail_row_idx, detail_rows_size,
        false # force_team_or_swimmer_creation
      )
    end

    it_behaves_like( "(build process successfull)" )

    it "doesn't create any additional secondary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ DataImportMeetingTeamScore.count }.by(1)
    end
    it "doesn't create any primary entity row" do
      expect{ subject }.not_to change{ MeetingTeamScore.count }
    end
    it "doesn't create any additional Team row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ Team.count }.by(1)
    end
    it "doesn't create any DataImportTeam row" do
      expect{ subject }.not_to change{ DataImportTeam.count }
    end

    describe "#result_row" do
      it "returns a secondary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeetingTeamScore )
      end
    end
    describe "#result_id" do
      it "returns a positive ID since the resulting row is a secondary entity" do
        expect( subject.result_id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_id ).to eq( subject.result_row.id )
      end
    end
  end
  #-- =========================================================================
  #++


  describe "self.get_all_relay_results() for a Meeting with no Relay results," do
    subject do
      V2::DataImportMeetingTeamScoreBuilder.get_all_relay_results(
        data_import_session,
        meeting,
        create(:team)
      )
    end

    it "returns a list" do
      expect( subject ).to respond_to(:each)
      expect( subject ).to respond_to(:size)
    end
    it "returns no items" do
      expect( subject.size ).to eq(0)
    end
  end


  describe "self.get_all_relay_results() for a Meeting with MRRs," do
    subject do
      V2::DataImportMeetingTeamScoreBuilder.get_all_relay_results(
        data_import_session,
        primary_ts_with_mrrs.meeting,
        primary_ts_with_mrrs.team
      )
    end

    it "returns a list" do
      expect( subject ).to respond_to(:each)
      expect( subject ).to respond_to(:size)
    end
    it "returns MRR items" do
      expect( subject ).to all( be_an_instance_of(MeetingRelayResult) )
    end
    it "returns the items relative to a specific (team, meeting) tuple" do
      expected_count = MeetingRelayResult.includes(:meeting).where(
        team_id:          primary_ts_with_mrrs.team_id,
        :"meetings.id" => primary_ts_with_mrrs.meeting_id,
        is_out_of_race:   false,
        is_disqualified:  false
      ).count
      expect( subject.size ).to eq( expected_count )
    end
  end


  describe "self.get_all_relay_results() for a Meeting with DI-MRRs," do
    subject do
      V2::DataImportMeetingTeamScoreBuilder.get_all_relay_results(
        data_import_session,
        secondary_ts_with_mrrs.meeting,
        secondary_ts_with_mrrs.team
      )
    end

    it "returns a list" do
      expect( subject ).to respond_to(:each)
      expect( subject ).to respond_to(:size)
    end
    it "returns DI-MRR items" do
      expect( subject ).to all( be_an_instance_of(DataImportMeetingRelayResult) )
    end
    it "returns the items relative to a specific (team, meeting) tuple" do
      expected_count = DataImportMeetingRelayResult.includes(:meeting).where(
        team_id:          secondary_ts_with_mrrs.team_id,
        :"meetings.id" => secondary_ts_with_mrrs.meeting_id,
        is_out_of_race:   false,
        is_disqualified:  false
      ).count
      expect( subject.size ).to eq( expected_count )
    end
  end
  #-- =========================================================================
  #++


  describe "self.fix_missing_rank()," do
    it "returns the rank value of a meeting with existing DataImportTeamScores" do
      result_rank = V2::DataImportMeetingTeamScoreBuilder.fix_missing_rank(
        data_import_session,
        secondary_ts_with_mrrs.meeting
      )
      expect( result_rank ).to eq( secondary_ts_with_mrrs.rank )
    end

    it "returns the tot.rows +1 as the rank value for a meeting w/ NO existing DataImportTeamScores" do
      result_rank = V2::DataImportMeetingTeamScoreBuilder.fix_missing_rank(
        data_import_session,
        meeting
      )
      expect( result_rank ).to eq(1)
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
