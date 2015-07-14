# encoding: utf-8
require 'spec_helper'

require_relative '../../../app/data_import/v2/fin_startlist_consts'


describe "TokenExtractor for RESULT_ROW-type buffers,", type: :integration do
  class DummyWrapper; include V2::FinStartListConsts; end
  let( :dummy_wrapper ) { DummyWrapper.new }

  let(:feed) do
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      " 16   OSTROGOTI RUGGERO LAURO        M30  MILANO CHENUOTA ASD        6'30\"00",
      " 20   MAZZANTI VIEN DAL MARE PAOLA   U25  LABELVA UMANA SPORT CLUB   0'34\"00",
      "53  BRUNAZZI ROMUALDA ROSAMUN F  M 25  NUOTOMENO ASD                       00.34.00",
      "42  RODRIGHIERI LUCANIA       F  M 35  NUOTO SEMPRE A.S.DILETANT           03.02.00",
      "19  CAPORETTO ROBERTINO       M  M 50  POLISPORTIVA SANMARTINIANA          01.30.00",
      "57  ROMANELLI VALERIA         F  M 25  U.S. DIL. NUOTO MONTEFELTRO         00.38.00",
      "97  SEMPROLI SILVIA           F  M 25  POLISPORTIVA GARDEN SRL S.S. DILETT 00.33.00",
      "132 MOROZZI OSCAR             M  M 25  01 ZEROUNO SSD - FIRENZE            00.29.10",

      "       1   BIBBIBBI  FRANCESCA            1981   MILANO  NUOTO CSI           1'19\"58",
      "       2   DIDDIEFFIGGI  FEDERICA         1980   ROMA  NUOTO SSD  AR         1'17\"73",
      "       3   D`ALAMBERTO  MARUGONA          1982   A.S.D. RICCIO               1'20\"63",
      "  11      FAKE  MARIAPINA GINA LINA       1983   NEVAH.S.C.A.RL.            00.00.00",
      "  53      SUPAFAKE  CAMILLA               1982   SOC. 2001 SRL - PAD        00:00:00",
      "  3  DANIELI FILIPPA              M35      NUOTO MASTER              0'00\"00",
      "  4  SABINI  PAOLETTA             M 60      ACQUASPORT 2010 ASD      00 00 00 ",
      "137  LEGGI  ROMANA                M 25   FAKESPORT ASD               00 00 00",
      " 27  MEGAFAKE JAMIE               M 45       OH-MY OH-MY             00.00.00",
      "  6  MATTIOLI BERTACCHINI  EMANUEL     M60    N MODENESI                     0'40\"01"
    ]
  end
  #-- -------------------------------------------------------------------------
  #++


  context "when tokenizing ENTRY ORDER," do
    subject { dummy_wrapper.tokenizer_entry_row_entry_order }

    let(:expected_tokens) do
      [ # field = :entry_order
        "16",
        "20",
        "53",
        "42",
        "19",
        "57",
        "97",
        "132",

        '1',
        '2',
        '3',
        '11',
        '53',
        '3',
        '4',
        '137',
        '27',
        '6'
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing SWIMMER_NAME," do
    subject { dummy_wrapper.tokenizer_entry_row_swimmer_name }

    let(:expected_tokens) do
      [ # field = :swimmer_name
        "OSTROGOTI RUGGERO LAURO",
        "MAZZANTI VIEN DAL MARE PAOLA",
        "BRUNAZZI ROMUALDA ROSAMUN",
        "RODRIGHIERI LUCANIA",
        "CAPORETTO ROBERTINO",
        "ROMANELLI VALERIA",
        "SEMPROLI SILVIA",
        "MOROZZI OSCAR",

        "BIBBIBBI  FRANCESCA",
        "DIDDIEFFIGGI  FEDERICA",
        "D`ALAMBERTO  MARUGONA",
        "FAKE  MARIAPINA GINA LINA",
        "SUPAFAKE  CAMILLA",
        "DANIELI FILIPPA",
        "SABINI  PAOLETTA",
        "LEGGI  ROMANA",
        "MEGAFAKE JAMIE",
        "MATTIOLI BERTACCHINI  EMANUEL"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing CATEGORY_GROUP," do
    subject { dummy_wrapper.tokenizer_entry_row_category_group }

    let(:expected_tokens) do
      [ # field = :category_group
        "M30",
        "U25",
        "M 25",
        "M 35",
        "M 50",
        "M 25",
        "M 25",
        "M 25",

        "1981",
        "1980",
        "1982",
        "1983",
        "1982",
        "M35",
        "M 60",
        "M 25",
        "M 45",
        "M60"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing TEAM_NAME," do
    subject { dummy_wrapper.tokenizer_entry_row_team_name }

    let(:expected_tokens) do
      [ # field = :team_name
        "MILANO CHENUOTA ASD",
        "LABELVA UMANA SPORT CLUB",
        "NUOTOMENO ASD",
        "NUOTO SEMPRE A.S.DILETANT",
        "POLISPORTIVA SANMARTINIANA",
        "U.S. DIL. NUOTO MONTEFELTRO",
        "POLISPORTIVA GARDEN SRL S.S. DILETT",
        "01 ZEROUNO SSD - FIRENZE",

        "MILANO  NUOTO CSI",
        "ROMA  NUOTO SSD  AR",
        "A.S.D. RICCIO",
        "NEVAH.S.C.A.RL.",
        "SOC. 2001 SRL - PAD",
        "NUOTO MASTER",
        "ACQUASPORT 2010 ASD",
        "FAKESPORT ASD",
        "OH-MY OH-MY",
        "N MODENESI"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++

  context "when tokenizing ENTRY_TIME," do
    subject { dummy_wrapper.tokenizer_entry_row_entry_time }

    let(:expected_tokens) do
      [ # field = :entry_time
        "6'30\"00",
        "0'34\"00",
        "00.34.00",
        "03.02.00",
        "01.30.00",
        "00.38.00",
        "00.33.00",
        "00.29.10",

        "1'19\"58",
        "1'17\"73",
        "1'20\"63",
        "00.00.00",
        "00:00:00",
        "0'00\"00",
        "00 00 00",
        "00 00 00",
        "00.00.00",
        "0'40\"01"
      ]
    end

    it_behaves_like( "(extracting tokens only for the matching feed lines)" )
  end
  #-- -------------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
