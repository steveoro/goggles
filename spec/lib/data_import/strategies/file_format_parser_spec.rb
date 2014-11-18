# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/strategies/file_format_parser'
require_relative '../../../../lib/data_import/fin_result_defs'
require_relative '../../../../lib/data_import/fin2_result_defs'


describe FileFormatParser, type: :strategy do

  context "with a FIN(1) result file type," do
    [
#      File.join(Rails.root, 'test/fixtures/samples/fixture0-nodata-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/fixture1-ris20120414molinella-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/fixture2-ris20111203riccione-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/fixture3-ris20120114ravenna-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/fixture4-ris20121112bologna-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20131110bologna-sample.txt')
    ].each do |filename|
      describe "#parse" do
        it "returns the correct constant associated with the file type for #{File.basename(filename)}" do
          format_parser = FileFormatParser.new( filename )
          expect( format_parser.parse ).to be_an_instance_of( FinResultDefs )
        end
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
end
