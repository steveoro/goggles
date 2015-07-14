# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/services/data_import_entity_builder'
require_relative '../../../app/data_import/v2/services/data_import_team_affiliation_builder'


describe V2::DataImportTeamAffiliationBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Non-existing (totally random) fixture params:
  let(:season)                { create( :season ) }
  let(:team)                  { create( :team ) }

  # Existing or matching fixture params:
  let(:team_affiliation)      { create( :team_affiliation ) }
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with NO matching TeamAffiliation (but existing Team and Season)," do
    subject do
      V2::DataImportTeamAffiliationBuilder.build_from_parameters(
        data_import_session,
        team,
        season
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

    it "creates a new primary entity row" do
      expect{ subject }.to change{ TeamAffiliation.count }.by(1)
    end
    describe "#result_row" do
      it "returns a primary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( TeamAffiliation )
      end
    end
    describe "#result_id" do
      it "returns a positive ID when since the resulting row is was created" do
        expect( subject.result_id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_id ).to eq( subject.result_row.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching TeamAffiliation row," do
    subject do
      V2::DataImportTeamAffiliationBuilder.build_from_parameters(
        data_import_session,
        team_affiliation.team,
        team_affiliation.season
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

    it "does not create any additional primary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ TeamAffiliation.count }.by(1)
    end
    it "does not create any additional MeetingSession row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ TeamAffiliation.count }.by(1)
    end

    describe "#result_row" do
      it "returns the entity instance found when the primary search is successful" do
        expect( subject.result_row ).to be_an_instance_of( TeamAffiliation )
      end
    end
    describe "#result_id" do
      it "returns a negative ID when the primary search is successful" do
        expect( subject.result_id ).to be < 0
      end
      it "is the ID of the resulting row, with a minus sign" do
        expect( subject.result_id ).to eq( -(subject.result_row.id) )
      end
      it "is the ID of the expected fixture row, with a minus sign" do
        expect( subject.result_id ).to eq( -(team_affiliation.id) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with a DataImportTeam and a valid Season)," do
    subject do
      V2::DataImportTeamAffiliationBuilder.build_from_parameters(
        data_import_session,
        create( :data_import_team ),
        season
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
    it "does not create a new primary entity row" do
      expect{ subject }.not_to change{ TeamAffiliation.count }
    end
    describe "#result_row" do
      it "returns nil" do
        expect( subject.result_row ).to be nil
      end
    end
    describe "#result_id" do
      it "returns zero" do
        expect( subject.result_id ).to eq(0)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
