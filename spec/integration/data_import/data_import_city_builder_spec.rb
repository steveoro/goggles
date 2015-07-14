require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/services/data_import_entity_builder'
require_relative '../../../app/data_import/v2/services/data_import_city_builder'


describe V2::DataImportCityBuilder, type: :integration do

  let(:data_import_session)     { create( :data_import_session ) }
  let(:city)                    { create( :city ) }
  let(:primary_team_name)       { "#{city.name} swimming club ASD" }
  let(:secondary_city)          { create( :data_import_city, data_import_session: data_import_session ) }
  let(:secondary_team_name)     { "#{secondary_city.name} swimming club ASD" }
  let(:non_matching_team_name)  { "#{FFaker::Lorem.word.camelcase}fake#{FFaker::Lorem.word.camelcase} Club ASD" }
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a NON-matching entity row," do
    subject do
      V2::DataImportCityBuilder.build_from_parameters(
        data_import_session,
        non_matching_team_name
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

    it "doesn't create a new primary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.not_to change{ City.count }
    end
    it "doesn't create a new secondary entity row" do
      expect{ subject }.not_to change{ DataImportCity.count }
    end

    describe "#result_row" do
      it "returns nil when the process is completed (#add_new is not called)" do
        expect( subject.result_row ).to be nil
      end
    end
    describe "#result_id" do
      it "returns a zero ID (the searches fail)" do
        expect( subject.result_id ).to eq(0)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching primary entity row," do
    subject do
      V2::DataImportCityBuilder.build_from_parameters(
        data_import_session,
        primary_team_name
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

    it "doesn't create a new primary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ City.count }.by(1)
    end
    it "does not create a new secondary entity row" do
      expect{ subject }.not_to change{ DataImportCity.count }
    end

    describe "#result_row" do
      it "returns a primary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( City )
      end
    end
    describe "#result_id" do
      it "returns a negative ID (the primary search is successful)" do
        expect( subject.result_id ).to be < 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row (with a minus sign)" do
        expect( subject.result_row ).to be_an_instance_of( City )
        expect( subject.result_row.id ).to eq( -(subject.result_id) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching secondary entity row," do
    subject do
      V2::DataImportCityBuilder.build_from_parameters(
        data_import_session,
        secondary_team_name
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

    it "doesn't create a new primary entity row" do
      expect{ subject }.not_to change{ City.count }
    end
    it "does not create a new secondary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ DataImportCity.count }.by(1)
    end

    describe "#result_row" do
      it "returns a primary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportCity )
      end
    end
    describe "#result_id" do
      it "returns a positive ID (the secondary search is successful)" do
        expect( subject.result_id ).to be > 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_row.id ).to eq( subject.result_id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
