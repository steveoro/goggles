# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require 'data_import/services/context_detector'
#require 'data_import/services/token_extractor'
#require 'data_import/fin_result_consts'


describe "TokenExtractor for RELAY_ROW-type buffers,", type: :integration do
  let( :dummy_wrapper ) do
    class DummyWrapper; include FinResultConsts; end
    DummyWrapper.new
  end

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
      "                1  LOM-037241   SPORT MANAGEMENT                 1'45\"45  955,05",

      "                  1  EMI-001439   MODENA NUOTO                     2'20\"87  747,43",
      "                  2  VEN-002980   CENTRO NUOTO JESOLO              2'22\"03  741,32",
      "                  3  EMI-006504   CIVATURS DE AKKER                2'32\"95  688,39",
      "                  1  EMI-001438   ASS.NE AMICI DEL NU              2'43\"31  748,09",
      "                  1  EMI-001439   MODENA NUOTO                     2'20\"87  747,43",
      "                  2  VEN-002980   CENTRO NUOTO JESOLO              2'22\"03  741,32",
      "                  3  EMI-006504   CIVATURS DE AKKER                2'32\"95  688,39",
      "                  1  EMI-001438   ASS.NE AMICI DEL NU              2'43\"31  748,09",

      "                  1  UMB-000017   LIBERTAS THYRUS ASD              1'56\"86  928,72",
      "                  2  TOS-017267   C.S.I. NUOTO PRATO               2'07\"68  850,02",
      "                  8  EMI-001430   ASS.SPORTIVA DINAMI              2'24\"32  752,01",
      "         Fuori gara  XSM-000102   SAN MARINO MASTER                2'10\"10  834,20",
      "         Fuori gara  MAR-000566   POLISP. PIAN DEL BR              2'10\"61  830,95",
      "         Fuori gara  MAR-000465   IL GRILLO                        2'24\"58  750,66"
    ]
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing RESULT_POSITION," do
    subject { dummy_wrapper.tokenizer_relay_row_result_position }

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
        '1',

        '1',
        '2',
        '3',
        '1',
        '1',
        '2',
        '3',
        '1',

        '1',
        '2',
        '8',
        'Fuori gara',
        'Fuori gara',
        'Fuori gara'
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing TEAM_NAME," do
    subject { dummy_wrapper.tokenizer_relay_row_team_name }

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
        'SPORT MANAGEMENT',

        "MODENA NUOTO",
        "CENTRO NUOTO JESOLO",
        "CIVATURS DE AKKER",
        "ASS.NE AMICI DEL NU",
        "MODENA NUOTO",
        "CENTRO NUOTO JESOLO",
        "CIVATURS DE AKKER",
        "ASS.NE AMICI DEL NU",

        "LIBERTAS THYRUS ASD",
        "C.S.I. NUOTO PRATO",
        "ASS.SPORTIVA DINAMI",
        "SAN MARINO MASTER",
        "POLISP. PIAN DEL BR",
        "IL GRILLO"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing RESULT_TIME," do
    subject { dummy_wrapper.tokenizer_relay_row_result_time }

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
        "1'45\"45",

        "2'20\"87",
        "2'22\"03",
        "2'32\"95",
        "2'43\"31",
        "2'20\"87",
        "2'22\"03",
        "2'32\"95",
        "2'43\"31",

        "1'56\"86",
        "2'07\"68",
        "2'24\"32",
        "2'10\"10",
        "2'10\"61",
        "2'24\"58"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing RESULT_SCORE," do
    subject { dummy_wrapper.tokenizer_relay_row_result_score }

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
        '955,05',

        "747,43",
        "741,32",
        "688,39",
        "748,09",
        "747,43",
        "741,32",
        "688,39",
        "748,09",

        "928,72",
        "850,02",
        "752,01",
        "834,20",
        "830,95",
        "750,66"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++