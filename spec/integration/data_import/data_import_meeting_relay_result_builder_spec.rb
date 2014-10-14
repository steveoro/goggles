# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/data_import_entity_builder'
require_relative '../../../lib/data_import/services/data_import_meeting_relay_result_builder'
require_relative '../../../lib/data_import/services/data_import_team_builder'
require_relative '../../../lib/data_import/services/data_import_swimmer_builder'
require_relative '../../../lib/data_import/services/data_import_badge_builder'


describe DataImportMeetingRelayResultBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Non-existing (totally random) fixture params. Rebuild a plausible event & program
  # starting from the meeting session:
  let(:meeting_program)       { create( :meeting_program_relay ) }
  let(:season)                { meeting_program.season }  # (by ActiveRecord has_one)

  let(:di_meeting_program) do
    create(
      :data_import_meeting_program_relay,
      data_import_session: data_import_session
    )
  end
  let(:di_season)             { di_meeting_program.meeting_session.meeting.season }

  let(:detail_row_idx)        { (rand * 50).to_i }  # Used to compute the esteemed heat begin time
  let(:detail_rows_size)      { (rand * 40).to_i }  # Used to compute the esteemed heat number
  # NOTE:
  # detail_row[:fields] => [
  #   :team_name,  :result_time, :result_score, :result_position
  # ]
  let(:detail_row) do
    {
      import_text: Faker::Lorem.paragraph[0..250],
      fields: {
        team_name:        build( :data_import_team ).name,
        result_time:      "#{((rand * 4) % 4).to_i}'#{((rand * 60) % 60).to_i}\"#{((rand * 100) % 100).to_i}",
        result_score:     (rand * 1000).to_i.to_s,
        result_position:  (1 + (rand * 20).to_i % 20).to_s,
      }
    }
  end

  # Existing or matching entities:
  let(:mrr)                   { create( :meeting_relay_result ) }
  let(:mrr_detail_row) do
    {
      import_text: Faker::Lorem.paragraph[0..250],
      fields: {
        team_name:        mrr.team.name,
        result_time:      "#{mrr.minutes}'#{mrr.seconds}\"#{mrr.hundreds}",
        result_score:     mrr.standard_points.to_s,
        result_position:  (1 + (rand * 20).to_i % 20).to_s
      }
    }
  end
  let(:di_mrr) do
    create(
      :data_import_meeting_relay_result,
      data_import_session: data_import_session
    )
  end
  let(:di_mrr_detail_row) do
    {
      import_text: Faker::Lorem.paragraph[0..250],
      fields: {
        team_name:        di_mrr.team.name,
        result_time:      "#{di_mrr.minutes}'#{di_mrr.seconds}\"#{di_mrr.hundreds}",
        result_score:     di_mrr.standard_points.to_s,
        result_position:  (1 + (rand * 20).to_i % 20).to_s
      }
    }
  end
  # TODO secondary entity
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with NO matching primary entity (but existing MeetingProgram)," do
    subject do
      DataImportMeetingRelayResultBuilder.build_from_parameters(
        data_import_session,
        season,
        meeting_program,
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
      expect{ subject }.to change{ DataImportMeetingRelayResult.count }.by(1)
    end
    it "doesn't create any primary entity row" do
      expect{ subject }.not_to change{ MeetingRelayResult.count }
    end
    it "doesn't create any additional MeetingProgram row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ MeetingProgram.count }.by(1)
    end
    it "doesn't create any DataImportMeetingProgram row" do
      expect{ subject }.not_to change{ DataImportMeetingProgram.count }
    end

    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeetingRelayResult )
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

  # TODO Test DataImportMeetingIndividualResultBuilder.fix_missing_rank for DataImportMeetingRelayResult

end
