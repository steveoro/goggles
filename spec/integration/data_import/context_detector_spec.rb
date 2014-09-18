# encoding: utf-8
require 'spec_helper'

require 'framework/console_logger'
require 'parsers/context_detector'
require 'parsers/fin_result_consts'


describe ContextDetector, type: :integration do

  # Checks if the specified feed is successfully recognized after all rows have
  # been checked.
  #
  # === Params:
  #
  # - after_n_feeds:
  #   counter for the total number of conditions to be checked before the result
  #   is assumed to be +true+.
  #
  # - feed_array:
  #   list of all the text lines to be parsed in order.
  #
  # - prev_context_name:
  #   name of the previously recognized contex. Defaults to +nil+.
  #
  def check_for_parsing_ok( after_n_feeds, feed_array, prev_context_name = nil )
    subject.clear
    feed_array[ 0 .. feed_array.size-2 ].each_with_index do | feed_line, line_idx |
      expect( subject.feed_and_detect( feed_line, line_idx, prev_context_name ) ).to be false
    end if after_n_feeds > 1
    expect( subject.feed_and_detect( feed_array.last, feed_array.size-1, prev_context_name ) ).to be true
  end

  # Checks if the specified feed fails to be recognized after all rows have
  # been checked.
  #
  # === Params:
  #
  # - feed_array:
  #   list of all the text lines to be parsed in order.
  #
  # - fake_offset_index:
  #   (fake) offset index for the current parsing. Defaults to 0.
  #
  # - prev_context_name:
  #   name of the previously recognized contex. Defaults to +nil+.
  #
  def check_for_parsing_fail( feed_array, fake_offset_index = 0, prev_context_name = nil )
    subject.clear
    feed_array[ 0 .. feed_array.size-1 ].each_with_index do | feed_line, line_idx |
      expect( subject.feed_and_detect( feed_line, fake_offset_index + line_idx, prev_context_name ) ).to be false
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when parsing MEETING_HEADER," do
    subject { ContextDetector.new( FinResultConsts::CNT_TYPE_MEETING_HEADER, nil ) }

    it "recognizes the 'FIN Campionati Regionali' format" do
      feed = [
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
        "                                  Campionati Regionali Emilia                                  ",
        "                     Manifestazione organizzata da a.s.d. Molinella Nuoto                      ",
        "                              Molinella - 15/16/17 Febbraio 2009                               "
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN Distanze speciali' format" do
      feed = [
        "                                     Distanze speciali EMI                                     ",
        "                Manifestazione organizzata da San Marino Nuoto - Molinellanuoto                ",
        "                                 San Marino - 4 Novembre 2007                                  "
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN meeting header w/ roman numerals at line 0' format" do
      feed = [
        "                                    VIII Trofeo Nuovo Nuoto                                    ",
        "                         Manifestazione organizzata da ASD Nuovo Nuoto                         ",
        "                                    Bologna - 30 Marzo 2008                                    "
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN meeting header w/ roman numerals at line 1' format" do
      feed = [
        "                                    Bologna - 31 Marzo 2008                                    ",
        "                                    VIII Trofeo Nuovo Nuoto                                    ",
        "                         Manifestazione organizzata da ASD Nuovo Nuoto                         "
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN meeting header w/ title on top and bottom date' format (sample #1)" do
      feed = [
        "                                  8° Trofeo Città di Riccione                                  ",
        "                        Manifestazione organizzata da POL. COM. RICCIONE                       ",
        "                                  RICCIONE - 3/4 Dicembre 2011                                 "
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN meeting header w/ title on top and bottom date' format (sample #2)" do
      feed = [
          "                               10° Trofeo Città di Ravenna Master                              ",
          "                    Manifestazione organizzata da Rinascita Team Romagna asd                   ",
          "                                  Ravenna - 14/15 Gennaio 2012                                 "
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN meeting header w/o date but w/ title on line 0' format" do
      feed = [
        "13° Trofeo Città di Desenzano",
        "Manifestazione organizzata da AICS Master - BS",
        ""
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN meeting header w/ date on top and title on line 2' format" do
      feed = [
        "11 novembre 2012",
        "10° Trofeo De Akker Team ASI",
        "Manifestazione organizzata da De Akker"
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN meeting header w/ a dual date on top and title on line 2' format (sample #1)" do
      feed = [
        "20-21 aprile 2013",
        "12° Trofeo Città  di Molinella",
        "Manifestazione organizzata da Molinellanuoto"
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN meeting header w/ a dual date on top and title on line 2' format (sample #1)" do
      feed = [
        "26-27 gennaio 2013  ",
        "17° Trof AICS città di Gussago",
        "Manifestazione organizzata da AICS Master - BS"
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN meeting header w/ a dual date on top and title on line 2' format (sample #1)" do
      feed = [
        "17-24 febbraio 2013 ",
        "Regionali Emilia",
        "Manifestazione organizzata da CR Emilia"
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN meeting header w/ a dual date on top and title on line 2' format (sample #1)" do
      feed = [
        "02-03 marzo 2013  ",
        "28° Brixia Fidelis",
        "Manifestazione organizzata da NC Brescia"
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN meeting header w/ a dual date on top and title on line 2' format (sample #1)" do
      feed = [
        "16 dicembre 2012  ",
        "1� Trofeo Coopernuoto",
        "Manifestazione organizzata da Coopernuoto Scsd"
      ]
      check_for_parsing_ok( 3, feed )
    end
    #-- -------------------------------------------------------------------------
    #++

    it "doesn't recognize a false-positive (sample #1)" do
      feed = [
        "",
        "        400 stile libero  femminile  -  Categoria  Under 25        ",
        "----------------------------------------------------------------------------------------------"
      ]
      check_for_parsing_fail( feed )
    end

    # This examples tests the line_timeout feature of the ContextDetector.
    it "doesn't recognize a false-positive (sample #2)" do
      feed = [
        " 19 MAR-034567 1979 GINONE  ALESSANDRO            AS FIGARO NUOTO             0'29\"05  800,69",
        " 20 EMI-023456 1978 GILBERTAZZI  PAOLINO          NUOTO CLUB FIDENZUOLA       0'29\"11  799,04",
        " 21 MAR-012345 1979 CICCIO  MERCUZIO              POLISP. QUALUNQUE           0'29\"15  797,94"
      ]
      # [Steve] To successfully NOT recognize this false-positive as a 'meeting_header',
      # we need to set an offset for the parsing (as in real-world cases) since this
      # format won't ever be used in the first 10 lines of the feeding text.
      check_for_parsing_fail( feed, 10 )
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when parsing CATEGORY_HEADER," do
    subject { ContextDetector.new( FinResultConsts::CNT_TYPE_CATEGORY_HEADER, nil ) }

    it "recognizes the 'FIN category w/ base time' format (sample #1)" do
      feed = [
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
        '',
        "        50 stile libero  maschile   -  Categoria  Master 45       Tempo Base   :  0'24\"09",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN category w/ base time' format (sample #2)" do
      feed = [
        '',
        "        200 farfalla  femminile  -  Categoria  Master 25          Tempo Base   :  2'20\"95",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN category w/ base time' format (sample #3)" do
      feed = [
        '',
        "        200 dorso  maschile   -  Categoria  Master 35             Tempo Base   :  2'06\"28",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN category w/ base time' format (sample #4)" do
      feed = [
        '',
        "        1500 stile libero  femminile  -  Categoria  Master 45     Tempo Base   : 18'34\"18",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN category w/ base time' format (sample #5)" do
      feed = [
        '',
        "        100 misti  femminile  -  Categoria  Master 40             Tempo Base   :  1'07\"68",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN category w/ base time' format (sample #6)" do
      feed = [
        '',
        "        50 farfalla  maschile   -  Categoria  Master 55           Tempo Base   :  0'27\"75",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN category w/o base time' format (sample #1)" do
      feed = [
        '',
        "        50 farfalla  femminile  -  Categoria  Under 25             ",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN category w/o base time' format (sample #2)" do
      feed = [
        '',
        "        50 rana  femminile  -  Categoria  Under 25                 ",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end
    #-- -----------------------------------------------------------------------
    #++

    it "doesn't recognize a false-positive (sample #1)" do
      feed = [
        '',
        "       2   DIDDIEFFIGGI  FEDERICA         1980   ROMA  NUOTO SSD  AR         1'17\"73  682,05",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_fail( feed )
    end

    it "doesn't recognize a relay header (sample #1)" do
      feed = [
        '',
        "        mistaffetta 4x50 stile libero  -  Categoria M100-119      Tempo Base   :  1'42\"99",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_fail( feed )
    end

    it "doesn't recognize a relay header (sample #2)" do
      feed = [
        '',
        "        staffetta 4x50 stile libero  Maschile   -  Categoria M160-199Tempo Base   :  1'39\"09",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_fail( feed )
    end

    it "doesn't recognize a relay header (sample #3)" do
      feed = [
        '',
        "        mistaffetta 4x50 stile libero  -  Categoria M160-199      Tempo Base   :  1'45\"29",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_fail( feed )
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when parsing RELAY_HEADER," do
    subject { ContextDetector.new( FinResultConsts::CNT_TYPE_RELAY_HEADER, nil ) }

    it "recognizes the 'FIN mixed relay w/ base time' format (sample #1)" do
      feed = [
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
        '',
        "        mistaffetta 4x50 stile libero  -  Categoria M100-119      Tempo Base   :  1'42\"99",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN mixed relay w/ base time' format (sample #2)" do
      feed = [
        '',
        "        mistaffetta 4x100 stile libero -  Categoria M120-159      Tempo Base   :  1'43\"07",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN mixed relay w/ base time' format (sample #3)" do
      feed = [
        '',
        "        mistaffetta 4x200 stile libero -  Categoria M160-199      Tempo Base   :  1'44\"97",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN mixed relay w/ base time' format (sample #4)" do
      feed = [
        '',
        "        mistaffetta 4x50 mista  -  Categoria M160-199             Tempo Base   :  1'57\"26",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN mixed relay w/ base time' format (sample #5)" do
      feed = [
        '',
        "        mistaffetta 4x50 stile libero  -  Categoria M240-279      Tempo Base   :  2'02\"17",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN relay w/ base time' format (sample #1)" do
      feed = [
        '',
        "        staffetta 4x50 mista  Maschile   -  Categoria M100-119    Tempo Base   :  1'49\"09",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN relay w/ base time' format (sample #2)" do
      feed = [
        '',
        "        staffetta 4x50 mista  Femminile  -  Categoria M160-199    Tempo Base   :  2'09\"12",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN relay w/ base time' format (sample #3)" do
      feed = [
        '',
        "        staffetta 4x50 stile libero  Maschile   -  Categoria M160-199Tempo Base   :  1'39\"09",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN relay w/ base time' format (sample #4)" do
      feed = [
        '',
        "        staffetta 4x50 stile libero  Femminile  -  Categoria M200-239Tempo Base   :  2'04\"15",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( 3, feed )
    end
    #-- -----------------------------------------------------------------------
    #++

    it "doesn't recognize a result-like feed (sample #1)" do
      feed = [
        '',
        "       1   BIBBIBBI  FRANCESCA            1981   MILANO  NUOTO CSI           1'19\"58  650,73",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_fail( feed )
    end

    it "doesn't recognize a result-like feed (sample #2)" do
      feed = [
        '',
        "  3 EMI-012345 1979 SBRAMBELLA  LUISA             NUOTO OTELLO PUTINA         1'30\"60  828,15",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_fail( feed )
    end

    it "doesn't recognize a result-like feed (sample #3)" do
      feed = [
        '',
        "    EMI-012345 1983 MEGAFAKE JAMIE                OH-MY OH-MY                Ritirato    0,00",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_fail( feed )
    end

    it "doesn't recognize a ranking-like feed (sample #1)" do
      feed = [
        '',
        "                        CSI NUOTO OBER FERR                Squalif.",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_fail( feed )
    end

    it "doesn't recognize a ranking-like feed (sample #2)" do
      feed = [
        '',
        "            1   EMI-001234  GINONE SUPER NUOTO                62525,95",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_fail( feed )
    end

    it "doesn't recognize a ranking-like feed (sample #3)" do
      feed = [
        '',
        "            3   EMI-023456  MI TUFFO CLUB                     46753,95",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_fail( feed )
    end

    it "doesn't recognize a ranking-like feed (sample #4)" do
      feed = [
        '',
        "            3      VADO IN PISCINA                   37112,33",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_fail( feed )
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when parsing TEAM_RANKING," do
    subject { ContextDetector.new( FinResultConsts::CNT_TYPE_TEAM_RANKING, nil ) }

    it "recognizes the 'FIN team-ranking' format (sample #1)" do
      feed = [
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
        "                                  Classifica Società                                 ",
        ''
      ]
      check_for_parsing_ok( 2, feed )
    end

    it "recognizes the 'FIN team-ranking' format (sample #2)" do
      feed = [
        "                                  Classifica Societ�                                 ",
        ''
      ]
      check_for_parsing_ok( 2, feed )
    end

    it "recognizes the 'FIN team-ranking' format (sample #3)" do
      feed = [
        "                                  Classifica Soc.",
        ''
      ]
      check_for_parsing_ok( 2, feed )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when parsing STATS," do
    subject { ContextDetector.new( FinResultConsts::CNT_TYPE_STATS, nil ) }

    it "recognizes the 'FIN stats' format (sample #1)" do
      feed = [
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
        '',
        "                                  Statistiche Società                                 ",
        ''
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN stats' format (sample #2)" do
      feed = [
        '',
        "                                  Statistiche Societ�                                 ",
        ''
      ]
      check_for_parsing_ok( 3, feed )
    end

    it "recognizes the 'FIN stats' format (sample #3)" do
      feed = [
        '',
        "Statistiche societa'",
        ''
      ]
      check_for_parsing_ok( 3, feed )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when parsing RESULT_ROW," do
    subject { ContextDetector.new( FinResultConsts::CNT_TYPE_RESULT_ROW, nil ) }

    it "recognizes the 'FIN result-row' format #1 (sample #1)" do
      feed = [
        "       1   SBIRULONI  FERRUCCIA           1982   N ALBINETANI                5'28\"30  0,00"
      ]
      check_for_parsing_ok( 1, feed, :category_header )
    end

    it "recognizes the 'FIN result-row' format #1 (sample #2)" do
      feed = [
        "       2   MARAMOCCHI  FIORENZA           1972   N REGGIANI                  4'28\"30  0,00"
      ]
      check_for_parsing_ok( 1, feed, :category_header )
    end

    it "recognizes the 'FIN result-row' format #2 (sample #1)" do
      feed = [
        "  3 EMI-012345 1978 BIANCHI  FILIPPA              NUOTO SUPER SPLASH          1'30\"60  828,15"
      ]
      check_for_parsing_ok( 1, feed, :category_header )
    end

    it "recognizes the 'FIN result-row' format #2 (sample #2)" do
      feed = [
        "  4 EMI-012345 1978 ROSSI  MARIA LUIGIA           NUOTO SUPER SPLASH         Squalif.   828,15"
      ]
      check_for_parsing_ok( 1, feed, :category_header )
    end

    it "recognizes the 'FIN result-row' format #2 (sample #3)" do
      feed = [
        "    EMI-012345 1983 MEGAFAKE JAMIE                OH-MY OH-MY                Ritirato    0,00"
      ]
      check_for_parsing_ok( 1, feed, :category_header )
    end
    #-- -----------------------------------------------------------------------
    #++

    it "doesn't recognize a relay-like feed (sample #1)" do
      feed = [
        "                        CSI NUOTO OBER FERR                Squalif."
      ]
      check_for_parsing_fail( feed, 0, :relay_header )
    end

    it "doesn't recognize a relay-like feed (sample #2)" do
      feed = [
        "                  4     MEROLANUOTO S.R.L.                  2'14\"12  874,29"
      ]
      check_for_parsing_fail( feed, 0, :relay_header )
    end

    it "doesn't recognize a relay-like feed (sample #3)" do
      feed = [
        "         Fuori gara     KGB FBI NUOTO                       2'18\"35  744,99"
      ]
      check_for_parsing_fail( feed, 0, :relay_header )
    end

    it "doesn't recognize a ranking-like feed (sample #1)" do
      feed = [
        "            1   EMI-001444  MODENA SPLASH CSI                 62525,95"
      ]
      check_for_parsing_fail( feed, 0, :team_ranking )
    end

    it "doesn't recognize a ranking-like feed (sample #2)" do
      feed = [
        "            1      N REGGIANI                        66495,23"
      ]
      check_for_parsing_fail( feed, 0, :team_ranking )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when parsing RELAY_ROW," do
    subject { ContextDetector.new( FinResultConsts::CNT_TYPE_RELAY_ROW, nil ) }

    it "recognizes the 'FIN relay-row' format #1 (sample #1)" do
      feed = [
        "                        REGGIO NUOTO                       Squalif."
      ]
      check_for_parsing_ok( 1, feed, :relay_header )
    end

    it "recognizes the 'FIN relay-row' format #1 (sample #2)" do
      feed = [
        "         Fuori gara     ROMA A BAGNO                        1'51\"50  855,34"
      ]
      check_for_parsing_ok( 1, feed, :relay_header )
    end

    it "recognizes the 'FIN relay-row' format #1 (sample #3)" do
      feed = [
        "         Fuori gara     SPORTING CLUB ARBIZ                Squalif."
      ]
      check_for_parsing_ok( 1, feed, :relay_header )
    end

    it "recognizes the 'FIN relay-row' format #1 (sample #4)" do
      feed = [
        "                        CSI NUOTO OBER FERR                Ritir."
      ]
      check_for_parsing_ok( 1, feed, :relay_header )
    end

    it "recognizes the 'FIN relay-row' format #1 (sample #5)" do
      feed = [
        "                  4     MEROLANUOTO S.R.L.                  2'14\"12  874,29"
      ]
      check_for_parsing_ok( 1, feed, :relay_header )
    end

    it "recognizes the 'FIN relay-row' format #1 (sample #6)" do
      feed = [
        "         Fuori gara     CSI OBER MASTER NUOTO               2'18\"35  744,99"
      ]
      check_for_parsing_ok( 1, feed, :relay_header )
    end
    #-- -----------------------------------------------------------------------
    #++

    it "doesn't recognize a ranking-like feed (sample #1)" do
      feed = [
        "            1   EMI-123456  MODENESE NUOTO                    62525,95"
      ]
      check_for_parsing_fail( feed, 0, :team_ranking )
    end

    it "doesn't recognize a ranking-like feed (sample #2)" do
      feed = [
        "            1      N REGGIANI                        66495,23"
      ]
      check_for_parsing_fail( feed, 0, :team_ranking )
    end

    it "doesn't recognize a result-like feed (sample #1)" do
      feed = [
        "       1   SBIRULONI  FERRUCCIA           1982   N ALBINETANI                5'28\"30  0,00"
      ]
      check_for_parsing_fail( feed, 0, :category_header )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when parsing RANKING_ROW," do
    subject { ContextDetector.new( FinResultConsts::CNT_TYPE_RANKING_ROW, nil ) }

    it "recognizes the 'FIN ranking-row' format #1 (sample #1)" do
      feed = [
        "            1      N REGGIANI                        66495,23"
      ]
      check_for_parsing_ok( 1, feed, :team_ranking )
    end

    it "recognizes the 'FIN ranking-row' format #1 (sample #2)" do
      feed = [
        "                   CSI NUOTO OBER FERR                   0,00"
      ]
      check_for_parsing_ok( 1, feed, :team_ranking )
    end
    #-- -----------------------------------------------------------------------
    #++

    it "doesn't recognize a relay-like feed (sample #1)" do
      feed = [
        "                  4     MEROLANUOTO S.R.L.                  2'14\"12  874,29"
      ]
      check_for_parsing_fail( feed, 0, :relay_header )
    end

    it "doesn't recognize a result-like feed (sample #1)" do
      feed = [
        "       1   SBIRULONI  FERRUCCIA           1982   N ALBINETANI                5'28\"30  0,00"
      ]
      check_for_parsing_fail( feed, 0, :category_header )
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
