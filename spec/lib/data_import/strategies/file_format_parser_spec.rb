# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/strategies/file_format_parser'
require_relative '../../../../lib/data_import/fin_result_defs'
require_relative '../../../../lib/data_import/fin2_result_defs'


describe FileFormatParser, type: :strategy do

  context "with a FIN(1) result file type," do
    subject { FileFormatParser.new( File.join(Rails.root, 'test/fixtures/samples/ris20131110bologna-sample.txt') ) }

    describe "#parse" do
      it "returns the correct constant associated with the file type" do
        expect( subject.parse ).to be_an_instance_of( FinResultDefs )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "with a FIN2 result file type," do
    subject { FileFormatParser.new( File.join(Rails.root, 'test/fixtures/samples/ris20131117poggibonsi.txt') ) }

    describe "#parse" do
      it "returns the correct constant associated with the file type" do
        expect( subject.parse ).to be_an_instance_of( Fin2ResultDefs )
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # TODO Do a method returning an array of several array of lines,
  # to test the detector method one by one with multiple fixture
end
