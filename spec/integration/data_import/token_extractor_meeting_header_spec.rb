# encoding: utf-8
require 'spec_helper'

require 'framework/console_logger'
require 'parsers/context_detector'
require 'parsers/token_extractor'
require 'parsers/fin_result_consts'


describe "TokenExtractor for CATEGORY_HEADER-type buffers,", type: :integration do

  let(:feed) do
    [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
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
  #-- -----------------------------------------------------------------------
  #++

  context "when tokenizing DISTANCE," do
    subject { FinResultConsts::TOK_EXT_CATEGORY_HEADER_DISTANCE }

    let(:expected_tokens) do
      [ # field = :distance
# TODO make a separate context for each field that will be tokenized
#     [ :distance, :style, :gender, :category_group, :base_time ],
        ['50', 'stile libero', 'maschile', 'Master 45', "0'24\"09"],
        ['200', 'farfalla', 'femminile', 'Master 25', "2'20\"95"],
        ['50', 'farfalla', 'femminile', 'Under 25', ""],
        ['200', 'dorso', 'maschile', 'Master 35', "2'06\"28"],
        ['1500', 'stile libero', 'femminile', 'Master 45', "18'34\"18"],
        ['100', 'misti', 'femminile', 'Master 40', "1'07\"68"],
        ['50', 'farfalla', 'maschile', 'Master 55', "0'27\"75"],
        ['50', 'rana', 'femminile', 'Under 25', ""],

        ['800', 'stile libero', 'Maschile', 'M60', "10'02\"40"],
        ['800', 'stile libero', 'Maschile', 'U25', ""],
        ['200', 'farfalla', 'Femminile', 'M30', "2'13\"60"],
        ['1500', 'stile libero', 'Maschile', 'M30', "16'35\"67"],
        ['200', 'farfalla', 'Maschile', 'U25', ""]
      ]
    end

# TODO
    xit "splits correctly in tokens only the recognized feed lines" do
      feed.each_with_index do |feed_line, index|
        # We need to clear the tokenizer since we are re-using the same instance
        # for each test:
        subject.clear
        token = subject.tokenize( feed_line )
        expect( token ).to match( expected_tokens[index] )
      end
    end
  end
  #-- -----------------------------------------------------------------------
  #++
end
#-- ---------------------------------------------------------------------------
#++
