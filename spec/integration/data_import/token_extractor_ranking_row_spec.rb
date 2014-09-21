# encoding: utf-8
require 'spec_helper'

require 'framework/console_logger'
require 'parsers/context_detector'
require 'parsers/token_extractor'
require 'parsers/fin_result_consts'


describe "TokenExtractor for RANKING_ROW-type buffers,", type: :integration do
  let( :dummy_wrapper ) do
    class DummyWrapper; include FinResultConsts; end
    DummyWrapper.new
  end

  let(:feed) do
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "            1   EMI-001444  ESTENSE NUOTO CSI                 62525,95",
      "            2   EMI-001481  N MODENESI                        58272,35",
      "            3   EMI-001451  RINASCITA TEAM ROMA               46753,95",
      "            4   EMI-001457  NUOTO CLUB 2000                   37724,16",
      "            5   EMI-001452  AQUATIC TEAM RAVENN               29332,89",
      "            1      N MODENESI                        66495,23",
      "            2      CN UISP BOLOGNA                   44667,70",
      "            3      NUOTO CLUB 2000                   37112,33",
      "            4      NUOVO NUOTO                       31562,33",
      "            5      AS MOLINELLA NUOTO                24085,60",
      "          143      SEA SUB MODENA                        0,00",
      "                   ASD SANTA CLARA - G                   0,00",
      "                   ASOLA N                               0,00",
      "                   FIRENZE NUOTA MASTER A.S.D.           0,00",
      "                   TEAM EUGANEO                          0,00",
      ""
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
        ''
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
        ""
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
        ""
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
