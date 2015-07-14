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
      File.join(Rails.root, 'test/fixtures/samples/ris20081221mussi-sample.txt'),
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
        expect( data_page_field_hash[ :title ]         ).to eq( 'III° Trofeo Mussi Lombardi Femiano III° Memorial Francesco Rizzo' )
        expect( data_page_field_hash[ :meeting_dates ] ).to eq( 'Domenica 21 Dicembre 2008' )
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
        # '200 Farfalla' samples
        [ 0, '1', 'TOS000695', 'MAGNELLI SAMUELA', '1981 25', 'FIORENTINA NUOTO',  '02 27 98', '926,68' ],
        [ 1, '2', 'LAZ037772', 'NASSO MARTINA', '1981 25', 'EUROPARADISE', '03 26 84', '662,98' ],
        [ 2, '1', 'LIG014209', 'OLIVERI FRANCESCA', '1979 30', 'RN SPEZIA 86', '03 32 76', '654,92' ],
        [ 3, '2', 'CAM006154', 'SORRENTINO ANNA', '1975 30', 'IL GABBIANO NAPOLI', '05 08 95', '451,01' ],

        [ 10, '1', 'EMI023180', 'ARTEAGA HECTOR ALESSAN', '1988 0', 'ASD CSI NUOTO OBER FERRAR', '02 53 82', nil ],
        [ 11, '1', 'TOS002054', 'CACCIATORE ALESSANDRO', '1981 25', 'NUOTO CLUB FIRENZE', '02 18 87', '863,54' ],
        [ 15, '2', 'TOS031905', 'BETTI SIMONE', '1975 30', 'ASD NUOTO UISP 2003', '04 17 64', '466,58' ],
        [ 18, '3', 'LAZ030299', 'FONTANA RENATO', '1974 35', 'NUOTO CLUB 91 PARMA', '02 19 98', '889,41' ],
        [ 21, '1', 'LIG002114', 'MUSCARÀ FRANCO', '1967 40', 'CS MARINA MILITARE', '02 48 05', '731,75' ],
        # '100 Misti' samples
        [ 38, '1', 'TOS007835', 'LUSCHI MARTINA', '1985 0', 'ASD LIBERTAS NUOTO ROSIGN', '01 29 40', nil ],
        [ 43, '5', 'TOS033546', 'PINTO MARILÙ', '1982 25', 'ASD CIRCOLO NUOTO LUCCA', '01 32 23', '690,34' ],
        [ 53, '5', 'TOS033064', 'PRATICÒ LAURA', '1970 35', 'SRL SD NUOTO COLLESALVETT', '01 40 98', '647,65' ],
        [ 61, '6', 'TOS016010', 'BINDI FIAMMETTA', '1965 40', 'SSD AMICI DEL NUOTO FIREN', '01 45 32', '617,83' ],
        [ 63, '2', 'TOS004246', 'CIONI ALESSANDRA', '1960 45', 'ASD DLF NUOTO LIVORNO', '01 38 64', '684,21' ],

        [ 66, '2', 'SIC012489', 'ROMANO GIULIO ORAZIO', '1986 0', 'NUOTO CLUB FIRENZE', '01 42 95', nil ],
        [ 78, '12', 'TOS028935', 'BAIOCCHI DEEPAK', '1980 25', 'CENTRO NUOTO MONTECATINI', '01 27 38', '631,72' ],
        [ 96, '1', 'LOM019717', 'MONTINI ALBERTO', '1968 40', 'ACQUASPORT BY T D', '00 58 28', '1013,90' ],
        [ 99,  '4', 'PIE000312', 'BO ROBERTO', '1966 40', 'ASD RARI NANTES GERBIDO', '01 16 97', '767,70' ],
        [ 100, '4', 'TOS033632', 'LANDI ANDREA', '1965 40', 'ASD PALLANUOTO VIAREGGIO', '01 16 97', '767,70' ],
        [ 118, '2', 'TOS002799', 'BENVENUTTI MARIO', '1937 70', 'ASD DLF NUOTO LIVORNO', '01 47 79', '704,33' ],
        # '200 Rana' samples
        [ 126, '4', 'CAM016321', 'NEGRI DORITA', '1972 35', 'ASD ALTA IRPINIA NUOTO', '04 05 14', '636,53' ],
        [ 129, '3', 'TOS000756', 'CAROTI GHELLI CRISTINA', '1966 40', 'CANOTTIERI ARNO PISA', '03 43 45', '697,47' ],
        [ 131, '1', 'EMI014135', 'GUGLIELMI GUJA', '1956 50', 'ASS AMICI DEL NUOTO MODEN', '03 52 21', '764,35' ],

        [ 134, '1', 'LIG015520', 'BUSSONE MATTEO', '1985 0', 'ASD LAVAGNA 90', '03 23 62', nil ],
        [ 146, '6', 'TOS032158', 'MAGNANI EMILIANO', '1978 30', 'ASD NUOTO UISP 2003', '03 15 03', '700,41' ],
        [ 156, '1', 'LOM019717', 'MONTINI ALBERTO', '1968 40', 'ACQUASPORT BY T D', '02 15 95', '1016,26' ],
        # '50 Farfalla' samples
        [ 185, '2', 'TOS031610', 'BARACANI SERENA', '1982 25', 'SSD AMICI DEL NUOTO FIREN', '00 34 40', '810,47' ],
        [ 193, '5', 'TOS004099', 'GIOVANNETTI BARBARA', '1970 35', 'ASS NUOTO LUCCA CAPANNORI', '00 55 74', '514,53' ],
        [ 198, '5', 'TOS018854', 'GHILARDUCCI RENZA', '1969 40', 'ASS NUOTO LUCCA CAPANNORI', '00 49 73', '567,26' ],

        [ 199, '1', 'EMI004745', 'BONDI ANDREA', '1989 0', 'ASD CSI NUOTO OBER FERRAR', '00 30 76', nil ],
        [ 222, '6', 'EMI014278', 'LIGABUE MARCO', '1971 35', 'ASD CSI NUOTO OBER FERRAR', '00 33 27', '735,80' ],
        [ 246, '5', 'EMI015624', 'ORLANDINI IDO PIRALDO', '1957 50', 'ASD CSI NUOTO OBER FERRAR', '00 35 66', '732,47' ],
        # '50 Dorso' samples
        [ 257, '2', 'TOSX06357', 'NIGLETTO CHIARA', '1986 0', 'FIORENTINA NUOTO', '00 43 42', nil ],
        [ 261, '3', 'LAZ045960', 'MARINO GIULIA', '1977 30', 'GS VV. F. F . SORGINI', '00 45 94', '631,04' ],
        [ 274, '10', 'TOSX06102', 'MALDERA MICHELA', '1969 40', 'ASS NUOTO VIAREGGIO', '01 02 44', '496,00' ]
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

    context "for :relay_row rows," do
      [
        [ 0, '1', 'ASD DLF NUOTO LIVORNO', '280 (F)', '03 46 73' ],
        [ 1, '1', 'ASD VERSILIANUOTO',     '160 (C)', '01 52 73' ]
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

    context "for :ranking_row rows," do
      [
        [  0,  '1', 'TOS001351', 'FIORENTINA NUOTO', '47068,97' ],
        [  5,  '6', 'TOS002435', 'ASS NUOTO VIAREGGIO', '20953,30' ],
        [ 10, '11', 'TOS002726', 'CANOTTIERI ARNO PISA', '9553,88' ],
        [ 15, '16', 'LIG086123', 'ANDREA DORIA GENOVA', '7335,92' ],
        [ 20, '21', 'CAM020133', 'IL GABBIANO NAPOLI', '5617,92' ],
        [ 24, '25', 'EMI001454', 'ASD CSI NUOTO OBER FERRARI', '3741,89' ],
        [ 30, '31', 'TOS000421', 'CENTRO NUOTO MONTECATINI', '3017,61' ],
        [ 41, '42', 'EMI001447', 'NUOTO CLUB 91 PARMA', '1761,95' ],
        [ 50, '51', 'LAZ000908', 'USD VIS NOVA', '1450,54' ],
        [ 55, '56', 'EMI001428', 'REGGIANA NUOTO', '1115,26' ],
        [ 59, '60', 'EMI001436', 'AS MOLINELLA NUOTO', '726,56' ],
        [ 61, '62', 'LAZ042987', 'GS VV. F. F . SORGINI', '631,04' ]
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
