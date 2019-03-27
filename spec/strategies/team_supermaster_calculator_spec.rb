require 'rails_helper'


describe TeamSupermasterCalculator, type: :strategy do

  let(:fix_team_affiliation) { TeamAffiliation.find( 5197 ) }  # CSI Nuoto Ober Ferrari - 182

  let(:fix_team)             { fix_team_affiliation.team }
  let(:fix_season )          { fix_team_affiliation.season }

  let(:fix_swimmer)       { Swimmer.find( [23, 51, 142, 149].sample ) }  # Leega, Attolini, Steve, Ganga
  let(:new_swimmer )      { create( :swimmer ) }
  let(:leega)             { Swimmer.find( 23 ) }
  let(:ganga)             { Swimmer.find( 149 ) }

  subject { TeamSupermasterCalculator.new(fix_team_affiliation) }

  describe "[a well formed instance]" do
    it_behaves_like( "(the existance of a method returning non-empty strings)", [
    ])

    it "assigns team_affiliation as given parameter" do
      expect( subject.team_affiliation ).to eq( fix_team_affiliation )
    end
    it "assigns team as given parameter" do
      expect( subject.team ).to eq( fix_team_affiliation.team )
    end
    it "assigns season as given parameter" do
      expect( subject.season ).to eq( fix_team_affiliation.season )
    end
    it "determines u25 min year based on season" do
      expect( subject.u25_year ).to eq( fix_team_affiliation.season.end_date.year() -25 )
    end
    it "determines min date for M25 first year valid meetings" do
      expect( subject.min_m25_date ).to eq( Date.new( fix_team_affiliation.season.end_date.year(), 1, 1 ) )
    end
    it "creates an empty results dao" do
      expect( subject.team_supermaster_dao.size ).to eq( 0 )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "#get_swimmer_results" do
    it "returns an array" do
      expect( subject.get_swimmer_results() ).to be_a_kind_of( Array )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
