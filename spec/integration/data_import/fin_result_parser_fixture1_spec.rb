# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin_result_consts'


describe "FinResultParser parsing fixture file 1,", type: :integration do
  # We need to parse the fixture file just once to speed-up tests:
  before( :all ) do
    @result_hash = V2::FinResultParser.parse_txt_file( File.join(Rails.root, 'test/fixtures/samples/fixture1-ris20120414molinella-sample.txt') )
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


  describe "[:parse_result] sub-member Hash," do
    subject { @result_hash[:parse_result] }

    it "recognizes a list of :meeting_header data pages" do
      expect( subject.has_key?( :meeting_header ) ).to be true
    end
    it "has no rows for the :meeting_header (header) data page" do
      expect( subject[:meeting_header] ).to be_an_instance_of( Array )
      expect( subject[:meeting_header].size ).to eq( 0 )
    end
    #-- -----------------------------------------------------------------------
    #++

    it "recognizes a list of :category_header data pages" do
      expect( subject.has_key?( :category_header ) ).to be true
    end
    it "has the exact amount of :category_header data pages for this fixture" do
      expect( subject[:category_header] ).to be_an_instance_of( Array )
      expect( subject[:category_header].size ).to eq( 16 )
    end

    context "for :category_header rows," do
      # (U25 has no base-time)
      context "in '50-stile libero-femminile-Master 25'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:category_header][1][:fields]
# DEBuG
#          puts "\r\nMem keys: #{ subject[:category_header].map{|row_hash| row_hash[:id] }.join("\r\n") }"
#          puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :distance ]       ).to eq( '50' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'stile libero' )
          expect( data_page_field_hash[ :gender ]         ).to eq( 'femminile' )
          expect( data_page_field_hash[ :category_group ] ).to eq( 'Master 25' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "0'26\"26" )
        end
      end
      context "in '50-stile libero-femminile-Master 30'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:category_header][2][:fields]
# DEBuG
#          puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :distance ]       ).to eq( '50' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'stile libero' )
          expect( data_page_field_hash[ :gender ]         ).to eq( 'femminile' )
          expect( data_page_field_hash[ :category_group ] ).to eq( 'Master 30' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "0'26\"10" )
        end
      end
      context "in '50-stile libero-maschile-Master 50'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:category_header][3][:fields]
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :distance ]       ).to eq( '50' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'stile libero' )
          expect( data_page_field_hash[ :gender ]         ).to eq( 'maschile' )
          expect( data_page_field_hash[ :category_group ] ).to eq( 'Master 50' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "0'24\"67" )
        end
      end
      context "in '50-stile libero-maschile-Master 55'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:category_header][4][:fields]
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :distance ]       ).to eq( '50' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'stile libero' )
          expect( data_page_field_hash[ :gender ]         ).to eq( 'maschile' )
          expect( data_page_field_hash[ :category_group ] ).to eq( 'Master 55' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "0'25\"46" )
        end
      end
      context "in '50-stile libero-maschile-Master 60'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:category_header][5][:fields]
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :distance ]       ).to eq( '50' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'stile libero' )
          expect( data_page_field_hash[ :gender ]         ).to eq( 'maschile' )
          expect( data_page_field_hash[ :category_group ] ).to eq( 'Master 60' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "0'26\"71" )
        end
      end
      context "in '50-stile libero-maschile-Master 65'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:category_header][6][:fields]
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :distance ]       ).to eq( '50' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'stile libero' )
          expect( data_page_field_hash[ :gender ]         ).to eq( 'maschile' )
          expect( data_page_field_hash[ :category_group ] ).to eq( 'Master 65' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "0'27\"16" )
        end
      end
      context "in '50-stile libero-maschile-Master 70'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:category_header][7][:fields]
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :distance ]       ).to eq( '50' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'stile libero' )
          expect( data_page_field_hash[ :gender ]         ).to eq( 'maschile' )
          expect( data_page_field_hash[ :category_group ] ).to eq( 'Master 70' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "0'29\"16" )
        end
      end
      # (U25 has no base-time)
      context "in '400-stile libero-femminile-Master 25'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:category_header][9][:fields]
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :distance ]       ).to eq( '400' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'stile libero' )
          expect( data_page_field_hash[ :gender ]         ).to eq( 'femminile' )
          expect( data_page_field_hash[ :category_group ] ).to eq( 'Master 25' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "4'26\"77" )
        end
      end
      context "in '400-stile libero-femminile-Master 30'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:category_header][10][:fields]
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :distance ]       ).to eq( '400' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'stile libero' )
          expect( data_page_field_hash[ :gender ]         ).to eq( 'femminile' )
          expect( data_page_field_hash[ :category_group ] ).to eq( 'Master 30' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "4'26\"19" )
        end
      end
      context "in '400-stile libero-femminile-Master 35'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:category_header][11][:fields]
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :distance ]       ).to eq( '400' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'stile libero' )
          expect( data_page_field_hash[ :gender ]         ).to eq( 'femminile' )
          expect( data_page_field_hash[ :category_group ] ).to eq( 'Master 35' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "4'28\"94" )
        end
      end
      # (U25 has no base-time)
      context "in '100-misti-femminile-Master 25'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:category_header][13][:fields]
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :distance ]       ).to eq( '100' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'misti' )
          expect( data_page_field_hash[ :gender ]         ).to eq( 'femminile' )
          expect( data_page_field_hash[ :category_group ] ).to eq( 'Master 25' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "1'05\"40" )
        end
      end
      context "in '100-misti-femminile-Master 30'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:category_header][14][:fields]
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :distance ]       ).to eq( '100' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'misti' )
          expect( data_page_field_hash[ :gender ]         ).to eq( 'femminile' )
          expect( data_page_field_hash[ :category_group ] ).to eq( 'Master 30' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "1'05\"11" )
        end
      end
      context "in '100-misti-femminile-Master 35'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:category_header][15][:fields]
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :distance ]       ).to eq( '100' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'misti' )
          expect( data_page_field_hash[ :gender ]         ).to eq( 'femminile' )
          expect( data_page_field_hash[ :category_group ] ).to eq( 'Master 35' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "1'06\"87" )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    it "recognizes a list of :result_row data pages" do
      expect( subject.has_key?( :result_row ) ).to be true
    end
    it "has the exact amount of :result_rows for this fixture" do
      expect( subject[:result_row] ).to be_an_instance_of( Array )
      expect( subject[:result_row].size ).to eq( 69 )
    end
    #-- -----------------------------------------------------------------------
    #++

    it "recognizes a list of :relay_header data pages" do
      expect( subject.has_key?( :relay_header ) ).to be true
    end
    it "has the exact amount of :relay_header data pages for this fixture" do
      expect( subject[:relay_header] ).to be_an_instance_of( Array )
      expect( subject[:relay_header].size ).to eq( 4 )
    end

    context "for :relay_header rows," do
      context "in 'mistaffetta 4x50 stile libero-M160-199'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:relay_header][0][:fields]
# DEBuG
#          puts "\r\nMem keys: #{ subject[:relay_header].map{|row_hash| row_hash[:id] }.join("\r\n") }"
#          puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :type ]           ).to eq( 'mistaffetta 4x50 stile libero' )
          expect( data_page_field_hash[ :distance ]       ).to eq( '4x50' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'stile libero' )
          expect( data_page_field_hash[ :gender ]         ).to be nil
          expect( data_page_field_hash[ :category_group ] ).to eq( 'M160-199' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "1'45\"29" )
        end
      end
      context "in 'mistaffetta 4x50 stile libero-M240-279'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:relay_header][1][:fields]
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :type ]           ).to eq( 'mistaffetta 4x50 stile libero' )
          expect( data_page_field_hash[ :distance ]       ).to eq( '4x50' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'stile libero' )
          expect( data_page_field_hash[ :gender ]         ).to be nil
          expect( data_page_field_hash[ :category_group ] ).to eq( 'M240-279' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "2'02\"17" )
        end
      end
      # [Steve, 20141206] As per current implementation, same id-key rows will be parsed
      # and added twice, even though they are duplicate rows.
      context "in 'mistaffetta 4x50 stile libero-M160-199'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:relay_header][2][:fields]
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :type ]           ).to eq( 'mistaffetta 4x50 stile libero' )
          expect( data_page_field_hash[ :distance ]       ).to eq( '4x50' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'stile libero' )
          expect( data_page_field_hash[ :gender ]         ).to be nil
          expect( data_page_field_hash[ :category_group ] ).to eq( 'M160-199' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "1'45\"29" )
        end
      end
      context "in 'mistaffetta 4x50 stile libero-M240-279'," do
        it "has the exact values for this fixture" do
          data_page_field_hash = subject[:relay_header][3][:fields]
          expect( data_page_field_hash ).to be_an_instance_of( Hash )
          expect( data_page_field_hash[ :type ]           ).to eq( 'mistaffetta 4x50 stile libero' )
          expect( data_page_field_hash[ :distance ]       ).to eq( '4x50' )
          expect( data_page_field_hash[ :style ]          ).to eq( 'stile libero' )
          expect( data_page_field_hash[ :gender ]         ).to be nil
          expect( data_page_field_hash[ :category_group ] ).to eq( 'M240-279' )
          expect( data_page_field_hash[ :base_time ]      ).to eq( "2'02\"17" )
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    it "recognizes a list of :relay_row data pages" do
      expect( subject.has_key?( :relay_row ) ).to be true
    end
    it "has the exact amount of :relay_rows for this fixture" do
      expect( subject[:relay_row] ).to be_an_instance_of( Array )
      expect( subject[:relay_row].size ).to eq( 8 )
    end
    #-- -----------------------------------------------------------------------
    #++

    it "recognizes a list of :stats data pages" do
      expect( subject.has_key?( :stats ) ).to be true
    end
    it "has just 0 rows (no data extracted) for the :stat (header) data page" do
      expect( subject[:stats] ).to be_an_instance_of( Array )
      expect( subject[:stats].size ).to eq( 0 )
    end

    it "recognizes a list of :stats details data pages" do
      expect( subject.has_key?( :stats_details ) ).to be true
    end
    it "has just 1 :stats detail data page for this fixture" do
      expect( subject[:stats_details] ).to be_an_instance_of( Array )
      expect( subject[:stats_details].size ).to eq( 1 )
    end
    context "for the :stats_details data page," do
      it "has the exact values for all :stats_details of this fixture" do
        data_page_field_hash = subject[:stats_details].first[:fields]
        expect( data_page_field_hash ).to be_an_instance_of( Hash )
        expect( data_page_field_hash[ :teams_tot ]        ).to eq( '107' )
        expect( data_page_field_hash[ :teams_presence ]   ).to eq( '99' )
        expect( data_page_field_hash[ :swimmer_tot ]      ).to eq( '702' )
        expect( data_page_field_hash[ :swimmer_presence ] ).to eq( '630' )
        expect( data_page_field_hash[ :entries_tot ]      ).to eq( '1263' )
        expect( data_page_field_hash[ :entries_presence ] ).to eq( '1091' )
        expect( data_page_field_hash[ :disqual_tot ]      ).to eq( '25' )
        expect( data_page_field_hash[ :withdrawals_tot ]  ).to eq( '3' )
      end
    end
    #-- -----------------------------------------------------------------------
    #++

    # The key to the array of data-pages must always be present,
    # even though the array of data pages is empty:
    it "recognizes a list of :team_ranking data pages" do
      expect( subject.has_key?( :team_ranking ) ).to be true
    end
    # We want to be sure that the stats sub-page about the
    # enlisted Teams won't be mistaken for a :team_ranking
    # data-page:
    it "has no :team_ranking (header) data pages" do
      expect( subject[:team_ranking] ).to be_an_instance_of( Array )
      expect( subject[:team_ranking].size ).to eq( 0 )
    end

    # The key to the array of data-pages must always be present,
    # even though the array of data pages is empty:
    it "recognizes a list of :ranking_row data pages" do
      expect( subject.has_key?( :ranking_row ) ).to be true
    end
    it "has no :ranking_rows" do
      expect( subject[:ranking_row] ).to be_an_instance_of( Array )
      expect( subject[:ranking_row].size ).to eq( 0 )
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++

  # In-depth check for each CATEGORY_HEADER found:
  [
    "50-stile libero-femminile-Under 25",
    "50-stile libero-femminile-Master 25",
    "50-stile libero-femminile-Master 30",
    "50-stile libero-maschile-Master 50",
    "50-stile libero-maschile-Master 55",
    "50-stile libero-maschile-Master 60",
    "50-stile libero-maschile-Master 65",
    "50-stile libero-maschile-Master 70",
    "400-stile libero-femminile-Under 25",
    "400-stile libero-femminile-Master 25",
    "400-stile libero-femminile-Master 30",
    "400-stile libero-femminile-Master 35",
    "100-misti-femminile-Under 25",
    "100-misti-femminile-Master 25",
    "100-misti-femminile-Master 30",
    "100-misti-femminile-Master 35"
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

# FIXME We store duplicated rows even if the memstore ID is the same, and this is surely a waste of memory...

  # In-depth check for each RELAY_HEADER found:
  [
    "mistaffetta 4x50 stile libero-M160-199",
    "mistaffetta 4x50 stile libero-M240-279",
    "mistaffetta 4x50 stile libero-M160-199",
    "mistaffetta 4x50 stile libero-M240-279"
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
