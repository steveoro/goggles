require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/strategies/data_importer'


describe DataImporter, type: :strategy do
  let(:existing_data_import_session) { create(:data_import_session) }

  context "for a new empty instance," do
    subject { DataImporter.new( nil, nil, existing_data_import_session ) }

    # it_behaves_like( "(the existance of a class method)", [
      # :create_new_data_import_session,
      # :destroy_data_import_session
    # ] )

    it_behaves_like( "(the existance of a method)", [
      :set_up, :destroy_data_import_session,
      :perform,

      :to_logfile,
      :try_detect_season_from_file_path,
      :try_detect_season_from_header_fields,
      :phase_1_parse,
      :phase_1_parse
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
    end


    describe "#set_up" do
      [
        :full_pathname, :season, :current_admin_id,
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


    describe "#to_logfile" do
      # TODO
    end


    describe "#try_detect_season_from_file_path" do
      # TODO
    end


    describe "#try_detect_season_from_header_fields" do
      # TODO
    end
    #-- -----------------------------------------------------------------------
    #++


    # Internal Parse & text digest phase.
    # This includes:
    # - TXT file read & parsing to obtain a result hash;
    # - Creation of the data-import session object.
    #
    describe "#phase_1_parse" do
      # TODO
    end


    # Internal Parse-results serialization phase.
    # This includes:
    # - Single row-by-row processing of the headers & details result hash (from phase-1)
    # - Creation of intermediate "secondary" entity rows for each parsed object,
    #   to a allow manual review before the final phase-3 commit.
    #
    describe "#phase_1_2_serialize" do
      # TODO
    end


    # Internal Commit phase.
    # This includes:
    # - Individual commit entity-by-entity for each of the intermediate rows found.
    #
    describe "#phase_3_commit" do
      # TODO
    end
    #-- -----------------------------------------------------------------------
    #++


    # Hi-level data-import "begin" command.
    describe "#start" do
      # TODO
    end


    # Hi-level data-import "end" command.
    describe "#commit" do
      # TODO
    end
    #-- -----------------------------------------------------------------------
    #++
  end
end

