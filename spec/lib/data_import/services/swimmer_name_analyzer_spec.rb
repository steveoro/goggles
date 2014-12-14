# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/services/swimmer_name_analyzer'


describe SwimmerNameAnalyzer, type: :service, data_import: true do

  context "for a well-defined instance," do
    subject { SwimmerNameAnalyzer.new() }

    it_behaves_like( "(the existance of a method)", [
      :all_swimmers,
      :matcher,
      :analysis_text_log, :sql_text_log,
      :analyze
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#initialize" do
      it "returns a TeamNameAnalyzer instance" do
        expect( subject ).to be_an_instance_of( SwimmerNameAnalyzer )
      end
    end

    describe "#all_swimmers" do
      it "returns the list of all Teams" do
        expect( subject.all_swimmers ).to all( be_an_instance_of(Swimmer) )
      end
    end

    describe "#matcher" do
      it "returns the internal FuzzyStringMatcher dedicated to Swimmer scanning" do
        expect( subject.matcher ).to be_an_instance_of(FuzzyStringMatcher)
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
# TODO
      xit "returns a DataImportSwimmerAnalysisResult instance" do
        analysys_log = ''
        sql_log = ''
        expect(
          subject.analyze( "MARCO LIGABUE", 132, analysys_log, sql_log )
        ).to be_an_instance_of(DataImportSwimmerAnalysisResult)
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
