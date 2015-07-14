# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v2/strategies/file_format_parser'
require_relative '../../../../app/data_import/v2/fin_result_defs'
require_relative '../../../../app/data_import/v2/fin2_result_defs'


describe V2::FileFormatParser, type: :strategy do

  context "with a FIN(1) result file type," do
    [
      File.join(Rails.root, 'test/fixtures/samples/ris20131110bologna-fake.txt'),
      File.join(Rails.root, 'test/fixtures/samples/fixture1-ris20120414molinella-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/fixture2-ris20111203riccione-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/fixture3-ris20120114ravenna-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/fixture4-ris20121112bologna-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20131110bologna-sample.txt')
    ].each do |filename|
      describe "#parse" do
        it "returns the correct constant associated with the file type for #{File.basename(filename)}" do
          format_parser = V2::FileFormatParser.new( filename )
          expect( format_parser.parse ).to be_an_instance_of( V2::FinResultDefs )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "with a FIN2 result file type," do
    [
      File.join(Rails.root, 'test/fixtures/samples/ris20081221mussi-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20091213livorno-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20101212livorno-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20101219mussi-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20130513pontedera-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20131117poggibonsi-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20140330lucca-sample.txt')
    ].each do |filename|
      describe "#parse" do
        it "returns the correct constant associated with the file type for #{File.basename(filename)}" do
          format_parser = V2::FileFormatParser.new( filename )
          expect( format_parser.parse ).to be_an_instance_of( V2::Fin2ResultDefs )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "with a FIN startlist file type," do
    [
      File.join(Rails.root, 'test/fixtures/samples/sta20121027verolanuova.txt'),
      File.join(Rails.root, 'test/fixtures/samples/sta20131102osimo.txt'),
      File.join(Rails.root, 'test/fixtures/samples/sta20131103specliguria.txt'),
      File.join(Rails.root, 'test/fixtures/samples/sta20131116albenga.txt'),
      File.join(Rails.root, 'test/fixtures/samples/sta20131117poggibonsi-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/sta20140208regtoscana-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/sta20140216regabruzzo.txt'),
      File.join(Rails.root, 'test/fixtures/samples/sta20140308firenze-sample.txt')
    ].each do |filename|
      describe "#parse" do
        it "returns the correct constant associated with the file type for #{File.basename(filename)}" do
          format_parser = V2::FileFormatParser.new( filename )
          expect( format_parser.parse ).to be_an_instance_of( V2::FinStartListDefs )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

end
