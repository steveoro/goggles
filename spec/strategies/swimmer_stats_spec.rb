require 'rails_helper'


describe SwimmerStats, type: :strategy do

  let(:swimmer)         { Swimmer.first(300).sample }
  let(:leega)           { Swimmer.find(23) }
  let(:leega_irons)     { 3 }
  let(:leega_meetings)  { 200 }
  let(:leega_points)    { 50000 }
  let(:leega_dsq)       { 2 }

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
          'complete_name','year_of_birth',
          'meetings_count', 'mirs_count', 'total_fin_points', 'total_minutes', 'total_seconds', 'total_hundreds', 'total_meters', 'disqualified_count',
          'max_fin_points_and_id', 'min_fin_points_and_id', 'irons_count',
          'teams_name_and_ids',
          'first_meeting', 'last_meeting'
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
  end
  #-- -------------------------------------------------------------------------
  #++

  context "for Leega (a swimmer with full stats)" do
    subject { SwimmerStats.new( leega ) }

    describe "#retrieve_data" do
      it "returns at least 3 ironmaster and 200 meetings, etc." do
        result = subject.retrieve_data
        expect( result['meetings_count'].to_i ).to be >= leega_meetings
        expect( result['total_fin_points'].to_i ).to be >= leega_points
        expect( result['irons_count'].to_i ).to be >= leega_irons
        expect( result['disqualified_count'].to_i ).to be >= leega_dsq
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
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
