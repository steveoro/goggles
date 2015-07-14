# encoding: utf-8
require 'spec_helper'

require_relative '../../../app/data_import/v2/fin_startlist_consts'


describe "TokenExtractor for EVENT INDIVIDUAL-type buffers,", type: :integration do
  class DummyWrapper; include V2::FinStartListConsts; end
  let( :dummy_wrapper ) { DummyWrapper.new }

  let(:feed) do
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "50 SL",
      "50 FA",
      "50 DO",
      "50 RA",

      "100 MI",
      "100 SL",
      "100 FA",
      "100 DO",
      "100 RA",

      "200 MI",
      "200 SL",
      "200 FA",
      "200 DO",
      "200 RA",

      "400 MI",
      "400 SL",

      "800 SL",
      "1500 SL"
    ]
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing DISTANCE," do
    subject { dummy_wrapper.tokenizer_event_individual_distance }

    let(:expected_tokens) do
      [ # field = :distance
        "50",
        "50",
        "50",
        "50",

        "100",
        "100",
        "100",
        "100",
        "100",

        "200",
        "200",
        "200",
        "200",
        "200",

        "400",
        "400",

        "800",
        "1500"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing STYLE," do
    subject { dummy_wrapper.tokenizer_event_individual_style }

    let(:expected_tokens) do
      [ # field = :style
        "SL",
        "FA",
        "DO",
        "RA",

        "MI",
        "SL",
        "FA",
        "DO",
        "RA",

        "MI",
        "SL",
        "FA",
        "DO",
        "RA",

        "MI",
        "SL",

        "SL",
        "SL"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
