# encoding: utf-8

require 'rails_helper'
require 'common/format'


describe MedalsDAO, type: :model do

  let(:is_a_relay)   { [0..1].sample }
  let(:season_code)  { SeasonType.all.sample.code }
  let(:pool_code)    { PoolType.all.sample.code }
  let(:event_code)   { EventType.all.sample.code }
  let(:medal_code)   { MedalType.all.sample.code }
  let(:medal_number) { (rand * 5).to_i + 1 }

  let(:season_wrong) { 'MASFUCK' }
  let(:pool_wrong)   { '42' }
  let(:event_wrong)  { '215CA' }

  context "MedalsDAO module," do

    subject { MedalsDAO.new() }

    describe "#medals" do
      it "returns an hash" do
        expect( subject.medals ).to be_a_kind_of( Hash )
      end
      it "contains the :individuals key which is a MedalsGroupDAO" do
        expect( subject.medals.has_key?(:individuals) ).to eq( true )
        expect( subject.medals[:individuals] ).to be_an_instance_of( MedalsDAO::MedalsGroupDAO )
      end
      it "contains the ::relays key which is a MedalsGroupDAO" do
        expect( subject.medals.has_key?(:relays) ).to eq( true )
        expect( subject.medals[:relays] ).to be_an_instance_of( MedalsDAO::MedalsGroupDAO )
      end
    end

    describe "#summary" do
      it "is an instance of MedalsCollectorDAO" do
        expect( subject.summary ).to be_an_instance_of( MedalsDAO::MedalsCollectorDAO )
      end
    end

    describe "#get_individuals" do
      it "returns a MedalsGroupDAO" do
        expect( subject.get_individuals ).to be_an_instance_of( MedalsDAO::MedalsGroupDAO )
      end
      it "returns the same object as summary" do
        expect( subject.get_individuals ).to eq( subject.medals[:individuals] )
      end
    end

    describe "#get_relays" do
      it "returns a MedalsGroupDAO" do
        expect( subject.get_relays ).to be_an_instance_of( MedalsDAO::MedalsGroupDAO )
      end
      it "returns the same object as summary" do
        expect( subject.get_relays ).to eq( subject.medals[:relays] )
      end
    end

    describe "#get_medals" do
      it "returns a number" do
        expect( subject.get_medals( is_a_relay, season_code, pool_code, event_code, medal_code ) ).to be >= 0
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  context "MedalsGroupDAO sub-module," do

    subject { MedalsDAO::MedalsGroupDAO.new() }

    describe "#detail" do
      it "returns an hash" do
        expect( subject.detail ).to be_a_kind_of( Hash )
      end
    end

    describe "#summary" do
      it "is an instance of MedalsCollectorDAO" do
        expect( subject.summary ).to be_an_instance_of( MedalsDAO::MedalsCollectorDAO )
      end
    end

    describe "#exists_season?" do
      it "returns false if no data stored" do
        expect( subject.exists_season?( season_code )).to eq( false )
      end
      it "returns true if at least one medals count stored" do
        subject.set_medals( season_code, pool_code, event_code, medal_code, medal_number )
        expect( subject.exists_season?( season_code )).to eq( true )
      end
      it "returns false if at least one medals count stored but for different season" do
        subject.set_medals( season_code, pool_code, event_code, medal_code, medal_number )
        expect( subject.exists_season?( season_wrong )).to eq( false )
      end
    end

    describe "#exists_pool?" do
      it "returns false if no data stored" do
        expect( subject.exists_pool?( season_code, pool_code )).to eq( false )
      end
      it "returns true if at least one medals count stored" do
        subject.set_medals( season_code, pool_code, event_code, medal_code, medal_number )
        expect( subject.exists_pool?( season_code, pool_code )).to eq( true )
      end
      it "returns false if at least one medals count stored but for different pool" do
        subject.set_medals( season_code, pool_code, event_code, medal_code, medal_number )
        expect( subject.exists_pool?( season_code, pool_wrong )).to eq( false )
      end
    end

    describe "#exists_event?" do
      it "returns false if no data stored" do
        expect( subject.exists_event?( season_code, pool_code, event_code )).to eq( false )
      end
      it "returns true if at least one medals count stored" do
        subject.set_medals( season_code, pool_code, event_code, medal_code, medal_number )
        expect( subject.exists_event?( season_code, pool_code, event_code )).to eq( true )
      end
      it "returns false if at least one medals count stored but for different event" do
        subject.set_medals( season_code, pool_code, event_code, medal_code, medal_number )
        expect( subject.exists_event?( season_code, pool_code, event_wrong )).to eq( false )
      end
    end

    describe "#set_medals" do
      it "returns the medal number passed as parameter" do
        expect( subject.set_medals( season_code, pool_code, event_code, medal_code, medal_number ) ).to eq( medal_number )
      end
      it "creates a key for each level (parameter)" do
        expect( subject.detail.has_key?(season_code) ).to eq( false )
        subject.set_medals( season_code, pool_code, event_code, medal_code, medal_number )
        expect( subject.detail.has_key?(season_code) ).to eq( true )
        expect( subject.detail[season_code].has_key?(pool_code) ).to eq( true )

      end
    end

    describe "#get_medals" do
      it "returns a number" do
        expect( subject.get_medals( season_code, pool_code, event_code, medal_code ) ).to be >= 0
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
