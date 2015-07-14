# encoding: utf-8
require 'spec_helper'

require_relative './context_detector_checks_for_parsing'
require_relative '../../../app/data_import/v2/fin_startlist_consts'


describe "ContextDetector set for 'FIN(1)sta' file types,", type: :integration do
  include V2::ContextDetectorChecksForParsing

  class DummyWrapper; include V2::FinStartListConsts; end
  let( :dummy_wrapper ) { DummyWrapper.new }
  #-- -------------------------------------------------------------------------
  #++


  # === MEETING_HEADER examples ===
  #
  context "when parsing MEETING_HEADER," do
    subject { V2::ContextDetector.new( dummy_wrapper.context_type_meeting_header, nil ) }

    it "recognizes the 'sta20121027verolanuova' fixture" do
      feed = [
        "12° Trofeo Città di Verolanuova",
        "Manifestazione organizzata da Verolanuoto",
        "27-28 Ottobre 2012"
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'sta20131102osimo' fixture" do
      feed = [
        "1� Meeting Senza Testa",
        "Manifestazione organizzata da Team Osimo Nuoto",
        "Mistaffetta 4x50 MI400 SL50 FA100 DO200 RAStaffetta 4x50 MI200 SL100 FA200 DO50 RA100 SL200 MI50 SL200 FA50 DO100 RAStaffetta 4x50 SLStatistiche"
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'sta20131103spec' fixture" do
      feed = [
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
        "Distanze speciali Liguria",
        "Manifestazione organizzata da CR Liguria",
        "800 SL1500 SLStatistiche"
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'sta20131116albenga' fixture" do
      feed = [
        "4� Trofeo Citt� di Albenga",
        "Manifestazione organizzata da S.S.D. IDEA SPORT a R.L.",
        "200 MI200 SL50 FA50 DO100 RA100 SL400 MI100 FA100 DO50 RA50 SLStatistiche"
      ]
      check_for_parsing_ok( feed )
    end

    it "recognizes the 'sta20131117poggibonsi' fixture" do
      feed = [
        "2� Trofeo Poggibonsi",
        "Manifestazione organizzata da Virtus Nuoto Poggibonsi",
        "100 FA50 RA100 DO50 SL100 MI100 SL50 DO100 RA50 FAStatistiche"
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
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  # === EVENT_INDIVIDUAL examples ===
  #
  context "when parsing EVENT_INDIVIDUAL," do
    subject { V2::ContextDetector.new( dummy_wrapper.context_type_event_individual, nil ) }

    it "recognizes the shortened 'FIN event' format (sample #1)" do
      feed = [
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
        '200 SL',
        ''
      ]
      check_for_parsing_ok( feed )
    end
    it "recognizes the shortened 'FIN event' format (sample #2)" do
      feed = [
        '400 SL',
        ''
      ]
      check_for_parsing_ok( feed )
    end
    it "recognizes the shortened 'FIN event' format (sample #3)" do
      feed = [
        '50 DO',
        ''
      ]
      check_for_parsing_ok( feed )
    end
    it "recognizes the shortened 'FIN event' format (sample #4)" do
      feed = [
        '100 MI',
        ''
      ]
      check_for_parsing_ok( feed )
    end
    it "recognizes the shortened 'FIN event' format (sample #5)" do
      feed = [
        '1500 SL',
        ''
      ]
      check_for_parsing_ok( feed )
    end
    it "recognizes the shortened 'FIN event' format (sample #6)" do
      feed = [
        '50 RA',
        ''
      ]
      check_for_parsing_ok( feed )
    end
    it "recognizes the shortened 'FIN event' format (sample #6)" do
      feed = [
        '50 FA',
        ''
      ]
      check_for_parsing_ok( feed )
    end
    it "recognizes the shortened 'FIN event' format (sample #6)" do
      feed = [
        '200 DO',
        ''
      ]
      check_for_parsing_ok( feed )
    end
    #-- -----------------------------------------------------------------------
    #++

    it "doesn't recognize a false-positive (sample #1)" do
      feed = [
        '400 SL, 100 MI, 100 SL, 50 RA, 50 FA, 200 MI, 50 DO, 50 SL',
        ''
      ]
      check_for_parsing_fail( feed )
    end
    it "doesn't recognize a false-positive (sample #2)" do
      feed = [
        '4   200SL   28   1:35   3:47   17:47',
        ''
      ]
      check_for_parsing_fail( feed )
    end
    it "doesn't recognize a false-positive (sample #3)" do
      feed = [
        '200 MI200 SL50 FA50 DO100 RA100 SL400 MI100 FA100 DO50 RA50 SLStatistiche',
        ''
      ]
      check_for_parsing_fail( feed )
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++


  # === ENTRY_ROW examples ===
  #
  context "when parsing ENTRY_ROW," do
    subject { V2::ContextDetector.new( dummy_wrapper.context_type_entry_row, nil ) }

    it "recognizes the 'FIN entry-row' format #1 (sample #1)" do
      feed = [
        " 10   SBIRULONI  FERRUCCIA           M50  NUOTATORI ALBINETANI       3'09\"00"
      ]
      check_for_parsing_ok( feed, :event_individual )
    end
    it "recognizes the 'FIN entry-row' format #1 (sample #2)" do
      feed = [
        " 22   MARMOCCHI  CRISTINA            U25  CLOROLESI POVIGLIO         6'50\"00"
      ]
      check_for_parsing_ok( feed, :event_individual )
    end
    it "recognizes the 'FIN entry-row' format #1 (sample #3)" do
      feed = [
        " 10   CANGELLI  CLAUDIA              M60  BERGAMO NUOTO ASD          7'35\"00"
      ]
      check_for_parsing_ok( feed, :event_individual )
    end

    it "recognizes the 'FIN entry-row' format #2 (sample #1)" do
      feed = [
        "1   ROSTAGNI SIMONE           M  M 45  MAROTTA NUOTA MASTER                02.40.00"
      ]
      check_for_parsing_ok( feed, :event_individual )
    end

    it "recognizes the 'FIN entry-row' format #2 (sample #2)" do
      feed = [
        "35  MONATA ROSTRO             M  M 55  DIMENSIONE NUOTO FANTAMARZO         00.42.50"
      ]
      check_for_parsing_ok( feed, :event_individual )
    end

    it "recognizes the 'FIN entry-row' format #2 (sample #3)" do
      feed = [
        "23  FLOPPO DISCO              F  M 25  AMICI DEL CLORO FIDENZA             01.15.00"
      ]
      check_for_parsing_ok( feed, :event_individual )
    end
    #-- -----------------------------------------------------------------------
    #++
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
