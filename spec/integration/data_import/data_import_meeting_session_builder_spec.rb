# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/services/data_import_entity_builder'
require_relative '../../../app/data_import/v2/services/data_import_meeting_session_builder'


describe V2::DataImportMeetingSessionBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Non-existing fixture params:
  let(:year)                  { ((rand * 100) % 10).to_i + 2007 }
  let(:month)                 { ((rand * 100) % 12).to_i + 1 }
  let(:day)                   { ((rand * 100) % 28).to_i + 1 }
  let(:header_text_date)      { "%04d%02d%02d" % [year, month, day] }
  let(:code_name)             { FFaker::Lorem.word }
  let(:full_pathname)         { "ris#{ header_text_date }#{ code_name }.txt" }
  let(:meeting_dates_text)    { "%04d-%02d-%02d" % [year, month, day] }
  let(:header_fields_dao)     { V2::FilenameParser.new( full_pathname ).parse }

  # Existing or matching fixture params:
  let(:meeting_session)       { create(:meeting_session) }
  let(:matching_pathname)     { "ris#{ meeting_session.meeting.header_date.strftime("%Y%m%d") }#{ meeting_session.meeting.code }.txt" }
  let(:matching_header_dao)   { V2::FilenameParser.new( matching_pathname ).parse }
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with NO matching MeetingSession but existing meeting," do
    subject do
      V2::DataImportMeetingSessionBuilder.build_from_parameters(
        data_import_session,
        meeting_session.meeting,
        matching_header_dao,
        meeting_dates_text,
        meeting_session.scheduled_date + 5.days,
        true # force_missing_meeting_creation
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
      expect{ subject }.to change{ DataImportMeetingSession.count }.by(1)
    end
    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeetingSession )
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

  context "after a self.build() with NO matching MeetingSession & NO Meeting rows," do
    subject do
      V2::DataImportMeetingSessionBuilder.build_from_parameters(
        data_import_session,
        nil,
        header_fields_dao,
        nil,
        Date.today,
        true # force_missing_meeting_creation
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
      expect{ subject }.to change{ DataImportMeetingSession.count }.by(1)
    end
    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeetingSession )
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

  context "after a self.build() with a matching MeetingSession row," do
    subject do
      # Alternatively, we can randomize this with existing rows from seeds:
#      meeting_session = MeetingSession.all.sort{ rand() - 0.5 }[0]
      V2::DataImportMeetingSessionBuilder.build_from_parameters(
        data_import_session,
        meeting_session.meeting,
        matching_header_dao,
        nil,
        meeting_session.scheduled_date,
        false # force_missing_meeting_creation
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

    it "does not create a new secondary entity row" do
      expect{ subject }.not_to change{ DataImportMeetingSession.count }
    end
    describe "#result_row" do
      it "returns the entity instance found when the primary search is successful" do
        expect( subject.result_row ).to be_an_instance_of( MeetingSession )
      end
    end
    describe "#result_id" do
      it "returns a negative ID when the primary search is successful" do
        expect( subject.result_id ).to be < 0
      end
      it "is the ID of the resulting row, with a minus sign" do
        expect( subject.result_id ).to eq( -(subject.result_row.id) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
