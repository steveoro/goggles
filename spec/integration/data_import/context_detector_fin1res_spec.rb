# encoding: utf-8
require 'spec_helper'

require_relative './context_detector_checks_for_parsing'


describe "ContextDetector set for 'FIN(1)res' file types,", type: :integration do
  include V2::ContextDetectorChecksForParsing

  class DummyWrapper; include V2::FinResultConsts; end
  let( :dummy_wrapper ) { DummyWrapper.new }
  #-- -------------------------------------------------------------------------
  #++


  # === MEETING_HEADER examples ===
  #
  context "when parsing MEETING_HEADER," do
    subject { V2::ContextDetector.new( dummy_wrapper.context_type_meeting_header, nil ) }

    it "recognizes the 'FIN Campionati Regionali' format" do
      feed = [
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
        "                                  Campionati Regionali Emilia                                  ",
        "                     Manifestazione organizzata da a.s.d. Molinella Nuoto                      ",
        "                              Molinella - 15/16/17 Febbraio 2009                               "
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN Distanze speciali' format" do
      feed = [
        "                                     Distanze speciali EMI                                     ",
        "                Manifestazione organizzata da San Marino Nuoto - Molinellanuoto                ",
        "                                 San Marino - 4 Novembre 2007                                  "
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN meeting header w/ roman numerals at line 0' format" do
      feed = [
        "                                    VIII Trofeo Nuovo Nuoto                                    ",
        "                         Manifestazione organizzata da ASD Nuovo Nuoto                         ",
        "                                    Bologna - 30 Marzo 2008                                    "
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN meeting header w/ roman numerals at line 1' format" do
      feed = [
        "                                    Bologna - 31 Marzo 2008                                    ",
        "                                    VIII Trofeo Nuovo Nuoto                                    ",
        "                         Manifestazione organizzata da ASD Nuovo Nuoto                         "
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN meeting header w/ title on top and bottom date' format (sample #1)" do
      feed = [
        "                                  8° Trofeo Città di Riccione                                  ",
        "                        Manifestazione organizzata da POL. COM. RICCIONE                       ",
        "                                  RICCIONE - 3/4 Dicembre 2011                                 "
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN meeting header w/ title on top and bottom date' format (sample #2)" do
      feed = [
          "                               10° Trofeo Città di Ravenna Master                              ",
          "                    Manifestazione organizzata da Rinascita Team Romagna asd                   ",
          "                                  Ravenna - 14/15 Gennaio 2012                                 "
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN meeting header w/o date but w/ title on line 0' format" do
      feed = [
        "13° Trofeo Città di Desenzano",
        "Manifestazione organizzata da AICS Master - BS",
        ""
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN meeting header w/ date on top and title on line 2' format" do
      feed = [
        "11 novembre 2012",
        "10° Trofeo De Akker Team ASI",
        "Manifestazione organizzata da De Akker"
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN meeting header w/ a dual date on top and title on line 2' format (sample #1)" do
      feed = [
        "20-21 aprile 2013",
        "12° Trofeo Città  di Molinella",
        "Manifestazione organizzata da Molinellanuoto"
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN meeting header w/ a dual date on top and title on line 2' format (sample #1)" do
      feed = [
        "26-27 gennaio 2013  ",
        "17° Trof AICS città di Gussago",
        "Manifestazione organizzata da AICS Master - BS"
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN meeting header w/ a dual date on top and title on line 2' format (sample #1)" do
      feed = [
        "17-24 febbraio 2013 ",
        "Regionali Emilia",
        "Manifestazione organizzata da CR Emilia"
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN meeting header w/ a dual date on top and title on line 2' format (sample #1)" do
      feed = [
        "02-03 marzo 2013  ",
        "28° Brixia Fidelis",
        "Manifestazione organizzata da NC Brescia"
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN meeting header w/ a dual date on top and title on line 2' format (sample #1)" do
      feed = [
        "16 dicembre 2012  ",
        "1� Trofeo Coopernuoto",
        "Manifestazione organizzata da Coopernuoto Scsd"
      ]
      check_for_parsing_ok( feed )
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

    # This examples tests the line_timeout feature of the V2::ContextDetector.
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


  # === CATEGORY_HEADER examples ===
  #
  context "when parsing CATEGORY_HEADER," do
    subject { V2::ContextDetector.new( dummy_wrapper.context_type_category_header, nil ) }

    it "recognizes the 'FIN category w/ base time' format (sample #1)" do
      feed = [
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
        '',
        "        50 stile libero  maschile   -  Categoria  Master 45       Tempo Base   :  0'24\"09",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN category w/ base time' format (sample #2)" do
      feed = [
        '',
        "        200 farfalla  femminile  -  Categoria  Master 25          Tempo Base   :  2'20\"95",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN category w/ base time' format (sample #3)" do
      feed = [
        '',
        "        200 dorso  maschile   -  Categoria  Master 35             Tempo Base   :  2'06\"28",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN category w/ base time' format (sample #4)" do
      feed = [
        '',
        "        1500 stile libero  femminile  -  Categoria  Master 45     Tempo Base   : 18'34\"18",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN category w/ base time' format (sample #5)" do
      feed = [
        '',
        "        100 misti  femminile  -  Categoria  Master 40             Tempo Base   :  1'07\"68",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN category w/ base time' format (sample #6)" do
      feed = [
        '',
        "        50 farfalla  maschile   -  Categoria  Master 55           Tempo Base   :  0'27\"75",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN category w/o base time' format (sample #1)" do
      feed = [
        '',
        "        50 farfalla  femminile  -  Categoria  Under 25             ",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN category w/o base time' format (sample #2)" do
      feed = [
        '',
        "        50 rana  femminile  -  Categoria  Under 25                 ",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
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


  # === RELAY_HEADER examples ===
  #
  context "when parsing RELAY_HEADER," do
    subject { V2::ContextDetector.new( dummy_wrapper.context_type_relay_header, nil ) }

    it "recognizes the 'FIN mixed relay w/ base time' format (sample #1)" do
      feed = [
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
        '',
        "        mistaffetta 4x50 stile libero  -  Categoria M100-119      Tempo Base   :  1'42\"99",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN mixed relay w/ base time' format (sample #2)" do
      feed = [
        '',
        "        mistaffetta 4x100 stile libero -  Categoria M120-159      Tempo Base   :  1'43\"07",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN mixed relay w/ base time' format (sample #3)" do
      feed = [
        '',
        "        mistaffetta 4x200 stile libero -  Categoria M160-199      Tempo Base   :  1'44\"97",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN mixed relay w/ base time' format (sample #4)" do
      feed = [
        '',
        "        mistaffetta 4x50 mista  -  Categoria M160-199             Tempo Base   :  1'57\"26",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN mixed relay w/ base time' format (sample #5)" do
      feed = [
        '',
        "        mistaffetta 4x50 stile libero  -  Categoria M240-279      Tempo Base   :  2'02\"17",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN relay w/ base time' format (sample #1)" do
      feed = [
        '',
        "        staffetta 4x50 mista  Maschile   -  Categoria M100-119    Tempo Base   :  1'49\"09",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN relay w/ base time' format (sample #2)" do
      feed = [
        '',
        "        staffetta 4x50 mista  Femminile  -  Categoria M160-199    Tempo Base   :  2'09\"12",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN relay w/ base time' format (sample #3)" do
      feed = [
        '',
        "        staffetta 4x50 stile libero  Maschile   -  Categoria M160-199Tempo Base   :  1'39\"09",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN relay w/ base time' format (sample #4)" do
      feed = [
        '',
        "        staffetta 4x50 stile libero  Femminile  -  Categoria M200-239Tempo Base   :  2'04\"15",
        '----------------------------------------------------------------------------------------------'
      ]
      check_for_parsing_ok( feed )
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


  # === TEAM_RANKING examples ===
  #
  context "when parsing TEAM_RANKING," do
    subject { V2::ContextDetector.new( dummy_wrapper.context_type_team_ranking, nil ) }

    it "recognizes the 'FIN team-ranking' format (sample #1)" do
      feed = [
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
        "                                  Classifica Società                                 ",
        ''
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN team-ranking' format (sample #2)" do
      feed = [
        "                                  Classifica Societ�                                 ",
        ''
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN team-ranking' format (sample #3)" do
      feed = [
        "                                  Classifica Soc.",
        ''
      ]
      check_for_parsing_ok( feed )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # === STATS examples ===
  #
  context "when parsing STATS," do
    subject { V2::ContextDetector.new( dummy_wrapper.context_type_stats, nil ) }

    it "recognizes the 'FIN stats' format (sample #1)" do
      feed = [
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
        "                                Statistiche                                ",
        ''
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'FIN stats' format (sample #2)" do
      feed = [
        "Statistiche",
        ''
      ]
      check_for_parsing_ok( feed )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # === RESULT_ROW examples ===
  #
  context "when parsing RESULT_ROW," do
    subject { V2::ContextDetector.new( dummy_wrapper.context_type_result_row, nil ) }

    it "recognizes the 'FIN result-row' format #1 (sample #1)" do
      feed = [
        "       1   SBIRULONI  FERRUCCIA           1982   N ALBINETANI                5'28\"30  0,00"
      ]
      check_for_parsing_ok( feed, :category_header )
    end

    it "recognizes the 'FIN result-row' format #1 (sample #2)" do
      feed = [
        "       2   MARAMOCCHI  FIORENZA           1972   N REGGIANI                  4'28\"30  0,00"
      ]
      check_for_parsing_ok( feed, :category_header )
    end

    it "recognizes the 'FIN result-row' format #2 (sample #1)" do
      feed = [
        "  3 EMI-012345 1978 BIANCHI  FILIPPA              NUOTO SUPER SPLASH          1'30\"60  828,15"
      ]
      check_for_parsing_ok( feed, :category_header )
    end

    it "recognizes the 'FIN result-row' format #2 (sample #2)" do
      feed = [
        "  4 EMI-012345 1978 ROSSI  MARIA LUIGIA           NUOTO SUPER SPLASH         Squalif.   828,15"
      ]
      check_for_parsing_ok( feed, :category_header )
    end

    it "recognizes the 'FIN result-row' format #2 (sample #3)" do
      feed = [
        "    EMI-012345 1983 MEGAFAKE JAMIE                OH-MY OH-MY                Ritirato    0,00"
      ]
      check_for_parsing_ok( feed, :category_header )
    end
    #-- -----------------------------------------------------------------------
    #++

    it "doesn't recognize a relay-like feed (DSQ sample #1)" do
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


  # === RELAY_ROW examples ===
  #
  context "when parsing RELAY_ROW," do
    subject { V2::ContextDetector.new( dummy_wrapper.context_type_relay_row, nil ) }

    it "recognizes the 'FIN relay-row' format #1 (sample #1)" do
      feed = [
        "                        REGGIO NUOTO                       Squalif."
      ]
      check_for_parsing_ok( feed, :relay_header )
    end

    it "recognizes the 'FIN relay-row' format #1 (sample #2)" do
      feed = [
        "         Fuori gara     ROMA A BAGNO                        1'51\"50  855,34"
      ]
      check_for_parsing_ok( feed, :relay_header )
    end

    it "recognizes the 'FIN relay-row' format #1 (sample #3)" do
      feed = [
        "         Fuori gara     SPORTING CLUB ARBIZ                Squalif."
      ]
      check_for_parsing_ok( feed, :relay_header )
    end

    it "recognizes the 'FIN relay-row' format #1 (sample #4)" do
      feed = [
        "                        CSI NUOTO OBER FERR                Ritir."
      ]
      check_for_parsing_ok( feed, :relay_header )
    end

    it "recognizes the 'FIN relay-row' format #1 (sample #5)" do
      feed = [
        "                  4     MEROLANUOTO S.R.L.                  2'14\"12  874,29"
      ]
      check_for_parsing_ok( feed, :relay_header )
    end

    it "recognizes the 'FIN relay-row' format #1 (sample #6)" do
      feed = [
        "         Fuori gara     CSI OBER MASTER NUOTO               2'18\"35  744,99"
      ]
      check_for_parsing_ok( feed, :relay_header )
    end

    it "recognizes the 'FIN relay-row' format #1 (sample #6)" do
      feed = [
        "                        FLAMINIO SPORTING CLUB \"B\"          Squalificata"
      ]
      check_for_parsing_ok( feed, :relay_header )
    end

    it "recognizes the 'FIN relay-row' format #1 (sample #7)" do
      feed = [
        "                     VILLA BONELLI NUOTO                            0'00\"00"
      ]
      check_for_parsing_ok( feed, :relay_header )
    end

    #-- -----------------------------------------------------------------------
    #++

    it "doesn't recognize a relay_header-like feed (sample #1)" do
      feed = [
        "        staffetta 4x50 stile libero  Femminile  -  Categoria M100-119Tempo Base   :  1'51\"90"
      ]
      check_for_parsing_fail( feed, 0, :relay_header )
    end

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


  # === STATS_DETAILS examples ===
  #
  context "when parsing STATS_DETAILS," do
    subject { V2::ContextDetector.new( dummy_wrapper.context_type_stats_details, nil ) }

    it "recognizes the 'default' format" do
      check_for_parsing_ok(
        [
          "                Numero di società iscritte                                41     ",
          "                Società che hanno fatto iscrizioni online                 41     ",
          "                Numero di società partecipanti                            40     ",
          "",
          "                Numero totale di atleti iscritti                         361     ",
          "                Numero di atleti under 25 iscritti                        18     ",
          "                Percentuale di atleti under 25 iscritti                 4,99 %   ",
          "                Numero di atleti iscritti online                         356     ",
          "                Percentuale di atleti iscritti online                  98,61 %   ",
          "",
          "                Numero di atleti partecipanti                            343     ",
          "                Numero di atleti assenti                                  18     ",
          "                Percentuale di atleti assenti                           4,99 %   ",
          "                Numero di atleti assenti ad una gara                      11     ",
          "",
          "                Numero totale di iscrizioni alle gare                    717     ",
          "                Numero di iscrizioni alle gare di atleti under 25         36     ",
          "                Percentuale di gare di atleti under 25                  5,02 %   ",
          "",
          "                Numero totale di gare disputate                          672     ",
          "                Numero di gare disputate da atleti under 25               33     ",
          "",
          "                Numero di assenze dalle gare                              45     ",
          "                Percentuale di assenze                                  6,28 %   ",
          "                Numero di squalifiche                                     20     ",
          "                Numero di ritiri                                           2     "
        ], :stats
      )
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # === RANKING_ROW examples ===
  #
  context "when parsing RANKING_ROW," do
    subject { V2::ContextDetector.new( dummy_wrapper.context_type_ranking_row, nil ) }

    it "recognizes the 'FIN ranking-row' format #1 (sample #1)" do
      feed = [
        "            1      N REGGIANI                        66495,23"
      ]
      check_for_parsing_ok( feed, :team_ranking )
    end

    it "recognizes the 'FIN ranking-row' format #1 (sample #2)" do
      feed = [
        "                   CSI NUOTO OBER FERR                   0,00"
      ]
      check_for_parsing_ok( feed, :team_ranking )
    end

    it "recognizes the 'FIN ranking-row' format #1 (sample #3)" do
      feed = [
        "10\tTOS-034786 - AMICI DEL NUOTO FIR  \t14.368,35"
      ]
      check_for_parsing_ok( feed, :team_ranking )
    end

    it "recognizes the 'FIN ranking-row' format #1 (sample #4)" do
      feed = [
        "            4      SWIMMING CLUB ALESS                133"
      ]
      check_for_parsing_ok( feed, :team_ranking )
    end
    #-- -----------------------------------------------------------------------
    #++

    it "doesn't recognize an end of page" do
      feed = [
        "Torna a inizio pagina"
      ]
      check_for_parsing_fail( feed, 0, :team_ranking )
    end

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
