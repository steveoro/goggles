require 'spec_helper'


describe ChampionshipRankingCalculator, type: :strategy do
  before :each do
    # Data forced from seeds
    @fix_season  = Season.find(131)
  end

  context "with requested parameters" do
    subject { ChampionshipRankingCalculator.new( @fix_season ) }

    describe "#get_involved_teams," do
      it "responds to get_involved_teams method" do
        expect(subject).to respond_to(:get_involved_teams)
      end
      it "returns a relation" do
        expect( subject.get_involved_teams ).to be_a_kind_of( ActiveRecord::Relation )
      end
      it "returns an empty array if the season hasn't affiliations" do
        empty_season = create(:season)
        empty_ranking = ChampionshipRankingCalculator.new( empty_season )
        expect( subject.get_involved_teams ).to be_a_kind_of( ActiveRecord::Relation )
        expect( empty_ranking.get_involved_teams.count ).to be_equal(0)
      end
    end
    #-- -----------------------------------------------------------------------

    describe "#get_involved_meetings," do
      it "responds to get_involved_meetings method" do
        expect(subject).to respond_to(:get_involved_meetings)
      end
      it "returns an enumerable" do
        expect( subject.get_involved_meetings ).to be_a_kind_of( ActiveRecord::Relation )
      end
      it "returns an empty array if the season hasn't affiliations" do
        empty_season = create(:season)
        empty_ranking = ChampionshipRankingCalculator.new( empty_season )
        expect( empty_ranking.get_involved_meetings ).to be_a_kind_of( ActiveRecord::Relation )
        expect( empty_ranking.get_involved_meetings.count ).to be_equal(0)
      end
    end
    #-- -----------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++
end
