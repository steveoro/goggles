# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v2/services/badge_duplicate_checker'


describe V2::BadgeDuplicateChecker, type: :service do
  let(:team)            { create(:team) }
  let(:team_affiliation) do
    TeamAffiliationFactoryTools.create_affiliation_with_badge_list( team, 1 )
  end
  let(:swimmer)         { team_affiliation.team.swimmers.first }
  let(:season)          { team_affiliation.season }

  let(:duplicate_affiliation) do
    create(
      :team_affiliation,
      season: season
    )
  end
  let(:duplicate_badge) do
    create(
      :badge,
      team_affiliation: duplicate_affiliation,
      swimmer:          swimmer,
      season:           duplicate_affiliation.season,
      # Force a random category type among the ones available for the
      # pre-built & selected season:
      category_type:    duplicate_affiliation.season.category_types.sort{ rand() - 0.5 }[0]
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "self.is_ok?()" do
    it "responds to self.is_ok?()" do
      expect( V2::BadgeDuplicateChecker ).to respond_to( :is_ok? )
    end

    context "for a valid Swimmer instance without duplicates," do
      it "returns true" do
        expect( V2::BadgeDuplicateChecker.is_ok?(swimmer, season) ).to be true
      end
    end

    context "for a Swimmer instance with duplicate badges," do
      it "returns false" do
        expect( V2::BadgeDuplicateChecker.is_ok?( duplicate_badge.swimmer, duplicate_badge.season) ).to be false
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end


  describe "self.get_swimmers_with_duplicates()" do
    it "responds to self.get_swimmers_with_duplicates()" do
      expect( V2::BadgeDuplicateChecker ).to respond_to( :get_swimmers_with_duplicates )
    end

    context "for a valid Season instance without duplicates," do
      it "returns an empty list" do
        result = V2::BadgeDuplicateChecker.get_swimmers_with_duplicates(season)
        expect( result.count ).to eq(0)
      end
    end

    context "for a Season instance with duplicate badges," do
      it "returns an empty list" do
        result = V2::BadgeDuplicateChecker.get_swimmers_with_duplicates( duplicate_badge.season )
        expect( result.count ).to be > 0
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
