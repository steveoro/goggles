# encoding: utf-8
require 'spec_helper'

require 'framework/console_logger'
require 'parsers/context_detector'
require 'parsers/token_extractor'
require 'parsers/fin_result_consts'


describe "TokenExtractor for RESULT_ROW-type buffers,", type: :integration do

  let(:feed) do
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "       1   BIBBIBBI  FRANCESCA            1981   MILANO  NUOTO CSI           1'19\"58  650,73",
      "       2   DIDDIEFFIGGI  FEDERICA         1980   ROMA  NUOTO SSD  AR         1'17\"73  682,05",
      "       3   D`ALAMBERTO  MARUGONA          1982   A.S.D. RICCIO               1'20\"63  622,03",
      "           FAKE  MARIAPINA GINA LINA      1983   NEVAH.S.C.A.RL.            Ritirata    0,00",
      "           SUPAFAKE  CAMILLA              1982   SOC. 2001 SRL - PAD        Squalif.    0,00",
      "  3 EMI-020270 1979 CHIEREGATO  SARA              NUOTO OTELLO PUTINA         1'30\"60  828,15",
      "  4 VEN-002165 1979 SAMBIN  SILVIA                ACQUAVIVA 2001 SRL          1'36\"99  773,58",
      "    EMI-024761 1982 GAMBETTI  FRANCESCA           ACQUAMBIENTE SSD -         Squalif.    0,00",
      "    EMI-012345 1983 MEGAFAKE JAMIE                OH-MY OH-MY                Ritirato    0,00",

      "  6 EMI-001040 1963 MATTIOLI BERTACCHINI  EMANUEL N MODENESI                  0'40\"01  690,83"
    ]
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing POSITION," do
    subject { FinResultConsts::TOK_EXT_RESULT_ROW_RESULT_POSITION }

    let(:expected_tokens) do
      [ # field = :result_position
        '1',
        '2',
        '3',
        '',
        '',
        '3',
        '4',
        '',
        '',
        '6'
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing TEAM_CODE," do
    subject { FinResultConsts::TOK_EXT_RESULT_ROW_TEAM_CODE }

    let(:expected_tokens) do
      [ # field = :team_code
        '',
        '',
        '',
        '',
        '',
        'EMI-020270',
        'VEN-002165',
        'EMI-024761',
        'EMI-012345',
        "EMI-001040"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing SWIMMER_NAME," do
    subject { FinResultConsts::TOK_EXT_RESULT_ROW_SWIMMER_NAME }

    let(:expected_tokens) do
      [ # field = :swimmer_name
        'BIBBIBBI  FRANCESCA',
        'DIDDIEFFIGGI  FEDERICA',
        'D`ALAMBERTO  MARUGONA',
        'FAKE  MARIAPINA GINA LINA',
        'SUPAFAKE  CAMILLA',
        'CHIEREGATO  SARA',
        'SAMBIN  SILVIA',
        'GAMBETTI  FRANCESCA',
        'MEGAFAKE JAMIE',
        "MATTIOLI BERTACCHINI  EMANUEL"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing SWIMMER_YEAR," do
    subject { FinResultConsts::TOK_EXT_RESULT_ROW_SWIMMER_YEAR }

    let(:expected_tokens) do
      [ # field = :swimmer_year
        '1981',
        '1980',
        '1982',
        '1983',
        '1982',
        '1979',
        '1979',
        '1982',
        '1983',
        "1963"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing TEAM_NAME," do
    subject { FinResultConsts::TOK_EXT_RESULT_ROW_TEAM_NAME }

    let(:expected_tokens) do
      [ # field = :team_name
        'MILANO  NUOTO CSI',
        'ROMA  NUOTO SSD  AR',
        'A.S.D. RICCIO',
        'NEVAH.S.C.A.RL.',
        'SOC. 2001 SRL - PAD',
        'NUOTO OTELLO PUTINA',
        'ACQUAVIVA 2001 SRL',
        'ACQUAMBIENTE SSD -',
        'OH-MY OH-MY',
        "N MODENESI"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing RESULT_TIME," do
    subject { FinResultConsts::TOK_EXT_RESULT_ROW_RESULT_TIME }

    let(:expected_tokens) do
      [ # field = :result_time
        "1'19\"58",
        "1'17\"73",
        "1'20\"63",
        "Ritirata",
        "Squalif.",
        "1'30\"60",
        "1'36\"99",
        "Squalif.",
        "Ritirato",
        "0'40\"01"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing RESULT_SCORE," do
    subject { FinResultConsts::TOK_EXT_RESULT_ROW_RESULT_SCORE }

    let(:expected_tokens) do
      [ # field = :result_score
        '650,73',
        '682,05',
        '622,03',
        '0,00',
        '0,00',
        '828,15',
        '773,58',
        '0,00',
        '0,00',
        "690,83"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
