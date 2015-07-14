# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin_result_consts'


describe "FinResultParser parsing fixture file 4,", type: :integration do
  # We need to parse the fixture file just once to speed-up tests:
  before( :all ) do
    @result_hash = V2::FinResultParser.parse_txt_file( File.join(Rails.root, 'test/fixtures/samples/fixture4-ris20121112bologna-sample.txt') )
  end

  it "returns an Hash" do
    expect( @result_hash ).to be_an_instance_of( Hash )
  end
  it "has the :parse_result, :line_count, :total_data_rows & :full_text_file_contents keys" do
    expect( @result_hash.keys ).to contain_exactly(
      :parse_result, :parsing_defs, :line_count, :total_data_rows, :full_text_file_contents
    )
  end
  #-- -------------------------------------------------------------------------
  #++

  describe "the :parse_result sub-member Hash," do
    subject { @result_hash[:parse_result] }

    it "recognizes a list of :meeting_header data pages" do
      expect( subject.has_key?( :meeting_header ) ).to be true
    end
    it "has just 1 :meeting_header data page for this fixture" do
      expect( subject[:meeting_header] ).to be_an_instance_of( Array )
      expect( subject[:meeting_header].size ).to eq( 1 )
    end
    context "for the :meeting_header data page," do
      it "has the exact values for all :meeting_header fields of this fixture" do
        data_page_field_hash = subject[:meeting_header].first[:fields]
        expect( data_page_field_hash ).to be_an_instance_of( Hash )
        expect( data_page_field_hash[ :title ]         ).to eq( '10° Trofeo De Akker Team ASI' )
        expect( data_page_field_hash[ :meeting_dates ] ).to eq( '11 novembre 2012' )
        expect( data_page_field_hash[ :organization ]  ).to eq( 'De Akker' )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    it "recognizes a list of :category_header data pages" do
      expect( subject.has_key?( :category_header ) ).to be true
    end
    it "has the exact amount of :category_header data pages for this fixture" do
      expect( subject[:category_header] ).to be_an_instance_of( Array )
      expect( subject[:category_header].size ).to eq( 15 )
    end

    it "recognizes a list of :result_row data pages" do
      expect( subject.has_key?( :result_row ) ).to be true
    end
    it "has the exact amount of :result_rows for this fixture" do
      expect( subject[:result_row] ).to be_an_instance_of( Array )
      expect( subject[:result_row].size ).to eq( 127 )
    end

    it "recognizes a list of :relay_header data pages" do
      expect( subject.has_key?( :relay_header ) ).to be true
    end
    it "has the exact amount of :relay_header data pages for this fixture" do
      expect( subject[:relay_header] ).to be_an_instance_of( Array )
      expect( subject[:relay_header].size ).to eq( 5 )
    end

    it "recognizes a list of :relay_row data pages" do
      expect( subject.has_key?( :relay_row ) ).to be true
    end
    it "has the exact amount of :relay_row data pages for this fixture" do
      expect( subject[:relay_row] ).to be_an_instance_of( Array )
      expect( subject[:relay_row].size ).to eq( 26 )
    end

    it "recognizes a list of :team_stats data pages" do
      expect( subject.has_key?( :team_stats ) ).to be true
    end
    it "has no rows for the :team_stats (header) data page" do
      expect( subject[:team_stats] ).to be_an_instance_of( Array )
      expect( subject[:team_stats].size ).to eq( 0 )
    end

    it "recognizes a list of :stats data pages" do
      expect( subject.has_key?( :stats ) ).to be true
    end
    it "has no rows for the :stat (header) data page" do
      expect( subject[:stats] ).to be_an_instance_of( Array )
      expect( subject[:stats].size ).to eq( 0 )
    end

    it "recognizes a list of :stats details data pages" do
      expect( subject.has_key?( :stats_details ) ).to be true
    end
    it "has the exact amount of :stats details data pages for this fixture" do
      expect( subject[:stats_details] ).to be_an_instance_of( Array )
      expect( subject[:stats_details].size ).to eq( 1 )
    end
    context "for the :stats_details data page," do
      it "has the exact values for all :stats_details of this fixture" do
        data_page_field_hash = subject[:stats_details].first[:fields]
        expect( data_page_field_hash ).to be_an_instance_of( Hash )
        expect( data_page_field_hash[ :teams_tot ]        ).to eq( '58' )
        expect( data_page_field_hash[ :teams_presence ]   ).to eq( '56' )
        expect( data_page_field_hash[ :swimmer_tot ]      ).to eq( '650' )
        expect( data_page_field_hash[ :swimmer_presence ] ).to eq( '590' )
        expect( data_page_field_hash[ :entries_tot ]      ).to eq( '1248' )
        expect( data_page_field_hash[ :entries_presence ] ).to eq( '1107' )
        expect( data_page_field_hash[ :disqual_tot ]      ).to eq( '27' )
        expect( data_page_field_hash[ :withdrawals_tot ]  ).to eq( '5' )
      end
    end

    it "recognizes a list of :team_ranking data pages" do
      expect( subject.has_key?( :team_ranking ) ).to be true
    end
    it "has no rows for the :team_ranking (header) data page" do
      expect( subject[:team_ranking] ).to be_an_instance_of( Array )
      expect( subject[:team_ranking].size ).to eq( 0 )
    end

    it "recognizes a list of :ranking_row data pages" do
      expect( subject.has_key?( :ranking_row ) ).to be true
    end
    it "has the exact amount of :ranking_rows for this fixture" do
      expect( subject[:ranking_row] ).to be_an_instance_of( Array )
# DEBUG
#      team_name_list = subject[:ranking_row].map{ |row| row[:fields][:team_name] }
#      puts "\r\n" << team_name_list.inspect
      expect( subject[:ranking_row].size ).to eq( 56 )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # In-depth check for each CATEGORY_HEADER found:
  [
    "50-farfalla-femminile-Under 25",
    "50-farfalla-femminile-Master 25",
    "50-farfalla-femminile-Master 30",

    "100-stile libero-femminile-Under 25",
    "100-stile libero-femminile-Master 25",
    "100-stile libero-femminile-Master 30",

    "50-rana-femminile-Under 25",
    "50-rana-femminile-Master 25",
    "50-rana-femminile-Master 30",

    "50-dorso-femminile-Under 25",
    "50-dorso-femminile-Master 25",
    "50-dorso-femminile-Master 30",

    "100-misti-femminile-Under 25",
    "100-misti-femminile-Master 25",
    "100-misti-femminile-Master 30"
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

  # In-depth check for each RELAY_HEADER found:
  [
    "mistaffetta 4x50 mista-M100-119",
    "mistaffetta 4x50 mista-M120-159",
    "mistaffetta 4x50 mista-M160-199",
    "mistaffetta 4x50 mista-M200-239",
    "mistaffetta 4x50 mista-M240-279"
  ].each do |string_key|
    it "recognizes a '#{string_key}' relay header" do
      headers_list = @result_hash[:parse_result][:relay_header]
      recognized_result = headers_list.find_all { |relay_hdr_hash|
        relay_hdr_hash[:id] == string_key
      }.first

      expect( recognized_result ).to be_an_instance_of( Hash )
      expect( recognized_result[:fields] ).to be_an_instance_of( Hash )
      expect( recognized_result[:fields].keys ).to include( :type, :category_group )
      expect( recognized_result[:import_text] ).to be_an_instance_of( String )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
