require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
# require_relative '../../../lib/data_import/services/data_import_entity_builder'


describe "DataImportEntityBuilder for Meeting,", type: :integration do

  let(:data_import_session) { create( :data_import_session ) }

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
  let(:scheduled_date)      { Date.parse( meeting_dates_text ) }
  let(:header_fields_dao)   { FilenameParser.new( full_pathname ).parse }
  #-- -------------------------------------------------------------------------
  #++

  # Prepares the result subject for the specs.
  def meeting_build_process( full_pathname, season, meeting_header_row, meeting_dates_text,
                             scheduled_date, header_fields_dao, force_missing_meeting_creation )
    DataImportEntityBuilder.build( data_import_session ) do
      entity Meeting

      set_up do                                   # Set the fields:
        if ( meeting_header_row )
          @title = meeting_header_row[:fields][:title]
          @organization = meeting_header_row[:fields][:organization]
          @notes = (meeting_dates_text ? "#{meeting_dates_text}\r\n" : '') +
                   (@organization ? "#{@organization}" : '')
        end
        @description = ( @title ? @title : "#{header_fields_dao.code_name } (#{Format.a_date(scheduled_date)})" )
      end
                                                  # Search conditions:
      search do
        primary    [
          "(header_date = ?) AND (season_id = ?) AND (code = ?)",
          scheduled_date, season.id, header_fields_dao.code_name
        ]
        secondary  [
          "(data_import_session_id = ?) AND (header_date = ?) AND (season_id = ?) AND (description = ?)",
          data_import_session.id, scheduled_date, season.id, @description
        ]
        default_search
      end

      attributes_for_creation(
        data_import_session_id: data_import_session.id,
        import_text:            meeting_header_row.instance_of?(Hash) ? meeting_header_row[:import_text] : '-',
        description:            @description,
        # [Steve, 20131025] No default value for this one:
#       entry_deadline:         scheduled_date - 14, # (This is just a guess)
        are_results_acquired:   true,
        is_under_25_admitted:   true, # (This is just a guess)
        configuration_file:     full_pathname,
        header_date:            scheduled_date,
        code:                   header_fields_dao.code_name,
        header_year:            header_fields_dao.header_year,
        edition:                header_fields_dao.edition, # (This is just a guess)
        edition_type_id:        header_fields_dao.edition_type_id,
        timing_type_id:         header_fields_dao.timing_type_id,
        # TODO/FUTURE DEV:
#       individual_score_computation_type_id: 0,
#       relay_score_computation_type_id: 0,
#       team_score_computation_type_id: 0,
        notes:                  @notes,
        season_id:              season.id,
        user_id:                1 # (don't care)
      )

      if_not_found do
        if force_missing_meeting_creation
          add_new
        else
          raise "Matching Meeting NOT found but meeting creation is disabled!"
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with NO matching Meeting row," do
    subject do
      meeting_build_process(                        # Totally random meeting:
        full_pathname,
        create(:season),
        meeting_header_row,
        meeting_dates_text,
        scheduled_date,
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


  # Prepares the result subject for the specs.
  # (We skip the setup & creation phase, since we want this to find a match.)
  def existing_meeting_build_process( meeting )
    DataImportEntityBuilder.build( data_import_session ) do
      entity Meeting

      search do
        primary    [
          "(header_date = ?) AND (season_id = ?) AND (code = ?)",
          meeting.header_date, meeting.season_id, meeting.code
        ]
        default_search
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with a matching Meeting row," do
    let(:meeting)   { create(:meeting) }
    subject         { existing_meeting_build_process( meeting ) }

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
