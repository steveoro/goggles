# encoding: utf-8
require 'spec_helper'

require 'common/encoding_tools'
require 'framework/console_logger'
require_relative './context_detector_checks_for_parsing'


shared_examples_for "(failing EVENT INDIVIDUAL)" do
  it "doesn't mistakenly recognize a RESULT context (type #1)" do
    check_for_parsing_fail(
      [
        '',
        '-------------------------------------------------------------------------------------------',
        '   ---   200 Rana Femmine   ---',
        '-------------------------------------------------------------------------------------------'
      ]
    )
  end
  it "doesn't mistakenly recognize a RESULT context (type #2)" do
    check_for_parsing_fail(
      [
        '',
        '---------------------------------------------------------------------------------------',
        '   ---   200 Misti Femmine   ---',
        '',
        '    Atleta                    Cat. S  Societa                   Reg  Tempo   Punti',
        '---------------------------------------------------------------------------------------'
      ]
    )
  end
  it "doesn't mistakenly recognize a RESULT context (type #3)" do
    check_for_parsing_fail(
      [
        '',
        '--------------------------------------------------------------------------------',
        '   ---   200 Stile Libero Femmine   ---',
        '   Atleta                    Cat Societa                   Reg Tempo    Punti',
        '--------------------------------------------------------------------------------'
      ]
    )
  end
end


shared_examples_for "(failing EVENT RELAY)" do
  it "doesn't mistakenly recognize a RELAY context (type #1)" do
    check_for_parsing_fail(
      [
#        '',
#        '--------------------------------------------------------------------------------',
        '   ---   Staffetta 4x50 Misti Mista   ---',
        '    Societa                  Reg Categ    TempoTot    Punti',
        '--------------------------------------------------------------------------------'
      ]
    )
  end
  it "doesn't mistakenly recognize a RELAY context (type #2)" do
    check_for_parsing_fail(
      [
#        '',
#        '-------------------------------------------------------------------------------------------',
        '   ---   Staffetta 4x50 Stile Libero Femmine   ---',
        '-------------------------------------------------------------------------------------------'
      ]
    )
  end
  it "doesn't mistakenly recognize a RELAY context (type #3)" do
    check_for_parsing_fail(
      [
#        '',
#        '---------------------------------------------------------------------------------------',
        '   ---   Staffetta 4x50 Stile Libero Maschi   ---',
        '',
        '    Societa                   Reg Categ   TempoTot  Primo frazionista      Tempo     Punti',
        '---------------------------------------------------------------------------------------'
      ]
    )
  end
  it "doesn't mistakenly recognize a RELAY context (type #4)" do
    check_for_parsing_fail(
      [
#        'Torna a inizio pagina',
        'Mistaffetta 4x50 SL',
        '',
        '    Societa                   Reg Categ   TempoTot  Primo frazionista      Tempo',
        '---------------------------------------------------------------------------------------'
      ]
    )
  end
end


shared_examples_for "(failing RANKING)" do
  it "doesn't mistakenly recognize a RANKING context (type #1)" do
    check_for_parsing_fail(
      [
#        '',
#        '--------------------------------------------------------------------------------',
        "   ---   CLASSIFICA SOCIETA'   ---",
        "                                    Regione     Punt.   Oro  Arg Bro Nga  Med",
        "--------------------------------------------------------------------------------"
      ]
    )
  end
  it "doesn't mistakenly recognize a RANKING context (type #2)" do
    check_for_parsing_fail(
      [
#        'Torna a inizio pagina',
        'Classifica societ�',
        '',
        '                                    Regione          Punt.   Oro  Arg Bro Nga   Med',
        '------------------------------------------------------------------------------------',
        ''
      ]
    )
  end
end


shared_examples_for "(failing STATS)" do
  it "doesn't mistakenly recognize a STATS context (type #1)" do
    check_for_parsing_fail(
      [
#        "  ",
        "Statistiche",
        ""
      ]
    )
  end
  it "doesn't mistakenly recognize a STATS context (type #2)" do
    check_for_parsing_fail(
      [
#        '',
#        '----------------------------------------------------------------------------',
        '   ---   STATISTICA FINALE     ---',
        '----------------------------------------------------------------------------'
      ]
    )
  end
  it "doesn't mistakenly recognize a STATS context (type #3)" do
    check_for_parsing_fail(
      [
#        ' ',
        'Reg Societa                         NrF    NrM    TotI   GrF    GrM    TotG',
        '---------------------------------------------------------------------------',
        ''
      ]
    )
  end
end
#-- ---------------------------------------------------------------------------
#-- ---------------------------------------------------------------------------
#++


describe "ContextDetector set for 'FIN2res' file types,", type: :integration do
  include V2::ContextDetectorChecksForParsing

  class DummyWrapper2; include V2::Fin2ResultConsts; end
  let( :dummy_wrapper2 ) { DummyWrapper2.new }
  #-- -------------------------------------------------------------------------
  #++


  # === MEETING_HEADER examples ===
  #
  context "when parsing MEETING_HEADER," do
    subject { V2::ContextDetector.new( dummy_wrapper2.context_type_meeting_header, nil ) }

    it "recognizes the 'ris20081221mus' format" do
      #              10        20        30        40        50        60        70        80        90
      #    0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      check_for_parsing_ok(
        [
          '',
          "Viareggio - Domenica 21 Dicembre 2008 - III� Trofeo Mussi Lombardi Femiano III� Memorial Francesco Rizzo",
          ''
        ]
      )
    end
    it "recognizes the 'ris20091213liv' format" do
      check_for_parsing_ok(
        [
          '',
          "Domenica 13 Dicembre 2009  XI� Meeting Degli Auguri  VII� Campionato Italiano U N V S",
          ''
        ]
      )
    end
    it "recognizes the 'ris20101212liv' format" do
      check_for_parsing_ok(
        [
          '',
          "12.o MEETING DEGLI AUGURI - 8.o CAMPIONATO ITALIANO UNVS",
          'LIVORNO --- 12 DICEMBRE 2010',
          '--  -  --'
        ]
      )
    end
    it "recognizes the 'ris20101219mus' format" do
      check_for_parsing_ok(
        [
          '',
          "Domenica 19 Dicembre 2010 - V� Trofeo \" Mussi Lombardi Femiano \" Memorial \" Francesco Rizzo \"",
          '',
          ''
        ]
      )
    end
    it "recognizes the 'ris20130513pont' format" do
      check_for_parsing_ok(
        [
          '12� Meeting della Valdera',
          "Manifestazione organizzata da DN Pontedera",
          ''
        ]
      )
    end
    it "recognizes the 'ris20131117pogg' format" do
      check_for_parsing_ok(
        [
          '2� Trofeo Poggibonsi',
          'Manifestazione organizzata da Virtus Nuoto Poggibonsi',
          '100 FA50 RA100 DO50 SL100 MI100 SL50 DO100 RA50 FAClassifica societ�Statistiche',
          '100 FA',
          ''
        ]
      )
    end
    it "recognizes the 'ris20140330lucc' format" do
      check_for_parsing_ok(
        [
          '7� Tr Ilaria del Carretto',
          'Manifestazione organizzata da Circolo Nuoto Lucca',
          'Mistaffetta 4x50 SL200 SL50 DO100 RA50 FA200 DO100 MI100 FA50 RAMistaffetta 4x50 MIClassifica societ�Statistiche',
          'Mistaffetta 4x50 SL',
          ''
        ]
      )
    end
    #-- -------------------------------------------------------------------------
    #++

    it "doesn't recognize a false-positive (sample #1)" do
      check_for_parsing_fail(
        [
          '',
          '',
          ''
        ],
        4 # fake start offset: after this line, every check should return false
      )
    end
    it "doesn't recognize a false-positive (sample #2)" do
      check_for_parsing_fail(
        [
          '100 FA',
          '',
          '---------------------------------------------------------------------------------------'
        ],
        4 # fake start offset: after this line, every check should return false
      )
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  # === EVENT_INDIVIDUAL examples ===
  #
  context "when parsing EVENT_INDIVIDUAL," do
    subject { V2::ContextDetector.new( dummy_wrapper2.context_type_event_individual, nil ) }

    it "recognizes the 'ris20081221mus' format" do
      #              10        20        30        40        50        60        70        80        90
      #    0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      check_for_parsing_ok(
        [
#          '',
          '-------------------------------------------------------------------------------------------',
          '   ---   200 Farfalla Femmine   ---',
          '-------------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20091213liv' format" do
      check_for_parsing_ok(
        [
#          '',
          '-------------------------------------------------------------------------------------------',
          '   ---   100 Stile Libero Femmine   ---',
          '-------------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20101212liv' format" do
      check_for_parsing_ok(
        [
#          '',
          '---------------------------------------------------------------------------------------',
          '   ---   200 Stile Libero Femmine   ---',
          '',
          '    Atleta                    Cat. S  Societa                   Reg  Tempo   Punti',
          '---------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20101219mus' format" do
      check_for_parsing_ok(
        [
#          '',
          '-------------------------------------------------------------------------------------------',
          '   ---   50 Dorso Maschi   ---',
          '-------------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20130513pont' format" do
      check_for_parsing_ok(
        [
#          '',
          '---------------------------------------------------------------------------------------',
          '   ---   50 Stile Libero Femmine   ---',
          '',
          '    Atleta                    Cat. S  Societa                   Reg  Tempo   Punti',
          '---------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20131117pogg' format" do
      check_for_parsing_ok(
        [
#          '',
          '---------------------------------------------------------------------------------------',
          '   ---   50 Rana Femmine   ---',
          '',
          '    Atleta                    Cat. S  Societa                   Reg  Tempo   Punti',
          '---------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20140330lucc' format" do
      check_for_parsing_ok(
        [
#          '',
          '--------------------------------------------------------------------------------',
          '   ---   200 Dorso Femmine   ---',
          '   Atleta                    Cat Societa                   Reg Tempo    Punti',
          '--------------------------------------------------------------------------------'
        ]
      )
    end
    #-- -------------------------------------------------------------------------
    #++

    it_behaves_like "(failing EVENT RELAY)"
    it_behaves_like "(failing RANKING)"
    it_behaves_like "(failing STATS)"
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  # === EVENT_RELAY examples ===
  #
  context "when parsing EVENT_RELAY," do
    subject { V2::ContextDetector.new( dummy_wrapper2.context_type_event_relay, nil ) }

    it "recognizes the 'ris20081221mus' format" do
      #              10        20        30        40        50        60        70        80        90
      #    0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      check_for_parsing_ok(
        [
#          '',
#          '-------------------------------------------------------------------------------------------',
          '   ---   Staffetta 4x50 Stile Libero Femmine   ---',
          '-------------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20091213liv' format" do
      check_for_parsing_ok(
        [
#          '',
#          '-------------------------------------------------------------------------------------------',
          '   ---   Staffetta 4x50 Stile Libero Maschi   ---',
          '-------------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20091213liv' format (sample #2)" do
      check_for_parsing_ok(
        [
#          '',
#          '-------------------------------------------------------------------------------------------',
          '   ---   Staffetta 4x50 Misti Mista   ---',
          '-------------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20101212liv' format" do
      check_for_parsing_ok(
        [
#          '',
#          '---------------------------------------------------------------------------------------',
          '   ---   Staffetta 4x50 Stile Libero Maschi   ---',
          '',
          '    Societa                   Reg Categ   TempoTot  Primo frazionista      Tempo     Punti',
          '---------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20130513pont' format" do
      check_for_parsing_ok(
        [
#          'Torna a inizio pagina',
          'Mistaffetta 4x50 SL',
          ''
        ]
      )
    end
    it "recognizes the 'ris20140330lucc' format (whole)" do
      check_for_parsing_ok(
        [
#          'Torna a inizio pagina',
          'Mistaffetta 4x50 MI',
          '',
          '--------------------------------------------------------------------------------',
          '   ---   Staffetta 4x50 Misti Mista   ---',
          '    Societa                  Reg Categ    TempoTot    Punti',
          '--------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20140330lucc' format (half-1)" do
      check_for_parsing_ok(
        [
#          'Torna a inizio pagina',
          'Mistaffetta 4x50 MI',
          ''
        ]
      )
    end
    it "recognizes the 'ris20140330lucc' format (half-2)" do
      check_for_parsing_ok(
        [
#          '',
#          '--------------------------------------------------------------------------------',
          '   ---   Staffetta 4x50 Misti Mista   ---',
          '    Societa                  Reg Categ    TempoTot    Punti',
          '--------------------------------------------------------------------------------'
        ]
      )
    end
    #-- -------------------------------------------------------------------------
    #++

    it_behaves_like "(failing EVENT INDIVIDUAL)"
    it_behaves_like "(failing RANKING)"
    it_behaves_like "(failing STATS)"
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  # === TEAM_RANKING examples ===
  #
  context "when parsing TEAM_RANKING," do
    subject { V2::ContextDetector.new( dummy_wrapper2.context_type_team_ranking, nil ) }

    it "recognizes the 'ris20081221mus' format" do
      #              10        20        30        40        50        60        70        80        90
      #    0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      check_for_parsing_ok(
        [
#          '',
#          '----------------------------------------------------------------------------------------',
          "                   ---   CLASSIFICA SOCIETA'   ---",
          '',
          "     Codice    Societa'                       Regione             Punt.  Oro    Ar.  Br.",
          "----------------------------------------------------------------------------------------"
        ]
      )
    end
    # (ris20091213liv is equal)
    it "recognizes the 'ris20101212liv' format" do
      check_for_parsing_ok(
        [
#          '',
#          "------------------------------------------------------------------------------",
          "   ---   CLASSIFICA SOCIETA'   ---",
          "                                    Regione               Punt.  Oro  Ar.  Br.",
          "------------------------------------------------------------------------------"
        ]
      )
    end
    it "recognizes the 'ris20101219mus' format" do
      check_for_parsing_ok(
        [
#          '',
#          "-------------------------------------------------------------------------------------------",
          "                   ---   CLASSIFICA SOCIETA'   ---",
          '',
          "              Societa'                       Regione             Punt.  Oro     Ar.     Br.",
          "-------------------------------------------------------------------------------------------"
        ]
      )
    end
    it "recognizes the 'ris20130513pont' format" do
      check_for_parsing_ok(
        [
#          "Torna a inizio pagina",
          "Classifica societ�",
          "",
          "                                    Regione          Punt.   Oro  Arg Bro Nga   Med",
          "------------------------------------------------------------------------------------"
        ]
      )
    end
    # (ris20131117pogg is equal)
     it "recognizes the 'ris20140330lucc' format" do
      check_for_parsing_ok(
        [
#          "Torna a inizio pagina",
          "Classifica societ�",
          "",
          "--------------------------------------------------------------------------------",
          "   ---   CLASSIFICA SOCIETA'   ---",
          "                                    Regione     Punt.   Oro  Arg Bro Nga  Med",
          "--------------------------------------------------------------------------------"
        ]
      )
    end
    #-- -------------------------------------------------------------------------
    #++

    it_behaves_like "(failing EVENT INDIVIDUAL)"
    it_behaves_like "(failing EVENT RELAY)"
    it_behaves_like "(failing STATS)"
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  # === STATS examples ===
  #
  context "when parsing STATS," do
    subject { V2::ContextDetector.new( dummy_wrapper2.context_type_stats, nil ) }

    it "recognizes the 'ris20081221mus' format" do
      #              10        20        30        40        50        60        70        80        90
      #    0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      check_for_parsing_ok(
        [
#          '',
#          '----------------------------------------------------------------------------',
          '   ---   STATISTICA FINALE     ---',
          '----------------------------------------------------------------------------'
        ]
      )
    end
    # (ris20091213liv is equal)
    # (ris20101212liv is equal)
    it "recognizes the 'ris20101219mus' format" do
      check_for_parsing_ok(
        [
#          '                                 ',
          '                                         Statistiche',
          ''
        ]
      )
    end
    it "recognizes the 'ris20130513pont' format" do
      check_for_parsing_ok(
        [
#          '  ',
          'Statistiche',
          ''
        ]
      )
    end
    # (ris20131117pogg is equal)
    it "recognizes the 'ris20140330lucc' format (whole)" do
      check_for_parsing_ok(
        [
#          '  ',
          'Statistiche',
          '',
          '----------------------------------------------------------------------------',
          '   ---   STATISTICA FINALE     ---',
          '----------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20140330lucc' format (half-1)" do
      check_for_parsing_ok(
        [
#          '  ',
          'Statistiche',
          ''
        ]
      )
    end
    it "recognizes the 'ris20140330lucc' format (half-2)" do
      check_for_parsing_ok(
        [
#          '----------------------------------------------------------------------------',
          '   ---   STATISTICA FINALE     ---',
          '----------------------------------------------------------------------------'
        ]
      )
    end
    #-- -------------------------------------------------------------------------
    #++

    it_behaves_like "(failing EVENT INDIVIDUAL)"
    it_behaves_like "(failing EVENT RELAY)"
    it_behaves_like "(failing RANKING)"
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  # *** Specs for DETAIL contexts ***


  # === RESULT_ROW examples ===
  #
  context "when parsing RESULT_ROW," do
    subject { V2::ContextDetector.new( dummy_wrapper2.context_type_result_row, nil ) }

    it "doesn't mistakenly recognize a empty line" do
      check_for_parsing_fail(
        [
          ''
        ], 0, :event_individual
      )
    end
    it "doesn't mistakenly recognize a separator line" do
      check_for_parsing_fail(
        [
          '-------------------------------------------------------------------------------------------'
        ], 0, :event_individual
      )
    end

    it "recognizes the 'ris20081221mus' format (M30)" do
      #              10        20        30        40        50        60        70        80        90
      #    0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      check_for_parsing_ok(
        [
          "1   LIG014209 OLIVERI FRANCESCA      1979 30 F  RN SPEZIA 86               03 32 76  654,92 "
        ], :event_individual
      )
    end
    it "recognizes the 'ris20081221mus' format (U25)" do
      check_for_parsing_ok(
        [
          "1   EMI023180 ARTEAGA HECTOR ALESSAN 1988 0 M  ASD CSI NUOTO OBER FERRAR  02 53 82 "
        ], :event_individual
      )
    end
    it "recognizes the 'ris20081221mus' format (extra)" do
      check_for_parsing_ok(
        [
          "1   LOM019717 MONTINI ALBERTO        1968 40 M  ACQUASPORT BY T D          02 15 95 1016,26 MO (M40)"
        ], :event_individual
      )
    end

    it "recognizes the 'ris20091213liv' format (M25)" do
      check_for_parsing_ok(
        [
          "1   TOS033546 PINTO MARIL�           1982 25 F  ASD CIRCOLO NUOTO LUCCA    03 44 80  691,55 "
        ], :event_individual
      )
    end
    it "recognizes the 'ris20091213liv' format (U25)" do
      check_for_parsing_ok(
        [
          "1   TOS001216 MALCOTTI GIULIA        1986 0 F  ASD CSI NUOTO PRATO        00 31 92 "
        ], :event_individual
      )
    end
    it "recognizes the 'ris20091213liv' format (extra)" do
      check_for_parsing_ok(
        [
          "1   TOS004244 CANESSA LUCIANO        1919 90 M  ASD DLF NUOTO LIVORNO      05 07 48  763,92 IT (M90)"
        ], :event_individual
      )
    end

    it "recognizes the 'ris20101212liv' format (U25)" do
      check_for_parsing_ok(
        [
          "1   BIANCHI VERONICA          U 25 F  CIRCOLO NUOTO LUCCA       TOS 00 39 42         "
        ], :event_individual
      )
    end
    it "recognizes the 'ris20101212liv' format (M40)" do
      check_for_parsing_ok(
        [
          "2   SESENA BARBARA            M 40 F  CSI NUOTO OBER FERRARI    EMI 00 42 99  744,82 "
        ], :event_individual
      )
    end
    it "recognizes the 'ris20101212liv' format (extra)" do
      check_for_parsing_ok(
        [
          "1   PAOLETTI GIORGIO          M 25 M  DLF NUOTO LIVORNO         TOS 02 14 16  967,05 IT (M25)"
        ], :event_individual
      )
    end
    # (ris20101219mus is equal to ris20081221mus)

    it "recognizes the 'ris20130513pont' format (extra)" do
      check_for_parsing_ok(
        [
          "1   DE GIAMPIETRO MARIO       M 90 M  POLISPORTIVA GARDEN SRL S EMI 06 04 00  973,24 IT (M90)"
        ], :event_individual
      )
    end

    it "recognizes the 'ris20131117pogg' format (fg)" do
      check_for_parsing_ok(
        [
          "fg  MEINI SARA                U 25 F  NUOTO LIBERTAS ROSIGNANO  TOS 00 41 32       "
        ], :event_individual
      )
    end

    it "recognizes the 'ris20140330lucc' format (extra)" do
      check_for_parsing_ok(
        [
          "1  BOSCHETTI ETTORE LUIGI    M 60 ANDREA DORIA              LIG 02 33 06 1006,93 IT (M60)"
        ], :event_individual
      )
    end
    #-- -------------------------------------------------------------------------
    #++

    it_behaves_like "(failing EVENT INDIVIDUAL)"
    it_behaves_like "(failing EVENT RELAY)"
    it_behaves_like "(failing RANKING)"
    it_behaves_like "(failing STATS)"
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  # === RELAY_ROW examples ===
  #
  context "when parsing RELAY_ROW," do
    subject { V2::ContextDetector.new( dummy_wrapper2.context_type_relay_row, nil ) }

    it "doesn't mistakenly recognize a empty line" do
      check_for_parsing_fail(
        [
          ''
        ], 0, :event_relay
      )
    end
    it "doesn't mistakenly recognize a separator line" do
      check_for_parsing_fail(
        [
          '-------------------------------------------------------------------------------------------'
        ], 0, :event_relay
      )
    end
    it "doesn't mistakenly recognize a secondary relay row" do
      check_for_parsing_fail(
        [
          '   Gino Pino Mariolino      00 00 00  '
        ], 0, :event_relay
      )
    end

    it "recognizes the 'ris20081221mus' format (280)" do
      #              10        20        30        40        50        60        70        80        90
      #    0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      check_for_parsing_ok(
        [
          "1   ASD DLF NUOTO LIVORNO      280 (F) 03 46 73  Noberini Nara          00 00 00  PR IT"
        ], :event_relay
      )
    end
    it "recognizes the 'ris20081221mus' format (160)" do
      check_for_parsing_ok(
        [
          "1   ASD VERSILIANUOTO          160 (C) 01 52 73  De Martino Alberto     00 00 00  "
        ], :event_relay
      )
    end

    it "recognizes the 'ris20091213liv' format (119)" do
      check_for_parsing_ok(
        [
          "1   ASD DLF NUOTO LIVORNO      119 (A) 01 46 07  Pancaccini Pablo       00 00 00  "
        ], :event_relay
      )
    end
    it "recognizes the 'ris20091213liv' format (159)" do
      check_for_parsing_ok(
        [
          "8   CSI ROMA FLAMINIO          159 (B) 02 11 31  Villani Luciano        00 00 00  "
        ], :event_relay
      )
    end
    it "recognizes the 'ris20091213liv' format (279)" do
      check_for_parsing_ok(
        [
          "1   ASD DLF NUOTO LIVORNO      279 (E) 01 55 59  Samaritani Dino  Barontini ILIO 00 00 00  RC IT"
        ], :event_relay
      )
    end

    it "recognizes the 'ris20101212liv' format (199)" do
      check_for_parsing_ok(
        [
          "2   CANOTTIERI ARNO PISA      TOS 199 (C)  02 04 23  Licciardello Giacomo   00 00 00  "
        ], :event_relay
      )
    end

    it "recognizes the 'ris20130513pont' format (U25)" do
      check_for_parsing_ok(
        [
          "1   NUOTO LIBERTAS ROSIGNANO  TOS 99 (U25) 02 02 82  Paladini Luca        00 00 00  "
        ], :event_relay
      )
    end
    it "recognizes the 'ris20130513pont' format (159)" do
      check_for_parsing_ok(
        [
          "6   NUOTOPIU' ACADEMY         TOS 159 (B)  02 16 25  Vivian Nicola        00 00 00  "
        ], :event_relay
      )
    end

    it "recognizes the 'ris20140330lucc' format (119)" do
      check_for_parsing_ok(
        [
          "1  CANOTTIERI ARNO PISA      TOS 119 (A)  02 20 11          "
        ], :event_relay
      )
    end
    it "recognizes the 'ris20140330lucc' format (319)" do
      check_for_parsing_ok(
        [
          "1  NUOTO LUCCA CAPANNORI     TOS 319 (F)  04 12 99          "
        ], :event_relay
      )
    end
    #-- -------------------------------------------------------------------------
    #++

    it_behaves_like "(failing EVENT INDIVIDUAL)"
    it_behaves_like "(failing EVENT RELAY)"
    it_behaves_like "(failing RANKING)"
    it_behaves_like "(failing STATS)"
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  # === RANKING_ROW examples ===
  #
  context "when parsing RANKING_ROW," do
    subject { V2::ContextDetector.new( dummy_wrapper2.context_type_ranking_row, nil ) }

    it "doesn't mistakenly recognize a empty line" do
      check_for_parsing_fail(
        [
          ''
        ], 0, :team_ranking
      )
    end
    it "doesn't mistakenly recognize a separator line" do
      check_for_parsing_fail(
        [
          '-------------------------------------------------------------------------------------------'
        ], 0, :team_ranking
      )
    end
    it "doesn't mistakenly recognize an header row" do
      check_for_parsing_fail(
        [
          "     Codice    Societa'                       Regione             Punt.  Oro    Ar.  Br."
        ], 0, :team_ranking
      )
    end

    it "recognizes the 'ris20081221mus' format" do
      #              10        20        30        40        50        60        70        80        90
      #    0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      check_for_parsing_ok(
        [
          " 25  EMI001454 ASD CSI NUOTO OBER FERRARI     Emilia Romagna      3741,89    3    4    0"
        ], :team_ranking
      )
    end

    it "recognizes the 'ris20091213liv' format" do
      check_for_parsing_ok(
        [
          " 1   TOS000538 ASD DLF NUOTO LIVORNO          Toscana           158426,41   66   38   39"
        ], :team_ranking
      )
    end

    it "recognizes the 'ris20101212liv' format" do
      check_for_parsing_ok(
        [
          " 25  CSI NUOTO OBER FERRARI         Emilia Romagna      6117,39    1    3    0"
        ], :team_ranking
      )
    end

    it "recognizes the 'ris20101219mus' format (#1)" do
      check_for_parsing_ok(
        [
          "2)  POLISPORTIVA AMATORI PRATO       Toscana       36900,920  16  10   7"
        ], :team_ranking
      )
    end
    it "recognizes the 'ris20101219mus' format (#2)" do
      check_for_parsing_ok(
        [
          "14)   ASD ALTO RENO DE AKKER               Emilia Romagna   6972,720   3   2   3"
        ], :team_ranking
      )
    end

    it "recognizes the 'ris20130513pont' format (#1)" do
      check_for_parsing_ok(
        [
          " 1   DIMENSIONE NUOTO PONTEDERA     Toscana        103932,25  24  22  23 144 721,75"
        ], :team_ranking
      )
    end
    it "recognizes the 'ris20130513pont' format (#2)" do
      check_for_parsing_ok(
        [
          " 25  CENTRO NUOTO UISP BOLOGNA      Emilia Romagna   4627,05   2   0   1   6 771,18"
        ], :team_ranking
      )
    end

    it "recognizes the 'ris20140330lucc' format (#1)" do
      check_for_parsing_ok(
        [
          " 7   RINASCITA TEAM ROMAGNA         EMI         20702,57  11   4   4  26 796,25"
        ], :team_ranking
      )
    end
    it "recognizes the 'ris20140330lucc' format (#2)" do
      check_for_parsing_ok(
        [
          " 38  SKY LINE NUOTO                 LOM           813,11   0   0   0   1 813,11"
        ], :team_ranking
      )
    end
    #-- -------------------------------------------------------------------------
    #++

    it_behaves_like "(failing EVENT INDIVIDUAL)"
    it_behaves_like "(failing EVENT RELAY)"
    it_behaves_like "(failing RANKING)"
    it_behaves_like "(failing STATS)"
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  # === STATS_DETAILS examples ===
  #
  context "when parsing STATS_DETAILS (format 1)," do
    subject { V2::ContextDetector.new( dummy_wrapper2.context_type_stats_details_type1, nil ) }

    it "recognizes the 'ris20101219mus' format" do
      check_for_parsing_ok(
        [
          "                Numero di societ� iscritte                   65",
          "                Societ� con iscrizioni online                54",
          "                Numero di societ� partecipanti               51 ",
          "",
          "                Numero totale di atleti iscritti            508 ",
          "                Numero di atleti iscritti online            421",
          "                ",
          "                Numero di atleti partecipanti               325",
          "                Numero di atleti assenti                    183",
          "                             ",
          "                Numero di iscrizioni alle gare              976 ",
          "                Numero di gare disputate                    606",
          "                Numero di assenze dalle gare                370",
          "                                    ",
          "                Numero di squalifiche                        11"
        ], :stats
      )
    end

    it_behaves_like "(failing EVENT INDIVIDUAL)"
    it_behaves_like "(failing EVENT RELAY)"
    it_behaves_like "(failing RANKING)"
    it_behaves_like "(failing STATS)"
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when parsing STATS_DETAILS (format 2)," do
    subject { V2::ContextDetector.new( dummy_wrapper2.context_type_stats_details_type2, nil ) }

    it "recognizes the 'ris20081221mus' format" do
      #              10        20        30        40        50        60        70        80        90
      #    0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      check_for_parsing_ok(
        [
          " Societ� Iscritte                                     75",
          " Societ� Presenti                                     67",
          '',
          " Atleti Iscritti                                     498",
          " Atleti Presenti                                     413",
          " Percentuale Assenti                                  17,07",
          " Atleta Presente con una gara non effettuata          27",
          '',
          " Iscrizioni Gare                                     946",
          " Gare Disputate                                      761",
          " Assenza Gare                                        185",
          " Percentuale Gare Non Disputate                       19,56",
          '',
          " Staffette Disputate                                   2",
          '',
          " Squalifiche                                          17",
          " Ritiri                                                0"
        ], :stats
      )
    end
    # (ris20091213liv is equal to ris20081221mus)
    # (ris20101212liv is equal to ris20081221mus)
    # (ris20130513pont is equal to ris20081221mus)
    # (ris20131117pogg is equal to ris20081221mus)
    # (ris20140330lucc is equal to ris20081221mus)

    it_behaves_like "(failing EVENT INDIVIDUAL)"
    it_behaves_like "(failing EVENT RELAY)"
    it_behaves_like "(failing RANKING)"
    it_behaves_like "(failing STATS)"
  end
  #-- -------------------------------------------------------------------------
  #++

end
#-- ---------------------------------------------------------------------------
#++
