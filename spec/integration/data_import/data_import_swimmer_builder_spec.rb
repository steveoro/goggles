require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/data_import_entity_builder'
require_relative '../../../lib/data_import/services/data_import_swimmer_builder'


describe DataImportSwimmerBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Existing or matching fixture params:
  let(:swimmer)               { create( :swimmer ) }
  let(:data_import_swimmer)   { create( :data_import_swimmer, data_import_session: data_import_session ) }

  # Non-existing (totally random) fixture params:
  let(:swimmer_name)          { "#{Faker::Name.first_name} {Faker::Name.last_name}" }
  let(:swimmer_year)          { 18.year.ago.year - ((rand * 100) % 60).to_i }
  let(:gender_type)           { GenderType.where( code: ['M','F']).sort{ rand - 0.5 }[0] }
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with invalid parameters," do
    subject do
      DataImportSwimmerBuilder.build_from_parameters(
        data_import_session,
        nil,
        swimmer_year,
        gender_type
      )
    end

    it "returns nil" do
      expect( subject ).to be nil
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a NON-matching entity row," do
    subject do
      DataImportSwimmerBuilder.build_from_parameters(
        data_import_session,
        swimmer_name,
        swimmer_year,
        gender_type
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
      expect{ subject }.to change{ DataImportSwimmer.count }.by(1)
    end
    it "does not create a new primary entity row" do
      expect{ subject }.not_to change{ Swimmer.count }
    end

    describe "#result_row" do
      it "returns a secondary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportSwimmer )
      end
    end
    describe "#result_id" do
      it "returns a positive ID (the searches fail but the creation is successful)" do
        expect( subject.result_id ).to be > 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row (with a minus sign)" do
        expect( subject.result_row ).to be_an_instance_of( DataImportSwimmer )
        expect( subject.result_row.id ).to eq( subject.result_id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching primary entity row," do
    subject do
      DataImportSwimmerBuilder.build_from_parameters(
        data_import_session,
        swimmer.complete_name,
        swimmer.year_of_birth,
        swimmer.gender_type
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

    it "does not create a new secondary entity row" do
      expect{ subject }.not_to change{ DataImportSwimmer.count }
    end
    it "does not create any additional primary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ Swimmer.count }.by(1)
    end

    describe "#result_row" do
      it "returns a primary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( Swimmer )
      end
    end
    describe "#result_id" do
      it "returns a negative ID (the primary search is successful)" do
        expect( subject.result_id ).to be < 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row (with a minus sign)" do
        expect( subject.result_row ).to be_an_instance_of( Swimmer )
        expect( subject.result_row.id ).to eq( -(subject.result_id) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching secondary entity row," do
    subject do
      DataImportSwimmerBuilder.build_from_parameters(
        data_import_session,
        data_import_swimmer.complete_name,
        data_import_swimmer.year_of_birth,
        data_import_swimmer.gender_type
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

    it "does not create a new primary entity row" do
      expect{ subject }.not_to change{ Swimmer.count }
    end
    it "does not create any additional secondary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ DataImportSwimmer.count }.by(1)
    end

    describe "#result_row" do
      it "returns a secondary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportSwimmer )
      end
    end
    describe "#result_id" do
      it "returns a positive ID (the secondary search is successful)" do
        expect( subject.result_id ).to be > 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_row ).to be_an_instance_of( DataImportSwimmer )
        expect( subject.result_row.id ).to eq( subject.result_id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
