# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v2/services/data_import_entity_builder'


describe V2::DataImportEntityBuilder, type: :service do

  let(:data_import_session) { create( :data_import_session ) }
  let(:meeting_ids)         { Meeting.all.map{|m| m.id} }
  let(:meeting_rand_id)     { meeting_ids.sort{ rand() - 0.5 }[0] }
  let(:season_ids)          { Season.all.map{|m| m.id} }
  let(:season_rand_id)      { season_ids.sort{ rand() - 0.5 }[0] }

  context "with a valid, empty self.build()," do
    subject do
      V2::DataImportEntityBuilder.build(data_import_session) {}
    end

    it "returns a V2::DataImportEntityBuilder instance" do
      expect( subject ).to be_an_instance_of( V2::DataImportEntityBuilder )
    end

    it_behaves_like( "(the existance of a method)", [
      :set_up, :search, :custom_logic, :if_not_found,
      :result_not_found?, :entity, :secondary_entity,
      :primary_search_ok?, :secondary_search_ok?, :set_result,
      :primary, :secondary, :search_for, :default_search,
      :entity_for_creation, :attributes_for_creation, :add_new
    ] )

    let(:record) { create(:user_training) }
    it_behaves_like( "SqlConverter [param: let(:record)]" )

    describe "#data_import_session" do
      it "is the DataImportSession specified for the build" do
        expect( subject.data_import_session ).to eq( data_import_session )
      end
    end
    describe "#result_row" do
      it "is nil" do
        expect( subject.result_row ).to be nil
      end
    end
    describe "#result_id" do
      it "is nil" do
        expect( subject.result_id ).to be nil
      end
    end
    describe "#result_not_found?" do
      it "is true" do
        expect( subject.result_not_found? ).to be true
      end
    end
    describe "#primary_search_ok?" do
      it "is true" do
        expect( subject.primary_search_ok? ).to be false
      end
    end
    describe "#secondary_search_ok?" do
      it "is true" do
        expect( subject.secondary_search_ok? ).to be false
      end
    end

    describe "#entity" do
      it "sets the primary entity" do
        expect( subject.entity(Meeting) ).to eq( Meeting )
      end
      it "sets also the secondary entity" do
        subject.entity(Meeting)
        expect( subject.secondary_entity ).to eq( DataImportMeeting )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#set_up" do
      it "is a BasicScope instance" do
        expect( subject.set_up {} ).to be_an_instance_of( V2::DataImportEntityBuilder::BasicScope )
      end
    end

    describe "#search" do
      it "is a SearchScope instance" do
        expect( subject.search {} ).to be_an_instance_of( V2::DataImportEntityBuilder::SearchScope )
      end
    end

    describe "#custom_logic" do
      it "is a CustomLogicScope instance" do
        expect( subject.custom_logic {} ).to be_an_instance_of( V2::DataImportEntityBuilder::CustomLogicScope )
      end
    end

    describe "#if_not_found" do
      it "is a IfNotFoundScope instance" do
        expect( subject.if_not_found {} ).to be_an_instance_of( V2::DataImportEntityBuilder::IfNotFoundScope )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#search_for" do
      let(:result) { subject.search_for(Meeting, id: meeting_rand_id) }

      it "returns a negative ID for a primary entity having the specified condition" do
        expect( result ).to eq( -meeting_rand_id )
      end
      it "returns a zero ID for a non-found result" do
        expect( subject.search_for(Meeting, id: -1) ).to eq(0)
      end
      it "returns a positive ID for a secondary entity having the specified condition" do
        expect( subject.search_for(DataImportSession, id: data_import_session.id) ).to eq( data_import_session.id )
      end
      it "sets the #result_id" do
        expect( result ).to eq( subject.result_id )
        expect( subject.search_for(Meeting, id: -1) ).to eq( subject.result_id )
        expect( subject.search_for(DataImportSession, id: data_import_session.id) ).to eq( subject.result_id )
      end
      it "updates #result_not_found?" do
        # Search ok on the primary:
        subject.search_for(Meeting, id: meeting_rand_id)
        expect( subject.result_not_found? ).to be false
        # Search failure:
        subject.search_for(Meeting, id: -1)
        expect( subject.result_not_found? ).to be true
        # Search ok on the secondary:
        subject.search_for(DataImportSession, id: data_import_session.id)
        expect( subject.result_not_found? ).to be false
      end
      it "updates #primary_search_ok? and #secondary_search_ok?" do
        # Search ok on the primary:
        subject.search_for(Meeting, id: meeting_rand_id)
        expect( subject.primary_search_ok? ).to be true
        expect( subject.secondary_search_ok? ).to be false
        # Search failure:
        subject.search_for(Meeting, id: -1)
        expect( subject.primary_search_ok? ).to be false
        expect( subject.secondary_search_ok? ).to be false
        # Search ok on the secondary:
        subject.search_for(DataImportSession, id: data_import_session.id)
        expect( subject.primary_search_ok? ).to be false
        expect( subject.secondary_search_ok? ).to be true
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#set_result" do
      it "clears both #result_row and #result_id when the parameter is nil" do
        subject.set_result(nil)
        expect( subject.result_row ).to be nil
        expect( subject.result_id ).to eq(0)
      end
      it "sets the #result_row to the instance specified as the parameter" do
        # Example with a primary entity:
        season = create(:season)
        subject.set_result( season )
        expect( subject.result_row ).to eq( season )
        # Example with a secondary entity:
        data_import_season = create(:data_import_season)
        subject.set_result( data_import_season )
        expect( subject.result_row ).to eq( data_import_season )
      end
      it "sets the #result_id to the -ID of the parameter if it's a primary entity" do
        season = create(:season)
        subject.set_result( season )
        expect( subject.result_row ).to eq( season )
        expect( subject.result_id ).to eq( -season.id )
      end
      it "sets the #result_id to the +ID of the parameter if it's a secondary entity" do
        data_import_season = create(:data_import_season)
        subject.set_result( data_import_season )
        expect( subject.result_id ).to eq( data_import_season.id )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#default_search" do
      it "searches just on the primary entity when a match can be found" do
        subject.entity(Meeting)
        subject.primary( id: meeting_rand_id )
        expect( subject.result_id ).to be nil # since search has yet to be run
        expect( subject.result_not_found? ).to be true
        expect( subject.primary_search_ok? ).to be false

        subject.default_search
        expect( subject.result_not_found? ).to be false
        expect( subject.result_id ).to eq( -meeting_rand_id )
        expect( subject.primary_search_ok? ).to be true
      end
      it "searches the secondary entity when the search fails on the primary and a secondary condition is set" do
        data_import_season = create( :data_import_season )
        subject.entity(Season)
        subject.primary( id: -1 )
        subject.secondary( id: data_import_season.id )
        expect( subject.result_id ).to be nil # since search has yet to be run
        expect( subject.result_not_found? ).to be true
        expect( subject.secondary_search_ok? ).to be false

        subject.default_search
        expect( subject.result_not_found? ).to be false
        expect( subject.result_id ).to eq( data_import_season.id )
        expect( subject.secondary_search_ok? ).to be true
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#entity_for_creation" do
      it "sets the entity used for the creation process" do
        expect( subject.entity_for_creation(Meeting) ).to eq( Meeting )
      end
      it "overrides the secondary entity, when it is not set yet" do
        subject.entity(Season)
        expect( subject.secondary_entity ).to eq( DataImportSeason )
        subject.entity_for_creation(Meeting)
        expect( subject.secondary_entity ).to eq( Meeting )
      end
    end

    describe "#attributes_for_creation" do
      it "sets the attributes used for the creation process" do
        name    = FFaker::Address.city
        country = FFaker::Address.country
        expect(
          subject.attributes_for_creation( id: 1, name: name, country: country )
        ).to eq( id: 1, name: name, country: country )
      end
    end

    describe "#add_new" do
      it "adds a new row to the specified entity with the specified attributes" do
        attr_data_import_season = attributes_for( :data_import_season )
        subject.entity_for_creation( DataImportSeason )
        subject.attributes_for_creation( attr_data_import_season )
        expect{ subject.add_new }.to change{ DataImportSeason.count }.by(1)
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
