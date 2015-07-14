# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin_result_consts'


describe "TokenExtractor for MEETING_HEADER-type buffers,", type: :integration do
  class DummyWrapper; include V2::FinResultConsts; end
  let( :dummy_wrapper ) { DummyWrapper.new }

  let(:feed) do
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "                                  8° Trofeo Città di Riccione                                  ",
      "                        Manifestazione organizzata da POL. COM. RICCIONE                       ",
      "                                  RICCIONE - 3/4 Dicembre 2011                                 ",
      # False-positive sample that must be discriminated by outer context:
#        " 19 MAR-034567 1979 GINONE  ALESSANDRO            AS FIGARO NUOTO             0'29\"05  800,69",
#        " 20 EMI-023456 1978 GILBERTAZZI  PAOLINO          NUOTO CLUB FIDENZUOLA       0'29\"11  799,04",
#        " 21 MAR-012345 1979 CICCIO  MERCUZIO              POLISP. QUALUNQUE           0'29\"15  797,94",
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
        # False positive:
#          '',
#          '',
#          '',
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
        # False positive:
#          '',
#          '',
#          '',
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
        # False positive:
#          '',
#          '',
#          '',
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
