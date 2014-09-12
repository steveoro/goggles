# encoding: utf-8
require 'spec_helper'

require 'framework/console_logger'
require 'parsers/context_detector'
require 'parsers/token_extractor'
require 'parsers/fin_result_consts'


describe "TokenExtractor for RELAY_ROW-type buffers,", type: :integration do

  let(:feed) do
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "                  1     ADRIA NUOTO SSD  AR                 2'07\"17  809,86",
      "         Fuori gara     AS DELFINO 93                       1'54\"15  902,23",
      "                  2     MASTERNUOTOFIDENZA                  2'20\"59  733,12",
      "         Fuori gara     KGO KLAB GEST.OPERA                 2'18\"35  744,99",
      "                  3     GIS-GEST. IMPIANTI                  2'10\"95  801,60",
      "                  4     PADOVANUOTO S.R.L.                  2'14\"12  874,29",
      "                        CSI NUOTO OBER FERR                Squalif.",
      "                  5     CN UISP BOLOGNA                     2'23\"74  871,02",
      "                  6     NUOTO CLUB 2000                     2'41\"79  773,84",

      "                1  SIC-000140   POL. WATERPOLO PALE              2'06\"56  987,67",
      "                1  LOM-009402   MALASPINA SC                     1'35\"98 1003,23",
      "                1  LOM-037241   SPORT MANAGEMENT                 1'45\"45  955,05"
    ]
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing RESULT_POSITION," do
    subject { FinResultConsts::TOK_EXT_RELAY_ROW_RESULT_POSITION }

    let(:expected_tokens) do
      [ # field = :result_position
        '1',
        'Fuori gara',
        '2',
        'Fuori gara',
        '3',
        '4',
        '',
        '5',
        '6',

        '1',
        '1',
        '1'
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing TEAM_NAME," do
    subject { FinResultConsts::TOK_EXT_RELAY_ROW_TEAM_NAME }

    let(:expected_tokens) do
      [ # field = :team_name
        'ADRIA NUOTO SSD  AR',
        'AS DELFINO 93',
        'MASTERNUOTOFIDENZA',
        'KGO KLAB GEST.OPERA',
        'GIS-GEST. IMPIANTI',
        'PADOVANUOTO S.R.L.',
        'CSI NUOTO OBER FERR',
        'CN UISP BOLOGNA',
        'NUOTO CLUB 2000',

        'POL. WATERPOLO PALE',
        'MALASPINA SC',
        'SPORT MANAGEMENT'
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing RESULT_TIME," do
    subject { FinResultConsts::TOK_EXT_RELAY_ROW_RESULT_TIME }

    let(:expected_tokens) do
      [ # field = :result_time
        "2'07\"17",
        "1'54\"15",
        "2'20\"59",
        "2'18\"35",
        "2'10\"95",
        "2'14\"12",
        'Squalif.',
        "2'23\"74",
        "2'41\"79",

        "2'06\"56",
        "1'35\"98",
        "1'45\"45"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing RESULT_SCORE," do
    subject { FinResultConsts::TOK_EXT_RELAY_ROW_RESULT_SCORE }

    let(:expected_tokens) do
      [ # field = :result_score
        '809,86',
        '902,23',
        '733,12',
        '744,99',
        '801,60',
        '874,29',
        '',
        '871,02',
        '773,84',

        '987,67',
        '1003,23',
        '955,05'
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
