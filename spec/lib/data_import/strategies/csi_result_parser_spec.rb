# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/strategies/csi_result_parser'


describe CsiResultParser, type: :strategy do
  let(:fixture_filename) { File.join(Rails.root, 'test/fixtures/samples/ris20150201csiprova2.csv') }

  context "as a valid instance," do
    subject { CsiResultParser.new( fixture_filename ) }

    it_behaves_like( "(the existance of a method)", [
      :full_pathname, :dao_list,
      :process_text_log, :sql_diff_text_log,
      :parse
    ] )


    describe "#process_text_log" do
      it "is contains at least an header" do
        expect( subject.process_text_log ).to include('CSI Result parsing')
# DEBUG
#        puts "\r\n" << subject.process_text_log
      end
      it "is contains the data-file name" do
        expect( subject.process_text_log ).to include(fixture_filename)
      end
      it "is contains the count of the data rows read" do
        expect( subject.process_text_log ).to match(/Acquired\s\d+\sdata\srows/ui)
      end
    end

    describe "#sql_diff_text_log" do
      it "is contains at least an header" do
        expect( subject.sql_diff_text_log ).to include('CSI Result parsing')
# DEBUG
#        puts "\r\n" << subject.sql_diff_text_log
      end
      it "is contains the data-file name" do
        expect( subject.sql_diff_text_log ).to include(fixture_filename)
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    describe "#parse" do
      context "for a successful parsing," do
# FIXME / WIP
        xit "returns true" do
# DEBUG
          puts "\r\n" << subject.process_text_log
          puts "\r\n" << subject.sql_diff_text_log
          expect( subject.parse ).to be true
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
end
