# encoding: utf-8
require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/services/swimmer_name_analyzer'


describe SwimmerNameAnalyzer, type: :service, data_import: true do

  context "for a well-defined instance," do
    subject { SwimmerNameAnalyzer.new() }

    it_behaves_like( "(the existance of a method)", [
      :swimmers,
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


    shared_examples_for "(a valid DataImportSwimmerAnalysisResult)" do
      it "is a DataImportSwimmerAnalysisResult instance" do
        expect( @result ).to be_an_instance_of(DataImportSwimmerAnalysisResult)
# DEBUG
#        puts "\r\n\r\n" << @analysis_log
#        puts "\r\n\r\n" << @sql_log
      end
      it "has a non-empty analysis_log" do
        expect( @analysis_log.size ).to be > 0
      end
      it "has a non-empty sql_log" do
        expect( @sql_log.size ).to be > 0
      end
    end


    shared_examples_for "(a DataImportSwimmerAnalysisResult with a PERFECT match)" do
      it "logs the exact match"
      it "doesn't allow the creation of a new swimmer"
      it "doesn't allow the creation of a new alias"
      it "doesn't log any suggested SQL statements"
    end


    shared_examples_for "(a DataImportSwimmerAnalysisResult with a SINGLE match)" do
      it "logs the single choice"
      it "doesn't allow the creation of a new swimmer"
      it "allows the creation of a new alias"
      it "logs a suggested SQL alias row creation"
    end


    shared_examples_for "(a DataImportSwimmerAnalysisResult with MULTIPLE matches)" do
      it "logs the multiple choices"
      it "doesn't allow the creation of a new swimmer"
      it "allows the creation of a new alias"
      it "logs a suggested SQL alias row creation"
    end


    shared_examples_for "(a DataImportSwimmerAnalysisResult with NO match)" do
      it "allows the creation of a new swimmer"
      it "doesn't allow the creation of a new alias"
      it "logs a suggested SQL swimmers row creation"
    end


    describe "#analyze" do
      context "for existing and similar swimmer names," do
        context "['MARCO LIGABUE']" do
          before(:each) do
            @analysis_log = ''
            @sql_log = ''
            # This pre-filter will speed-up the tests
            subject.swimmers = Swimmer.where("complete_name LIKE '%LIGABUE%'")
            @result = subject.analyze( "MARCO LIGABUE", 1971, GenderType::MALE_ID, @analysis_log, @sql_log )
          end
          it_behaves_like "(a valid DataImportSwimmerAnalysisResult)"
          it_behaves_like "(a DataImportSwimmerAnalysisResult with a SINGLE match)"
        end

        context "['ROSSI GABRIELE']" do
          before(:each) do
            @analysis_log = ''
            @sql_log = ''
            subject.swimmers = Swimmer.where("complete_name LIKE '%ROSSI%'")
            @result = subject.analyze( "ROSSI GABRIELE", 1961, GenderType::MALE_ID, @analysis_log, @sql_log )
          end
          it_behaves_like "(a valid DataImportSwimmerAnalysisResult)"
          it_behaves_like "(a DataImportSwimmerAnalysisResult with a SINGLE match)"
        end
      end


      context "for existing but vaguely similar swimmer names," do
        # [Steve, 20150105] 'PIERALDO ORLANDINI' & 'IDO ORLANDINI' fail miserably

        # This should give at least 2 results:
        context "['IDO PIERALDO ORLANDINI']" do
          before(:each) do
            @analysis_log = ''
            @sql_log = ''
            # This pre-filter will speed-up the tests
            subject.swimmers = Swimmer.where("complete_name LIKE '%ORLANDINI%'")
            @result = subject.analyze( "IDO PIERALDO ORLANDINI", 1957, GenderType::MALE_ID, @analysis_log, @sql_log )
          end
          it_behaves_like "(a valid DataImportSwimmerAnalysisResult)"
          it_behaves_like "(a DataImportSwimmerAnalysisResult with MULTIPLE matches)"
        end

        context "['SADDI JAVIER FRANCISCO']" do
          before(:each) do
            @analysis_log = ''
            @sql_log = ''
            # This pre-filter will speed-up the tests
            subject.swimmers = Swimmer.where("complete_name LIKE '%SADDI%'")
            @result = subject.analyze( "SADDI JAVIER FRANCISCO", 1989, GenderType::MALE_ID, @analysis_log, @sql_log )
          end
          it_behaves_like "(a valid DataImportSwimmerAnalysisResult)"
          it_behaves_like "(a DataImportSwimmerAnalysisResult with a SINGLE match)"
        end
      end


      context "for non existing swimmer names," do
        # This should give no valid results, yielding a creation sql statement:
        context "['ROSSI MARIO']" do
          before(:each) do
            @analysis_log = ''
            @sql_log = ''
            # This pre-filter will speed-up the tests
            subject.swimmers = Swimmer.where("complete_name LIKE '%ROSSI%'")
            @result = subject.analyze( "ROSSI MARIO", 1815, GenderType::MALE_ID, @analysis_log, @sql_log )
          end
          it_behaves_like "(a valid DataImportSwimmerAnalysisResult)"
          it_behaves_like "(a DataImportSwimmerAnalysisResult with NO match)"
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
