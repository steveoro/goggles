# encoding: utf-8
require 'spec_helper'

require 'data_import/services/team_name_analizer'


describe TeamNameAnalizer, type: :service do

  context "for a well-defined instance," do
    subject { TeamNameAnalizer.new() }

    it_behaves_like( "(the existance of a method)", [
      :all_teams, :all_affiliations,
      :team_matcher, :affiliation_matcher,
      :analyze
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#initialize" do
      it "returns a TeamNameAnalizer instance" do
        expect( subject ).to be_an_instance_of( TeamNameAnalizer )
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
