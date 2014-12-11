# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require 'data_import/services/context_detector'
#require 'data_import/services/token_extractor'
#require 'data_import/fin_result_consts'


describe "FinResultParser parsing FIN Result file type 2,", type: :integration do
  # We need to parse the fixture file just once to speed-up tests:
  before( :all ) do
    @result_hash = FinResultParser.parse_txt_file(
      File.join(Rails.root, 'test/fixtures/samples/ris20081221mussi-sample.txt'),
      nil,                                          # We don't care for logging, here
      Fin2ResultDefs.new                            # This will forcibly plug-in the correct parsing engine
    )
# DEBUG
    [
      :meeting_header, :event_individual, :event_relay, :team_ranking, :stats,
      :stats_details_1, :stats_details_2, :relay_row
    ].each do |key|
      puts "\r\n--- @result_hash[:parse_result][#{key}]:\r\n" <<
           "[ #{@result_hash[:parse_result][key].map{|hash| hash.inspect }.join("\r\n")} ]"
    end
  end

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
      expect( subject.has_key?( :event_individual ) ).to be true
    end
    it "has the exact amount of :category_header data pages for this fixture" do
      expect( subject[:event_individual] ).to be_an_instance_of( Array )
      expect( subject[:event_individual].size ).to eq( 9 )
    end

    context "for :event_individual rows," do
      [
        [ 0, '200', 'Farfalla', 'Femmine' ],
        [ 1, '200', 'Farfalla', 'Maschi' ],
        [ 2, '100', 'Misti', 'Femmine' ],
        [ 3, '100', 'Misti', 'Maschi' ],
        [ 4, '200', 'Rana', 'Femmine' ],
        [ 5, '200', 'Rana', 'Maschi' ],
        [ 6, '50', 'Farfalla', 'Femmine' ],
        [ 7, '50', 'Farfalla', 'Maschi' ],
        [ 8, '50', 'Dorso', 'Femmine' ]
      ].each do |event_index, distance, style, gender|
        context "in '#{distance}-#{style}-#{gender}'," do
          it "has the exact values for this fixture" do
            data_page_field_hash = subject[:event_individual][event_index][:fields]
# DEBuG
#            puts "\r\nMem keys: #{ subject[:event_individual].map{|row_hash| row_hash[:id] }.join("\r\n") }"
#            puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
            expect( data_page_field_hash ).to be_an_instance_of( Hash )
            expect( data_page_field_hash[ :distance ] ).to eq( distance )
            expect( data_page_field_hash[ :style ]    ).to eq( style )
            expect( data_page_field_hash[ :gender ]   ).to eq( gender )
          end
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
      expect( subject[:result_row].size ).to eq( 283 )
    end

    context "for :result_row rows," do
      [
        [ 0, '1', 'TOS000695', 'MAGNELLI SAMUELA', '1981', 'FIORENTINA NUOTO',  '02 27 98', '926,68' ]
#        [ 1, '', '', '', '', '', '', '', '' ]
      ].each do |event_index, result_position, team_code, swimmer_name, swimmer_year, team_name, result_time, result_score|
        context "in (#{event_index})'#{result_position}-#{team_code}-#{result_time}'," do
          it "has the exact values for this fixture" do
            data_page_field_hash = subject[:result_row][event_index][:fields]
# DEBuG
#            puts "\r\nMem keys: #{ subject[:result_row].map{|row_hash| row_hash[:id] }.join("\r\n") }"
#            puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
            expect( data_page_field_hash ).to be_an_instance_of( Hash )
            expect( data_page_field_hash[ :result_position ] ).to eq( result_position )
            expect( data_page_field_hash[ :team_code ]       ).to eq( team_code )
            expect( data_page_field_hash[ :swimmer_name ]    ).to eq( swimmer_name )
            expect( data_page_field_hash[ :swimmer_year ]    ).to eq( swimmer_year )
            expect( data_page_field_hash[ :team_name ]       ).to eq( team_name )
            expect( data_page_field_hash[ :result_time ]     ).to eq( result_time )
            expect( data_page_field_hash[ :result_score ]    ).to eq( result_score )
          end
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    it "recognizes a list of :relay_header data pages" do
      expect( subject.has_key?( :event_relay ) ).to be true
    end
    it "has the exact amount of :relay_header data pages for this fixture" do
      expect( subject[:event_relay] ).to be_an_instance_of( Array )
      expect( subject[:event_relay].size ).to eq( 2 )
    end

    context "for :event_relay rows," do
      [
        [ 0, 'Staffetta 4x50 Stile Libero Femmine', '4x50', 'Stile Libero', 'Femmine' ],
        [ 1, 'Staffetta 4x50 Stile Libero Maschi', '4x50', 'Stile Libero', 'Maschi' ]
      ].each do |event_index, type, distance, style, gender|
        context "in '#{distance}-#{style}-#{gender}'," do
          it "has the exact values for this fixture" do
            data_page_field_hash = subject[:event_relay][event_index][:fields]
# DEBuG
#            puts "\r\nMem keys: #{ subject[:event_relay].map{|row_hash| row_hash[:id] }.join("\r\n") }"
#            puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
            expect( data_page_field_hash ).to be_an_instance_of( Hash )
            expect( data_page_field_hash[ :type ]     ).to eq( type )
            expect( data_page_field_hash[ :distance ] ).to eq( distance )
            expect( data_page_field_hash[ :style ]    ).to eq( style )
            expect( data_page_field_hash[ :gender ]   ).to eq( gender )
          end
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
      expect( subject[:relay_row].size ).to eq( 2 )
    end
    #-- -----------------------------------------------------------------------
    #++


    it "recognizes a list of :stats data pages" do
      expect( subject.has_key?( :stats ) ).to be true
    end
    it "has no rows for the :stat (header) data page" do
      expect( subject[:stats] ).to be_an_instance_of( Array )
      expect( subject[:stats].size ).to eq( 0 )
    end
    #-- -----------------------------------------------------------------------
    #++


    it "does not recognizes a list of :stats details data pages" do
      expect( subject.has_key?( :stats_details ) ).to be false
    end
    it "recognizes a list of :stats details data pages" do
      expect( subject.has_key?( :stats_details_1 ) ).to be true
    end
    it "has just 1 :stats detail data page for this fixture" do
      expect( subject[:stats_details_1] ).to be_an_instance_of( Array )
      expect( subject[:stats_details_1].size ).to eq( 0 )
    end
    it "recognizes a list of :stats details data pages" do
      expect( subject.has_key?( :stats_details_2 ) ).to be true
    end
    it "has just 1 :stats detail data page for this fixture" do
      expect( subject[:stats_details_2] ).to be_an_instance_of( Array )
      expect( subject[:stats_details_2].size ).to eq( 1 )
    end

    context "for the :stats_details_2 data page," do
      it "has the exact values for all :stats_details of this fixture" do
        data_page_field_hash = subject[:stats_details_2].first[:fields]
        expect( data_page_field_hash ).to be_an_instance_of( Hash )
        expect( data_page_field_hash[ :teams_tot ]        ).to eq( '75' )
        expect( data_page_field_hash[ :teams_presence ]   ).to eq( '67' )
        expect( data_page_field_hash[ :swimmer_tot ]      ).to eq( '498' )
        expect( data_page_field_hash[ :swimmer_presence ] ).to eq( '413' )
        expect( data_page_field_hash[ :entries_tot ]      ).to eq( '946' )
        expect( data_page_field_hash[ :entries_presence ] ).to eq( '761' )
        expect( data_page_field_hash[ :disqual_tot ]      ).to eq( '17' )
        expect( data_page_field_hash[ :withdrawals_tot ]  ).to eq( '0' )
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    # The key to the array of data-pages must always be present,
    # even though the array of data pages is empty:
    it "recognizes a list of :team_ranking data pages" do
      expect( subject.has_key?( :team_ranking ) ).to be true
    end
    it "has no rows for the :team_ranking (header) data pages" do
      expect( subject[:team_ranking] ).to be_an_instance_of( Array )
      expect( subject[:team_ranking].size ).to eq( 0 )
    end

    # The key to the array of data-pages must always be present,
    # even though the array of data pages is empty:
    it "recognizes a list of :ranking_row data pages" do
      expect( subject.has_key?( :ranking_row ) ).to be true
    end
    it "has the exact amount of :ranking_rows" do
      expect( subject[:ranking_row] ).to be_an_instance_of( Array )
      expect( subject[:ranking_row].size ).to eq( 63 )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

# FIXME We store duplicated rows even if the memstore ID is the same, and this is surely a waste of memory...

  # In-depth check for each RELAY_HEADER found:
  # [
    # "mistaffetta 4x50 stile libero-M160-199",
    # "mistaffetta 4x50 stile libero-M240-279",
    # "mistaffetta 4x50 stile libero-M160-199",
    # "mistaffetta 4x50 stile libero-M240-279"
  # ].each do |string_key|
    # it "recognizes a '#{string_key}' relay header" do
      # headers_list = @result_hash[:parse_result][:relay_header]
      # recognized_result = headers_list.find_all { |relay_hdr_hash|
        # relay_hdr_hash[:id] == string_key
      # }.first
#
      # expect( recognized_result ).to be_an_instance_of( Hash )
      # expect( recognized_result[:fields] ).to be_an_instance_of( Hash )
      # expect( recognized_result[:fields].keys ).to include( :type, :category_group )
      # expect( recognized_result[:import_text] ).to be_an_instance_of( String )
    # end
  # end
  #-- -------------------------------------------------------------------------
  #++
end
