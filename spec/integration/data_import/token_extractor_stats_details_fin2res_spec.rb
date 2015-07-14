# encoding: utf-8
require 'spec_helper'

#require 'framework/console_logger'
#require_relative '../../../data_import/v2/services/context_detector'
#require_relative '../../../data_import/v2/services/token_extractor'
#require_relative '../../../data_import/v2/fin2_result_consts'


describe "TokenExtractor for STATS_DETAILS-type buffers,", type: :integration do
  class DummyWrapper2; include V2::Fin2ResultConsts; end
  let( :dummy_wrapper2 ) { DummyWrapper2.new }

  # [Steve, 20141203]
  # Since all tokenizer have the same formula, we can test a single Tokenizer instance
  # against all the rows and see if the expected token returned matches.
  context "when tokenizing <all rows> against '20101219muss' (sub-format type1)," do
    subject { dummy_wrapper2.tokenizer_stats_teams_tot }

    let(:feed) do
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      [
        "                Numero di societ� iscritte                   65",
        "                Societ� con iscrizioni online                54",
        "                Numero di societ� partecipanti               51 ",
        "",
        "                Numero totale di atleti iscritti            508 ",
        "                Numero di atleti iscritti online            421",
        "                ",
        "                Numero di atleti partecipanti               325",
        "                Numero di atleti assenti                    183",
        "                             ",
        "                Numero di iscrizioni alle gare              976 ",
        "                Numero di gare disputate                    606",
        "                Numero di assenze dalle gare                370",
        "                                    ",
        "                Numero di squalifiche                        11"
      ]
    end

    let(:expected_tokens) do
      [
        '65',
        '54',
        '51',
        '',
        '508',
        '421',
        '',
        '325',
        '183',
        '',
        '976',
        '606',
        '370',
        '',
        '11'
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when tokenizing <all rows> against '20081221muss' (sub-format type2)," do
    subject { dummy_wrapper2.tokenizer_stats_teams_presence }

    let(:feed) do
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      [
        " Societ� Iscritte                                     75",
        " Societ� Presenti                                     67",
        "",
        " Atleti Iscritti                                     498",
        " Atleti Presenti                                     413",
        " Percentuale Assenti                                  17,07",
        " Atleta Presente con una gara non effettuata          27",
        "",
        " Iscrizioni Gare                                     946",
        " Gare Disputate                                      761",
        " Assenza Gare                                        185",
        " Percentuale Gare Non Disputate                       19,56",
        "",
        " Staffette Disputate                                   2",
        "",
        " Squalifiche                                          17",
        " Ritiri                                                0"
      ]
    end

    let(:expected_tokens) do
      [
        "75",
        "67",
        "",
        "498",
        "413",
        "17,07",
        "27",
        "",
        "946",
        "761",
        "185",
        "19,56",
        "",
        "2",
        "",
        "17",
        "0"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when tokenizing <all rows> against '20130513pont' (sub-format type2)," do
    subject { dummy_wrapper2.tokenizer_stats_teams_presence }

    let(:feed) do
      #            10        20        30        40        50        60        70        80        90
      #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      [
        " Societ� Iscritte                                     59",
        " Societ� Presenti                                     53",
        "",
        " Atleti Iscritti                                     483",
        " Atleti Presenti                                     413",
        " Percentuale Assenti                                  14,49",
        " Atleta Presente con una gara non effettuata          21",
        "",
        " Iscrizioni Gare                                     944",
        " Gare Disputate                                      789",
        " Assenza Gare                                        155",
        " Percentuale Gare Non Disputate                       16,42",
        "",
        " Staffette Disputate                                  12",
        "",
        " Squalifiche                                          29",
        " Ritiri                                                3"
      ]
    end

    let(:expected_tokens) do
      [
        "59",
        "53",
        "",
        "483",
        "413",
        "14,49",
        "21",
        "",
        "944",
        "789",
        "155",
        "16,42",
        "",
        "12",
        "",
        "29",
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
