# encoding: utf-8

require 'test_helper'
require 'parsers/token_extractor'
require 'parsers/fin_result_defs'


class TokenExtractorTest < ActiveSupport::TestCase

  test "new" do
    te = TokenExtractor.new(
      :position,
      / \d{1,3}(?= {1,3})/i,
      / (?=[a-z]+)/i
    )
    assert_not_nil( te, "new TokenExtractor instance is nil!")
    assert_equal( :position, te.field_name, "field name is different!")
  end
  # ---------------------------------------------------------------------------

  test "to_s" do
    te = TokenExtractor.new(
      :position,
      / \d{1,3}(?= {1,3})/i,
      / (?=[a-z]+)/i
    )
    puts "\r\nto_s result = #{te}"
    assert( te.to_s.size > 0, "to_s returns an empty string!")
  end
  # ---------------------------------------------------------------------------

  test "get_start_index" do
    te = TokenExtractor.new(
      :position,
      / \d{1,3}(?= {1,3}\w)/i,
      / (?=[a-z]+)/i
    )
    sidx = te.get_start_index( "       1   BIBBIBBI  FRANCESCA            1981   MILANO  NUOTO CSI           1'19\"58  650,73" )
    assert_not_nil( sidx, "start index is nil!" )
    te.clear()

    sidx = te.get_start_index( "           BIBBIBBI  FRANCESCA            1981   MILANO  NUOTO CSI           1'19\"58  650,73" )
    assert_nil( sidx, "start index was expected to be nil and is not! (Check the Regexp used!)" )
  end


  test "get_end_index" do
    te = TokenExtractor.new(
      :position,
      / \d{1,3}(?= {1,3})/i,
      / (?=[a-z]+)/i
    )
    txt = "       1   BIBBIBBI  FRANCESCA            1981   MILANO  NUOTO CSI           1'19\"58  650,73"
    sidx = te.get_start_index( txt )
    eidx = te.get_end_index( txt )
    assert_not_nil( eidx, "end index is nil!" )
    assert( sidx <= eidx, "start index is greater than end index!" )
  end
  # ---------------------------------------------------------------------------


  test "tokenize_meeting_header" do
    parsing_defs = FinResultDefs.new( '' )
    tokenizers   = parsing_defs.get_tokenizers_for( :meeting_header ).values
    txt_fixtures = get_txt_fixtures_for_meeting_header()
    expectations = get_expectations_for_meeting_header()
    process_fixtures_and_expectations( tokenizers, txt_fixtures, expectations )
  end
  # ---------------------------------------------------------------------------


  test "tokenize_category_header" do
    parsing_defs = FinResultDefs.new( '' )
    tokenizers   = parsing_defs.get_tokenizers_for( :category_header ).values
    txt_fixtures = get_txt_fixtures_for_category_header()
    expectations = get_expectations_for_category_header()
    process_fixtures_and_expectations( tokenizers, txt_fixtures, expectations )
  end

  test "tokenize_result_row" do
    parsing_defs = FinResultDefs.new( '' )
    tokenizers   = parsing_defs.get_tokenizers_for( :result_row ).values
    txt_fixtures = get_txt_fixtures_for_result_row()
    expectations = get_expectations_for_result_row()
    process_fixtures_and_expectations( tokenizers, txt_fixtures, expectations )
  end
  # ---------------------------------------------------------------------------


  test "tokenize_relay_header" do
    parsing_defs = FinResultDefs.new( '' )
    tokenizers   = parsing_defs.get_tokenizers_for( :relay_header ).values
    txt_fixtures = get_txt_fixtures_for_relay_header()
    expectations = get_expectations_for_relay_header()
    process_fixtures_and_expectations( tokenizers, txt_fixtures, expectations )
  end

  test "tokenize_relay_row" do
    parsing_defs = FinResultDefs.new( '' )
    tokenizers   = parsing_defs.get_tokenizers_for( :relay_row ).values
    txt_fixtures = get_txt_fixtures_for_relay_row()
    expectations = get_expectations_for_relay_row()
    process_fixtures_and_expectations( tokenizers, txt_fixtures, expectations )
  end
  # ---------------------------------------------------------------------------


  test "tokenize_ranking_row" do
    parsing_defs = FinResultDefs.new( '' )
    tokenizers   = parsing_defs.get_tokenizers_for( :ranking_row ).values
    txt_fixtures = get_txt_fixtures_for_ranking_row()
    expectations = get_expectations_for_ranking_row()
    process_fixtures_and_expectations( tokenizers, txt_fixtures, expectations )
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  private


  def process_fixtures_and_expectations( tokenizers, txt_fixtures, expectations )
    txt_fixtures.each_with_index { |txt, fixture_idx|
      puts "\r\n=== Testing tokenize with fixture <<#{txt}>> (#{fixture_idx+1}/#{txt_fixtures.size})..."
      tokenizers.each_with_index { |token_extractor, idx|
        unless expectations[ fixture_idx ].nil?
          expected_value = expectations[ fixture_idx ][ idx ]
          sidx = token_extractor.get_start_index( txt )
          eidx = token_extractor.get_end_index( txt )
          puts "- Searching for field '#{token_extractor.field_name}' (expecting '#{expected_value}')... Start: #{sidx}, end: #{eidx}"
          do_tokenize( token_extractor, txt, expected_value )
          token_extractor.clear()                   # Clear the cached resulting indexes
        end
      }
    }
  end


  def do_tokenize( token_extractor, txt, expected_value )
    token = token_extractor.tokenize( txt )
    assert_not_nil( token, "token is nil!" )
    assert_equal( expected_value, token, "token (#{token_extractor.field_name}: '#{token}') differs from expected value ('#{expected_value}')!" )
  end
  # ---------------------------------------------------------------------------


  def get_txt_fixtures_for_meeting_header()
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "                                  8° Trofeo Città di Riccione                                  ",
      "                        Manifestazione organizzata da POL. COM. RICCIONE                       ",
      "                                  RICCIONE - 3/4 Dicembre 2011                                 ",
      # False positive:
#      " 19 MAR-034567 1979 GINONE  ALESSANDRO            AS FIGARO NUOTO             0'29\"05  800,69",
#      " 20 EMI-023456 1978 GILBERTAZZI  PAOLINO          NUOTO CLUB FIDENZUOLA       0'29\"11  799,04",
#      " 21 MAR-012345 1979 CICCIO  MERCUZIO              POLISP. QUALUNQUE           0'29\"15  797,94",

      "                               10° Trofeo Città di Ravenna Master                              ",
      "                    Manifestazione organizzata da Rinascita Team Romagna asd                   ",
      "                                  Ravenna - 14/15 Gennaio 2012                                 ",
      "                                      2° Trofeo del Golfo",
      "                        Manifestazione organizzata da AS DIL RN SPEZIA",
      "                                   LA SPEZIA - 8 Marzo 2008",
      "                                    VIII Trofeo Nuovo Nuoto                                    ",
      "                         Manifestazione organizzata da ASD Nuovo Nuoto                         ",
      "                                    Bologna - 30 Marzo 2008                                    ",
      "                      Trofeo A.I.C.S. \"Città di Desenzano\" - 12ª edizione                      ",
      "                 Manifestazione organizzata da A.S.D. Master A.I.C.S. Brescia                  ",
      "                                Desenzano - 26/27 Gennaio 2008                                 ",

      "                                  Campionati Regionali Emilia                                  ",
      "                     Manifestazione organizzata da a.s.d. Molinella Nuoto                      ",
      "                              Molinella - 15/16/17 Febbraio 2009                               ",

      "11 novembre 2012",
      "10° Trofeo De Akker Team ASI",
      "Manifestazione organizzata da De Akker",
      "20-21 aprile 2013",
      "12° Trofeo Città  di Molinella",
      "Manifestazione organizzata da Molinellanuoto",
      "26-27 gennaio 2013  ",
      "17° Trof AICS città di Gussago",
      "Manifestazione organizzata da AICS Master - BS",
      "17-24 febbraio 2013 ",
      "Regionali Emilia",
      "Manifestazione organizzata da CR Emilia",
      "02-03 marzo 2013  ",
      "28° Brixia Fidelis",
      "Manifestazione organizzata da NC Brescia"
    ]
  end

  def get_expectations_for_meeting_header()
    [ # field list = [:title, :meeting_dates, :organization]
      ["8° Trofeo Città di Riccione", '', ''],
      ['', '', 'POL. COM. RICCIONE'],
      ['', "3/4 Dicembre 2011", ''],
      # False positive:
#      ['', '', ''],
#      ['', '', ''],
#      ['', '', ''],

      ["10° Trofeo Città di Ravenna Master", '', ''],
      ['', '', 'Rinascita Team Romagna asd'],
      ['', "14/15 Gennaio 2012", ''],

      ["2° Trofeo del Golfo", '', ''],
      ['', '', 'AS DIL RN SPEZIA'],
      ['', "8 Marzo 2008", ''],

      ["VIII Trofeo Nuovo Nuoto", '', ''],
      ['', '', 'ASD Nuovo Nuoto'],
      ['', "30 Marzo 2008", ''],

      ["Trofeo A.I.C.S. \"Città di Desenzano\" - 12ª edizione", '', ''],
      ['', '', 'A.S.D. Master A.I.C.S. Brescia'],
      ['', "26/27 Gennaio 2008", ''],

      ["Campionati Regionali Emilia", '', ''],
      ['', '', 'a.s.d. Molinella Nuoto'],
      ['', "15/16/17 Febbraio 2009", ''],

      ['', "11 novembre 2012", ''],
      ["10° Trofeo De Akker Team ASI", '', ''],
      ['', '', "De Akker"],
      ['', "20-21 aprile 2013", ''],
      ["12° Trofeo Città  di Molinella", '', ''],
      ['', '', "Molinellanuoto"],
      ['', "26-27 gennaio 2013", ''],
      ["17° Trof AICS città di Gussago", '', ''],
      ['', '', "AICS Master - BS"],
      ['', "17-24 febbraio 2013", ''],
      ["Regionali Emilia", '', ''],
      ['', '', "CR Emilia"],
      ['', "02-03 marzo 2013", ''],
      ["28° Brixia Fidelis", '', ''],
      ['', '', "NC Brescia"]
    ]
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  def get_txt_fixtures_for_category_header()
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "        50 stile libero  maschile   -  Categoria  Master 45       Tempo Base   :  0'24\"09",
      "        200 farfalla  femminile  -  Categoria  Master 25          Tempo Base   :  2'20\"95",
      "        50 farfalla  femminile  -  Categoria  Under 25             ",

      "        200 dorso  maschile   -  Categoria  Master 35             Tempo Base   :  2'06\"28",
      "        1500 stile libero  femminile  -  Categoria  Master 45     Tempo Base   : 18'34\"18",
      "        100 misti  femminile  -  Categoria  Master 40             Tempo Base   :  1'07\"68",
      "        50 farfalla  maschile   -  Categoria  Master 55           Tempo Base   :  0'27\"75",
      "        50 rana  femminile  -  Categoria  Under 25                 ",

      "        800 stile libero  Maschile   -  Categoria M60             Tempo Base   : 10'02\"40",
      "        800 stile libero  Maschile   -  Categoria U25              ",
      "        200 farfalla  Femminile  -  Categoria M30                 Tempo Base   :  2'13\"60",
      "        1500 stile libero  Maschile   -  Categoria M30            Tempo Base   : 16'35\"67",
      "        200 farfalla  Maschile   -  Categoria U25                  "
    ]
  end

  def get_expectations_for_category_header()
    [
#     [ :distance, :style, :gender, :category_group, :base_time ],
      ['50', 'stile libero', 'maschile', 'Master 45', "0'24\"09"],
      ['200', 'farfalla', 'femminile', 'Master 25', "2'20\"95"],
      ['50', 'farfalla', 'femminile', 'Under 25', ""],
      ['200', 'dorso', 'maschile', 'Master 35', "2'06\"28"],
      ['1500', 'stile libero', 'femminile', 'Master 45', "18'34\"18"],
      ['100', 'misti', 'femminile', 'Master 40', "1'07\"68"],
      ['50', 'farfalla', 'maschile', 'Master 55', "0'27\"75"],
      ['50', 'rana', 'femminile', 'Under 25', ""],
      
      ['800', 'stile libero', 'Maschile', 'M60', "10'02\"40"],
      ['800', 'stile libero', 'Maschile', 'U25', ""],
      ['200', 'farfalla', 'Femminile', 'M30', "2'13\"60"],
      ['1500', 'stile libero', 'Maschile', 'M30', "16'35\"67"],
      ['200', 'farfalla', 'Maschile', 'U25', ""]
    ]
  end
  # ---------------------------------------------------------------------------


  def get_txt_fixtures_for_result_row()
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "       1   BIBBIBBI  FRANCESCA            1981   MILANO  NUOTO CSI           1'19\"58  650,73",
      "       2   DIDDIEFFIGGI  FEDERICA         1980   ROMA  NUOTO SSD  AR         1'17\"73  682,05",
      "       3   D`ALAMBERTO  MARUGONA          1982   A.S.D. RICCIO               1'20\"63  622,03",
      "           FAKE  MARIAPINA GINA LINA      1983   NEVAH.S.C.A.RL.            Ritirata    0,00",
      "           SUPAFAKE  CAMILLA              1982   SOC. 2001 SRL - PAD        Squalif.    0,00",
      "  3 EMI-020270 1979 CHIEREGATO  SARA              NUOTO OTELLO PUTINA         1'30\"60  828,15",
      "  4 VEN-002165 1979 SAMBIN  SILVIA                ACQUAVIVA 2001 SRL          1'36\"99  773,58",
      "    EMI-024761 1982 GAMBETTI  FRANCESCA           ACQUAMBIENTE SSD -         Squalif.    0,00",
      "    EMI-012345 1983 MEGAFAKE JAMIE                OH-MY OH-MY                Ritirato    0,00"
    ]
  end

  def get_expectations_for_result_row()
    [
#      :result_position, :team_code, :swimmer_name, :swimmer_year, :team_name, :result_time, :result_score
      ['1', '', 'BIBBIBBI  FRANCESCA', '1981', 'MILANO  NUOTO CSI', "1'19\"58", '650,73'],
      ['2', '', 'DIDDIEFFIGGI  FEDERICA', '1980', 'ROMA  NUOTO SSD  AR', "1'17\"73", '682,05'],
      ['3', '', 'D`ALAMBERTO  MARUGONA', '1982', 'A.S.D. RICCIO', "1'20\"63", '622,03'],
      ['', '', 'FAKE  MARIAPINA GINA LINA', '1983', 'NEVAH.S.C.A.RL.', "Ritirata", '0,00'],
      ['', '', 'SUPAFAKE  CAMILLA', '1982', 'SOC. 2001 SRL - PAD', "Squalif.", '0,00'],
      ['3', 'EMI-020270', 'CHIEREGATO  SARA', '1979', 'NUOTO OTELLO PUTINA', "1'30\"60", '828,15'],
      ['4', 'VEN-002165', 'SAMBIN  SILVIA', '1979', 'ACQUAVIVA 2001 SRL', "1'36\"99", '773,58'],
      ['', 'EMI-024761', 'GAMBETTI  FRANCESCA', '1982', 'ACQUAMBIENTE SSD -', "Squalif.", '0,00'],
      ['', 'EMI-012345', 'MEGAFAKE JAMIE', '1983', 'OH-MY OH-MY', "Ritirato", '0,00']
    ]
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------

      # -- Fields to be extracted: :title OR :meeting_dates
# line1: /\s*\d{1,3}° Trofeo|\d\d((\/|-|\,)\d\d)*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\d{2,4}/ui

      # -- Fields to be extracted: :organization OR :title
# line2: /(\s*Manifestazione organizzata da |\s*\d{1,3}° Trofeo\s)/ui

      # -- Fields to be extracted: :meeting_dates OR :organization
# line3: /\d\d((\/|-|\,)\d\d)*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\d{2,4}|\s*Manifestazione organizzata da /ui

# data: /\d\d((\/|-|\,)\d\d)*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\d{2,4}/ui
#       ('til EOLN)

#                               10° Trofeo Città di Ravenna Master                              
#                    Manifestazione organizzata da Rinascita Team Romagna asd                   
#                                  Ravenna - 14/15 Gennaio 2012                                 

#11 novembre 2012  
#10° Trofeo De Akker Team ASI
#Manifestazione organizzata da De Akker

#20-21 aprile 2013 
#12° Trofeo Città  di Molinella
#Manifestazione organizzata da Molinellanuoto


  def get_txt_fixtures_for_relay_header()
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "        mistaffetta 4x50 stile libero  -  Categoria M100-119      Tempo Base   :  1'42\"99",
      "        mistaffetta 4x100 stile libero -  Categoria M120-159      Tempo Base   :  1'43\"07",
      "        mistaffetta 4x200 stile libero -  Categoria M160-199      Tempo Base   :  1'44\"97",
      "        mistaffetta 4x50 mista  -  Categoria M160-199             Tempo Base   :  1'57\"26",
      "        mistaffetta 4x50 mista  -  Categoria M200-239             Tempo Base   :  2'05\"20",

      "        staffetta 4x50 mista  Maschile   -  Categoria M100-119    Tempo Base   :  1'49\"09",
      "        staffetta 4x50 mista  Femminile  -  Categoria M160-199    Tempo Base   :  2'09\"12",
      "        staffetta 4x50 stile libero  Maschile   -  Categoria M160-199Tempo Base   :  1'39\"09",
      "        staffetta 4x50 stile libero  Femminile  -  Categoria M200-239Tempo Base   :  2'04\"15"
    ]
  end

  def get_expectations_for_relay_header()
    [
#     [ :type, :distance, :style, :gender, :category_group, :base_time ]      
      ['mistaffetta 4x50 stile libero', '4x50', 'stile libero', '', 'M100-119', "1'42\"99"],
      ['mistaffetta 4x100 stile libero', '4x100', 'stile libero', '', 'M120-159', "1'43\"07"],
      ['mistaffetta 4x200 stile libero', '4x200', 'stile libero', '', 'M160-199', "1'44\"97"],
      ['mistaffetta 4x50 mista', '4x50', 'mista', '', 'M160-199', "1'57\"26"],
      ['mistaffetta 4x50 mista', '4x50', 'mista', '', 'M200-239', "2'05\"20"],

      ["staffetta 4x50 mista  Maschile", "4x50", "mista", "Maschile", "M100-119", "1'49\"09"],
      ["staffetta 4x50 mista  Femminile", "4x50", "mista", "Femminile", "M160-199", "2'09\"12"],
      ["staffetta 4x50 stile libero  Maschile", "4x50", "stile libero", "Maschile", "M160-199", "1'39\"09"],
      ["staffetta 4x50 stile libero  Femminile", "4x50", "stile libero", "Femminile", "M200-239", "2'04\"15"]
    ]
  end
  # ---------------------------------------------------------------------------

  def get_txt_fixtures_for_relay_row()
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "                  1     ADRIA NUOTO SSD  AR                 2'07\"17  809,86",
      "         Fuori gara     AS DELFINO 93                       1'54\"15  902,23",
      "                  2     MASTERNUOTOFIDENZA                  2'20\"59  733,12",
      "         Fuori gara     KGO KLAB GEST.OPERA                 2'18\"35  744,99",
      "                  3     GIS-GEST. IMPIANTI                  2'10\"95  801,60",
      "                  4     PADOVANUOTO S.R.L.                  2'14\"12  874,29",
      "                        CSI NUOTO OBER FERR                Squalif.",
      "                  5     CN UISP BOLOGNA                     2'23\"74  871,02",
      "                  6     NUOTO CLUB 2000                     2'41\"79  773,84",

      "                1  SIC-000140   POL. WATERPOLO PALE              2'06\"56  987,67",
      "                1  LOM-009402   MALASPINA SC                     1'35\"98 1003,23",
      "                1  LOM-037241   SPORT MANAGEMENT                 1'45\"45  955,05"
    ]
  end

  def get_expectations_for_relay_row()
    [
#     [ :result_position, :team_name, :result_time, :result_score ]
      ['1', 'ADRIA NUOTO SSD  AR', "2'07\"17", '809,86'],
      ['Fuori gara', 'AS DELFINO 93', "1'54\"15", '902,23'],
      ['2', 'MASTERNUOTOFIDENZA', "2'20\"59", '733,12'],
      ['Fuori gara', 'KGO KLAB GEST.OPERA', "2'18\"35", '744,99'],
      ['3', 'GIS-GEST. IMPIANTI', "2'10\"95", '801,60'],
      ['4', 'PADOVANUOTO S.R.L.', "2'14\"12", '874,29'],
      ['', 'CSI NUOTO OBER FERR', 'Squalif.', ''],
      ['5', 'CN UISP BOLOGNA', "2'23\"74", '871,02'],
      ['6', 'NUOTO CLUB 2000', "2'41\"79", '773,84'],

      ['1', 'POL. WATERPOLO PALE', "2'06\"56", '987,67'],
      ['1', 'MALASPINA SC', "1'35\"98", '1003,23'],
      ['1', 'SPORT MANAGEMENT', "1'45\"45", '955,05']
    ]
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  def get_txt_fixtures_for_ranking_row()
    [
      "            1   EMI-001444  ESTENSE NUOTO CSI                 62525,95",
      "            2   EMI-001481  N MODENESI                        58272,35",
      "            3   EMI-001451  RINASCITA TEAM ROMA               46753,95",
      "            4   EMI-001457  NUOTO CLUB 2000                   37724,16",
      "            5   EMI-001452  AQUATIC TEAM RAVENN               29332,89",
      "            1      N MODENESI                        66495,23",
      "            2      CN UISP BOLOGNA                   44667,70",
      "            3      NUOTO CLUB 2000                   37112,33",
      "            4      NUOVO NUOTO                       31562,33",
      "            5      AS MOLINELLA NUOTO                24085,60",
      "          143      SEA SUB MODENA                        0,00",
      "                   ASD SANTA CLARA - G                   0,00",
      "                   ASOLA N                               0,00",
      "                   FIRENZE NUOTA MASTER A.S.D.           0,00",
      "                   TEAM EUGANEO                          0,00",
      ""
    ]
  end

  def get_expectations_for_ranking_row()
    [
      [ '1',    "EMI-001444", "ESTENSE NUOTO CSI", "62525,95" ],
      [ '2',    "EMI-001481", "N MODENESI", "58272,35" ],
      [ '3',    "EMI-001451", "RINASCITA TEAM ROMA", "46753,95" ],
      [ '4',    "EMI-001457", "NUOTO CLUB 2000", "37724,16" ],
      [ '5',    "EMI-001452", "AQUATIC TEAM RAVENN", "29332,89" ],
      [ '1',    '', "N MODENESI", "66495,23" ],
      [ '2',    '', "CN UISP BOLOGNA", "44667,70" ],
      [ '3',    '', "NUOTO CLUB 2000", "37112,33" ],
      [ '4',    '', "NUOVO NUOTO", "31562,33" ],
      [ '5',    '', "AS MOLINELLA NUOTO", "24085,60" ],
      [ '143',  '', "SEA SUB MODENA", "0,00" ],
      [ '',     '', "ASD SANTA CLARA - G", "0,00" ],
      [ '',     '', "ASOLA N", "0,00" ],
      [ '',     '', "FIRENZE NUOTA MASTER A.S.D.", "0,00" ],
      [ '',     '', "TEAM EUGANEO", "0,00" ],
      [ '',     '', "", "" ]
    ]
  end
  # ---------------------------------------------------------------------------
end
