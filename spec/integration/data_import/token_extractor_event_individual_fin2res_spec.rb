# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin2_result_consts'


describe "TokenExtractor for EVENT INDIVIDUAL-type buffers,", type: :integration do
  class DummyWrapper2; include V2::Fin2ResultConsts; end
  let( :dummy_wrapper2 ) { DummyWrapper2.new }

  let(:feed) do
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "   ---   200 Farfalla Femmine   ---",
      "   ---   200 Farfalla Maschi   ---",
      "   ---   200 Rana Femmine   ---",
      "   ---   50 Farfalla Maschi   ---",
      "   ---   50 Dorso Femmine   ---",
      "   ---   200 Stile Libero Femmine   ---",
      "   ---   100 Stile Libero Maschi   ---",
      "   ---   50 Farfalla Femmine   ---",
      "   ---   100 Dorso Femmine   ---",
      "   ---   200 Misti Femmine   ---",
      "   ---   200 Misti Maschi   ---",
      "   ---   50 Dorso Femmine   ---",
      "   ---   100 Misti Femmine   ---",
      "   ---   50 Stile Libero Femmine   ---",
      "   ---   50 Dorso Maschi   ---",
      "   ---   100 Rana Maschi   ---",

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
    subject { dummy_wrapper2.tokenizer_category_header_distance }

    let(:expected_tokens) do
      [ # field = :distance
        '200',
        '200',
        '200',
        '50',
        '50',
        '200',
        '100',
        '50',
        '100',
        '200',
        '200',
        '50',
        '100',
        '50',
        '50',
        '100',

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
    subject { dummy_wrapper2.tokenizer_category_header_style }

    let(:expected_tokens) do
      [ # field = :style
        "Farfalla",
        "Farfalla",
        "Rana",
        "Farfalla",
        "Dorso",
        "Stile Libero",
        "Stile Libero",
        "Farfalla",
        "Dorso",
        "Misti",
        "Misti",
        "Dorso",
        "Misti",
        "Stile Libero",
        "Dorso",
        "Rana",

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
    subject { dummy_wrapper2.tokenizer_category_header_gender }

    let(:expected_tokens) do
      [ # field = :gender
        "Femmine",
        "Maschi",
        "Femmine",
        "Maschi",
        "Femmine",
        "Femmine",
        "Maschi",
        "Femmine",
        "Femmine",
        "Femmine",
        "Maschi",
        "Femmine",
        "Femmine",
        "Femmine",
        "Maschi",
        "Maschi",

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


# The following tokens are not available in fin2result format:

  # context "when tokenizing CATEGORY_GROUP," do
    # subject { dummy_wrapper2.tokenizer_category_header_group }
#
    # let(:expected_tokens) do
      # [ # field = :category_group
        # 'Master 45',
        # 'Master 25',
        # 'Under 25',
        # 'Master 35',
        # 'Master 45',
        # 'Master 40',
        # 'Master 55',
        # 'Under 25',
#
        # 'M60',
        # 'U25',
        # 'M30',
        # 'M30',
        # 'U25'
      # ]
    # end
#
    # it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  # end
  # #-- -------------------------------------------------------------------------
  # #++
#
  # context "when tokenizing BASE_TIME," do
    # subject { dummy_wrapper2.tokenizer_category_header_base_time }
#
    # let(:expected_tokens) do
      # [ # field = :base_time
        # "0'24\"09",
        # "2'20\"95",
        # "",
        # "2'06\"28",
        # "18'34\"18",
        # "1'07\"68",
        # "0'27\"75",
        # "",
#
        # "10'02\"40",
        # "",
        # "2'13\"60",
        # "16'35\"67",
        # ""
      # ]
    # end
#
    # it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  # end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
