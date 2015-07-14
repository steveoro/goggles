# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin_result_consts'


describe "TokenExtractor for CATEGORY_HEADER-type buffers,", type: :integration do
  class DummyWrapper; include V2::FinResultConsts; end
  let( :dummy_wrapper ) { DummyWrapper.new }

  let(:feed) do
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "        400 stile libero  femminile  -  Categoria  Master 25      Tempo Base   :  4'24\"58",
      "        100 misti  femminile  -  Categoria  Master 55             Tempo Base   :  1'15\"72",

      "        50 stile libero  maschile   -  Categoria  Master 45       Tempo Base   :  0'24\"09",
      "        200 farfalla  femminile  -  Categoria  Master 25          Tempo Base   :  2'20\"95",
      "        50 farfalla  femminile  -  Categoria  Under 25             ",

      "        200 dorso  maschile   -  Categoria  Master 35             Tempo Base   :  2'06\"28",
      "        1500 stile libero  femminile  -  Categoria  Master 45     Tempo Base   : 18'34\"18",
      "        100 misti  femminile  -  Categoria  Master 40             Tempo Base   :  1'07\"68",
      "        50 farfalla  maschile   -  Categoria  Master 55           Tempo Base   :  0'27\"75",
      "        50 rana  femminile  -  Categoria  Under 25                 ",

      "        800 stile libero  Maschile   -  Categoria M60             Tempo Base   : 10'02\"40",
      "        800 stile libero  Maschile   -  Categoria U25              ",
      "        200 farfalla  Femminile  -  Categoria M30                 Tempo Base   :  2'13\"60",
      "        1500 stile libero  Maschile   -  Categoria M30            Tempo Base   : 16'35\"67",
      "        200 farfalla  Maschile   -  Categoria U25                  "
    ]
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing DISTANCE," do
    subject { dummy_wrapper.tokenizer_category_header_distance }

    let(:expected_tokens) do
      [ # field = :distance
        "400",
        "100",

        '50',
        '200',
        '50',
        '200',
        '1500',
        '100',
        '50',
        '50',

        '800',
        '800',
        '200',
        '1500',
        '200'
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing STYLE," do
    subject { dummy_wrapper.tokenizer_category_header_style }

    let(:expected_tokens) do
      [ # field = :style
        "stile libero",
        "misti",

        'stile libero',
        'farfalla',
        'farfalla',
        'dorso',
        'stile libero',
        'misti',
        'farfalla',
        'rana',

        'stile libero',
        'stile libero',
        'farfalla',
        'stile libero',
        'farfalla'
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing GENDER," do
    subject { dummy_wrapper.tokenizer_category_header_gender }

    let(:expected_tokens) do
      [ # field = :gender
        "femminile",
        "femminile",

        'maschile',
        'femminile',
        'femminile',
        'maschile',
        'femminile',
        'femminile',
        'maschile',
        'femminile',

        'Maschile',
        'Maschile',
        'Femminile',
        'Maschile',
        'Maschile'
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing CATEGORY_GROUP," do
    subject { dummy_wrapper.tokenizer_category_header_group }

    let(:expected_tokens) do
      [ # field = :category_group
        "Master 25",
        "Master 55",

        'Master 45',
        'Master 25',
        'Under 25',
        'Master 35',
        'Master 45',
        'Master 40',
        'Master 55',
        'Under 25',

        'M60',
        'U25',
        'M30',
        'M30',
        'U25'
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing BASE_TIME," do
    subject { dummy_wrapper.tokenizer_category_header_base_time }

    let(:expected_tokens) do
      [ # field = :base_time
        "4'24\"58",
        "1'15\"72",

        "0'24\"09",
        "2'20\"95",
        "",
        "2'06\"28",
        "18'34\"18",
        "1'07\"68",
        "0'27\"75",
        "",

        "10'02\"40",
        "",
        "2'13\"60",
        "16'35\"67",
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
