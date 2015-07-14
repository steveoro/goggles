# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin_result_consts'


describe "TokenExtractor for RELAY_HEADER-type buffers,", type: :integration do
  class DummyWrapper; include V2::FinResultConsts; end
  let( :dummy_wrapper ) { DummyWrapper.new }

  let(:feed) do
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "        mistaffetta 4x50 stile libero  -  Categoria M100-119      Tempo Base   :  1'42\"99",
      "        mistaffetta 4x100 stile libero -  Categoria M120-159      Tempo Base   :  1'43\"07",
      "        mistaffetta 4x200 stile libero -  Categoria M160-199      Tempo Base   :  1'44\"97",
      "        mistaffetta 4x50 mista  -  Categoria M160-199             Tempo Base   :  1'57\"26",
      "        mistaffetta 4x50 mista  -  Categoria M200-239             Tempo Base   :  2'05\"20",

      "        staffetta 4x50 mista  Maschile   -  Categoria M100-119    Tempo Base   :  1'49\"09",
      "        staffetta 4x50 mista  Femminile  -  Categoria M160-199    Tempo Base   :  2'09\"12",
      "        staffetta 4x50 stile libero  Maschile   -  Categoria M160-199Tempo Base   :  1'39\"09",
      "        staffetta 4x50 stile libero  Femminile  -  Categoria M200-239Tempo Base   :  2'04\"15"
    ]
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when tokenizing TYPE," do
    subject { dummy_wrapper.tokenizer_relay_header_type }

    let(:expected_tokens) do
      [ # field = :type
        'mistaffetta 4x50 stile libero',
        'mistaffetta 4x100 stile libero',
        'mistaffetta 4x200 stile libero',
        'mistaffetta 4x50 mista',
        'mistaffetta 4x50 mista',

        "staffetta 4x50 mista  Maschile",
        "staffetta 4x50 mista  Femminile",
        "staffetta 4x50 stile libero  Maschile",
        "staffetta 4x50 stile libero  Femminile"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing DISTANCE," do
    subject { dummy_wrapper.tokenizer_relay_header_distance }

    let(:expected_tokens) do
      [ # field = :distance
        '4x50',
        '4x100',
        '4x200',
        '4x50',
        '4x50',

        '4x50',
        '4x50',
        '4x50',
        '4x50'
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing STYLE," do
    subject { dummy_wrapper.tokenizer_relay_header_style }

    let(:expected_tokens) do
      [ # field = :style
        'stile libero',
        'stile libero',
        'stile libero',
        'mista',
        'mista',

        'mista',
        'mista',
        'stile libero',
        'stile libero'
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing CATEGORY_GROUP," do
    subject { dummy_wrapper.tokenizer_relay_header_category_group }

    let(:expected_tokens) do
      [ # field = :category_group
        'M100-119',
        'M120-159',
        'M160-199',
        'M160-199',
        'M200-239',

        'M100-119',
        'M160-199',
        'M160-199',
        'M200-239'
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing BASE_TIME," do
    subject { dummy_wrapper.tokenizer_relay_header_base_time }

    let(:expected_tokens) do
      [ # field = :base_time
        "1'42\"99",
        "1'43\"07",
        "1'44\"97",
        "1'57\"26",
        "2'05\"20",

        "1'49\"09",
        "2'09\"12",
        "1'39\"09",
        "2'04\"15"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
