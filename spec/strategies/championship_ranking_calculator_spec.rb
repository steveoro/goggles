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

    describe "#get_columns," do
      it "responds to get_columns method" do
        expect(subject).to respond_to(:get_columns)
      end
      it "returns an enumerable" do
        expect( subject.get_columns ).to be_a_kind_of( Array )
      end
    end
    #-- -----------------------------------------------------------------------

    describe "#get_season_ranking," do
      it "responds to get_season_ranking method" do
        expect(subject).to respond_to(:get_season_ranking)
      end
      it "returns a ChampionshipDAO" do
        expect( subject.get_season_ranking ).to be_an_instance_of( ChampionshipDAO )
      end

      context "with 2013-2014 CSI season" do
        it "has found 2 columns for meeting scores" do
          expect( subject.get_season_ranking.columns.count ).to be_equal(2)        
        end
        it "has found 5 meetings involved" do
          expect( subject.get_season_ranking.meetings.count ).to be_equal(5)        
        end
        it "has found 14 teams involved" do
          expect( subject.get_season_ranking.team_scores.count ).to be_equal(14)        
        end
        it "has found CSI Nuoto Ober Ferrari (1) in 2nd position" do
          expect( subject.get_season_ranking.team_scores[1].team.id ).to be_equal(1)        
        end
        it "has found CSI Nuoto Ober Ferrari with 3136 points" do
          expect( subject.get_season_ranking.team_scores[1].total_points.to_i ).to be_equal(3136)        
        end
      end
    end
    #-- -----------------------------------------------------------------------
  end
  #-- -------------------------------------------------------------------------
  #++
end
