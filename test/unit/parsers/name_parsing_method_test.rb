# encoding: utf-8

require 'test_helper'


class NameParsingMethodTest < ActiveSupport::TestCase

  test "name_splitter" do
    txt_names = get_name_fixtures()
    expectations = get_name_expectations()
                                                    # Substitute all >= 3-space gaps with a constant 2-space gap:
    txt_names.each_with_index { |swimmer_name, index|
      splitted_name = swimmer_name.gsub(/\s{3,}/, '  ').split('  ')
      assert( splitted_name.size > 0, "2-space gaps split: splitted_name.size is zero!" )
                                                    # Just 1 token found? (assuming a single-spaced separator is being used)
      if splitted_name.size < 2
        splitted_name = splitted_name[0].split(' ')
        assert( splitted_name.size > 0, "1-space gaps split: splitted_name.size is zero!" )
      end
      last_name = splitted_name[0]
      first_name = splitted_name.reject{ |s| s == last_name }.join(' ')
      expected_value = expectations[index]
      splitted_value = "#{last_name},#{first_name}"
      assert_equal( splitted_value, expected_value, "splitted result='#{splitted_value}' is different from expected='#{expected_value}'!")
    }
  end
  # ---------------------------------------------------------------------------


  private


  def get_name_fixtures()
    [
      "BIBBIBBI  FRANCESCA",
      "DIDDIEFFIGGI  FEDERICA",
      "D`ALAMBERTO    MARUGONA",
      "FAKE  MARIAPINA GINA LINA",
      "SUPAFAKE   CAMILLA",
      "SBROMBOLA SARA",
      "SILVIA ROSSI",
      "FILOMENA GIAMBELLI",
      "VANELLI CORALLI GINO",
      "MEGAFAKE JAMIE"
    ]
  end


  def get_name_expectations()
    [
      "BIBBIBBI,FRANCESCA",
      "DIDDIEFFIGGI,FEDERICA",
      "D`ALAMBERTO,MARUGONA",
      "FAKE,MARIAPINA GINA LINA",
      "SUPAFAKE,CAMILLA",
      "SBROMBOLA,SARA",
      "SILVIA,ROSSI",
      "FILOMENA,GIAMBELLI",
      "VANELLI,CORALLI GINO",
      "MEGAFAKE,JAMIE"
    ]
  end
  # ---------------------------------------------------------------------------
end
