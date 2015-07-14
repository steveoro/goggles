# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin_result_consts'


describe "TokenExtractor for STATS_DETAILS-type buffers,", type: :integration do
  class DummyWrapper; include V2::FinResultConsts; end
  let( :dummy_wrapper ) { DummyWrapper.new }

  # [Steve, 20141203]
  # Since all tokenizer have the same formula, we can test a single Tokenizer instance
  # against all the rows and see if the expected token returned matches.
  context "when tokenizing <all rows> against 'fixture1'," do
    subject { dummy_wrapper.tokenizer_stats_teams_tot }

    let(:feed) do
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      [
        "                Numero di società iscritte                               107     ",
        "                Società che hanno fatto iscrizioni online                104     ",
        "                Numero di società partecipanti                            99     ",
        "",
        "                Numero totale di atleti iscritti                         702     ",
        "                Numero di atleti under 25 iscritti                        53     ",
        "                Percentuale di atleti under 25 iscritti                 7,55 %   ",
        "                Numero di atleti iscritti online                         679     ",
        "                Percentuale di atleti iscritti online                  96,72 %   ",
        "",
        "                Numero di atleti partecipanti                            630     ",
        "                Numero di atleti assenti                                  72     ",
        "                Percentuale di atleti assenti                          10,26 %   ",
        "                Numero di atleti assenti ad una gara                      51     ",
        "",
        "                Numero totale di iscrizioni alle gare                   1263     ",
        "                Numero di iscrizioni alle gare di atleti under 25         95     ",
        "                Percentuale di gare di atleti under 25                  7,52 %   ",
        "",
        "                Numero totale di gare disputate                         1091     ",
        "                Numero di gare disputate da atleti under 25               79     ",
        "",
        "                Numero di assenze dalle gare                             172     ",
        "                Percentuale di assenze                                 13,62 %   ",
        "                Numero di squalifiche                                     25     ",
        "                Numero di ritiri                                           3     "
      ]
    end

    let(:expected_tokens) do
      [
        "107",
        "104",
        "99",
        "",
        "702",
        "53",
        "7,55 %",
        "679",
        "96,72 %",
        "",
        "630",
        "72",
        "10,26 %",
        "51",
        "",
        "1263",
        "95",
        "7,52 %",
        "",
        "1091",
        "79",
        "",
        "172",
        "13,62 %",
        "25",
        "3"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
