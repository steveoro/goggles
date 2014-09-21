# encoding: utf-8
require 'spec_helper'

require 'framework/console_logger'
require 'parsers/context_detector'
require 'parsers/token_extractor'
require 'parsers/fin_result_consts'


describe "FinResultParser parsing fixture file 2,", type: :integration do
  FIXTURE_FILE_2 = File.join(Rails.root, 'test/fixtures/samples/fixture2-ris20111203riccione-sample.txt')

  # We need to parse the fixture file just once to speed-up tests:
  before( :all ) { @result_hash = FinResultParser.parse_txt_file( FIXTURE_FILE_2 ) }


  it "returns an Hash" do
    expect( @result_hash ).to be_an_instance_of( Hash )
  end
  it "has the :parse_result, :line_count, :total_data_rows & :full_text_file_contents keys" do
    expect( @result_hash.keys ).to contain_exactly(
      :parse_result, :line_count, :total_data_rows, :full_text_file_contents
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "the :parse_result sub-member Hash," do
    subject { @result_hash[:parse_result] }

    it "recognizes a list of :category_header data pages" do
      expect( subject.has_key?( :category_header ) ).to be true
    end
    it "has the exact amount of :category_header data pages for this fixture" do
      expect( subject[:category_header] ).to be_an_instance_of( Array )
      expect( subject[:category_header].size ).to eq( 6 )
    end

    it "recognizes a list of :result_row data pages" do
      expect( subject.has_key?( :result_row ) ).to be true
    end
    it "has the exact amount of :result_rows for this fixture" do
      expect( subject[:result_row] ).to be_an_instance_of( Array )
      expect( subject[:result_row].size ).to eq( 144 )
    end

    it "recognizes a list of :relay_header data pages" do
      expect( subject.has_key?( :relay_header ) ).to be true
    end
    it "has no :relay_header data pages for this fixture" do
      expect( subject[:relay_header] ).to be_an_instance_of( Array )
      expect( subject[:relay_header].size ).to eq( 0 )
    end

    it "recognizes a list of :relay_row data pages" do
      expect( subject.has_key?( :relay_row ) ).to be true
    end
    it "has no :relay_row data pages for this fixture" do
      expect( subject[:relay_row] ).to be_an_instance_of( Array )
      expect( subject[:relay_row].size ).to eq( 0 )
    end

    it "recognizes a list of :stats data pages" do
      expect( subject.has_key?( :stats ) ).to be true
    end
    it "has no :stat (header) data page" do
      expect( subject[:stats] ).to be_an_instance_of( Array )
      expect( subject[:stats].size ).to eq( 0 )
    end

    it "recognizes a list of :stats details data pages" do
      expect( subject.has_key?( :stats_details ) ).to be true
    end
    it "has no :stats details data pages for this fixture" do
      expect( subject[:stats_details] ).to be_an_instance_of( Array )
      expect( subject[:stats_details].size ).to eq( 0 )
    end

    it "recognizes a list of :team_ranking data pages" do
      expect( subject.has_key?( :team_ranking ) ).to be true
    end
    it "has just 1 :team_ranking (header) data page" do
      expect( subject[:team_ranking] ).to be_an_instance_of( Array )
      expect( subject[:team_ranking].size ).to eq( 1 )
    end

    it "recognizes a list of :ranking_row data pages" do
      expect( subject.has_key?( :ranking_row ) ).to be true
    end
    it "has the exact amount of :ranking_rows for this fixture" do
      expect( subject[:ranking_row] ).to be_an_instance_of( Array )
      expect( subject[:ranking_row].size ).to eq( 134 )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # In-depth check for each CATEGORY_HEADER found:
  [
    "1500-stile libero-femminile-Under 25",
    "1500-stile libero-femminile-Master 30",
    "1500-stile libero-femminile-Master 35",
    "1500-stile libero-femminile-Master 40",
    "50-stile libero-maschile-Master 30",
    "50-stile libero-maschile-Master 45"
  ].each do |string_key|
    it "recognizes a '#{string_key}' category header" do
      headers_list = @result_hash[:parse_result][:category_header]
      recognized_result = headers_list.find_all { |category_hdr_hash|
        category_hdr_hash[:id] == string_key
      }.first

      expect( recognized_result ).to be_an_instance_of( Hash )
      expect( recognized_result[:fields] ).to be_an_instance_of( Hash )
      # We use "include" instead of "contain_exactly" because :base_time
      # may or may not be found:
      expect( recognized_result[:fields].keys ).to include( :distance, :style, :gender, :category_group )
      expect( recognized_result[:import_text] ).to be_an_instance_of( String )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
