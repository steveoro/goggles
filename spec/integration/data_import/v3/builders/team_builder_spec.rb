# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../../app/data_import/v3/builders/entity_builder'
require_relative '../../../../../app/data_import/v3/builders/team_builder'


describe V3::TeamBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }
  let(:team)                  { create( :team ) }
  let(:data_import_team)      { create( :data_import_team, data_import_session: data_import_session ) }
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with NO matching entity rows," do
    subject do
      V3::TeamBuilder.build_from_parameters(
        data_import_session,
        "#{create(:city).name} swimming club ASD",
        create(:season),
        true # force_team_or_swimmer_creation
      )
    end

    it "returns a V3::EntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V3::EntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    it "creates a new secondary entity row" do
      expect{ subject }.to change{ DataImportTeam.count }.by(1)
    end
    # The following is due to the fact that the missing affiliation rows are added
    # only when the primary search is successful:
    it "does not create a missing TeamAffiliation row" do
      expect{ subject }.not_to change{ TeamAffiliation.count }
    end
    it "does not create a primary entity row" do
      expect{ subject }.not_to change{ Team.count }
    end

    describe "#result_row" do
      it "returns a secondary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportTeam )
      end
    end
    describe "#result_id" do
      it "returns a positive ID since the resulting row is a secondary entity" do
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


  context "after a self.build() with a matching primary entity row," do
    subject do
      V3::TeamBuilder.build_from_parameters(
        data_import_session,
        team.name,
        create(:season), # <== This implies a missing TeamAffiliation link
        false # force_team_or_swimmer_creation
      )
    end

    it "returns a V3::EntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V3::EntityBuilder )
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
    it "creates the missing TeamAffiliation row" do
      expect{ subject }.to change{ TeamAffiliation.count }.by(1)
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


  shared_examples_for "(a self.build() with a fuzzy-matching or equal secondary entity row)" do
    it "returns a V3::EntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V3::EntityBuilder )
    end
    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end

    it "does not create a new primary entity row" do
      expect{ subject }.not_to change{ Team.count }
    end
    it "does not create any additional secondary entity row" do
      # 1 is from the calling factory create
      expect{ subject }.to change{ DataImportTeam.count }.by(1)
    end
    # The following is due to the fact that the missing affiliation rows are added
    # only when the primary search is successful:
    it "does not create a missing TeamAffiliation row" do
      expect{ subject }.not_to change{ TeamAffiliation.count }
    end

    describe "#result_row" do
      it "returns a secondary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportTeam )
      end
    end
    describe "#result_id" do
      it "returns a positive ID since the resulting row is a secondary entity" do
        expect( subject.result_id ).to be > 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_row ).to be_an_instance_of( DataImportTeam )
        expect( subject.result_row.id ).to eq( subject.result_id )
      end
    end
  end


  context "after a self.build() with a matching secondary entity row," do
    subject do
      V3::TeamBuilder.build_from_parameters(
        data_import_session,
        data_import_team.name,
        create(:season), # <== This implies a missing TeamAffiliation link
        false # force_team_or_swimmer_creation
      )
    end

    it_behaves_like "(a self.build() with a fuzzy-matching or equal secondary entity row)"
  end


  context "after a self.build() with a fuzzy-matching secondary entity row," do
    subject do
      V3::TeamBuilder.build_from_parameters(
        data_import_session,
        data_import_team.name + " ASD",
        create(:season), # <== This implies a missing TeamAffiliation link
        true # force_team_or_swimmer_creation
      )
    end

    it_behaves_like "(a self.build() with a fuzzy-matching or equal secondary entity row)"
  end
  #-- -------------------------------------------------------------------------
  #++
end
