# encoding: utf-8
require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/services/data_import_entity_builder'
require_relative '../../../app/data_import/v2/services/data_import_meeting_individual_result_builder'
require_relative '../../../app/data_import/v2/services/data_import_team_builder'
require_relative '../../../app/data_import/v2/services/data_import_swimmer_builder'
require_relative '../../../app/data_import/v2/services/data_import_badge_builder'


describe V2::DataImportMeetingIndividualResultBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Non-existing (totally random) fixture params. Rebuild a plausible event & program
  # starting from the meeting session:
  let(:meeting_program)       { create( :meeting_program_individual ) }
  let(:season)                { meeting_program.season }  # (by ActiveRecord has_one)
  let(:gender_type)           { meeting_program.gender_type }
  let(:category_type)         { meeting_program.category_type }

  let(:di_meeting_program) do
    create(
      :data_import_meeting_program_individual,
      data_import_session: data_import_session
    )
  end
  let(:di_season)             { di_meeting_program.meeting_session.meeting.season }
  let(:di_gender_type)        { di_meeting_program.gender_type }
  let(:di_category_type)      { di_meeting_program.category_type }

  let(:detail_row_idx)        { (rand * 50).to_i }  # Used to compute the esteemed heat begin time
  let(:detail_rows_size)      { (rand * 40).to_i }  # Used to compute the esteemed heat number
  let(:random_score)          { (rand * 1000).to_i }
  # NOTE:
  # detail_row[:fields] => [
  #    :team_name, :team_code, :swimmer_name, :swimmer_year,
  #    :result_time, :result_score, :result_position
  # ]
  let(:detail_row) do
    {
      import_text: FFaker::Lorem.paragraph[0..250],
      fields: {
        team_name:        build( :data_import_team ).name,
        team_code:        build( :data_import_team ).badge_number,
        swimmer_name:     build( :swimmer ).complete_name,
        swimmer_year:     build( :swimmer ).year_of_birth,
        result_time:      "0'#{((rand * 60) % 60).to_i}\"#{((rand * 100) % 100).to_i}",
        result_score:     random_score.to_s,
        result_position:  (1 + (rand * 20).to_i % 20).to_s,
      }
    }
  end

  # Existing or matching entities:
  let(:mir)                   { create( :meeting_individual_result ) }
  let(:mir_detail_row) do
    {
      import_text: FFaker::Lorem.paragraph[0..250],
      fields: {
        team_name:        mir.team.name,
        team_code:        mir.team_affiliation.number,
        swimmer_name:     mir.swimmer.complete_name,
        swimmer_year:     mir.swimmer.year_of_birth,
        result_time:      "#{mir.minutes}'#{mir.seconds}\"#{mir.hundreds}",
        result_score:     mir.standard_points.to_s,
        result_position:  (1 + (rand * 20).to_i % 20).to_s
      }
    }
  end
  let(:di_mir) do
    create(
      :data_import_meeting_individual_result,
      data_import_session: data_import_session
    )
  end
  let(:di_mir_detail_row) do
    {
      import_text: FFaker::Lorem.paragraph[0..250],
      fields: {
        team_name:        di_mir.team.name,
        team_code:        di_mir.team_affiliation.number,
        swimmer_name:     di_mir.swimmer.complete_name,
        swimmer_year:     di_mir.swimmer.year_of_birth,
        result_time:      "#{di_mir.minutes}'#{di_mir.seconds}\"#{di_mir.hundreds}",
        result_score:     di_mir.standard_points.to_s,
        result_position:  (1 + (rand * 20).to_i % 20).to_s
      }
    }
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with NO matching primary entity (but existing MeetingProgram)," do
    subject do
      V2::DataImportMeetingIndividualResultBuilder.build_from_parameters(
        data_import_session,
        season,
        meeting_program,
        detail_row, detail_row_idx, detail_rows_size,
        gender_type, category_type,
        true # force_team_or_swimmer_creation
      )
    end

    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    it "creates a new secondary entity row" do
      expect{ subject }.to change{ DataImportMeetingIndividualResult.count }.by(1)
    end
    it "doesn't create any primary entity row" do
      expect{ subject }.not_to change{ MeetingIndividualResult.count }
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
        expect( subject.result_row ).to be_an_instance_of( DataImportMeetingIndividualResult )
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
    subject do
      V2::DataImportMeetingIndividualResultBuilder.build_from_parameters(
        data_import_session,
        di_season,
        di_meeting_program,
        detail_row, detail_row_idx, detail_rows_size,
        di_gender_type, di_category_type,
        true # force_team_or_swimmer_creation
      )
    end

    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    it "creates a new secondary entity row" do
      expect{ subject }.to change{ DataImportMeetingIndividualResult.count }.by(1)
    end
    it "doesn't create any primary entity row" do
      expect{ subject }.not_to change{ MeetingIndividualResult.count }
    end
    it "doesn't create any additional DataImportMeetingProgram row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ DataImportMeetingProgram.count }.by(1)
    end
    it "doesn't create any MeetingProgram row" do
      expect{ subject }.not_to change{ MeetingProgram.count }
    end

    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeetingIndividualResult )
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
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching primary entity (and its MeetingProgram)," do
    subject do
# DEBUG
#      puts "\r\n\r\n========================================================================================================================="
#      puts " --- Subject MIR: " << mir.inspect
#      puts " --- Subject swimmer: " << mir.swimmer.inspect
#      possible_swimmers = Swimmer.where( "complete_name LIKE \"%#{mir.swimmer.last_name}%\"" ).reload
#      possible_swimmers.each{ |row| puts " --- id: #{row.id}, #{row.complete_name}, gender: #{row.gender_type_id}, #{row.year_of_birth}"}
      V2::DataImportMeetingIndividualResultBuilder.build_from_parameters(
        data_import_session,
        mir.meeting_program.season, # (by ActiveRecord has_one)
        mir.meeting_program,
        mir_detail_row, detail_row_idx, detail_rows_size,
        mir.meeting_program.gender_type,
        mir.meeting_program.category_type,
        false # force_team_or_swimmer_creation
      )
    end

    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    it "doesn't create any additional primary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ MeetingIndividualResult.count }.by(1)
    end
    it "doesn't create a new secondary entity row" do
      expect{ subject }.not_to change{ DataImportMeetingIndividualResult.count }
    end
    it "doesn't create any additional MeetingProgram row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ MeetingProgram.count }.by(1)
    end
    it "doesn't create any DataImportMeetingProgram row" do
      expect{ subject }.not_to change{ DataImportMeetingProgram.count }
    end

    describe "#result_row" do
      it "returns a primary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( MeetingIndividualResult )
      end
    end
    describe "#result_id" do
      it "returns a negative ID when the resulting row is a primary entity" do
        expect( subject.result_id ).to be < 0
      end
      it "is the ID of the resulting row (with a minus sign)" do
        expect( subject.result_id ).to eq( -subject.result_row.id )
      end
      it "is the ID of the fixture row (with a minus sign)" do
        expect( subject.result_id ).to eq( -mir.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching secondary entity (w/ DataImportMeetingProgram)," do
    subject do
      V2::DataImportMeetingIndividualResultBuilder.build_from_parameters(
        data_import_session,
        di_mir.data_import_meeting_program.meeting_session.meeting.season,
        di_mir.data_import_meeting_program,
        di_mir_detail_row, detail_row_idx, detail_rows_size,
        di_mir.data_import_meeting_program.gender_type,
        di_mir.data_import_meeting_program.category_type,
        false # force_team_or_swimmer_creation
      )
    end

    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    it "doesn't create any additional secondary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ DataImportMeetingIndividualResult.count }.by(1)
    end
    it "doesn't create a new primary entity row" do
      expect{ subject }.not_to change{ MeetingIndividualResult.count }
    end
    it "doesn't create any additional DataImportMeetingProgram row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ DataImportMeetingProgram.count }.by(1)
    end
    it "doesn't create any MeetingProgram row" do
      expect{ subject }.not_to change{ MeetingProgram.count }
    end

    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeetingIndividualResult )
      end
    end
    describe "#result_id" do
      it "returns a positive ID since the resulting row is a data-import entity" do
        expect( subject.result_id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_id ).to eq( subject.result_row.id )
      end
      it "is the ID of the fixture row" do
        expect( subject.result_id ).to eq( di_mir.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "self.fix_missing_rank() for MIRs," do
    it "returns the rank value of a matching MIR having the same program and score" do
      result_rank = V2::DataImportMeetingIndividualResultBuilder.fix_missing_rank(
        DataImportMeetingIndividualResult,
        data_import_session,
        di_mir.data_import_meeting_program,
        di_mir.standard_points
      )
      expect( result_rank ).to eq( di_mir.rank )
    end

    it "returns the tot.rows +1 as the rank value for a matching program, w/ MIRs and a new score" do
      result_rank = V2::DataImportMeetingIndividualResultBuilder.fix_missing_rank(
        DataImportMeetingIndividualResult,
        data_import_session,
        di_mir.data_import_meeting_program,
        di_mir.standard_points + random_score
      )
      expect( result_rank ).to be > 0
    end

    it "returns 1 as the rank value for a matching program and a new score but w/o MIRS" do
      result_rank = V2::DataImportMeetingIndividualResultBuilder.fix_missing_rank(
        DataImportMeetingIndividualResult,
        data_import_session,
        meeting_program,
        random_score
      )
      expect( result_rank ).to eq(1)
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
