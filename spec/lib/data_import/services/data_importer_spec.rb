require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/strategies/data_importer'
require_relative '../../../../lib/data_import/header_fields_dao'


describe DataImporter, type: :strategy do
  let(:existing_data_import_session) { create(:data_import_session) }

  context "for a new empty instance," do
    subject { DataImporter.new( nil, nil, existing_data_import_session ) }

    it_behaves_like( "(the existance of a method)", [
      :set_up,
      :destroy_data_import_session,
      :import_log_filename,
      :to_logfile,
      :write_import_logfile,
      :write_analysis_logfile,
      :write_sql_diff_logfile,
      :perform, :display_name, :max_attempts,
      :try_detect_season_from_file_path,
      :try_detect_season_from_header_fields,
      :phase_1_parse,
      :phase_1_2_serialize,
      :phase_3_commit
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#initialize" do
      it "returns a DataImporter instance" do
        expect( subject ).to be_an_instance_of( DataImporter )
      end
      it "does not create a new DataImportSession row when it is provided" do
        # (+1 from the let/create in the subject)
        expect{ subject }.to change{ DataImportSession.count }.by(1)
      end
      it "sets the internal #data_import_session member with the specified session" do
        expect( subject.data_import_session ).to eq( existing_data_import_session )
      end
      it "creates a new DataImportSession row when not provided" do
        expect{ DataImporter.new() }.to change{ DataImportSession.count }.by(1)
      end
      it "sets the #full_pathname to the value of the specified session" do
        expect( subject.full_pathname ).to eq( existing_data_import_session.file_name )
      end
      it "sets the #season to the value of the specified session" do
        expect( subject.season ).to eq( existing_data_import_session.season )
      end
      it "sets the #current_admin_id to the value of the specified session" do
        expect( subject.current_admin_id ).to eq( existing_data_import_session.user_id )
      end
      it "sets the #header_fields_dao to according to the file name in the session" do
        expect( subject.header_fields_dao ).to be_an_instance_of( HeaderFieldsDAO )
        expect( subject.header_fields_dao.full_pathname ).to eq( existing_data_import_session.file_name )
      end
    end


    describe "#set_up" do
      [
        :full_pathname,
        :season, :current_admin_id,
        :force_missing_meeting_creation,
        :force_missing_team_creation,
        :do_not_consume_file,
        :log_dir
      ].each do |member_symbol|
        it "accepts the :#{member_symbol} key" do
          expect{
            subject.set_up( member_symbol => Faker::Lorem.word )
          }.not_to raise_error
        end
        it "stores the value in the corresponding ##{member_symbol} member" do
          value = Faker::Lorem.word
          subject.set_up( member_symbol => value )
          expect( subject.send(member_symbol) ).to eq( value )
        end
        it "raises an error for any other unknown symbol" do
          expect{
            subject.set_up( Faker::Lorem.word.to_sym => Faker::Lorem.word )
          }.to raise_error
        end
      end
    end


    describe "#destroy_data_import_session" do
      # Let's use another subject def to make sure each example has its own session:
      subject { DataImporter.new( nil, nil, existing_data_import_session ) }

      it "sets the internal #data_import_session member to nil" do
        subject.destroy_data_import_session
        expect( subject.data_import_session ).to be nil
      end
      it "deletes the associated #data_import_session from DataImportSession" do
        session_id = existing_data_import_session.id
        expect( DataImportSession.find_by_id(session_id) ).not_to be nil
        subject.destroy_data_import_session
        expect( DataImportSession.find_by_id(session_id) ).to be nil
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "#import_log_filename" do
      it "returns a non empty string" do
        expect( subject.import_log_filename ).to be_an_instance_of( String )
      end
    end


    describe "#to_logfile" do
      let(:contents) { Faker::Lorem.paragraph }

      it "writes the contents to a logfile" do
        subject.to_logfile( contents )
        read_file = File.read( subject.import_log_filename )
        expect( read_file ).to include( contents )
      end
    end


    let(:season) { create(:season) }

    describe "#try_detect_season_from_file_path" do
      it "returns the current @season instance if it already set" do
        subject.set_up(
          full_pathname: "upload/ris20141025nonexisting.txt",
          season: season
        )
        expect( subject.try_detect_season_from_file_path ).to eq( season )
      end
      it "returns the correct Season if it finds the Season.id in the path name" do
        subject.set_up(
          full_pathname: "uploads/results.#{season.id}/ris20141025nonexisting.txt",
          season: nil
        )
        expect( subject.try_detect_season_from_file_path ).to eq( season )
      end
      it "returns nil if it doesn't find the Season.id in the pathname" do
        subject.set_up(
          full_pathname: "upload/ris20141025nonexisting.txt",
          season: nil
        )
        expect( subject.try_detect_season_from_file_path ).to be nil
      end
    end


    describe "#try_detect_season_from_header_fields" do
      it "returns the current @season instance when already set" do
        importer = DataImporter.new( nil, nil, existing_data_import_session )
        expect( importer.try_detect_season_from_header_fields ).to eq( importer.season )
      end
      it "returns same Season instance as the DataImportSession when already set" do
        importer = DataImporter.new( nil, nil, existing_data_import_session )
        expect( importer.try_detect_season_from_header_fields ).to eq(
          existing_data_import_session.season
        )
      end

      it "returns the correct Season if it parses correctly the header fields" do
        # We must use an existing season from the seeds because the current factory
        # may generate new seasons for a conflicting/existing season_type.
        # (And this, in turn, would make the following test fail for season mismatch
        #  due to different Season rows having the same header_year and season_type)
        # FIXME:
        # Also, the recognition from the header_year will fail for single-field
        # header_years, like in FINA o LEN Championships. So we test only against
        # season_type_id = 2.
        fixture_season = Season.where( season_type_id: 2 ).sort{ rand - 0.5 }[0]
        file_name      = "ris#{ (fixture_season.begin_date + 5.days).strftime("%Y%m%d") }nonexisting.txt"
        importer = DataImporter.new()
        importer.set_up( full_pathname: file_name )
# DEBUG
        # puts "\r\n- #{importer.header_fields_dao.inspect}"
        expect(
          importer.try_detect_season_from_header_fields( fixture_season.season_type.code )
        ).to eq( fixture_season )
      end

      it "returns nil if it can't detect the Season from the header fields" do
        importer = DataImporter.new()
        importer.set_up( full_pathname: "ris19891025nonexisting.txt" )
        expect( importer.try_detect_season_from_header_fields ).to be nil
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    # Internal Parse & text digest phase.
    # This includes:
    # - TXT file read & parsing to obtain a result hash;
    # - Creation of the data-import session object.
    #
    describe "#phase_1_parse" do
      context "after successful completion," do
        it "returns the current (updated) #data_import_session" do
          # TODO
        end
        it "updates the #result_hash member" do
          # TODO
        end
        it "sets the session #phase to '10'" do
          # TODO
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    # Internal Parse-results serialization phase.
    # This includes:
    # - Single row-by-row processing of the headers & details result hash (from phase-1)
    # - Creation of intermediate "secondary" entity rows for each parsed object,
    #   to allow manual review before the final phase-3 commit.
    #
    describe "#phase_1_2_serialize" do
      it "returns nil if the last completed phase is not '10'" do
        # TODO
      end

      context "after successful completion," do
        it "returns the current (updated) #data_import_session" do
          # TODO
        end
        it "stores the parsed secondary entities" do
          # TODO
        end
        it "sets the session #phase to 12 (if there's no need of the Team Analysis)" do
          # TODO
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    # Internal Commit phase.
    # This includes:
    # - Individual commit entity-by-entity for each of the intermediate rows found.
    #
    describe "#phase_3_commit" do
      it "returns false if the last completed phase is not '12'" do
        # TODO
      end

      context "after successful completion," do
        it "returns true" do
          # TODO
        end
        it "stores the primary entities from the available secondary ones" do
          # TODO
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
end

