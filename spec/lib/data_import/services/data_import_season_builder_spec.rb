require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/services/data_import_season_builder'


describe DataImportSeasonBuilder, type: :service do

  let(:data_import_season)  { create(:data_import_season) }
  let(:data_import_session) { data_import_season.data_import_session }


  describe "self.find_or_create_new()" do
    subject do
      DataImportSeasonBuilder.find_or_create_new( data_import_session ) {}
    end
    it "returns a DataImportSeason instance"
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "#corresponding_season" do
  end
  #-- -------------------------------------------------------------------------
  #++
end
