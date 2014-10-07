# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/data_import_entity_builder'
require_relative '../../../lib/data_import/services/data_import_meeting_builder'


describe DataImportMeetingBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  let(:pathname)            { File.join(Faker::Lorem.word, Faker::Lorem.word) }
  let(:prefix)              { Faker::Lorem.word[0..2] }
  let(:year)                { ((rand * 100) % 10).to_i + 2007 }
  let(:month)               { ((rand * 100) % 12).to_i + 1 }
  let(:day)                 { ((rand * 100) % 28).to_i + 1 }
  let(:header_text_date)    { "%04d%02d%02d" % [year, month, day] }
  let(:code_name)           { Faker::Lorem.word }
  let(:full_pathname)       { File.join( pathname, "#{ prefix }#{ header_text_date }#{ code_name }.txt" ) }
  let(:meeting_header_row) do
    {
      import_text: "#{Faker::Lorem.word} meeting - organized by #{Faker::Lorem.word} team",
      fields: {
        title: "#{Faker::Lorem.word} meeting",
        organization: "#{Faker::Lorem.word} team"
      }
    }
  end
  let(:meeting_dates_text)  { "%04d-%02d-%02d" % [year, month, day] }
  let(:header_fields_dao)   { FilenameParser.new( full_pathname ).parse }
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with NO matching Meeting row," do
    subject do
      DataImportMeetingBuilder.build_from_parameters(
        data_import_session,
        create(:season),
        meeting_header_row,
        meeting_dates_text,
        header_fields_dao,
        true # force_missing_meeting_creation
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
    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeeting )
      end
    end
    describe "#result_id" do
      it "returns a positive ID when the resulting row is a data-import entity" do
        expect( subject.result_id ).to be > 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_row ).to be_an_instance_of( DataImportMeeting )
        expect( subject.result_row.id ).to eq( subject.result_id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching Meeting row," do
    let(:meeting)             { create(:meeting) }
    let(:matching_pathname)   { File.join( pathname, "ris#{ meeting.header_date.strftime("%Y%m%d") }#{ meeting.code }.txt" ) }
    let(:matching_header_row) do
      {
        import_text: "#{meeting.edition}° #{meeting.description} meeting",
        fields: {
          title:        meeting.description,
          organization: nil
        }
      }
    end
    let(:matching_header_dao) { FilenameParser.new( matching_pathname ).parse }

    subject do
      DataImportMeetingBuilder.build_from_parameters(
        data_import_session,
        meeting.season,
        matching_header_row,
        nil,
        matching_header_dao,
        false # force_missing_meeting_creation
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
    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( Meeting )
      end
    end
    describe "#result_id" do
      it "returns a negative ID when the primary search is successful" do
        expect( subject.result_id ).to be < 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row, with a minus sign" do
        expect( subject.result_row ).to be_an_instance_of( Meeting )
        expect( subject.result_row.id ).to eq( -(subject.result_id) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
