# encoding: utf-8

require 'spec_helper'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../app/data_import/v3/strategies/fin_result_parser'
require_relative '../../../../app/data_import/v3/services/txt_parse_service'
require_relative '../../../../app/data_import/v3/services/context_detector'
require_relative '../../../../app/data_import/v3/fin_result_consts'
require_relative '../../../../app/data_import/v3/txt_result_defs'
require_relative '../../../../app/data_import/v3/fin_result_defs'


describe V3::FinResultParser, type: :strategy do

  context "as a stand-alone class," do
    subject do
      V3::FinResultParser.new(
        File.join(Rails.root, 'test/fixtures/samples/fixture0-nodata-sample.txt'),
        V3::FinResultDefs.new
      )
    end

    # Since subject is already a class, we just need to use this shared existance example
    # instead of the "(the existance of a class method)":
    it_behaves_like( "(the existance of a method)", [
      :parse_file, :process_log
    ] )
    #-- -----------------------------------------------------------------------
    #++


    describe "#process_log" do
      it "returns a kind of String instance" do
        expect( subject.process_log ).to be_a_kind_of( String )
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    describe "#parse_txt_file" do
      let(:result_hash) { subject.parse_file() }

      it "returns an Hash instance" do
        expect( result_hash ).to be_an_instance_of( Hash )
      end
      describe "result hash" do
        it "has the :parse_result key" do
          expect( result_hash.has_key?( :parse_result ) ).to be true
        end
        it "has a V3::ParseResult instance as value of the :parse_result key" do
          expect( result_hash[:parse_result] ).to be_an_instance_of( V3::ParseResult )
        end

        it "has the :parsing_defs key" do
          expect( result_hash.has_key?( :parsing_defs ) ).to be true
        end
        it "has a kind of V3::TxtResultDefs instance as value of the :parsing_defs key" do
          expect( result_hash[:parsing_defs] ).to be_a_kind_of( V3::TxtResultDefs )
        end

        it "has the :line_count key" do
          expect( result_hash.has_key?( :line_count ) ).to be true
        end
        it "has the :total_data_rows key" do
          expect( result_hash.has_key?( :total_data_rows ) ).to be true
        end
        it "has the :full_text_file_contents key" do
          expect( result_hash.has_key?( :full_text_file_contents ) ).to be true
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
