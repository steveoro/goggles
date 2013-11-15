# encoding: utf-8

require 'test_helper'
require 'framework/console_logger'
require 'parsers/context_detector'
require 'parsers/fin_result_defs'


class ContextDetectorTest < ActiveSupport::TestCase

  test "new" do
    cd = ContextDetector.new(
      :whatever,
      [/ \d{1,3}(?= {1,3})/i, / (?=[a-z]+)/i, ''],
      nil,                                          # logger
      :a_parent
    )
    assert_not_nil( cd, "new ContextDetector instance is nil!")
    assert( cd.instance_of?(ContextDetector) )
    assert_equal( :whatever, cd.context_name, "context_name is different!")
    assert_equal( :a_parent, cd.parent_context_name, "parent_context_name is different!")
    assert_equal( 0, cd.line_timeout, "line_timeout should be 0!")
  end
  # ---------------------------------------------------------------------------

  test "to_s" do
    cd = ContextDetector.new(
      :whatever,
      [/ \d{1,3}(?= {1,3})/i, / (?=[a-z]+)/i, ''],
      nil,                                          # logger
      :a_parent
    )
    puts "\r\nto_s result = #{cd}"
    assert( cd.to_s.size > 0, "to_s returns an empty string!")
  end
  # ---------------------------------------------------------------------------


  test "feed_and_detect_meeting_header" do
    parsing_defs = FinResultDefs.new( '' ) # no filename, no logger defined
    detector = parsing_defs.get_detector_for( :meeting_header )
    fixtures = get_fixtures_for_meeting_header()
    process_fixtures_and_expectations( detector, fixtures )
  end

  test "feed_and_detect_category_header" do
    parsing_defs = FinResultDefs.new( '' ) # no filename, no logger defined
    detector = parsing_defs.get_detector_for( :category_header )
    fixtures = get_fixtures_for_category_header()
    process_fixtures_and_expectations( detector, fixtures )
  end

  test "feed_and_detect_relay_header" do
    parsing_defs = FinResultDefs.new( '' ) # no filename, no logger defined
    detector = parsing_defs.get_detector_for( :relay_header )
    fixtures = get_fixtures_for_relay_header()
    process_fixtures_and_expectations( detector, fixtures )
  end

  test "feed_and_detect_team_ranking" do
    parsing_defs = FinResultDefs.new( '' ) # no filename, no logger defined
    detector = parsing_defs.get_detector_for( :team_ranking )
    fixtures = get_fixtures_for_team_ranking()
    process_fixtures_and_expectations( detector, fixtures )
  end
  # ---------------------------------------------------------------------------

  test "feed_and_detect_result_row" do
    parsing_defs = FinResultDefs.new( '' ) # no filename, no logger defined
    detector = parsing_defs.get_detector_for( :result_row )
    fixtures = get_fixtures_for_result_row()
    process_fixtures_and_expectations( detector, fixtures )
  end

  test "feed_and_detect_relay_row" do
    parsing_defs = FinResultDefs.new( '' ) # no filename, no logger defined
    detector = parsing_defs.get_detector_for( :relay_row )
    fixtures = get_fixtures_for_relay_row()
    process_fixtures_and_expectations( detector, fixtures )
  end

  test "feed_and_detect_ranking_row" do
    parsing_defs = FinResultDefs.new( '' ) # no filename, no logger defined
    detector = parsing_defs.get_detector_for( :ranking_row )
    fixtures = get_fixtures_for_ranking_row()
    process_fixtures_and_expectations( detector, fixtures )
  end
  # ---------------------------------------------------------------------------


  private


  def process_fixtures_and_expectations( detector, fixtures )
    fixtures.each_with_index { |fixture, fixture_idx|
      puts "\r\n=== Testing ContextDetector('#{detector.context_name}') with fixture: #{fixture_idx+1}/#{fixtures.size}..."
      feed     = fixture[:feed]
      results  = fixture[:results]
      previous_context = fixture[:previous_context]

      feed.each_with_index { |txt_line, line_idx|
        fake_line_counter = fixture[:use_fake_line_counter].nil? ? line_idx : (line_idx + feed.size * fixture_idx)
        puts "    Checking fixture line <<#{txt_line}>>...\r\n    (Line: #{line_idx}, fake line counter: #{fake_line_counter}, fixture: #{fixture_idx+1}/#{fixtures.size})"
        is_context_changed = detector.feed_and_detect( txt_line, fake_line_counter, previous_context )
        assert_equal( results[line_idx], is_context_changed )
        
        if ( is_context_changed )
          cached_lines = detector.dump_line_cache()
          assert_equal( feed.size, cached_lines.size, "feed.size:#{feed.size} <> cached_lines.size:#{cached_lines.size}!" )
        end
      }
    }
  end
  # ---------------------------------------------------------------------------


  def get_fixtures_for_meeting_header()
    [
        #            10        20        30        40        50        60        70        80        90
        #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      {
        :feed => [
          "                                  Campionati Regionali Emilia                                  ",
          "                     Manifestazione organizzata da a.s.d. Molinella Nuoto                      ",
          "                              Molinella - 15/16/17 Febbraio 2009                               "
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          "                                     Distanze speciali EMI                                     ",
          "                Manifestazione organizzata da San Marino Nuoto - Molinellanuoto                ",
          "                                 San Marino - 4 Novembre 2007                                  "
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          "                                    VIII Trofeo Nuovo Nuoto                                    ",
          "                         Manifestazione organizzata da ASD Nuovo Nuoto                         ",
          "                                    Bologna - 30 Marzo 2008                                    "
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          "                                    Bologna - 31 Marzo 2008                                    ",
          "                                    VIII Trofeo Nuovo Nuoto                                    ",
          "                         Manifestazione organizzata da ASD Nuovo Nuoto                         "
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          "13° Trofeo Città di Desenzano",
          "Manifestazione organizzata da AICS Master - BS",
          ""
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          "11 novembre 2012",
          "10° Trofeo De Akker Team ASI",
          "Manifestazione organizzata da De Akker"
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          "",
          "        400 stile libero  femminile  -  Categoria  Under 25        ",
          "----------------------------------------------------------------------------------------------"
        ],
        :results => [ false, false, false ]
      },
      {
        :feed => [
          "                                  8° Trofeo Città di Riccione                                  ",
          "                        Manifestazione organizzata da POL. COM. RICCIONE                       ",
          "                                  RICCIONE - 3/4 Dicembre 2011                                 "
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          # False positive:
          " 19 MAR-034567 1979 GINONE  ALESSANDRO            AS FIGARO NUOTO             0'29\"05  800,69",
          " 20 EMI-023456 1978 GILBERTAZZI  PAOLINO          NUOTO CLUB FIDENZUOLA       0'29\"11  799,04",
          " 21 MAR-012345 1979 CICCIO  MERCUZIO              POLISP. QUALUNQUE           0'29\"15  797,94"
        ],
        :results => [ false, false, false ],
        :use_fake_line_counter => true              # Only method to discriminate this false-positive (regexp are too lax)
      },
      {
        :feed => [
          "                               10° Trofeo Città di Ravenna Master                              ",
          "                    Manifestazione organizzata da Rinascita Team Romagna asd                   ",
          "                                  Ravenna - 14/15 Gennaio 2012                                 "
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          "20-21 aprile 2013",
          "12° Trofeo Città  di Molinella",
          "Manifestazione organizzata da Molinellanuoto"
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          "26-27 gennaio 2013  ",
          "17° Trof AICS città di Gussago",
          "Manifestazione organizzata da AICS Master - BS"
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          "17-24 febbraio 2013 ",
          "Regionali Emilia",
          "Manifestazione organizzata da CR Emilia"
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          "02-03 marzo 2013  ",
          "28° Brixia Fidelis",
          "Manifestazione organizzata da NC Brescia"
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          "16 dicembre 2012  ",
          "1� Trofeo Coopernuoto",
          "Manifestazione organizzata da Coopernuoto Scsd"
        ],
        :results => [ false, false, true ]
      }
    ]
  end
  # ---------------------------------------------------------------------------


  def get_fixtures_for_category_header()
    [
        #            10        20        30        40        50        60        70        80        90
        #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      {
        :feed => [
          '',
          "        50 stile libero  maschile   -  Categoria  Master 45       Tempo Base   :  0'24\"09",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          '',
          "        200 farfalla  femminile  -  Categoria  Master 25          Tempo Base   :  2'20\"95",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          '',
          "        50 farfalla  femminile  -  Categoria  Under 25             ",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          '',
          "        200 dorso  maschile   -  Categoria  Master 35             Tempo Base   :  2'06\"28",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          '',
          "        1500 stile libero  femminile  -  Categoria  Master 45     Tempo Base   : 18'34\"18",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          '',
          "        100 misti  femminile  -  Categoria  Master 40             Tempo Base   :  1'07\"68",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          '',
          "        50 farfalla  maschile   -  Categoria  Master 55           Tempo Base   :  0'27\"75",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          '',
          "        50 rana  femminile  -  Categoria  Under 25                 ",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },

      {
        :feed => [
          '',
          "       2   DIDDIEFFIGGI  FEDERICA         1980   ROMA  NUOTO SSD  AR         1'17\"73  682,05",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, false ]
      },
      {
        :feed => [
          '',
          "        mistaffetta 4x50 stile libero  -  Categoria M100-119      Tempo Base   :  1'42\"99",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, false ]
      },
      {
        :feed => [
          '',
          "        staffetta 4x50 stile libero  Maschile   -  Categoria M160-199Tempo Base   :  1'39\"09",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, false ]
      }
    ]
  end
  # ---------------------------------------------------------------------------


  def get_fixtures_for_relay_header()
    [
        #            10        20        30        40        50        60        70        80        90
        #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      {
        :feed => [
          '',
          "        mistaffetta 4x50 stile libero  -  Categoria M100-119      Tempo Base   :  1'42\"99",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          '',
          "        mistaffetta 4x100 stile libero -  Categoria M120-159      Tempo Base   :  1'43\"07",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          '',
          "        mistaffetta 4x200 stile libero -  Categoria M160-199      Tempo Base   :  1'44\"97",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          '',
          "        mistaffetta 4x50 mista  -  Categoria M160-199             Tempo Base   :  1'57\"26",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          '',
          "        staffetta 4x50 mista  Maschile   -  Categoria M100-119    Tempo Base   :  1'49\"09",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          '',
          "        staffetta 4x50 mista  Femminile  -  Categoria M160-199    Tempo Base   :  2'09\"12",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          '',
          "        staffetta 4x50 stile libero  Maschile   -  Categoria M160-199Tempo Base   :  1'39\"09",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },
      {
        :feed => [
          '',
          "        staffetta 4x50 stile libero  Femminile  -  Categoria M200-239Tempo Base   :  2'04\"15",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, true ]
      },

      {
        :feed => [
          '',
          "       1   BIBBIBBI  FRANCESCA            1981   MILANO  NUOTO CSI           1'19\"58  650,73",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, false ]
      },
      {
        :feed => [
          '',
          "  3 EMI-020270 1979 CHIEREGATO  SARA              NUOTO OTELLO PUTINA         1'30\"60  828,15",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, false ]
      },
      {
        :feed => [
          '',
          "    EMI-012345 1983 MEGAFAKE JAMIE                OH-MY OH-MY                Ritirato    0,00",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, false ]
      },
      {
        :feed => [
          '',
          "                        CSI NUOTO OBER FERR                Squalif.",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, false ]
      },
      {
        :feed => [
          '',
          "            1   EMI-001234  GINONE SUPER NUOTO                62525,95",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, false ]
      },
      {
        :feed => [
          '',
          "            3   EMI-023456  MI TUFFO CLUB                     46753,95",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, false ]
      },
      {
        :feed => [
          '',
          "            3      VADO IN PISCINA                   37112,33",
          '----------------------------------------------------------------------------------------------'
        ],
        :results => [ false, false, false ]
      }
    ]
  end
  # ---------------------------------------------------------------------------


  def get_fixtures_for_team_ranking()
    [
        #            10        20        30        40        50        60        70        80        90
        #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      {
        :feed => [
          "                                  Classifica Società                                 ",
          ''
        ],
        :results => [ false, true ]
      },
      {
        :feed => [
          "                                  Classifica Societ�                                 ",
          ''
        ],
        :results => [ false, true ]
      },
      {
        :feed => [
          "                                  Classifica Soc.",
          ''
        ],
        :results => [ false, true ]
      }
    ]
  end
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  def get_fixtures_for_result_row()
    [
      {
        :feed => [
          "       1   SBIRULONI  FERRUCCIA           1982   N ALBINETANI                5'28\"30  0,00"
        ], :previous_context => :category_header, :results => [ true ]
      },
      {
        :feed => [
          "       2   MARAMOCCHI  FIORENZA           1972   N REGGIANI                  4'28\"30  0,00"
        ], :previous_context => :category_header, :results => [ true ]
      },
      {
        :feed => [
          "  3 EMI-012345 1978 BIANCHI  FILIPPA              NUOTO SUPER SPLASH          1'30\"60  828,15"
        ], :previous_context => :category_header, :results => [ true ]
      },
      {
        :feed => [
          "  4 EMI-012345 1978 ROSSI  MARIA LUIGIA           NUOTO SUPER SPLASH         Squalif.   828,15"
        ], :previous_context => :category_header, :results => [ true ]
      },
      {
        :feed => [
          "    EMI-012345 1983 MEGAFAKE JAMIE                OH-MY OH-MY                Ritirato    0,00"
        ], :previous_context => :category_header, :results => [ true ]
      },

      {
        :feed => [
          "                        CSI NUOTO OBER FERR                Squalif."
        ], :previous_context => :relay_header, :results => [ false ]
      },
      {
        :feed => [
          "                  4     MEROLANUOTO S.R.L.                  2'14\"12  874,29"
        ], :previous_context => :relay_header, :results => [ false ]
      },
      {
        :feed => [
          "         Fuori gara     KGB FBI NUOTO                       2'18\"35  744,99"
        ], :previous_context => :relay_header, :results => [ false ]
      },

      {
        :feed => [
          "            1   EMI-001444  MODENA SPLASH CSI                 62525,95"
        ], :previous_context => :team_ranking, :results => [ false ]
      },
      {
        :feed => [
          "            1      N REGGIANI                        66495,23"
        ], :previous_context => :team_ranking, :results => [ false ]
      }
    ]
  end
  # ---------------------------------------------------------------------------


  def get_fixtures_for_relay_row()
    [
      {
        :feed => [
          "                        REGGIO NUOTO                       Squalif."
        ], :previous_context => :relay_header, :results => [ true ]
      },
      {
        :feed => [
          "         Fuori gara     ROMA A BAGNO                        1'51\"50  855,34"
        ], :previous_context => :relay_header, :results => [ true ]
      },
      {
        :feed => [
          "         Fuori gara     SPORTING CLUB ARBIZ                Squalif."
        ], :previous_context => :relay_header, :results => [ true ]
      },
      {
        :feed => [
          "                        CSI NUOTO OBER FERR                Ritir."
        ], :previous_context => :relay_header, :results => [ true ]
      },
      {
        :feed => [
          "                  4     MEROLANUOTO S.R.L.                  2'14\"12  874,29"
        ], :previous_context => :relay_header, :results => [ true ]
      },
      {
        :feed => [
          "         Fuori gara     CSI OBER MASTER NUOTO               2'18\"35  744,99"
        ], :previous_context => :relay_header, :results => [ true ]
      },

      {
        :feed => [
          "            1   EMI-123456  MODENESE NUOTO                    62525,95"
        ], :previous_context => :team_ranking, :results => [ false ]
      },
      {
        :feed => [
          "            1      N REGGIANI                        66495,23"
        ], :previous_context => :team_ranking, :results => [ false ]
      },

      {
        :feed => [
          "       1   SBIRULONI  FERRUCCIA           1982   N ALBINETANI                5'28\"30  0,00"
        ], :previous_context => :category_header, :results => [ false ]
      }
    ]
  end
  # ---------------------------------------------------------------------------


  def get_fixtures_for_ranking_row()
    [
      {
        :feed => [
          "            1      N REGGIANI                        66495,23"
        ], :previous_context => :team_ranking, :results => [ true ]
      },
      {
        :feed => [
          "                   CSI NUOTO OBER FERR                   0,00"
        ], :previous_context => :team_ranking, :results => [ true ]
      },

      {
        :feed => [
          "                  4     MEROLANUOTO S.R.L.                  2'14\"12  874,29"
        ], :previous_context => :relay_header, :results => [ false ]
      },
      {
        :feed => [
          "       1   SBIRULONI  FERRUCCIA           1982   N ALBINETANI                5'28\"30  0,00"
        ], :previous_context => :category_header, :results => [ false ]
      }
    ]
  end
  # ---------------------------------------------------------------------------
end
