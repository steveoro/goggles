# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/data_import_entity_builder'
require_relative '../../../lib/data_import/services/data_import_meeting_individual_result_builder'


describe DataImportMeetingIndividualResultBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Non-existing (totally random) fixture params. Rebuild a plausible event & program
  # starting from the meeting session:
  let(:meeting_program)       { create( :meeting_program ) }
  let(:season)                { meeting_program.meeting.season }
  let(:gender_type)           { meeting_program.gender_type }
  let(:category_type)         { meeting_program.category_type }
  # NOTE:
  # detail_row[:fields] => [
  #    :result_position, :team_code, :swimmer_name, :swimmer_year, :team_name,
  #    :result_time, :result_score
  # ]
  let(:detail_row) do
    {
      import_text: Faker::Lorem.paragraph,
      fields: {
        result_position:  1 + (rand * 20).to_i % 20
#        team_code:        stroke_type.code,
#        swimmer_name:     gender_type.code,
#        swimmer_year:     category_type.code,
#        team_name:        category_type.code,
#        result_time:      category_type.code,
#        result_score:     category_type.code
      }
    }
  end
  # This is just used to compute the esteemed heat begin time:
  let(:detail_row_idx)        { (rand * 50).to_i }
  # This is just used to compute the esteemed heat number:
  let(:detail_rows_size)      { (rand * 40).to_i }

  # Existing or matching fixture params:
  let(:meeting_individual_result) { create( :meeting_individual_result ) }
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with NO matching MeetingIndividualResult (but existing MeetingProgram)," do
    subject do
      DataImportMeetingIndividualResultBuilder.build_from_parameters(
        data_import_session,
        season, meeting_program,
        detail_row, detail_row_idx, detail_rows_size,
        gender_type, category_type,
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

    xit "creates a new secondary entity row" do
      expect{ subject }.to change{ DataImportMeetingIndividualResult.count }.by(1)
    end
    describe "#result_row" do
      xit "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeetingIndividualResult )
      end
    end
    describe "#result_id" do
      xit "returns a positive ID when the resulting row is a data-import entity" do
        expect( subject.result_id ).to be > 0
      end
      xit "is the ID of the resulting row" do
        expect( subject.result_id ).to eq( subject.result_row.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with a matching MeetingIndividualResult (and its MeetingProgram)," do
    subject do
      DataImportMeetingIndividualResultBuilder.build_from_parameters(
        data_import_session,
        meeting_individual_result.season,
        meeting_individual_result.meeting_program,
        detail_row, detail_row_idx, detail_rows_size,
        meeting_individual_result.gender_type,
        meeting_individual_result.category_type,
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

    xit "doesn't create any additional primary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ MeetingIndividualResult.count }.by(1)
    end
    xit "doesn't create a new secondary entity row" do
      expect{ subject }.not_to change{ DataImportMeetingIndividualResult.count }
    end
    xit "doesn't create any additional MeetingProgram row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ MeetingProgram.count }.by(1)
    end

    describe "#result_row" do
      xit "returns a primary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( MeetingIndividualResult )
      end
    end
    describe "#result_id" do
      xit "returns a negative ID when the resulting row is a primary entity" do
        expect( subject.result_id ).to be < 0
      end
      xit "is the ID of the resulting row (with a minus sign)" do
        expect( subject.result_id ).to eq( -subject.result_row.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
