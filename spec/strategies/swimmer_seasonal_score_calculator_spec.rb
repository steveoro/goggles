require 'spec_helper'
require 'wrappers/timing'


describe SwimmerSeasonalScoreCalculator, type: :strategy do

  context "with requested parameters" do
    let(:fin_season_type) { SeasonType.find_by_code('MASFIN') }
    let(:fin_season)      { Season.find(142) }
    #let(:active_swimmer)  { Team.find(1).badges.for_season( fin_season ).sort{ rand - 0.5 }[0].swimmer }
    let(:active_swimmer)  { Swimmer.find(23) }
    let(:active_team)     { active_swimmer.team }

    subject { SwimmerSeasonalScoreCalculator.new( active_swimmer, fin_season ) }

    it_behaves_like( "(the existance of a method)", [
      :swimmer,
      :season,
      :badge,
      :results,
      :get_badge,
      :get_results
    ] )

    describe "#parameters," do
      it "are the given parameters" do
        expect( subject.swimmer ).to eq( active_swimmer )
        expect( subject.season ).to eq( fin_season )
        expect( subject.badge ).to eq( subject.get_badge )
      end
    end
    #-- -----------------------------------------------------------------------
    
    describe "#get_badge," do
      it "returns nil if no badge present" do
        sssc = SwimmerSeasonalScoreCalculator.new( create( :swimmer ), create( :season ) )
        expect( sssc.get_badge ).to be_nil
      end
      it "returns a badge if any" do
        expect( subject.get_badge ).to be_an_instance_of( Badge )
      end
      it "returns a badge of swimmer and season" do
        expect( subject.get_badge.swimmer ).to eq( active_swimmer )
        expect( subject.get_badge.season ).to eq( fin_season )
      end
    end
    #-- -----------------------------------------------------------------------
    
    describe "#get_results," do
      it "returns nil if no badge present" do
        sssc = SwimmerSeasonalScoreCalculator.new( create( :swimmer ), create( :season ) )
        expect( sssc.get_results ).to be_nil
      end
      it "returns a collection of results" do
        expect( subject.get_results ).to all( be_an_instance_of( MeetingIndividualResult ) )
      end
      it "returns a collection of results for the badge" do
        subject.get_results.each do |mir|
          expect( mir.badge ).to eq( subject.badge )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    
    describe "#calculate_supermaster_score," do
      it "returns a best limited ranking dao" do
        expect( subject.calculate_supermaster_score ).to be_an_instance_of( BestLimitedRankingDAO )
      end
    end
    #-- -----------------------------------------------------------------------
    
  end
  #-- -------------------------------------------------------------------------
  #++

  context "without requested parameters" do
    it "raises an exception for wrong swimmer parameter" do
      expect{ SwimmerSeasonalScoreCalculator.new }.to raise_error( ArgumentError )
      expect{ SwimmerSeasonalScoreCalculator.new( 'Wrong type parameter' ) }.to raise_error( ArgumentError )
      expect{ SwimmerSeasonalScoreCalculator.new( 'Wrong type parameter', Season.first ) }.to raise_error( ArgumentError )
    end
    it "raises an exception for wrong season parameter" do
      expect{ SwimmerSeasonalScoreCalculator.new( Swimmer.first ) }.to raise_error( ArgumentError )
      expect{ SwimmerSeasonalScoreCalculator.new( Swimmer.first, 'Wrong type parameter' ) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
