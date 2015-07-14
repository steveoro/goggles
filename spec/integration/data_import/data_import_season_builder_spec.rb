# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../app/data_import/v2/services/data_import_entity_builder'
require_relative '../../../app/data_import/v2/services/data_import_season_builder'


describe V2::DataImportSeasonBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }
  let(:year)                  { ((rand * 100) % 50).to_i + 1945 }
  let(:month)                 { ((rand * 100) % 12).to_i + 1 }
  let(:day)                   { ((rand * 100) % 28).to_i + 1 }
  let(:not_found_date_text)   { "%04d%02d%02d" % [year, month, day] }
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with NO matching Season row," do
    subject do
      V2::DataImportSeasonBuilder.build_from_parameters(
        data_import_session,
        not_found_date_text,
        1,   # season_type_id
        0,   # edition
        true # force_missing_meeting_creation
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

    it "creates a new secondary entity row" do
      expect{ subject }.to change{ DataImportSeason.count }.by(1)
    end

    describe "#result_row" do
      it "returns a data-import entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportSeason )
      end
    end
    describe "#result_id" do
      it "returns a positive ID when the resulting row is a data-import entity" do
        expect( subject.result_id ).to be > 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_row ).to be_an_instance_of( DataImportSeason )
        expect( subject.result_row.id ).to eq( subject.result_id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching Season row," do
    let(:season) { create(:season) }

    subject do
      V2::DataImportSeasonBuilder.build_from_parameters(
        data_import_session,
        season.begin_date,
        season.season_type,
        season.edition
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

    it "does not create a new secondary entity row" do
      expect{ subject }.not_to change{ DataImportSeason.count }
    end
    # (Primary entity will be changed in size by running the subject, since it has
    #  a factory create in it -- furthermore this version of the builder does not
    #  alter the primary entity, since default entity for creation is just the secondary one.)

    describe "#result_row" do
      it "returns the entity instance found when the primary search is successful" do
        expect( subject.result_row ).to be_an_instance_of( Season )
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
