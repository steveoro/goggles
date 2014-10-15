require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../lib/data_import/services/data_import_entity_builder'
require_relative '../../../lib/data_import/services/data_import_badge_builder'


describe DataImportBadgeBuilder, type: :integration do

  let(:data_import_session)   { create( :data_import_session ) }

  # Existing or matching fixture params:
  let(:badge)                 { create( :badge, season: data_import_session.season ) }
  let(:data_import_badge) do
    create(
      :data_import_badge,
      data_import_session: data_import_session,
      season:              data_import_session.season
    )
  end

  # Non-existing (totally random) fixture params:
  let(:team)                  { create( :team ) }
  let(:swimmer)               { create( :swimmer ) }
  let(:category_type) do
    create(
      :category_type,
      season: data_import_session.season
    )
  end
  let(:entry_time_type)       { EntryTimeType.all.sort{ rand - 0.5 }[0] }

  let(:badge_code)            { 8.times.map{ (rand * 10).to_i }.join }
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with invalid parameters," do
    subject do
      DataImportBadgeBuilder.build_from_parameters(
        data_import_session,
        nil,
        data_import_session.season,
        team,
        swimmer,
        category_type,
        entry_time_type
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
      DataImportBadgeBuilder.build_from_parameters(
        data_import_session,
        badge_code,
        data_import_session.season,
        team,
        swimmer,
        category_type,
        entry_time_type
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
      expect{ subject }.to change{ DataImportBadge.count }.by(1)
    end
    it "does not create a new primary entity row" do
      expect{ subject }.not_to change{ Badge.count }
    end

    describe "#result_row" do
      it "returns a secondary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportBadge )
      end
    end
    describe "#result_id" do
      it "returns a positive ID (the searches fail but the creation is successful)" do
        expect( subject.result_id ).to be > 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row (with a minus sign)" do
        expect( subject.result_row ).to be_an_instance_of( DataImportBadge )
        expect( subject.result_row.id ).to eq( subject.result_id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching primary entity row," do
    subject do
      DataImportBadgeBuilder.build_from_parameters(
        data_import_session,
        badge.number,
        badge.season,
        badge.team,
        badge.swimmer,
        badge.category_type,
        badge.entry_time_type
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
      expect{ subject }.not_to change{ DataImportBadge.count }
    end
    it "does not create any additional primary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ Badge.count }.by(1)
    end

    describe "#result_row" do
      it "returns a primary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( Badge )
      end
    end
    describe "#result_id" do
      it "returns a negative ID (the primary search is successful)" do
        expect( subject.result_id ).to be < 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row (with a minus sign)" do
        expect( subject.result_row ).to be_an_instance_of( Badge )
        expect( subject.result_row.id ).to eq( -(subject.result_id) )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "after a self.build() with a matching secondary entity row," do
    subject do
# DEBUG
#      puts "\r\n#{data_import_badge.inspect}"
      DataImportBadgeBuilder.build_from_parameters(
        data_import_session,
        data_import_badge.number,
        data_import_badge.season,
        data_import_badge.team,
        data_import_badge.swimmer,
        data_import_badge.category_type,
        data_import_badge.entry_time_type
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
      expect{ subject }.not_to change{ Badge.count }
    end
    it "does not create any additional secondary entity row" do
      # (+1 only from the factory creation in the subject)
      expect{ subject }.to change{ DataImportBadge.count }.by(1)
    end

    describe "#result_row" do
      it "returns a secondary entity instance when the process is successful" do
        expect( subject.result_row ).to be_an_instance_of( DataImportBadge )
      end
    end
    describe "#result_id" do
      it "returns a positive ID (the secondary search is successful)" do
        expect( subject.result_id ).to be > 0
        expect( subject.result_row.id ).to be > 0
      end
      it "is the ID of the resulting row" do
        expect( subject.result_row ).to be_an_instance_of( DataImportBadge )
        expect( subject.result_row.id ).to eq( subject.result_id )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
