# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin_result_consts'


describe "TokenExtractor for RANKING_ROW-type buffers,", type: :integration do
  class DummyWrapper; include V2::FinResultConsts; end
  let( :dummy_wrapper ) { DummyWrapper.new }

  let(:feed) do
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "            1   EMI-001444  ESTENSE NUOTO CSI                 62525,95",
      "            2   EMI-001481  N MODENESI                        58272,35",
      "            3   EMI-001451  RINASCITA TEAM ROMA               46753,95",
      "            4   EMI-001457  NUOTO CLUB 2000                   37724,16",
      "            5   EMI-001452  AQUATIC TEAM RAVENN               29332,89",
      "            6      N MODENESI                        66495,23",
      "            7      CN UISP BOLOGNA                   44667,70",
      "            8      NUOTO CLUB 2000                   37112,33",
      "            9      NUOVO NUOTO                       31562,33",
      "           10      AS MOLINELLA NUOTO                24085,60",
      "          143      SEA SUB MODENA                        0,00",
      "                   ASD SANTA CLARA - G                   0,00",
      "                   ASOLA N                               0,00",
      "                   FIRENZE NUOTA MASTER A.S.D.           0,00",
      "                   TEAM EUGANEO                          0,00",
      "",
      " 1° ESTENSE NUOTO CSI A.S. DILETT.  54412.09  67  812.12",
      " 2° S.NUOTATORI PADOVANI A.S.D.     46729.03  53  881.68",
      " 5° S.S.D. NATATORIUM TREVISO ar.l. 40754.42  56  727.76",
      " 6° SSD STILE LIBERO SRL            26266.59  32  820.83",
      "12° NUOTOPIU' ACADEMY A.S.DILETT. 18034.13  21  858.77",
      "15° A.S.GYMNASIUM SPILIMBERGO 15442.72  20  772.14",
      "17° A.S.D.B.N. Nuotatori Veneziani  13057.14  18  725.40",
      "18° A.S.DILETT. JESOLONUOTO   12299.81  17  723.52",
      "20° a.s.d. ROVIGONUOTO        10773.76  19  567.04",
      "    1)   Flaminio Sporting Club                   203120,20",
      "    4)   Due Ponti ssd                            111513,50",
      "    5)   Circolo Canottieri Aniene                110270,70",
      " 1 LAZ-074109 - EMPIRE ROMA SSD  \t43.049,36",
      "46 LAZ-039648 - FERRATELLA SPORT SR   1.251,19",
      "47\tCAM-020133 - IL GABBIANO NAPOLI \t   990,19",
      "49 LAZ-042987 - G.S. VV. F.  F. SOR     670,74",
      "            1      CAN VITTORINO                      369"
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
        '6',
        '7',
        '8',
        '9',
        '10',
        '143',
        '',
        '',
        '',
        '',
        '',
        "1",
        "2",
        "5",
        "6",
        "12",
        "15",
        "17",
        "18",
        "20",
        "1",
        "4",
        "5",
        "1",
        "46",
        "47",
        "49",
        "1"
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
        '',
        '',
        '',
        '',
        "LAZ-074109",
        "LAZ-039648",
        "CAM-020133",
        "LAZ-042987",
        ""
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
        "a.s.d. ROVIGONUOTO",
        "Flaminio Sporting Club",
        "Due Ponti ssd",
        "Circolo Canottieri Aniene",
        "EMPIRE ROMA SSD",
        "FERRATELLA SPORT SR",
        "IL GABBIANO NAPOLI",
        "G.S. VV. F.  F. SOR",
        "CAN VITTORINO"
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
        "10773.76",
        "203120,20",
        "111513,50",
        "110270,70",
        "43.049,36",
        "1.251,19",
        "990,19",
        "670,74",
        "369"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
