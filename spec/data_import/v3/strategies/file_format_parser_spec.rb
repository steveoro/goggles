# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/strategies/file_format_parser'
require_relative '../../../../app/data_import/v3/fin_result_defs'
require_relative '../../../../app/data_import/v3/fin2_result_defs'


describe V3::FileFormatParser, type: :strategy do

  describe "for a well defined instance," do
    subject { V3::FileFormatParser.new( File.join(Rails.root, 'test/fixtures/samples/ris20131110bologna-fake.txt') ) }
    it "responds to #parsing_defs" do
      expect( subject ).to respond_to( :parsing_defs )
    end
    it "responds to #content_parser" do
      expect( subject ).to respond_to( :content_parser )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "with a FIN(1) result file type," do
    [
      'test/fixtures/samples/ris20131110bologna-fake.txt',
      'test/fixtures/samples/fixture1-ris20120414molinella-sample.txt',
      'test/fixtures/samples/fixture2-ris20111203riccione-sample.txt',
      'test/fixtures/samples/fixture3-ris20120114ravenna-sample.txt',
      'test/fixtures/samples/fixture4-ris20121112bologna-sample.txt',
      'test/fixtures/samples/ris20131110bologna-sample.txt'
    ].each do |filename|
      describe "#parse" do
        it "returns the correct constant associated with the file type for #{File.basename(filename)}" do
          full_pathname = File.join(Rails.root, filename)
          format_parser = V3::FileFormatParser.new( full_pathname )
          expect( format_parser.parsing_defs ).to be_an_instance_of( V3::FinResultDefs )
          expect( format_parser.content_parser ).to be_an_instance_of( V3::FinResultParser )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "with a FIN2 result file type," do
    [
      'test/fixtures/samples/ris20081221mussi-sample.txt',
      'test/fixtures/samples/ris20091213livorno-sample.txt',
      'test/fixtures/samples/ris20101212livorno-sample.txt',
      'test/fixtures/samples/ris20101219mussi-sample.txt',
      'test/fixtures/samples/ris20130513pontedera-sample.txt',
      'test/fixtures/samples/ris20131117poggibonsi-sample.txt',
      'test/fixtures/samples/ris20140330lucca-sample.txt'
    ].each do |filename|
      describe "#parse" do
        it "returns the correct constant associated with the file type for #{File.basename(filename)}" do
          full_pathname = File.join(Rails.root, filename)
          format_parser = V3::FileFormatParser.new( full_pathname )
          expect( format_parser.parsing_defs ).to be_an_instance_of( V3::Fin2ResultDefs )
          expect( format_parser.content_parser ).to be_an_instance_of( V3::FinResultParser )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "with a FIN startlist file type," do
    [
      'test/fixtures/samples/sta20121027verolanuova.txt',
      'test/fixtures/samples/sta20131102osimo.txt',
      'test/fixtures/samples/sta20131103specliguria.txt',
      'test/fixtures/samples/sta20131116albenga.txt',
      'test/fixtures/samples/sta20131117poggibonsi-sample.txt',
      'test/fixtures/samples/sta20140208regtoscana-sample.txt',
      'test/fixtures/samples/sta20140216regabruzzo.txt',
      'test/fixtures/samples/sta20140308firenze-sample.txt'
    ].each do |filename|
      describe "#parse" do
        it "returns the correct constant associated with the file type for #{File.basename(filename)}" do
          full_pathname = File.join(Rails.root, filename)
          format_parser = V3::FileFormatParser.new( full_pathname )
          expect( format_parser.parsing_defs ).to be_an_instance_of( V3::FinStartListDefs )
          expect( format_parser.content_parser ).to be_an_instance_of( V3::FinResultParser )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "with a CSI result or startlist file type," do
    [
      'test/fixtures/samples/ris20150201csiprova2.csv',
      'test/fixtures/samples/sta20150222csiprova3.csv'
    ].each do |filename|
      describe "#parse" do
        it "returns the correct constant associated with the file type for #{File.basename(filename)}" do
          full_pathname = File.join(Rails.root, filename)
          format_parser = V3::FileFormatParser.new( full_pathname )
# TODO:
          expect( format_parser.parsing_defs ).to be nil
          expect( format_parser.content_parser ).to be nil
#          expect( format_parser.parse ).to be_an_instance_of( V3::Fin2ResultDefs )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

end
