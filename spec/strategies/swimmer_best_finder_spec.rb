require 'spec_helper'
require 'wrappers/timing'


describe SwimmerBestFinder, type: :strategy do

  context "with requested parameters" do
    let(:csi_season_type) { SeasonType.find_by_code('MASCSI') }
    let(:csi_season)      { csi_season_type.seasons.is_ended.sort{ rand - 0.5 }[0] }
    let(:active_team)     { csi_season.teams.sort{ rand - 0.5 }[0] }
    let(:active_swimmer)  { active_team.swimmers.has_results.uniq.sort{ rand - 0.5 }[0] }

    subject { SwimmerBestFinder.new( active_swimmer ) }

    it_behaves_like( "(the existance of a method)", [
      :swimmer 
    ] )

    describe "#parameters," do
      it "are the given parameters" do
        expect( subject.swimmer ).to eq( active_swimmer )
      end
    end
    #-- -----------------------------------------------------------------------
    
    describe "#get_closed_seasons_involved_into, " do
      it "returns an array" do
        expect( subject.get_closed_seasons_involved_into ).to be_a_kind_of( ActiveRecord::Relation )
      end
      it "returns an array of seasons" do
        expect( subject.get_closed_seasons_involved_into ).to all(be_an_instance_of( Season ))
      end
      it "returns an array of ended seasons" do
        subject.get_closed_seasons_involved_into.each do |season|
          expect( season.is_season_ended_at ).to be true
        end
      end
      it "returns an array of sorted seasons" do
        seasons = subject.get_closed_seasons_involved_into
        elem = 1
        while elem < seasons.size do
          expect( seasons[elem].begin_date ).to be <= seasons[elem - 1].begin_date
          elem = elem + 1
        end
      end
      it "returns an array of seasons of given season type" do
        subject.get_closed_seasons_involved_into( csi_season_type ).each do |season|
          expect( season.season_type.code ).to eq( csi_season_type.code )
        end
      end
      it "returns an array of seasons same season type if given" do
        expect( subject.get_closed_seasons_involved_into( csi_season_type ).map{ |s| s.season_type.code }.uniq.count ).to eq( 1 )
      end
      it "returns an array of seasons of different season types if any" do
        fix_swimmer = Swimmer.find(23)
        fix_sbf     = SwimmerBestFinder.new( fix_swimmer )
        expect( fix_sbf.get_closed_seasons_involved_into.map{ |s| s.season_type.code }.uniq.count ).to be > 1
      end
    end
    #-- -----------------------------------------------------------------------
    
    describe "#get_involved_season_last_best_for_event," do
      it "returns a timing instance if event already swam" do
        fix_swimmer = Swimmer.find(23)
        fix_sbf     = SwimmerBestFinder.new( fix_swimmer )
        fix_event   = EventType.find_by_code('50FA')
        fix_pool    = PoolType.find_by_code('25')
        expect( fix_sbf.get_involved_season_last_best_for_event( fix_sbf.get_closed_seasons_involved_into, fix_event, fix_pool ) ).to be_an_instance_of( Timing )
      end
      it "returns nil if event not already swam" do
        fix_swimmer = Swimmer.find(23)
        fix_sbf     = SwimmerBestFinder.new( fix_swimmer )
        fix_event   = EventType.find_by_code('100MI')
        fix_pool    = PoolType.find_by_code('50')
        expect( fix_sbf.get_involved_season_last_best_for_event( fix_sbf.get_closed_seasons_involved_into, fix_event, fix_pool ) ).to be_nil        
      end
    end
    #-- -----------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++

  context "without requested parameters" do
    it "raises an exception for wrong swimmer parameter" do
      expect{ SwimmerBestFinder.new }.to raise_error( ArgumentError )
      expect{ SwimmerBestFinder.new( 'Wrong type parameter' ) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
