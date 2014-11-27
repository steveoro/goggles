# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require 'data_import/services/context_detector'
#require 'data_import/services/token_extractor'
#require 'data_import/fin2_result_consts'


describe "TokenExtractor for RANKING_ROW-type buffers,", type: :integration do
  let( :dummy_wrapper ) do
    class DummyWrapper; include Fin2ResultConsts; end
    DummyWrapper.new
  end

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
    subject { dummy_wrapper.tokenizer_ranking_row_result_position }

    let(:expected_tokens) do
      [ # field = :result_position
        '1',
        '2',
        '3',
        '4',
        '5',
        '1',
        '2',
        '3',
        '4',
        '5',
        '143',
        '',
        '',
        '',
        '',
        '',
        "1°",
        "2°",
        "5°",
        "6°",
        "12°",
        "15°",
        "17°",
        "18°",
        "20°"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing TEAM_CODE," do
    subject { dummy_wrapper.tokenizer_ranking_row_team_code }

    let(:expected_tokens) do
      [ # field = :team_code
        "EMI-001444",
        "EMI-001481",
        "EMI-001451",
        "EMI-001457",
        "EMI-001452",
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
        '',
        ''
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when tokenizing TEAM_NAME," do
    subject { dummy_wrapper.tokenizer_ranking_row_team_name }

    let(:expected_tokens) do
      [ # field = :team_name
        "ESTENSE NUOTO CSI",
        "N MODENESI",
        "RINASCITA TEAM ROMA",
        "NUOTO CLUB 2000",
        "AQUATIC TEAM RAVENN",
        "N MODENESI",
        "CN UISP BOLOGNA",
        "NUOTO CLUB 2000",
        "NUOVO NUOTO",
        "AS MOLINELLA NUOTO",
        "SEA SUB MODENA",
        "ASD SANTA CLARA - G",
        "ASOLA N",
        "FIRENZE NUOTA MASTER A.S.D.",
        "TEAM EUGANEO",
        "",
        "ESTENSE NUOTO CSI A.S. DILETT.",
        "S.NUOTATORI PADOVANI A.S.D.",
        "S.S.D. NATATORIUM TREVISO ar.l.",
        "SSD STILE LIBERO SRL",
        "NUOTOPIU' ACADEMY A.S.DILETT.",
        "A.S.GYMNASIUM SPILIMBERGO",
        "A.S.D.B.N. Nuotatori Veneziani",
        "A.S.DILETT. JESOLONUOTO",
        "a.s.d. ROVIGONUOTO"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing RESULT_SCORE," do
    subject { dummy_wrapper.tokenizer_ranking_row_result_score }

    let(:expected_tokens) do
      [ # field = :result_score
        "62525,95",
        "58272,35",
        "46753,95",
        "37724,16",
        "29332,89",
        "66495,23",
        "44667,70",
        "37112,33",
        "31562,33",
        "24085,60",
        "0,00",
        "0,00",
        "0,00",
        "0,00",
        "0,00",
        "",
        "54412.09",
        "46729.03",
        "40754.42",
        "26266.59",
        "18034.13",
        "15442.72",
        "13057.14",
        "12299.81",
        "10773.76"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
