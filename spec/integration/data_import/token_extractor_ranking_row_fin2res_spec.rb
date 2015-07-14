# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin2_result_consts'


describe "TokenExtractor for RANKING_ROW-type buffers,", type: :integration do
  class DummyWrapper2; include V2::Fin2ResultConsts; end
  let( :dummy_wrapper2 ) { DummyWrapper2.new }

  let(:feed) do
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      " 1   DIMENSIONE NUOTO PONTEDERA     TOS         45923,00   8  10   9  66 695,80",
      " 10  NUOTO UISP 2003                TOS         16942,00  10   6   2  24 705,92",
      " 18  PALLANUOTO BENFICA VIAREGGIO   TOS          8960,83   1   3   4  12 746,74",

      " 1   FIRENZE NUOTA MASTER           Toscana         62701,77  35  17  12  86 729,09",
      " 12  AZZURRA RACE TEAM              Umbria           8392,52   4   2   2  12 699,38",
      " 26  POLISPORTIVA GARDEN SRL S.S. D Emilia Romagna   1563,87   2   0   0   2 781,94",
      " 1   DIMENSIONE NUOTO PONTEDERA     Toscana        103932,25  24  22  23 144 721,75",
      " 20  AS DILET NUOTO CLUB AZZURRA 91 Emilia Romagna   6983,69   3   2   2  11 634,88",
      " 30  SPORT MANAGEMENT LOMBARDIA ASD Lombardia        3290,31   3   0   1   4 822,58",

      "1)   ASD DLF NUOTO LIVORNO                Toscana       49084,580  21  14  10",
      "11)  ASS NUOTO LUCCA CAPANNORI        Toscana       10960,530   7   3   2",
      "12)  CANOTTIERI ARNO PISA               Toscana        8089,260   1   3   1",
      "14)  ASD ALTO RENO DE AKKER               Emilia Romagna   6972,720   3   2   3",
      "22)  EUROPARADISE                       Lazio        4716,910   1   1   0",
      "26)  VILLA BONELLI NUOTO                Emilia Romagna   3268,840   1   2   0",

      " 4   NUOTATORI MODENESI             Emilia Romagna     37526,18    6    9   11",
      " 18  DIMENSIONE NUOTO PONTEDERA     Toscana             8232,30    1    0    2",
      " 44  A.S.D.  NATATORIUM TREVISO     Veneto              1381,12    0    1    0",

      " 1   TOS000538 ASD DLF NUOTO LIVORNO          Toscana           158426,41   66   38   39",
      " 24  EMI001454 ASD CSI NUOTO OBER FERRARI     Emilia Romagna      7308,19    1    4    1",
      " 56  FRI000424 AS GORIZIA NUOTO               Friuli V. Giulia     970,84    1    0    0",
      " 10  TOS029877 ASD MASSA NUOTO                Toscana            11580,82    3    0    2",
      " 25  EMI001454 ASD CSI NUOTO OBER FERRARI     Emilia Romagna      3741,89    3    4    0",
      " 42  EMI001447 NUOTO CLUB 91 PARMA            Emilia Romagna      1761,95    1    0    1"
    ]
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing RESULT_POSITION," do
    subject { dummy_wrapper2.tokenizer_ranking_row_result_position }

    let(:expected_tokens) do
      [ # field = :result_position
        "1",
        "10",
        "18",

        "1",
        "12",
        "26",
        "1",
        "20",
        "30",

        "1)",
        "11)",
        "12)",
        "14)",
        "22)",
        "26)",

        "4",
        "18",
        "44",

        "1",
        "24",
        "56",
        "10",
        "25",
        "42"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing TEAM_CODE," do
    subject { dummy_wrapper2.tokenizer_ranking_row_team_code }

    let(:expected_tokens) do
      [ # field = :team_code
        '',
        '',
        '',

        '',
        '',
        '',
        '',
        '',
        '',

        '',
        '',
        '',
        '',
        '',
        '',

        '',
        '',
        '',

        "TOS000538",
        "EMI001454",
        "FRI000424",
        "TOS029877",
        "EMI001454",
        "EMI001447"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing TEAM_NAME," do
    subject { dummy_wrapper2.tokenizer_ranking_row_team_name }

    let(:expected_tokens) do
      [ # field = :team_name
        "DIMENSIONE NUOTO PONTEDERA",
        "NUOTO UISP 2003",
        "PALLANUOTO BENFICA VIAREGGIO",

        "FIRENZE NUOTA MASTER",
        "AZZURRA RACE TEAM",
        "POLISPORTIVA GARDEN SRL S.S. D",
        "DIMENSIONE NUOTO PONTEDERA",
        "AS DILET NUOTO CLUB AZZURRA 91",
        "SPORT MANAGEMENT LOMBARDIA ASD",

        "ASD DLF NUOTO LIVORNO",
        "ASS NUOTO LUCCA CAPANNORI",
        "CANOTTIERI ARNO PISA",
        "ASD ALTO RENO DE AKKER",
        "EUROPARADISE",
        "VILLA BONELLI NUOTO",

        "NUOTATORI MODENESI",
        "DIMENSIONE NUOTO PONTEDERA",
        "A.S.D.  NATATORIUM TREVISO",

        "ASD DLF NUOTO LIVORNO",
        "ASD CSI NUOTO OBER FERRARI",
        "AS GORIZIA NUOTO",
        "ASD MASSA NUOTO",
        "ASD CSI NUOTO OBER FERRARI",
        "NUOTO CLUB 91 PARMA"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing RESULT_SCORE," do
    subject { dummy_wrapper2.tokenizer_ranking_row_result_score }

    let(:expected_tokens) do
      [ # field = :result_score
        "45923,00",
        "16942,00",
        "8960,83",

        "62701,77",
        "8392,52",
        "1563,87",
        "103932,25",
        "6983,69",
        "3290,31",

        "49084,580",
        "10960,530",
        "8089,260",
        "6972,720",
        "4716,910",
        "3268,840",

        "37526,18",
        "8232,30",
        "1381,12",

        "158426,41",
        "7308,19",
        "970,84",
        "11580,82",
        "3741,89",
        "1761,95"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
