# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/services/data_import_entity_builder'
require_relative '../../../app/data_import/v2/services/data_import_time_standard_builder'


describe V2::DataImportTimeStandardBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with NO matching TimeStandard row," do
    subject do
      ts = build( :time_standard )                  # Build (without saving) a totally fake time standard
      V2::DataImportTimeStandardBuilder.build_from_parameters(
        data_import_session,
        create(:season),
        ts.event_type_id,
        ts.category_type_id,
        ts.gender_type_id,
        ts.pool_type_id,
        ts.minutes,
        ts.seconds,
        ts.hundreds
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
      expect{ subject }.to change{ TimeStandard.count }.by(1)
    end

    describe "#result_row" do
      it "returns the newly created entity instance" do
        expect( subject.result_row ).to be_an_instance_of( TimeStandard )
      end
    end
    describe "#result_id" do
      it "returns a positive ID" do
        expect( subject.result_id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_id ).to eq( subject.result_row.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with a matching TimeStandard row," do
    subject do
      ts = create( :time_standard )
      # Alternatively, we can randomize this with existing rows from seeded TimeStandard:
#      ts = TimeStandard.all.sort{ rand() - 0.5 }[0]
      V2::DataImportTimeStandardBuilder.build_from_parameters(
        data_import_session,
        ts.season,
        ts.event_type_id,
        ts.category_type_id,
        ts.gender_type_id,
        ts.pool_type_id,
        ts.minutes,
        ts.seconds,
        ts.hundreds
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

    it "does not create any additional primary entity rows" do
      # 1 is from the calling factory create
      expect{ subject }.to change{ TimeStandard.count }.by(1)
    end

    describe "#result_row" do
      it "returns the entity instance found when the primary search is successful" do
        expect( subject.result_row ).to be_an_instance_of( TimeStandard )
      end
    end
    describe "#result_id" do
      it "returns a negative ID when the primary search is successful" do
        expect( subject.result_id ).to be < 0
      end
      it "is the ID of the resulting row, with a minus sign" do
        expect( subject.result_id ).to eq( -(subject.result_row.id) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
