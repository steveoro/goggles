# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/services/badge_duplicate_checker'


describe BadgeDuplicateChecker, type: :service do
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
      swimmer: swimmer
    )
  end
  #-- -------------------------------------------------------------------------
  #++


  describe "self.is_ok?()" do
    it "responds to self.is_ok?()" do
      expect( BadgeDuplicateChecker ).to respond_to( :is_ok? )
    end

    context "for a valid Swimmer instance without duplicates," do
      it "returns true" do
        expect( BadgeDuplicateChecker.is_ok?(swimmer, season) ).to be true
      end
    end

    context "for a Swimmer instance with duplicate badges," do
      it "returns false" do
        expect( BadgeDuplicateChecker.is_ok?( duplicate_badge.swimmer, duplicate_badge.season) ).to be false
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
