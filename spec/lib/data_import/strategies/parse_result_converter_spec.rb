# encoding: utf-8

require 'spec_helper'
require 'ffaker'

# [Steve, 20140925] we must use a relative path for sake of CI server happyness:
require_relative '../../../../lib/data_import/strategies/fin_result_parser'
require_relative '../../../../lib/data_import/strategies/filename_parser'
require_relative '../../../../lib/data_import/strategies/parse_result_converter'
require_relative '../../../../lib/data_import/fin_result_defs'
require_relative '../../../../lib/data_import/fin2_result_defs'


describe ParseResultConverter, type: :strategy do

  before(:all) do
    # Since parsing takes some time, a single random sample will suffice:
    random_sample_filename = [
      File.join(Rails.root, 'test/fixtures/samples/ris20081221mussi-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20091213livorno-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20101212livorno-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20101219mussi-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20130513pontedera-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20131117poggibonsi-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20140330lucca-sample.txt')
    ].sort{ rand - 0.5 }[0]
    source_parsing_defs = Fin2ResultDefs.new
    result_hash = FinResultParser.parse_txt_file(
      random_sample_filename,
      nil,                                          # We don't care for logging, here
      source_parsing_defs                           # This will forcibly plug-in the correct parsing engine
    )
    header_fields_dao = FilenameParser.new( random_sample_filename ).parse
    season = Season.where(
      season_type_id: 1, # SeasonType.find_by_code('MASFIN').id
      header_year:    header_fields_dao.header_year
    ).first

    @converted_result_hash = ParseResultConverter.new.to_parse_result(
      result_hash[:parse_result],
      source_parsing_defs,
      season
    )
  end


  it "responds to #to_parse_result" do
    expect( subject ).to respond_to( :to_parse_result )
  end


  context "when converting from FIN2 to FIN(1) formats," do
    describe "#to_parse_result output," do
      subject { @converted_result_hash }

      it "is an instance of Hash" do
        expect( subject ).to be_an_instance_of( Hash )
      end

      [
        :meeting_header,
        :category_header, :result_row,
        :relay_header, :relay_row,
        :team_ranking, :ranking_row,
        :stats, :stats_details
      ].each do |context_key|
        it "recognizes a list of :#{context_key} data pages" do
          expect( subject.has_key?( context_key ) ).to be true
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

end