require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/strategies/data_importer'


describe DataImporter, type: :strategy do

  context "for a new empty instance," do
    subject { DataImporter.new( nil, nil, 1 ) }

    it_behaves_like( "(the existance of a class method)", [
      :create_new_data_import_session,
      :destroy_data_import_session
    ] )

    it_behaves_like( "(the existance of a method)", [
      :to_logfile, :consume_txt_file
    ] )


    describe "#to_logfile" do
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
    describe "#phase_2_serialize" do
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

