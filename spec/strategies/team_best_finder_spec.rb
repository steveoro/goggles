require 'spec_helper'
require 'wrappers/timing'


describe TeamBestFinder, type: :strategy do

  let(:csi_season_type) { SeasonType.find_by_code('MASCSI') }
  let(:csi_season)      { csi_season_type.seasons.is_ended.sort{ rand - 0.5 }[0] }
  let(:active_team)     { Team.all[(rand * (Team.count - 1)).to_i] }

  subject { TeamBestFinder.new( active_team ) }

  context "with requested parameters" do
    it_behaves_like( "(the existance of a method)", [
      :team,
      :categories,
      :retrieve_categories,
      :get_team_best_individual_result
    ] )

    describe "#parameters," do
      it "are the given parameters" do
        expect( subject.team ).to eq( active_team )
        expect( subject.categories.size ).to be > 0
      end
    end
    #-- -----------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#retrieve_categories," do
    it "returns an array" do
      expect( subject.retrieve_categories ).to be_an_instance_of( Array )
    end
    it "returns an array of category types" do
      expect( subject.retrieve_categories ).to all(be_an_instance_of( CategoryType ))
    end
    it "returns a non empty array of category types for team with results" do
      expect( subject.retrieve_categories.size ).to be > 0
    end
    it "returns an array of category with at least OVER, SEN, M60 for Ober Ferrari" do
      fix_team = Team.find(1)
      fix_tbf  = TeamBestFinder.new( fix_team )
      fix_cat  = fix_tbf.retrieve_categories 
      expect( fix_cat.size ).to be >= 3 
      expect( fix_cat.size ).to be <= 25 
      expect( fix_cat.rindex{ |e| e.code == 'OVER' } ).to be > 0 
      expect( fix_cat.rindex{ |e| e.code == 'SEN' } ).to be > 0 
      expect( fix_cat.rindex{ |e| e.code == 'M60' } ).to be > 0 
    end
  end
  #-- -----------------------------------------------------------------------

  describe "#get_team_best_individual_result," do
  end
  #-- -----------------------------------------------------------------------

  context "without requested parameters" do
    it "raises an exception for wrong swimmer parameter" do
      expect{ TeamBestFinder.new }.to raise_error( ArgumentError )
      expect{ TeamBestFinder.new( 'Wrong type parameter' ) }.to raise_error( ArgumentError )
    end
    it "raises an exception for team without results" do
      expect{ TeamBestFinder.new( create( :team ) ) }.to raise_error( ArgumentError )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
