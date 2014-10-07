# encoding: utf-8

require 'spec_helper'

describe ChampionshipDAO, type: :model do

  context "as a valid instance," do
    let(:columns)       { [:season_individual_points, :season_relay_points] }
    let(:meetings)      { Season.find(131).meetings }
    let(:team_scores)   { [] }

    subject { ChampionshipDAO.new( columns, meetings, team_scores ) }


    it_behaves_like( "(the existance of a method)", [
      :columns, :meetings, :team_scores
    ] )

    describe "#columns" do
      it "is the array specified for the construction" do
        expect( subject.columns ).to eq( columns )
      end
    end
    describe "#meetings" do
      it "is the relation specified for the construction" do
        expect( subject.meetings ).to eq( meetings )
      end
    end
    describe "#team_scores" do
      it "is the array specified for the construction" do
        expect( subject.team_scores ).to eq( team_scores )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end

