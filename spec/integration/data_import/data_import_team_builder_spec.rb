# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/data_import_entity_builder'
require_relative '../../../lib/data_import/services/data_import_team_builder'


describe DataImportTeamBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with NO matching Team row," do
    subject do
      DataImportTeamBuilder.build_from_parameters(
        data_import_session,
        "#{create(:city).name} swimming club ASD",
        create(:season),
        true # force_missing_team_creation
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

    it "creates a new secondary entity row" do
      expect{ subject }.to change{ DataImportTeam.count }.by(1)
    end

    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportTeam )
      end
    end
    describe "#result_id" do
      it "returns a positive ID when the resulting row is a data-import entity" do
        expect( subject.result_id ).to be > 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_row ).to be_an_instance_of( DataImportTeam )
        expect( subject.result_row.id ).to eq( subject.result_id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching Team row," do
    let(:team)   { create(:team) }
    subject do
      DataImportTeamBuilder.build_from_parameters(
        data_import_session,
        team.name,
        create(:season), # <== This'd yield to the creation of the missing TeamAffiliation for this new season
        false # force_missing_team_creation
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

    it "does not create any additional primary entity row" do
      # 1 is from the calling factory create
      expect{ subject }.to change{ Team.count }.by(1)
    end
    it "does not create a new secondary entity row" do
      expect{ subject }.not_to change{ DataImportTeam.count }
    end

    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( Team )
      end
    end
    describe "#result_id" do
      it "returns a negative ID when the primary search is successful" do
        expect( subject.result_id ).to be < 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row, with a minus sign" do
        expect( subject.result_row ).to be_an_instance_of( Team )
        expect( subject.result_row.id ).to eq( -(subject.result_id) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
