# encoding: utf-8

require 'rails_helper'
require 'common/format'


describe SwimmerStatsDAO, type: :model do
  let(:leega)           { Swimmer.find(23) }
  let(:swimmer)         { Swimmer.all.sample }

  context "with valid parameter," do

    subject { SwimmerStatsDAO.new( swimmer ) }

    it_behaves_like( "(the existance of a method)", [
      :swimmer, :swimmer_stats,
      :retrieve_individual_results, :retrieve_valid_fin_results_only, :calculate_stats,
      :find_linked_team_names, :get_linked_team_names, :sum_time_swam, :get_time_swam,
      :get_first_meeting, :get_last_meeting, :get_best_fin, :get_worst_fin
    ] )

    it_behaves_like( "(the existance of a method returning numeric values)", [
      :count_meetings, :count_individual_results, :sum_meters_swam, :count_iron_masters, :find_max_fin_points, :find_min_fin_points, :find_tot_fin_points, :count_disqualifications,
      :get_meetings_count, :get_individual_results_count, :get_meters_swam, :get_iron_masters_count, :get_tot_fin_points, :get_disqualifications
    ])

    it_behaves_like( "(the existance of a method returning an array)", [
      :mirs, :fin_mirs
    ])

    describe "#swimmer" do
      it "returns a swimmer" do
        expect( subject.swimmer ).to be_an_instance_of( Swimmer )
      end
      it "contains the given parameter" do
        expect( subject.swimmer ).to eq( swimmer )
      end
    end

    describe "#swimmer_stats" do
      it "is an hash" do
        expect( subject.swimmer_stats ).to be_a_kind_of( Hash )
      end
    end

    describe "#retrieve_individual_results" do
      it "returns an array" do
        expect( subject.retrieve_individual_results ).to be_a_kind_of( Array )
      end
    end

    describe "#calculate_stats" do
      it "populates stats hash" do
        result = SwimmerStatsDAO.new( swimmer )
        expect( result.swimmer_stats.size ).to eq( 0 )
        result.calculate_stats
        expect( result.swimmer_stats.size ).to be > 0
      end
      it "calculates disqualifications, total meters and time swam as single methods" do
        result = SwimmerStatsDAO.new( swimmer )
        result.calculate_stats
        expect( result.count_disqualifications ).to eq( result.get_disqualifications )
        expect( result.sum_meters_swam ).to eq( result.get_meters_swam )
        expect( result.sum_time_swam ).to eq( result.get_time_swam )
      end
    end

    describe "#get_first_meeting" do
      it "returns nil when no data as yet to be retrieved" do
        result = SwimmerStatsDAO.new( swimmer )
        expect( result.swimmer_stats.size ).to eq( 0 )
        expect( result.get_first_meeting ).to be_nil
      end
      it "returns a SwimmerMeetingDAO after data is retrieved" do
        result = SwimmerStatsDAO.new( swimmer )
        result.calculate_stats
        expect( result.get_first_meeting ).to be_an_instance_of( SwimmerStatsDAO::SwimmerStatsMeetingDAO )
      end
    end

    describe "#get_last_meeting" do
      it "returns nil if no data retrieved" do
        result = SwimmerStatsDAO.new( swimmer )
        expect( result.swimmer_stats.size ).to be( 0 )
        expect( result.get_last_meeting ).to be_nil
      end
      it "returns a Meeting if data retrieved" do
        result = SwimmerStatsDAO.new( swimmer )
        result.calculate_stats
        expect( result.get_first_meeting ).to be_an_instance_of( SwimmerStatsDAO::SwimmerStatsMeetingDAO )
      end
    end

    describe "#get_best_fin" do
      it "returns nil if no data retrieved" do
        result = SwimmerStatsDAO.new( swimmer )
        expect( result.swimmer_stats.size ).to eq( 0 )
        expect( result.get_best_fin ).to be_nil
      end
      it "returns a SwimmerMeetingDAO if data retrieved" do
        ssd = SwimmerStatsDAO.new( leega )
        ssd.calculate_stats
        expect( ssd.get_best_fin ).to be_an_instance_of( SwimmerStatsDAO::SwimmerStatsMeetingDAO )
      end
    end

    describe "#get_worst_fin" do
      it "returns nil if no data retrieved" do
        result = SwimmerStatsDAO.new( swimmer )
        expect( result.swimmer_stats.size ).to eq( 0 )
        expect( result.get_worst_fin ).to be_nil
      end
      it "returns a SwimmerMeetingDAO if data retrieved" do
        ssd = SwimmerStatsDAO.new( leega )
        ssd.calculate_stats
        expect( ssd.get_worst_fin ).to be_an_instance_of( SwimmerStatsDAO::SwimmerStatsMeetingDAO )
      end
    end
  end
end

