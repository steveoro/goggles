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
      File.join(Rails.root, 'test/fixtures/samples/ris20101212livorno-sample.txt'),
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
        expect( data_page_field_hash[ :title ]         ).to eq( '12.o MEETING DEGLI AUGURI - 8.o CAMPIONATO ITALIANO UNVS' )
        expect( data_page_field_hash[ :meeting_dates ] ).to eq( '12 DICEMBRE 2010' )
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
      expect( subject[:event_individual].size ).to eq( 13 )
    end

    context "for :event_individual rows," do
      [
        [ 0, '200', 'Stile Libero', 'Femmine' ],
        [ 1, '100', 'Dorso', 'Femmine' ],
        [ 2, '100', 'Rana', 'Femmine' ],
        [ 3, '100', 'Farfalla', 'Femmine' ],
        [ 4, '100', 'Farfalla', 'Maschi' ],
        [ 5, '100', 'Stile Libero', 'Femmine' ],
        [ 6, '200', 'Misti', 'Femmine' ],
        [ 7, '200', 'Misti', 'Maschi' ],
        [ 8, '200', 'Rana', 'Femmine' ],
        [ 9, '200', 'Rana', 'Maschi' ],
        [ 10, '50', 'Farfalla', 'Femmine' ],
        [ 11, '50', 'Dorso', 'Femmine' ],
        [ 12, '50', 'Rana', 'Femmine' ]
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
      expect( subject[:result_row].size ).to eq( 304 )
    end

    # TODO
    context "for :result_row rows," do
      [
        # '200 Stile Libero' samples
        [  0, '1', nil, 'VOLPI GIULIA', 'U 25', 'OLIMPIA VIGNOLA', '02 39 78', nil ],
        [  3, '3', nil, "D'ANGINA ELISA", 'M 25', 'CIRCOLO NUOTO LUCCA', '03 08 49', '672,77' ],
        [ 32, '2', nil, "ORVIETO ELEONORA", 'M 65', 'DLF NUOTO LIVORNO', '04 48 36', '588,64' ],
        # '100 Dorso' samples
        [ 37, '4', nil, "VIELMINI ILARIA", 'M 30', 'CANOTTIERI ARNO PISA', '01 35 06', '698,09' ],
        [ 43, '2', nil, "SESENA BARBARA", 'M 40', 'CSI NUOTO OBER FERRARI', '01 34 13', '729,95' ],
        [ 49, '1', nil, "COLORA'  DEBORA", 'M 45', 'DLF NUOTO LIVORNO', '01 43 94', '691,65' ],
        [ 57, '1', nil, "ZANDA GIULIA", 'M 75', 'DLF NUOTO LIVORNO', '02 54 50', '600,80' ],
        # '100 Rana' samples
        [ 58, '1', nil, "LABARDI ELENA", 'U 25', 'ESSECI NUOTO', '01 26 58', nil ],
        [ 63, '1', nil, "CREVAR BOZIDARKA MATILDE", 'M 30', 'CENTRO NUOTO MONTECATINI', '02 09 18', '581,67' ],
        [ 67, '2', nil, "BIANCHI ELENA", 'M 40', 'CSI NUOTO OBER FERRARI', '01 38 64', '783,76' ],
        [ 71, '6', nil, "BONACINI MONICA", 'M 40', 'CSI NUOTO OBER FERRARI', '01 42 69', '752,85' ],
        # '100 Farfalla' samples
        [ 77, '1', nil, "LANINI DANIELA", 'M 40', 'AQUATEMPRA', '02 00 17', '549,39' ],
        [ 80, '2', nil, "PARISI ANTONELLA", 'M 45', 'US VIS NOVA', '02 01 32', '561,16' ],
        [ 81, '1', nil, "PIZZA MONICA", 'M 50', 'NUOTO UISP 2003', '02 47 42', '430,83' ],
        [ 83, '0', nil, "PIEGAIA ANDREA", 'U 25', 'NUOTO LUCCA CAPANNORI', '01 18 91', nil ],
        [ 104, '1', nil, "MELANI AGOSTINO", 'M 65', 'AMICI DEL NUOTO FIRENZE', '01 45 72', '682,94' ],
        # '100 Stile Libero' samples
        [ 107, '2', nil, "VARRONI SILVIA", 'U 25', 'OLIMPIA VIGNOLA', '01 15 77', nil ],
        [ 122, '3', nil, "ZAPPELLI ALESSIA", 'M 35', 'NUOTO VALDINIEVOLE', '01 37 25', '609,56' ],
        [ 136, '2', nil, "ORVIETO ELEONORA", 'M 65', 'DLF NUOTO LIVORNO', '02 15 08', '561,45' ],
        # '200 Misti' samples
        [ 146, '2', nil, "VINCENZI SONIA", 'M 45', 'DLF NUOTO LIVORNO', '03 43 29', '692,55' ],
        [ 148, '2', nil, "FRIGIERI GIOVANNI", 'U 25', 'NUOTATORI MODENESI', '02 53 97', nil ],
        [ 164, '5', nil, "VANNELLI MOSE'", 'M 40', 'DLF NUOTO LIVORNO', '03 13 17', '699,64' ],
        # '200 Rana' samples
        [ 182, '3', nil, "ARMENTO KRAMMER ASTRID MA", 'M 45', 'NUOTO LUCCA CAPANNORI', '03 58 47', '728,77' ],
        [ 188, '1', nil, "BIOLCHINI ANDREA", 'U 25', 'NUOTATORI MODENESI', '02 49 23', nil ],
        [ 210, '1', nil, "CLERICI ALESSANDRO", 'M 70', 'PONTECARREGA NUOTO PN', '04 06 47', '786,55' ],
        # '50 Farfalla' samples
        [ 211, '1', nil, "BIANCHI VERONICA", 'U 25', 'CIRCOLO NUOTO LUCCA', '00 39 42', nil ],
        [ 219, '3', nil, "LEONARDI BARBARA", 'M 35', 'CSI NUOTO PRATO', '00 37 05', '783,81' ],
        [ 225, '1', nil, "RAMAGLI PAOLA", 'M 65', 'DLF NUOTO LIVORNO', '01 01 58', '609,61' ],
        # '50 Dorso' samples
        [ 234, '5', nil, "SALVIANTI FRANCESCA", 'M 30', 'AMICI DEL NUOTO FIRENZE', '00 55 73', '546,92' ],
        [ 239, '2', nil, "SESENA BARBARA", 'M 40', 'CSI NUOTO OBER FERRARI', '00 42 99', '744,82' ],
        [ 265, '1', nil, "CORTI DELIA", 'M 70', 'DLF NUOTO LIVORNO', '01 05 54', '652,58' ],
        # '50 Rana' samples
        [ 271, '3', nil, "CACCAMO CHIARA", 'M 25', 'CANOTTIERI ARNO PISA', '00 43 43', '771,59' ],
        [ 282, '4', nil, "BONACINI MONICA", 'M 40', 'CSI NUOTO OBER FERRARI', '00 46 10', '762,26' ],
        [ 283, '5', nil, "BIANCHI ELENA", 'M 40', 'CSI NUOTO OBER FERRARI', '00 46 95', '748,46' ]
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
      expect( subject[:relay_row].size ).to eq( 25 )
    end

    context "for :relay_row rows," do
      [
        [ 0, '1', 'CENTRO NUOTO MONTECATINI', '159 (B)', '02 15 80' ],
        [ 2, '3', 'NUOTATORI MODENESI', '159 (B)', '02 31 21' ],
        [ 3, '1', 'DLF NUOTO LIVORNO', '199 (C)', '02 14 32' ],
        [ 6, '3', 'NUOTO LUCCA CAPANNORI', '239 (D)', '03 19 68' ],

        [  9, '3', 'NUOTO LIBERTAS ROSIGNANO', '119 (A)', '01 59 12' ],
        [ 14, '5', 'ESSECI NUOTO', '159 (B)', '02 01 67' ],
        [ 20, '6', 'NUOTO PIOMBINO', '199 (C)', '02 22 12' ],
        [ 22, '1', 'DLF NUOTO LIVORNO', '239 (D)', '02 20 36' ],
        [ 23, '1', 'NUOTO PIOMBINO', '279 (E)', '02 49 38' ],
        [ 24, '1', 'FIRENZE NUOTA MASTER', '319 (F)', '03 13 78' ]
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
        expect( data_page_field_hash[ :teams_tot ]        ).to eq( '52' )
        expect( data_page_field_hash[ :teams_presence ]   ).to eq( '51' )
        expect( data_page_field_hash[ :swimmer_tot ]      ).to eq( '545' )
        expect( data_page_field_hash[ :swimmer_presence ] ).to eq( '497' )
        expect( data_page_field_hash[ :entries_tot ]      ).to eq( '1067' )
        expect( data_page_field_hash[ :entries_presence ] ).to eq( '961' )
        expect( data_page_field_hash[ :disqual_tot ]      ).to eq( '4' )
        expect( data_page_field_hash[ :withdrawals_tot ]  ).to eq( '1' )
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
      expect( subject[:ranking_row].size ).to eq( 51 )
    end

    context "for :ranking_row rows," do
      [
        [  0 , '1', nil, 'DLF NUOTO LIVORNO', '145298,42' ],
        [  9, '10', nil, 'CANOTTIERI ARNO PISA', '23428,36' ],
        [ 14, '15', nil, 'NUOTO VALDINIEVOLE', '10558,44' ],
        [ 19, '20', nil, 'RAPALLO NUOTO', '7526,29' ],
        [ 24, '25', nil, 'CSI NUOTO OBER FERRARI', '6117,39' ],
        [ 29, '30', nil, 'ACQUASPORT BY T D', '3176,42' ],
        [ 34, '35', nil, 'ANDREA DORIA', '1790,41' ],
        [ 39, '40', nil, 'HIDRON SPORT', '1535,39' ],
        [ 44, '45', nil, 'NUOVO NUOTO', '1325,68' ],
        [ 49, '50', nil, 'CANOTTIERI NAPOLI', '736,29' ]
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
