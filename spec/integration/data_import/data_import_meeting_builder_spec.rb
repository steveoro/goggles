# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/services/data_import_entity_builder'
require_relative '../../../app/data_import/v2/services/data_import_meeting_builder'


describe V2::DataImportMeetingBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Non-existing (totally random) fixture params:
  let(:pathname)            { File.join(FFaker::Lorem.word, FFaker::Lorem.word) }
  let(:prefix)              { FFaker::Lorem.word[0..2] }
  let(:year)                { ((rand * 100) % 50).to_i + 1945 }
  let(:month)               { ((rand * 100) % 12).to_i + 1 }
  let(:day)                 { ((rand * 100) % 28).to_i + 1 }
  let(:header_text_date)    { "%04d%02d%02d" % [year, month, day] }
  let(:code_name)           { FFaker::Lorem.word }
  let(:full_pathname)       { File.join( pathname, "#{ prefix }#{ header_text_date }#{ code_name }.txt" ) }
  let(:meeting_dates_text)  { "%04d-%02d-%02d" % [year, month, day] }
  let(:header_fields_dao)   { V2::FilenameParser.new( full_pathname ).parse }
  let(:meeting_header_row) do
    {
      import_text: "#{FFaker::Lorem.word} meeting - organized by #{FFaker::Lorem.word} team",
      fields: {
        title: "#{FFaker::Lorem.word} meeting",
        organization: "#{FFaker::Lorem.word} team"
      }
    }
  end

  # Existing or searchable/matching fixture params:
  let(:searchable_season_out_of_seed) do
    create(
      :season,
      begin_date: Date.parse( "#{year}0915" ), # A totally rand date text before 1996
      season_type_id: 1,
      edition: 0
    )
  end
  # Specifying the season will set all meeting dates accordingly:
  let(:meeting)             { create( :meeting, season: searchable_season_out_of_seed ) }
  let(:matching_pathname)   { File.join( pathname, "ris#{ meeting.header_date.strftime("%Y%m%d") }#{ meeting.code }.txt" ) }
  let(:matching_header_dao) { V2::FilenameParser.new( matching_pathname ).parse }
  let(:matching_header_row) do
    {
      import_text: "#{meeting.edition}° #{meeting.description} meeting",
      fields: {
        title:        meeting.description,
        organization: nil
      }
    }
  end
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with NO matching Meeting row (but with Season)," do
    let(:new_season) { create(:season) }
    subject do
      V2::DataImportMeetingBuilder.build_from_parameters(
        data_import_session,
        new_season,
        header_fields_dao,
        meeting_header_row,
        meeting_dates_text,
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
      expect{ subject }.to change{ DataImportMeeting.count }.by(1)
    end
    it "doesn't create a new data_import_seasons row" do
      expect{ subject }.not_to change{ DataImportSeason.count }
    end
    it "finds the correct Season row" do
      expect( subject.result_row.season_id ).to eq(new_season.id)
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


  context "after a self.build() with a matching Meeting row (and with Season)," do
    subject do
      V2::DataImportMeetingBuilder.build_from_parameters(
        data_import_session,
        meeting.season,
        matching_header_dao,
        matching_header_row,
        nil,
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
      expect{ subject }.not_to change{ DataImportMeeting.count }
    end
    it "doesn't create a new data_import_seasons row" do
      expect{ subject }.not_to change{ DataImportSeason.count }
    end
    it "finds the correct Meeting row" do
      expect( subject.result_row.id ).to eq(meeting.id)
    end
    it "finds the correct Season row" do
      expect( subject.result_row.season_id ).to eq(meeting.season_id)
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


  context "after a self.build() with a matching Meeting row but without specifying Season," do
    subject do
# DEBUG
#      puts "\r\n*** Subject: meeting ID #{meeting.id}, #{meeting.season.inspect}"
      V2::DataImportMeetingBuilder.build_from_parameters(
        data_import_session,
        nil,
        matching_header_dao,
        matching_header_row,
        nil,
        # We set the following to true while also testing that no secondary entity
        # rows will be created, so that the search/add build for Season may be
        # toggled on:
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

    it "does not create a new secondary entity row" do
      expect{ subject }.not_to change{ DataImportMeeting.count }
    end
    it "doesn't create a new data_import_seasons row" do
      expect{ subject }.not_to change{ DataImportSeason.count }
    end
    it "finds the correct Meeting row" do
      expect( subject.result_row.id ).to eq(meeting.id)
    end
    it "finds the correct Season row" do
      expect( subject.result_row.season_id ).to eq(meeting.season_id)
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
