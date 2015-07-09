# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v2/dao/swimmer_analysis_report_dao'
require_relative '../../../../app/strategies/fuzzy_string_matcher'


describe SwimmerAnalysisReportDAO, type: :model do

  context "as an empty, valid instance," do
    subject { SwimmerAnalysisReportDAO.new( nil, nil, nil, nil, '' ) }

    it_behaves_like( "(the existance of a method)", [
      :swimmer_match, :swimmer_id,
      :hiscoring_match, :best_match, :text_log
    ] )
  end

  context "as a valid instance with all filled-in members," do
    let(:swimmer) { create(:swimmer) }

    subject do
      SwimmerAnalysisReportDAO.new(
        { score: 0.9, row: swimmer },
        swimmer.id,
        { score: 0.9, row: swimmer },
        { score: 0.9, row: swimmer },
        "...Whatever...\r\n#{FFaker::Lorem.paragraph[0..99]}\r\n#{FFaker::Lorem.paragraph[0..99]}"
      )
    end

    describe "#swimmer_match" do
      it "returns an Hash" do
        expect( subject.swimmer_match ).to be_an_instance_of( Hash )
      end
      it "has the :score key" do
        expect( subject.swimmer_match.has_key?(:score) ).to be true
      end
      it "has a sufficient value corresponding to the :score key" do
        expect( subject.swimmer_match[:score] ).to be > FuzzyStringMatcher::BIAS_SCORE_MIN
      end
      it "has the :row key" do
        expect( subject.swimmer_match.has_key?(:row) ).to be true
      end
      it "has a Swimmer row as value for the :row key" do
        expect( subject.swimmer_match[:row] ).to be_an_instance_of( Swimmer )
      end
    end

    describe "#swimmer_id" do
      it "returns a positive ID" do
        expect( subject.swimmer_id ).to be > 0
      end
      it "returns the ID of the fixture specified in the constructor" do
        expect( subject.swimmer_id ).to eq( swimmer.id )
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
        ).to be_an_instance_of( Swimmer )
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

