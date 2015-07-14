# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin_result_consts'


describe "FinResultParser parsing fixture file 2,", type: :integration do
  # We need to parse the fixture file just once to speed-up tests:
  before( :all ) do
    @result_hash = V2::FinResultParser.parse_txt_file( File.join(Rails.root, 'test/fixtures/samples/fixture2-ris20111203riccione-sample.txt') )
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
    it "has the exact amount of :meeting_header (header) data page" do
      expect( subject[:meeting_header] ).to be_an_instance_of( Array )
      expect( subject[:meeting_header].size ).to eq( 1 )
    end

    context "for :meeting_header rows," do
      context "in [:meeting_header].first," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:meeting_header].first[:fields]
# DEBuG
#          puts "\r\nMem keys: #{ subject[:meeting_header].map{|row_hash| row_hash[:id] }.join("\r\n") }"
#          puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :title ]         ).to eq( '8° Trofeo Città di Riccione' )
          expect( data_page_field_hash[ :meeting_dates ] ).to eq( '3/4 Dicembre 2011' )
          expect( data_page_field_hash[ :organization ]  ).to eq( 'POL. COM. RICCIONE' )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    it "recognizes a list of :category_header data pages" do
      expect( subject.has_key?( :category_header ) ).to be true
    end
    it "has the exact amount of :category_header data pages for this fixture" do
      expect( subject[:category_header] ).to be_an_instance_of( Array )
      expect( subject[:category_header].size ).to eq( 6 )
    end
    #-- -----------------------------------------------------------------------
    #++

    it "recognizes a list of :result_row data pages" do
      expect( subject.has_key?( :result_row ) ).to be true
    end
    it "has the exact amount of :result_rows for this fixture" do
      expect( subject[:result_row] ).to be_an_instance_of( Array )
      expect( subject[:result_row].size ).to eq( 144 )
    end
    #-- -----------------------------------------------------------------------
    #++

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
    #-- -----------------------------------------------------------------------
    #++

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
    #-- -----------------------------------------------------------------------
    #++

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
