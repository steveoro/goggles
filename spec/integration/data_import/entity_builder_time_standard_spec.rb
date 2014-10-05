require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
# require_relative '../../../lib/data_import/services/data_import_entity_builder'


describe "DataImportEntityBuilder for TimeStandard,", type: :integration do

  let(:data_import_session) { create( :data_import_session ) }

  # # Prepares the result subject for the specs.
  def time_standard_build_process( season_id, event_type_id, category_type_id,
                                   gender_type_id, pool_type_id, mins, secs, hds )
    DataImportEntityBuilder.build( data_import_session ) do
      entity              TimeStandard
                                                  # Search condition:
      search do
        primary(
          event_type_id:    event_type_id,
          category_type_id: category_type_id,
          gender_type_id:   gender_type_id,
          pool_type_id:     pool_type_id,
          minutes:          mins,
          seconds:          secs,
          hundreds:         hds
        )
        default_search
      end

      # This will override what is the default secondary entity ('DataImportTimeStandard', which does not exist):
      entity_for_creation TimeStandard

      attributes_for_creation(
        season_id:        season_id,
        event_type_id:    event_type_id,
        category_type_id: category_type_id,
        gender_type_id:   gender_type_id,
        pool_type_id:     pool_type_id,
        minutes:          mins,
        seconds:          secs,
        hundreds:         hds
      )

      if_not_found        { add_new }
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "after a self.build() with a matching TimeStandard row," do
    subject do
      # Randomize this with existing rows from seeded TimeStandard:
      ts = TimeStandard.find( (rand * (TimeStandard.count-1)).to_i + 1 )
      time_standard_build_process(
        ts.season_id,
        ts.event_type_id,
        ts.category_type_id,
        ts.gender_type_id,
        ts.pool_type_id,
        ts.minutes,
        ts.seconds,
        ts.hundreds
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

  context "after a self.build() without any matching TimeStandard row," do
    subject do
      ts = build( :time_standard )                  # Build (without saving) a totally fake time standard
      time_standard_build_process(
        1, # season_id
        ts.event_type_id,
        ts.category_type_id,
        ts.gender_type_id,
        ts.pool_type_id,
        ts.minutes,
        ts.seconds,
        ts.hundreds
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
    describe "#result_row" do
      it "returns the newly created entity instance" do
        expect( subject.result_row ).to be_an_instance_of( TimeStandard )
      end
    end
    describe "#result_id" do
      it "returns an always positive ID" do
        expect( subject.result_id ).to be > 0
      end
      it "is the ID of the resulting row (always positive)" do
        expect( subject.result_id ).to eq( subject.result_row.id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
