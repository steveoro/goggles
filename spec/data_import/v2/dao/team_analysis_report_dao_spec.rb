# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v2/dao/team_analysis_report_dao'
require_relative '../../../../app/strategies/fuzzy_string_matcher'


describe TeamAnalysisReportDAO, type: :model do

  context "as an empty, valid instance," do
    subject { TeamAnalysisReportDAO.new( nil, nil, nil, nil, nil, '' ) }

    it_behaves_like( "(the existance of a method)", [
      :team_match, :team_id, :affiliation_match,
      :hiscoring_match, :best_match, :text_log
    ] )
  end

  context "as a valid instance with some filled members," do
    let(:team_affiliation) { create(:team_affiliation) }

    subject do
      TeamAnalysisReportDAO.new(
        { score: 0.9, row: team_affiliation.team },
        team_affiliation.team_id,
        { score: 0.9, row: team_affiliation },
        { score: 0.9, row: team_affiliation.team },
        nil,
        "...Whatever...\r\n#{FFaker::Lorem.paragraph[0..99]}\r\n#{FFaker::Lorem.paragraph[0..99]}"
      )
    end

    describe "#team_match" do
      it "returns an Hash" do
        expect( subject.team_match ).to be_an_instance_of( Hash )
      end
      it "has the :score key" do
        expect( subject.team_match.has_key?(:score) ).to be true
      end
      it "has a sufficient value corresponding to the :score key" do
        expect( subject.team_match[:score] ).to be > FuzzyStringMatcher::BIAS_SCORE_MIN
      end
      it "has the :row key" do
        expect( subject.team_match.has_key?(:row) ).to be true
      end
      it "has a Team row as value for the :row key" do
        expect( subject.team_match[:row] ).to be_an_instance_of( Team )
      end
    end

    describe "#team_id" do
      it "returns a positive ID" do
        expect( subject.team_id ).to be > 0
      end
    end

    describe "#affiliation_match" do
      it "returns an Hash" do
        expect( subject.affiliation_match ).to be_an_instance_of( Hash )
      end
      it "has the :score key" do
        expect( subject.affiliation_match.has_key?(:score) ).to be true
      end
      it "has a sufficient value corresponding to the :score key" do
        expect( subject.affiliation_match[:score] ).to be > FuzzyStringMatcher::BIAS_SCORE_MIN
      end
      it "has the :row key" do
        expect( subject.affiliation_match.has_key?(:row) ).to be true
      end
      it "has a TeamAffiliation row as value for the :row key" do
        expect( subject.affiliation_match[:row] ).to be_an_instance_of( TeamAffiliation )
      end
    end

    describe "#hiscoring_match" do
      it "returns an Hash" do
        expect( subject.hiscoring_match ).to be_an_instance_of( Hash )
      end
      it "has the :score key" do
        expect( subject.hiscoring_match.has_key?(:score) ).to be true
      end
      it "has a sufficient value corresponding to the :score key" do
        expect( subject.hiscoring_match[:score] ).to be > FuzzyStringMatcher::BIAS_SCORE_MIN
      end
      it "has the :row key" do
        expect( subject.hiscoring_match.has_key?(:row) ).to be true
      end
      it "has a Team or TeamAffiliation row as value for the :row key" do
        expect(
          subject.hiscoring_match[:row]
        ).to be_an_instance_of( Team ).or be_an_instance_of( TeamAffiliation )
      end
    end

    describe "#text_log" do
      it "returns an String" do
        expect( subject.text_log ).to be_an_instance_of( String )
      end
      it "returns a non-empty string" do
        expect( subject.text_log.size ).to be > 0
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end

