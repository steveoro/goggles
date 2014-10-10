require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/data_import_entity_builder'
require_relative '../../../lib/data_import/services/data_import_city_builder'


describe DataImportCityBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }
  let(:city)                  { create(:city) }
  let(:new_team_name)         { "#{city.name} swimming club ASD" }

  # These are cities actually existing in the database:
  # FIXME [Steve, 20141006] For instance, 'Ancona' crashes the formula because it doesn't exist in the database
  let(:known_cities)          { %w( Bologna Prato Parma Correggio Ravenna Brescia Modena Ferrara ) }
  let(:recognized_team_name)  { "#{ known_cities.sort{ rand() - 0.5 }[0] } club ASD" }
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a NON-matching entity row," do
    subject do
      DataImportCityBuilder.build_from_parameters( data_import_session, new_team_name )
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
      expect{ subject }.to change{ DataImportCity.count }.by(1)
    end
    describe "#result_row" do
      it "returns a secondary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportCity )
      end
    end
    describe "#result_id" do
      it "returns a positive ID (the searches fail but the creation is successful)" do
        expect( subject.result_id ).to be > 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row (with a minus sign)" do
        expect( subject.result_row ).to be_an_instance_of( DataImportCity )
        expect( subject.result_row.id ).to eq( subject.result_id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching entity row," do
    subject do
      DataImportCityBuilder.build_from_parameters( data_import_session, recognized_team_name )
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
    # TODO

#    subject do
#      DataImportCityBuilder.build_from_parameters( data_import_session, recognized_team_name )
#    end

    # it "returns a DataImportEntityBuilder instance" do
      # expect( subject ).to be_an_instance_of( DataImportEntityBuilder )
    # end
    # describe "#data_import_session" do
      # it "is the DataImportSession specified for the build" do
        # expect( subject.data_import_session ).to eq( data_import_session )
      # end
    # end
#
    # it "does not create a new secondary entity row" do
      # expect{ subject }.not_to change{ DataImportCity.count }
    # end
    # describe "#result_row" do
      # it "returns a primary entity instance when the process is successful" do
        # expect( subject.result_row ).to be_an_instance_of( City )
      # end
    # end
    # describe "#result_id" do
      # it "returns a negative ID (the primary search is successful)" do
        # expect( subject.result_id ).to be < 0
        # expect( subject.result_row.id ).to be > 0
      # end
      # it "is the ID of the resulting row (with a minus sign)" do
        # expect( subject.result_row ).to be_an_instance_of( City )
        # expect( subject.result_row.id ).to eq( -(subject.result_id) )
      # end
    # end

  end
  #-- -------------------------------------------------------------------------
  #++
end
