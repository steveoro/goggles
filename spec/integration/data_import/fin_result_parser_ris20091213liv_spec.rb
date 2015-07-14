# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin_result_consts'


describe "FinResultParser parsing FIN Result file type 2,", type: :integration do
  # We need to parse the fixture file just once to speed-up tests:
  before( :all ) do
    @result_hash = V2::FinResultParser.parse_txt_file(
      File.join(Rails.root, 'test/fixtures/samples/ris20091213livorno-sample.txt'),
      nil,                                          # We don't care for logging, here
      V2::Fin2ResultDefs.new                            # This will forcibly plug-in the correct parsing engine
    )
# DEBUG
#    [
#      :meeting_header, :event_individual, :event_relay, :team_ranking, :stats,
#      :stats_details_1, :stats_details_2, :relay_row
#    ].each do |key|
#      puts "\r\n--- @result_hash[:parse_result][#{key}]:\r\n" <<
#           "[ #{@result_hash[:parse_result][key].map{|hash| hash.inspect }.join("\r\n")} ]"
#    end
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
# DEBuG
#        puts "\r\nMem keys: #{ subject[:meeting_header].map{|row_hash| row_hash[:id] }.join("\r\n") }"
#        puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
        expect( data_page_field_hash ).to be_an_instance_of( Hash )
        expect( data_page_field_hash[ :title ]         ).to eq( 'XI° Meeting Degli Auguri  VII° Campionato Italiano U N V S' )
        expect( data_page_field_hash[ :meeting_dates ] ).to eq( 'Domenica 13 Dicembre 2009' )
        expect( data_page_field_hash[ :organization ]  ).to be nil
      end
    end
    #-- -----------------------------------------------------------------------
    #++


    it "recognizes a list of :category_header data pages" do
      expect( subject.has_key?( :event_individual ) ).to be true
    end
    it "has the exact amount of :category_header data pages for this fixture" do
      expect( subject[:event_individual] ).to be_an_instance_of( Array )
      expect( subject[:event_individual].size ).to eq( 9 )
    end

    context "for :event_individual rows," do
      [
        [ 0, '200', 'Stile Libero', 'Femmine' ],
        [ 1, '200', 'Stile Libero', 'Maschi' ],
        [ 2, '100', 'Rana', 'Femmine' ],
        [ 3, '100', 'Rana', 'Maschi' ],
        [ 4, '100', 'Farfalla', 'Femmine' ],
        [ 5, '100', 'Farfalla', 'Maschi' ],
        [ 6, '100', 'Stile Libero', 'Femmine' ],
        [ 7, '200', 'Rana', 'Femmine' ],
        [ 8, '50', 'Farfalla', 'Femmine' ]
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
      expect( subject[:result_row].size ).to eq( 266 )
    end

    # TODO
    context "for :result_row rows," do
      [
        # '200 SL F' samples
#        [  0, '1', nil, 'VOLPI GIULIA', 'U 25', 'OLIMPIA VIGNOLA', '02 39 78', nil ],

        # '200 SL M' samples
#        [ 37, '4', nil, "VIELMINI ILARIA", 'M 30', 'CANOTTIERI ARNO PISA', '01 35 06', '698,09' ],

        # '100 RA F' samples
#        [ 58, '1', nil, "LABARDI ELENA", 'U 25', 'ESSECI NUOTO', '01 26 58', nil ],

        # '100 RA M' samples
#        [ 80, '2', nil, "PARISI ANTONELLA", 'M 45', 'US VIS NOVA', '02 01 32', '561,16' ],

        # '100 FA F' samples
#        [ 107, '2', nil, "VARRONI SILVIA", 'U 25', 'OLIMPIA VIGNOLA', '01 15 77', nil ],

        # '100 FA M' samples
#        [ 146, '2', nil, "VINCENZI SONIA", 'M 45', 'DLF NUOTO LIVORNO', '03 43 29', '692,55' ],

        # '100 SL F' samples
#        [ 182, '3', nil, "ARMENTO KRAMMER ASTRID MA", 'M 45', 'NUOTO LUCCA CAPANNORI', '03 58 47', '728,77' ],

        # '200 RA F' samples
#        [ 211, '1', nil, "BIANCHI VERONICA", 'U 25', 'CIRCOLO NUOTO LUCCA', '00 39 42', nil ],

        # '50 FA F' samples
#        [ 234, '5', nil, "SALVIANTI FRANCESCA", 'M 30', 'AMICI DEL NUOTO FIRENZE', '00 55 73', '546,92' ],
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
      expect( subject[:relay_row].size ).to eq( 27 )
    end

    context "for :relay_row rows," do
      [
#        [ 0, '1', 'CENTRO NUOTO MONTECATINI', '159 (B)', '02 15 80' ],
      ].each do |event_index, result_position, team_name, category, result_time|
        context "in (#{event_index})'#{category}-#{result_position}-#{team_name}'," do
          it "has the exact values for this fixture" do
            data_page_field_hash = subject[:relay_row][event_index][:fields]
# DEBuG
#            puts "\r\nMem keys: #{ subject[:relay_row].map{|row_hash| row_hash[:id] }.join("\r\n") }"
#            puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
            expect( data_page_field_hash ).to be_an_instance_of( Hash )
            expect( data_page_field_hash[ :result_position ] ).to eq( result_position )
            expect( data_page_field_hash[ :team_name ]       ).to eq( team_name )
            expect( data_page_field_hash[ :category ]        ).to eq( category )
            expect( data_page_field_hash[ :result_time ]     ).to eq( result_time )
          end
        end
      end
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
        expect( data_page_field_hash[ :teams_tot ]        ).to eq( '64' )
        expect( data_page_field_hash[ :teams_presence ]   ).to eq( '59' )
        expect( data_page_field_hash[ :swimmer_tot ]      ).to eq( '590' )
        expect( data_page_field_hash[ :swimmer_presence ] ).to eq( '514' )
        expect( data_page_field_hash[ :entries_tot ]      ).to eq( '1128' )
        expect( data_page_field_hash[ :entries_presence ] ).to eq( '974' )
        expect( data_page_field_hash[ :disqual_tot ]      ).to eq( '10' )
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
      expect( subject[:ranking_row].size ).to eq( 59 )
    end

    context "for :ranking_row rows," do
      [
#        [  0 , '1', nil, 'DLF NUOTO LIVORNO', '145298,42' ],
      ].each do |event_index, result_position, team_code, team_name, result_score|
        context "in (#{event_index})'#{result_position}-#{team_code}-#{team_name}'," do
          it "has the exact values for this fixture" do
            data_page_field_hash = subject[:ranking_row][event_index][:fields]
# DEBuG
#            puts "\r\nMem keys: #{ subject[:ranking_row].map{|row_hash| row_hash[:id] }.join("\r\n") }"
#            puts "\r\nCurrent: #{ data_page_field_hash.inspect }"
            expect( data_page_field_hash ).to be_an_instance_of( Hash )
            expect( data_page_field_hash[ :result_position ] ).to eq( result_position )
            expect( data_page_field_hash[ :team_code ]        ).to eq( team_code )
            expect( data_page_field_hash[ :team_name ]       ).to eq( team_name )
            expect( data_page_field_hash[ :result_score ]     ).to eq( result_score )
          end
        end
      end
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
