# encoding: utf-8

require 'test_helper'


class CategoryTypeParsingMethodTest < ActiveSupport::TestCase

  test "parse_category_type_from_import_text" do
    txts = get_fixtures()
    expectations = get_expectations()
                                                    # season_type = 1 => FIN Master
    txts.each_with_index { |category_token, index|
      category_type_id = CategoryType.parse_category_type_from_import_text( 1, category_token )
      assert_not_nil( category_type_id )
      assert( category_type_id > 0, "returned category_type_id is less than 1!")

      category = CategoryType.find_by_id( category_type_id )
      assert_not_nil( category )

      expected_code = expectations[ index ]
      assert_equal( expected_code, category.code, "category.code result='#{category.code}' is different from expected='#{expected_code}'!")
    }
  end
  # ---------------------------------------------------------------------------


  private


  def get_fixtures()
    [
      " Categoria  Under 25",
      " Categoria  Master 25  ",
      " Categoria  Master 30 ",
      "Master 55",
      " Master 60 ",
      " Categoria M100-119 ",
      " Categoria M120-159  ",
      "Categoria M160-199",
      " Categoria M200-239  ",
      " -  Categoria M240-279",
      " M280-319",
      "M320-399 "
    ]
  end


  def get_expectations()
    [
      "U25",
      "M25",
      "M30",
      "M55",
      "M60",
      "M100",
      "M120",
      "M160",
      "M200",
      "M240",
      "M280",
      "M320"
    ]
  end
  # ---------------------------------------------------------------------------
end
