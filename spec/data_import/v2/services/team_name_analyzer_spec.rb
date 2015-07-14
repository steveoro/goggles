# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v2/services/team_name_analyzer'


describe V2::TeamNameAnalyzer, type: :service, data_import: true do

  context "for a well-defined instance," do
    subject { V2::TeamNameAnalyzer.new() }

    it_behaves_like( "(the existance of a method)", [
      :all_teams, :all_affiliations,
      :team_matcher, :affiliation_matcher,
      :analysis_text_log, :sql_text_log,
      :analyze
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#initialize" do
      it "returns a V2::TeamNameAnalyzer instance" do
        expect( subject ).to be_an_instance_of( V2::TeamNameAnalyzer )
      end
    end

    describe "#all_teams" do
      it "returns the list of all Teams" do
        expect( subject.all_teams ).to all( be_an_instance_of(Team) )
      end
    end

    describe "#all_affiliations" do
      it "returns the list of all Teams" do
        expect( subject.all_affiliations ).to all( be_an_instance_of(TeamAffiliation) )
      end
    end

    describe "#team_matcher" do
      it "returns the internal FuzzyStringMatcher dedicated to Teams scanning" do
        expect( subject.team_matcher ).to be_an_instance_of(FuzzyStringMatcher)
      end
    end
    describe "#affiliation_matcher" do
      it "returns the internal FuzzyStringMatcher dedicated to TeamAffiliation scanning" do
        expect( subject.team_matcher ).to be_an_instance_of(FuzzyStringMatcher)
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#analysis_text_log" do
      it "returns a String" do
        expect( subject.analysis_text_log ).to be_an_instance_of(String)
        expect( subject.analysis_text_log.size ).to be >= 0
      end
    end
    describe "#sql_text_log" do
      it "returns a String" do
        expect( subject.sql_text_log ).to be_an_instance_of(String)
        expect( subject.sql_text_log.size ).to be >= 0
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#analyze" do
      it "returns a DataImportTeamAnalysisResult instance" do
        analysys_log = ''
        sql_log = ''
        expect(
          subject.analyze( "CSI OBER FERRARI", 132, analysys_log, sql_log )
        ).to be_an_instance_of(DataImportTeamAnalysisResult)
        expect( analysys_log ).not_to eq('')
        expect( sql_log ).not_to eq('')
      end

      # TODO Refactor more and add more tests
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
