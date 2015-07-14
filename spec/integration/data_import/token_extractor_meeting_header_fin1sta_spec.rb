# encoding: utf-8
require 'spec_helper'

require_relative '../../../app/data_import/v2/fin_startlist_consts'


describe "TokenExtractor for MEETING_HEADER-type buffers,", type: :integration do
  class DummyWrapper; include V2::FinStartListConsts; end
  let( :dummy_wrapper ) { DummyWrapper.new }

  let(:feed) do
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "                                  8° Trofeo Città di Riccione                                  ",
      "                        Manifestazione organizzata da POL. COM. RICCIONE                       ",
      "                                  RICCIONE - 3/4 Dicembre 2011                                 ",

      "12° Trofeo Città di Verolanuova",
      "Manifestazione organizzata da Verolanuoto",
      "27-28 Ottobre 2012",
      "1� Meeting Senza Testa",
      "Manifestazione organizzata da Team Osimo Nuoto",
      "Mistaffetta 4x50 MI400 SL50 FA100 DO200 RAStaffetta 4x50 MI200 SL100 FA200 DO50 RA100 SL200 MI50 SL200 FA50 DO100 RAStaffetta 4x50 SLStatistiche",
      "Distanze speciali Liguria",
      "Manifestazione organizzata da CR Liguria",
      "800 SL1500 SLStatistiche",
      "2� Trofeo Poggibonsi",
      "Manifestazione organizzata da Virtus Nuoto Poggibonsi",
      "100 FA50 RA100 DO50 SL100 MI100 SL50 DO100 RA50 FAStatistiche",

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
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing HEADER_TITLE," do
    subject { dummy_wrapper.tokenizer_meeting_header_title }

    let(:expected_tokens) do
      [ # field = :title
        "8° Trofeo Città di Riccione",
        '',
        '',

        "12° Trofeo Città di Verolanuova",
        "",
        "",
        "1� Meeting Senza Testa",
        "",
        "",
        "Distanze speciali Liguria",
        "",
        "",
        "2� Trofeo Poggibonsi",
        "",
        "",

        "10° Trofeo Città di Ravenna Master",
        '',
        '',
        "2° Trofeo del Golfo",
        '',
        '',
        "VIII Trofeo Nuovo Nuoto",
        '',
        '',
        "Trofeo A.I.C.S. \"Città di Desenzano\" - 12ª edizione",
        '',
        '',
        "Campionati Regionali Emilia",
        '',
        '',
        '',
        "10° Trofeo De Akker Team ASI",
        '',
        '',
        "12° Trofeo Città  di Molinella",
        '',
        '',
        "17° Trof AICS città di Gussago",
        '',
        '',
        "Regionali Emilia",
        '',
        '',
        "28° Brixia Fidelis",
        ''
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing MEETING_DATES," do
    subject { dummy_wrapper.tokenizer_meeting_header_meeting_dates }

    let(:expected_tokens) do
      [ # field = :meeting_dates
        '',
        '',
        "3/4 Dicembre 2011",

        "",
        "",
        "27-28 Ottobre 2012",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",
        "",

        '',
        '',
        "14/15 Gennaio 2012",
        '',
        '',
        "8 Marzo 2008",
        '',
        '',
        "30 Marzo 2008",
        '',
        '',
        "26/27 Gennaio 2008",
        '',
        '',
        "15/16/17 Febbraio 2009",
        "11 novembre 2012",
        '',
        '',
        "20-21 aprile 2013",
        '',
        '',
        "26-27 gennaio 2013",
        '',
        '',
        "17-24 febbraio 2013",
        '',
        '',
        "02-03 marzo 2013",
        '',
        ''
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing ORGANIZATION," do
    subject { dummy_wrapper.tokenizer_meeting_header_organization }

    let(:expected_tokens) do
      [ # field = :organization
        '',
        'POL. COM. RICCIONE',
        '',

        "",
        "Verolanuoto",
        "",
        "",
        "Team Osimo Nuoto",
        "",
        "",
        "CR Liguria",
        "",
        "",
        "Virtus Nuoto Poggibonsi",
        "",

        '',
        'Rinascita Team Romagna asd',
        '',
        '',
        'AS DIL RN SPEZIA',
        '',
        '',
        'ASD Nuovo Nuoto',
        '',
        '',
        'A.S.D. Master A.I.C.S. Brescia',
        '',
        '',
        'a.s.d. Molinella Nuoto',
        '',
        '',
        '',
        "De Akker",
        '',
        '',
        "Molinellanuoto",
        '',
        '',
        "AICS Master - BS",
        '',
        '',
        "CR Emilia",
        '',
        '',
        "NC Brescia"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
