require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/services/data_import_season_builder'


describe DataImportSeasonBuilder, type: :service do

  let(:data_import_season)  { create(:data_import_season) }
  let(:data_import_session) { data_import_season.data_import_session }


  describe "self.find_or_create_new()" do
#    subject do
#      DataImportSeasonBuilder.find_or_create_new( data_import_session ) {}
#    end

    xit "returns a DataImportSeasonBuilder instance" do
      result = DataImportSeasonBuilder.find_or_create_new( data_import_session ) {}
      expect( result ).to be_an_instance_of( DataImportSeasonBuilder )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # TODO rename the result getter in a more generic way
  # TODO implement the same class for meetings and then refactor both stuff

  describe "#data_import_session" do
    it "returns the DataImportSession stored with the constructor"
  end


  describe "#data_import_season" do
    it "returns nil whe no match has been performed yet"
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#corresponding_season" do
    context "when matching a row already existing in the primary entity," do
      it "returns a negative ID"
      it "updates the result getter with the resulting row"
    end

    context "when matching a row already existing in the data-import entity," do
      it "returns a positive ID"
      it "updates the result getter with the resulting row"
    end

    context "when matching a non-existing row," do
      it "adds another row to the data-import table"
      it "returns a positive ID"
      it "updates the result getter with the resulting row"
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
