# encoding: utf-8
require 'spec_helper'

require 'common/encoding_tools'
require 'framework/console_logger'
require_relative './context_detector_checks_for_parsing'


shared_examples_for "(failing EVENT INDIVIDUAL)" do
  # TODO
end


shared_examples_for "(failing EVENT RELAY)" do
  it "doesn't mistakenly recognize a RELAY context (type #1)" do
    check_for_parsing_fail(
      [
        '',
        '--------------------------------------------------------------------------------',
        '   ---   Staffetta 4x50 Misti Mista   ---',
        '    Societa                  Reg Categ    TempoTot    Punti',
        '--------------------------------------------------------------------------------'
      ]
    )
  end
  it "doesn't mistakenly recognize a RELAY context (type #2)" do
    check_for_parsing_fail(
      [
        '',
        '-------------------------------------------------------------------------------------------',
        '   ---   Staffetta 4x50 Stile Libero Femmine   ---',
        '-------------------------------------------------------------------------------------------'
      ]
    )
  end
  it "doesn't mistakenly recognize a RELAY context (type #3)" do
    check_for_parsing_fail(
      [
        '',
        '---------------------------------------------------------------------------------------',
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
        'Torna a inizio pagina',
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
        '',
        '--------------------------------------------------------------------------------',
        "   ---   CLASSIFICA SOCIETA'   ---",
        "                                    Regione     Punt.   Oro  Arg Bro Nga  Med",
        "--------------------------------------------------------------------------------"
      ]
    )
  end
  it "doesn't mistakenly recognize a RANKING context (type #2)" do
    check_for_parsing_fail(
      [
        'Torna a inizio pagina',
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
        "  ",
        "Statistiche",
        ""
      ]
    )
  end
  it "doesn't mistakenly recognize a STATS context (type #2)" do
    check_for_parsing_fail(
      [
        '',
        '----------------------------------------------------------------------------',
        '   ---   STATISTICA FINALE     ---',
        '----------------------------------------------------------------------------'
      ]
    )
  end
  it "doesn't mistakenly recognize a STATS context (type #3)" do
    check_for_parsing_fail(
      [
        ' ',
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
  include ContextDetectorChecksForParsing

  let( :dummy_wrapper ) do
    class DummyWrapper; include Fin2ResultConsts; end
    DummyWrapper.new
  end
  #-- -------------------------------------------------------------------------
  #++


  # === MEETING_HEADER examples ===
  #
  context "when parsing MEETING_HEADER," do
    subject { ContextDetector.new( dummy_wrapper.context_type_meeting_header, nil ) }

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
    subject { ContextDetector.new( dummy_wrapper.context_type_event_individual, nil ) }

    it "recognizes the 'ris20081221mus' format" do
      #              10        20        30        40        50        60        70        80        90
      #    0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      check_for_parsing_ok(
        [
          '',
          '-------------------------------------------------------------------------------------------',
          '   ---   200 Farfalla Femmine   ---',
          '-------------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20091213liv' format" do
      check_for_parsing_ok(
        [
          '',
          '-------------------------------------------------------------------------------------------',
          '   ---   100 Stile Libero Femmine   ---',
          '-------------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20101212liv' format" do
      check_for_parsing_ok(
        [
          '',
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
          '',
          '-------------------------------------------------------------------------------------------',
          '   ---   50 Dorso Maschi   ---',
          '-------------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20130513pont' format" do
      check_for_parsing_ok(
        [
          '',
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
          '',
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
          '',
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
    subject { ContextDetector.new( dummy_wrapper.context_type_event_relay, nil ) }

    it "recognizes the 'ris20081221mus' format" do
      #              10        20        30        40        50        60        70        80        90
      #    0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      check_for_parsing_ok(
        [
          '',
          '-------------------------------------------------------------------------------------------',
          '   ---   Staffetta 4x50 Stile Libero Femmine   ---',
          '-------------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20091213liv' format" do
      check_for_parsing_ok(
        [
          '',
          '-------------------------------------------------------------------------------------------',
          '   ---   Staffetta 4x50 Stile Libero Maschi   ---',
          '-------------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20091213liv' format (sample #2)" do
      check_for_parsing_ok(
        [
          '',
          '-------------------------------------------------------------------------------------------',
          '   ---   Staffetta 4x50 Misti Mista   ---',
          '-------------------------------------------------------------------------------------------'
        ]
      )
    end
    it "recognizes the 'ris20101212liv' format" do
      check_for_parsing_ok(
        [
          '',
          '---------------------------------------------------------------------------------------',
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
          'Torna a inizio pagina',
          'Mistaffetta 4x50 SL',
          ''
        ]
      )
    end
    it "recognizes the 'ris20140330lucc' format (whole)" do
      check_for_parsing_ok(
        [
          'Torna a inizio pagina',
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
          'Torna a inizio pagina',
          'Mistaffetta 4x50 MI',
          ''
        ]
      )
    end
    it "recognizes the 'ris20140330lucc' format (half-2)" do
      check_for_parsing_ok(
        [
          '',
          '--------------------------------------------------------------------------------',
          '   ---   Staffetta 4x50 Misti Mista   ---',
          '    Societa                  Reg Categ    TempoTot    Punti',
          '--------------------------------------------------------------------------------'
        ]
      )
    end
    #-- -------------------------------------------------------------------------
    #++

    it_behaves_like "(failing RANKING)"
    it_behaves_like "(failing STATS)"
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
