require 'rails_helper'


describe TeamStats, type: :strategy do

  let(:team)         { Team.first(300).sample }
  let(:ober)         { Team.find(1) }

  # Leega stats (minimum values at 13/10/2019)
  let(:ober_federations) { 5 }
  let(:ober_meetings)    { 200 }
  let(:ober_first)       { Date.new(2001, 01, 28) }
  let(:ober_last)        { Date.new(2019, 06, 26) }

  context "well formed instance" do
    subject { TeamStats.new( team ) }

    it_behaves_like( "(the existance of a method)", [
      :team, :stats
    ] )

    it "assigns attributes as given parameters" do
      expect( subject.team ).to eq( team )
    end

    it "creates empty readable attributes" do
      expect( subject.stats ).to be_nil
    end

    describe "#retrieve_data" do
      it "returns a relation and sets stats" do
        expect( subject.stats ).to be_nil
        result = subject.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( subject.stats ).to be_a_kind_of( ActiveRecord::Result )
        expect( subject.stats ).to eq( result )
      end
      it "returns a query result with necessary columns" do
        keys = [
          'federation_name', 'min_date', 'max_date',
          'affiliations_count', 'meetings_count'
          ]
        result = subject.retrieve_data
        result.each do |element|
          expect( element.size ).to eq( keys.size )
          keys.each do |column|
            expect( element.has_key?(column) ).to eq(true)
          end
        end
      end
    end

    describe "#get_team_stats_dao" do
      it "returns a stats_dao" do
        expect( subject.get_team_stats_dao ).to be_an_instance_of( TeamStatsDAO )
      end
      it "returns an empty stats_dao if no data retrieved" do
        expect( subject.stats ).to be_nil
        ssd = subject.get_team_stats_dao
        expect( ssd.get_meetings_count ).to eq(0)
      end
    end

    describe "#get_item_data" do
      it "returns an hash if items given" do
        expect( subject.get_item_data('PIPPO:PLUTO', [:id, :value]) ).to be_a_kind_of( Hash )
      end
      it "returns nil if any items given" do
        expect( subject.get_item_data( nil, [:id, :value] ) ).to be_nil
      end
      it "returns an hash with given keys" do
        keys = [:id, :value, :note]
        result = subject.get_item_data('PIPPO:PLUTO:PAPERINO', keys)
        keys.each do |key|
          expect( result.has_key?( key ) ).to eq(true)
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # This context is to ensure results of data retrieving are those desidered
  # based on known data (of Leega)
  context "for Ober Ferrari (a team with full stats)" do
    subject { TeamStats.new( ober ) }

    describe "#retrieve_data" do
      it "returns at least 200 meetings, etc." do
        result = subject.retrieve_data
        expect( result ).to be_a_kind_of( ActiveRecord::Result )
        expect( result.count ).to be >= ober_federations
      end
    end

    describe "#get_team_stats_dao" do
      it "returns a non empty stats_dao if data retrieved" do
        subject.retrieve_data
        ssd = subject.get_team_stats_dao
        #expect( ssd.get_meetings_count ).to be >= ober_meetings
        #expect( ssd.get_disqualifications ).to be >= ober_dsq
        #expect( ssd.get_meters_swam ).to be >= ober_meters
        #expect( ssd.get_individual_results_count ).to be >= ober_events
        #expect( ssd.get_relay_results_count ).to be >= ober_relays
        #expect( ssd.get_first_meeting_hash[:meeting_date].to_date ).to be <= ober_first
        #expect( ssd.get_last_meeting_hash[:meeting_date].to_date ).to be >= ober_last
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
