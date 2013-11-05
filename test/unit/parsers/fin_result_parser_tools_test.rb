# encoding: utf-8

require 'test_helper'
require 'parsers/fin_result_parser_tools'


class FinResultParserToolsTest < ActiveSupport::TestCase

  test "respond to main class methods" do
    [
      'parse_filename_fields', 'parse_meeting_date',
      'parse_out_of_race_from_result_time',
      'parse_disqualified_from_result_time',
      'parse_disqualification_code_type_id_from_result_time',
      'parse_mins_secs_hds_from_result_time',
      'guess_city_from_team_name',
      'seems_to_be_the_same_city',
      'seems_to_have_the_same_name'
    ].each do |method_name|
      assert( FinResultParserTools.respond_to?(method_name), "doesn't respond to '#{method_name}'!" )
    end
  end
  # ---------------------------------------------------------------------------


  test "seems_to_be_the_same_city" do
    is_the_same = FinResultParserTools.seems_to_be_the_same_city(
      # new:     /   existing:
      'Reggio Emilia', "REGGIO NELL'EMILIA",
      'Reggio Emilia', "REGGIO NELL'EMILIA",
      'ITA', 'ITA'
    )
    assert( is_the_same )

    is_the_same = FinResultParserTools.seems_to_be_the_same_city(
      # new:     /   existing:
      "Reggio nell'Emilia", "REGGIO EMILIA",
      'Reggio Emilia', "REGGIO EMILIA",
      'ITA', 'ITA'
    )
    assert( is_the_same )
  end
  # ---------------------------------------------------------------------------


  test "seems_to_have_the_same_name" do
    is_the_same = FinResultParserTools.seems_to_have_the_same_name(
      # new:     /   existing:
      "C.S.I. Nuoto Master Ober Ferrari", "CSI NUOTO OBER FERR",
      "CSI NUOTO OBER FERRARI"
    )
    assert( is_the_same )

    is_the_same = FinResultParserTools.seems_to_have_the_same_name(
      # new:     /   existing:
      "C.S.I. Nuoto Master Ober Ferrari", "CSI OBER FERR",
      "C.S.I. NUOTO OBER FERRARI"
    )
    assert( is_the_same )
  end
  # ---------------------------------------------------------------------------
end
