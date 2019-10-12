require 'rails_helper'


describe SwimmerStats, type: :strategy do

  let(:swimmer)         { Swimmer.first(300).sample }
  let(:leega)           { Swimmer.find(23) }
  let(:leega_irons)     { 3 }
  let(:leega_meetings)  { 200 }
  let(:leega_events)    { 400 }
  let(:leega_points)    { 150000 }
  let(:leega_dsq)       { 2 }
  let(:leega_meters)    { 75000 }
  let(:leega_worst_fin) { 587 }
  let(:leega_best_fin)  { 827 }

  context "well formed instance" do
    subject { SwimmerStats.new( swimmer ) }

    it_behaves_like( "(the existance of a method)", [
      :swimmer, :swimmer_stats
    ] )

    it "assigns attributes as given parameters" do
      expect( subject.swimmer ).to eq( swimmer )
    end

    it "creates empty readable attributes" do
      expect( subject.swimmer_stats ).to be_nil
    end

    describe "#retrieve_data" do
      it "returns a relation and sets swimmer_stats" do
        expect( subject.swimmer_stats ).to be_nil
        result = subject.retrieve_data
        expect( result ).to be_a_kind_of( Hash )
        expect( subject.swimmer_stats ).to be_a_kind_of( Hash )
        expect( subject.swimmer_stats ).to eq( result )
      end
      it "returns a query result with necessary columns" do
        subject.retrieve_data
        [
          'meetings_count', 'individual_count', 'total_fin_points',
          'individual_minutes', 'individual_seconds', 'individual_hundreds', 'individual_meters', 'individual_disqualified_count',
          'max_fin_points_data', 'min_fin_points_data',
          'irons_count',
          'teams_name_and_ids',
          'first_meeting_data', 'last_meeting_data'
        ].each do |column|
          expect( subject.swimmer_stats.has_key?(column) ).to eq(true)
        end
      end
    end

    describe "#get_swimmers_stats_dao" do
      it "returns a swimmer_stats_dao" do
        expect( subject.get_swimmers_stats_dao ).to be_an_instance_of( SwimmerStatsDAO )
      end
      it "returns an empty swimmer_stats_dao if no data retrieved" do
        expect( subject.swimmer_stats ).to be_nil
        ssd = subject.get_swimmers_stats_dao
        expect( ssd.get_meetings_count ).to eq(0)
      end
    end

    describe "#get_linked_teams" do
      it "returns a string" do
        expect( subject.get_linked_teams('PIPPO:1') ).to be_an_instance_of( String )
      end
    end

    describe "#get_items_hash" do
      it "returns an hash" do
        expect( subject.get_items_hash('PIPPO:1') ).to be_a_kind_of( Hash )
        expect( subject.get_items_hash( nil ) ).to be_a_kind_of( Hash )
      end
      it "returns an hash that respond to 1 key" do
        result = subject.get_items_hash('PIPPO:1')
        expect( result.has_key?('1') ).to eq(true)
      end
      it "returns an hash with three keys" do
        result = subject.get_items_hash('PIPPO:1, PLUTO:2, PAPERINO:3')
        expect( result.size ).to eq(3)
      end
    end

    describe "#get_items_array" do
      it "returns an array if items given" do
        expect( subject.get_items_array('PIPPO:1:PRIMO:ALTRO') ).to be_a_kind_of( Array )
      end
      it "returns nil if any items given" do
        expect( subject.get_items_array( nil ) ).to be_nil
      end
      it "returns an array elements if a 5 elements item given" do
        expect( subject.get_items_array('PIPPO:1:PRIMO:DOPO:ADESSO').count ).to eq(5)
      end
    end

    describe "#get_distinct_items" do
      it "returns an array if items given" do
        expect( subject.get_distinct_items('PIPPO, PLUTO') ).to be_a_kind_of( Array )
      end
      it "returns nil if any items given" do
        expect( subject.get_distinct_items( nil ) ).to be_nil
      end
      it "returns an array with no replicated items" do
        expect( subject.get_distinct_items('PIPPO, PIPPO, PLUTO, PIPPO').size ).to eq( 2 )
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
  context "for Leega (a swimmer with full stats)" do
    subject { SwimmerStats.new( leega ) }

    describe "#retrieve_data" do
      it "returns at least 3 ironmaster and 200 meetings, etc." do
        result = subject.retrieve_data
        expect( result['meetings_count'].to_i ).to be >= leega_meetings
        expect( result['total_fin_points'].to_i ).to be >= leega_points
        expect( result['irons_count'].to_i ).to be >= leega_irons
        expect( result['individual_disqualified_count'].to_i ).to be >= leega_dsq
        expect( result['teams_name_and_ids'].split(', ').size ).to be >= 2
      end
    end

    describe "#get_swimmers_stats_dao" do
      it "returns a non empty swimmer_stats_dao if data retrieved" do
        subject.retrieve_data
        ssd = subject.get_swimmers_stats_dao
        expect( ssd.get_meetings_count ).to be >= leega_meetings
        expect( ssd.get_tot_fin_points ).to be >= leega_points
        expect( ssd.get_iron_masters_count ).to be >= leega_irons
        expect( ssd.get_disqualifications ).to be >= leega_dsq
        expect( ssd.get_meters_swam ).to be >= leega_meters
        expect( ssd.get_meters_swam ).to be >= leega_meters
        expect( ssd.get_individual_results_count ).to be >= leega_events
        expect( ssd.swimmer_stats[:teams_hash].size ).to be >= 2
        expect( ssd.swimmer_stats[:first_array].size ).to eq(4)
        expect( ssd.swimmer_stats[:last_array].size ).to eq(4)
        expect( ssd.swimmer_stats[:worst_fin_array].size ).to eq(6)
        expect( ssd.swimmer_stats[:best_fin_array].size ).to eq(6)
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
