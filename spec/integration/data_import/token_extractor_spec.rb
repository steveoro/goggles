# encoding: utf-8
require 'spec_helper'

require 'framework/console_logger'
require 'parsers/context_detector'
require 'parsers/token_extractor'
require 'parsers/fin_result_consts'


describe TokenExtractor, type: :integration do

  # Checks if the specified feed is successfully recognized after all rows have
  # been checked.
  #
  def check_for_parsing_ok( feed_array )
    # TODO
  end


  # TODO Convert old integration test (under test/unit) into new specs



  context "when parsing MEETING_HEADER," do
    subject { FinResultConsts::CNT_TYPE_MEETING_HEADER }

    # TODO Divide feed & expectations among all meeting_header Tokenizers
    # TODO test each single expectation with its own feed
    feed = [
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

    expectations = [ # field list = [:title, :meeting_dates, :organization]
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

    it "splits correctly in tokens the supplied feed line"

    it "fails to extract tokens from a wrong feed line"

  end

end
#-- ---------------------------------------------------------------------------
#++
