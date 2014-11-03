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
        :current_admin_id,
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
      context "when specifying a :full_pathname," do
        it "stores the value in the corresponding :full_pathname member" do
          file_name = "#{Faker::Lorem.word.downcase}.txt"
          subject.set_up( full_pathname: file_name )
          expect( subject.full_pathname ).to eq( file_name )
        end
        it "updates the field in the associated session" do
          file_name = "#{Faker::Lorem.word.downcase}.txt"
          subject.set_up( full_pathname: file_name )
          expect( subject.data_import_session.file_name ).to eq( file_name )
        end
      end
      context "when specifying a :season," do
        it "stores the value in the corresponding :season member" do
          season = build( :season )
          subject.set_up( season: season )
          expect( subject.season ).to eq( season )
        end
        it "updates the field in the associated session" do
          season = build( :season )
          subject.set_up( season: season )
          expect( subject.data_import_session.season_id ).to eq( season.id )
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
      # We need to parse the fixture file just once to speed-up tests.
      # Let's create a shared "subject" instance variable with a session
      # associated:
      before( :all ) do
        file_name = File.join(Rails.root, 'test/fixtures/samples/ris20131110bologna-sample.txt')
        @phase_1_session = create(
          :data_import_session,
          file_name: file_name,
          season: Season.find_by_id( 132 )
        )
        @phase_1_subject = DataImporter.new( nil, nil, @phase_1_session )
        @phase_1_subject.set_up(
          force_missing_meeting_creation: false,
          force_missing_team_creation: false,
          do_not_consume_file: true                 # THIS IS MANDATORY! (Otherwise the sample file will be destroyed by the tests)
        )
        @result = @phase_1_subject.phase_1_parse
      end

      # After everything has been tested in this context, clean up the
      # session and its internal reference in the subject:
      after(:all) do
        @phase_1_session = nil
        @phase_1_subject.destroy_data_import_session
      end

      context "after a successful completion," do
        it "returns the current (updated) #data_import_session" do
          expect( @result ).to be_an_instance_of( DataImportSession )
          expect( @result.id ).to eq( @phase_1_session.id )
        end
        it "sets the session #phase to '10'" do
          expect( @result.phase ).to eq(10)
        end

        describe "#result_hash member" do
          it "is an Hash" do
            expect( @phase_1_subject.result_hash ).to be_an_instance_of( Hash )
          end
          it "has the :parse_result, :line_count, :total_data_rows & :full_text_file_contents keys" do
            expect( @phase_1_subject.result_hash.keys ).to contain_exactly(
              :parse_result, :line_count, :total_data_rows, :full_text_file_contents
            )
          end

          # [Steve, 201410128] The following numbers have all been hand-verified
          it "has 1 [:parse_result][:meeting_header] item" do
            expect( @phase_1_subject.result_hash[:parse_result][:meeting_header].size ).to eq( 1 )
          end

          it "has 36 [:parse_result][:category_header] items" do
            expect( @phase_1_subject.result_hash[:parse_result][:category_header].size ).to eq( 36 )
          end
          it "has 222 [:parse_result][:result_row] items" do
            expect( @phase_1_subject.result_hash[:parse_result][:result_row].size ).to eq( 222 )
          end

          it "has 5 [:parse_result][:relay_header] items" do
            expect( @phase_1_subject.result_hash[:parse_result][:relay_header].size ).to eq( 5 )
          end
          it "has 18 [:parse_result][:relay_row] items" do
            expect( @phase_1_subject.result_hash[:parse_result][:relay_row].size ).to eq( 18 )
          end

          it "has 1 [:parse_result][:team_ranking] item" do
            expect( @phase_1_subject.result_hash[:parse_result][:team_ranking].size ).to eq( 1 )
          end
          it "has 45 [:parse_result][:ranking_row] items" do
            expect( @phase_1_subject.result_hash[:parse_result][:ranking_row].size ).to eq( 45 )
          end

          it "has 1 [:parse_result][:stats] item" do
            expect( @phase_1_subject.result_hash[:parse_result][:stats].size ).to eq( 1 )
          end
          # (The following single detail item has all the 8 recognized fields in it)
          it "has 1 [:parse_result][:stats_details] item" do
            expect( @phase_1_subject.result_hash[:parse_result][:stats_details].size ).to eq( 1 )
          end
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
      context "when invoked not in the right sequence" do
        before( :all ) do
          file_name = File.join(Rails.root, 'test/fixtures/samples/ris20131110bologna-sample.txt')
          @phase_1_session = create(
            :data_import_session,
            file_name: file_name,
            season: Season.find_by_id( 132 )
          )
          @phase_1_subject = DataImporter.new( nil, nil, @phase_1_session )
          @phase_1_subject.set_up(
            force_missing_meeting_creation: false,
            force_missing_team_creation: false,
            do_not_consume_file: true               # THIS IS MANDATORY! (Otherwise the sample file will be destroyed by the tests)
          )
        end

        after(:all) do
          @phase_1_session = nil
          @phase_1_subject.destroy_data_import_session
        end

        it "returns nil if the last completed phase is not '10'" do
          expect( @phase_1_subject.phase_1_2_serialize ).to be nil
        end
      end
      #-- ---------------------------------------------------------------------
      #++

      context "after a successful completion, w/ force meeting & team creation DISABLED," do
        before( :all ) do
          file_name = File.join(Rails.root, 'test/fixtures/samples/ris20131110bologna-sample.txt')
          @phase_1_session = create(
            :data_import_session,
            file_name: file_name,
            season: Season.find_by_id( 132 )
          )
          @phase_1_subject = DataImporter.new( nil, nil, @phase_1_session )
          @phase_1_subject.set_up(
            force_missing_meeting_creation: false,
            force_missing_team_creation: false,
            do_not_consume_file: true               # THIS IS MANDATORY! (Otherwise the sample file will be destroyed by the tests)
          )
          @analysis_before_count = DataImportTeamAnalysisResult.where( data_import_session_id: @phase_1_session.id ).count
          @phase_1_subject.phase_1_parse
          expect( @phase_1_subject.data_import_session.phase ).to eq(10)
          @result = @phase_1_subject.phase_1_2_serialize
        end

        after(:all) do
          @phase_1_session = nil
          @phase_1_subject.destroy_data_import_session
        end

# FIXME IT FAILS:
        xit "returns the current (updated) #data_import_session" do
          expect( @result ).to be_an_instance_of( DataImportSession )
          expect( @result.id ).to eq( @phase_1_session.id )
        end

        it "has team analysis results" do
          expect( @phase_1_subject.has_team_analysis_results ).to be true
        end
        it "has the session #phase still set to '10' since the Team Analysis phase is required" do
          expect( @phase_1_subject.data_import_session.phase ).to eq(10)
        end
        it "stores the temporary results of the team analysis, waiting for confirmation" do
          current_analysis_count = DataImportTeamAnalysisResult.where( data_import_session_id: @phase_1_session.id ).count
          # [20141028] Currently there should be "only" 41 (of a total of 45) unknown
          # Team names in the test DB but. since this is bound to change in the future,
          # we can only safely assume that the analysis count will be absolutely
          # lesser than 45 and greater than 0.
          #
          # (If, in the future, all teams for this result file will be inserted and
          # added to the DB seeds used for the tests, several of these examples may
          # fail, since the assumption is that a phase-1.1 is needed anyway.)
          expect( current_analysis_count ).to be > @analysis_before_count
          expect( current_analysis_count - @analysis_before_count ).to be < 45
        end
      end
      #-- ---------------------------------------------------------------------
      #++

      context "after successful completion, w/ FORCE meeting & team creation ENABLED," do
        before(:all) do
          file_name = File.join(Rails.root, 'test/fixtures/samples/ris20131110bologna-sample.txt')
          @phase_1_session = create(
            :data_import_session,
            file_name: file_name,
            season: Season.find_by_id( 132 )
          )
          @phase_1_subject = DataImporter.new( nil, nil, @phase_1_session )
          @phase_1_subject.set_up(
            force_missing_meeting_creation: true,
            force_missing_team_creation: true,
            do_not_consume_file: true               # THIS IS MANDATORY! (Otherwise the sample file will be destroyed by the tests)
          )
          @phase_1_subject.phase_1_parse
          expect( @phase_1_subject.data_import_session.phase ).to eq(10)
          @di_team_before_count     = DataImportTeam.where( data_import_session_id: @phase_1_session.id ).count
          @di_swimmer_before_count  = DataImportSwimmer.where( data_import_session_id: @phase_1_session.id ).count
          @di_mir_before_count      = DataImportMeetingIndividualResult.where( data_import_session_id: @phase_1_session.id ).count
          @di_mrr_before_count      = DataImportMeetingRelayResult.where( data_import_session_id: @phase_1_session.id ).count
          @di_score_before_count    = DataImportMeetingTeamScore.where( data_import_session_id: @phase_1_session.id ).count
          @result = @phase_1_subject.phase_1_2_serialize
        end

        after(:all) do
          @phase_1_session = nil
          @phase_1_subject.destroy_data_import_session
        end

        it "returns the current (updated) #data_import_session" do
          expect( @result ).to be_an_instance_of( DataImportSession )
          expect( @result.id ).to eq( @phase_1_session.id )
        end
        it "has team analysis results" do
          expect( @phase_1_subject.has_team_analysis_results ).to be false
        end
        it "has the session #phase set to '12'" do
          expect( @phase_1_subject.data_import_session.phase ).to eq(12)
        end

        # (For sake of speed in execution, we'll just check that some of the main table sizes do increase)
        it "stores the DataImportTeam parsed rows" do
          expect(
            DataImportTeam.where( data_import_session_id: @phase_1_session.id ).count
          ).to be > @di_team_before_count
        end
        it "stores the DataImportSwimmer parsed rows" do
          expect(
            DataImportSwimmer.where( data_import_session_id: @phase_1_session.id ).count
          ).to be > @di_swimmer_before_count
        end
        it "stores the DataImportMeetingIndividualResult parsed rows" do
          expect(
            DataImportMeetingIndividualResult.where( data_import_session_id: @phase_1_session.id ).count
          ).to be > @di_mir_before_count
        end
        it "stores the DataImportMeetingRelayResult parsed rows" do
          expect(
            DataImportMeetingRelayResult.where( data_import_session_id: @phase_1_session.id ).count
          ).to be > @di_mrr_before_count
        end
        it "stores the DataImportMeetingTeamScore parsed rows" do
          expect(
            DataImportMeetingTeamScore.where( data_import_session_id: @phase_1_session.id ).count
          ).to be > @di_score_before_count
        end
      end
      #-- ---------------------------------------------------------------------
      #++
    end
    #-- -----------------------------------------------------------------------
    #++


    # Internal Commit phase.
    # This includes:
    # - Individual commit entity-by-entity for each of the intermediate rows found.
    #
    describe "#phase_3_commit" do
      context "when invoked not in the right sequence" do
        before( :all ) do
          file_name = File.join(Rails.root, 'test/fixtures/samples/ris20131110bologna-sample.txt')
          @phase_1_session = create(
            :data_import_session,
            file_name: file_name,
            season: Season.find_by_id( 132 )
          )
          @phase_1_subject = DataImporter.new( nil, nil, @phase_1_session )
          @phase_1_subject.set_up(
            force_missing_meeting_creation: false,
            force_missing_team_creation: false,
            do_not_consume_file: true               # THIS IS MANDATORY! (Otherwise the sample file will be destroyed by the tests)
          )
        end

        after(:all) do
          @phase_1_session = nil
          @phase_1_subject.destroy_data_import_session
        end

        it "returns false if the last completed phase is not '12'" do
          expect( @phase_1_subject.phase_3_commit ).to be false
        end
      end

      # [Steve, 20141028] We cannot fully test a successful, completed phase-3 here,
      # because it will cause all previous examples for phases 1 & 2 to subsequently
      # fail. (Persisting the temporary/secondary data-import entities into the
      # primary tables will alter the outcome of the searches in the previous phases.)
      #
      # => We'll use dedicated integration tests instead, with transactional
      #    storage of the resulting rows.
    end
    #-- -----------------------------------------------------------------------
    #++
  end
end