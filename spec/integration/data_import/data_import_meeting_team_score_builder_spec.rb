# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/data_import_entity_builder'
require_relative '../../../lib/data_import/services/data_import_meeting_team_score_builder'
require_relative '../../../lib/data_import/services/data_import_team_builder'
require_relative '../../../lib/data_import/services/data_import_swimmer_builder'
require_relative '../../../lib/data_import/services/data_import_badge_builder'


describe DataImportMeetingTeamScoreBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Non-existing (totally random) fixture params. Rebuild a plausible event & program
  # starting from the meeting session:
  let(:meeting)               { create( :meeting ) }
  let(:season)                { meeting.season }
  let(:detail_row_idx)        { (rand * 50).to_i }  # Used to compute the esteemed heat begin time
  let(:detail_rows_size)      { (rand * 40).to_i }  # Used to compute the esteemed heat number
  let(:random_score)          { (rand * 1000).to_i }
  # NOTE:
  # detail_row[:fields] => [
  #   :team_code, :team_name, :result_score, :result_position
  # ]
  let(:detail_row) do
    {
      import_text: Faker::Lorem.paragraph[0..250],
      fields: {
        team_code:        build( :data_import_team ).badge_number,
        team_name:        build( :data_import_team ).name,
        result_score:     random_score.to_s,
        result_position:  (1 + (rand * 20).to_i % 20).to_s
      }
    }
  end

  # Existing or matching entities:
  # TODO primary
  # TODO secondary
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with NO matching primary entity (but existing MeetingProgram)," do
    subject do
      DataImportMeetingTeamScoreBuilder.build_from_parameters(
        data_import_session,
        season,
        meeting,
        detail_row, detail_row_idx, detail_rows_size,
        true # force_missing_team_creation
      )
    end

    it "returns a DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    it "creates a new secondary entity row" do
      expect{ subject }.to change{ DataImportMeetingTeamScore.count }.by(1)
    end
    it "doesn't create any primary entity row" do
      expect{ subject }.not_to change{ MeetingTeamScore.count }
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


  context "after a self.build() with NO matching primary entity (but existing DataImportMeetingProgram)," do
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching primary entity (and its MeetingProgram)," do
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching secondary entity (w/ DataImportMeetingProgram)," do
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "self.get_all_relay_results() for a Meeting with no Relay results," do
    xit "returns and empty array" do
      # TODO
    end
  end


  describe "self.get_all_relay_results() for a Meeting with MRRs," do
# TODO Either use pre-loaded seed or create a specific MRR-only meeting with at least a couple of teams
    xit "returns the list of MRRs" do
      mrr_list = DataImportMeetingTeamScoreBuilder.get_all_relay_results(
        data_import_session,
        meeting,
        team
      )
      expected_count = meeting.meeting_relay_results.where(
        team_id: team.id,
        is_out_of_race: false, is_disqualified: false
      ).count
      expect( mrr_list.size ).to eq( expected_count )
    end
  end


  describe "self.get_all_relay_results() for a Meeting with DI-MRRs," do
# TODO Either use pre-loaded seed or create a specific MRR-only meeting with at least a couple of teams
    xit "returns the list of DI-MRRs" do
    end
  end


  describe "self.get_all_relay_results() for a Meeting with both DI-MRRs & MRRs," do
# TODO Either use pre-loaded seed or create a specific MRR-only meeting with at least a couple of teams
    xit "returns the composed list of MRRs + DI-MRRs" do
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "self.fix_missing_rank()," do
    # TODO
  end
  #-- -------------------------------------------------------------------------
  #++
end
