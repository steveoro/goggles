# encoding: utf-8

require 'test_helper'
require 'data_import/strategies/fin_result_parser_tools'


class MeetingDateParsingMethodTest < ActiveSupport::TestCase

  test "parse_meeting_date_from_import_text" do
    txts = get_fixtures()
    expectations = get_expectations()
                                                    # season_type = 1 => FIN Master
    txts.each_with_index { |token, index|
      puts "\r\nProcessing '#{token}'..."
      expected_text = expectations[ index ]

      e = Date.parse( expected_text )
      d = FinResultParserTools.parse_meeting_date( token )

      assert_equal( e, d, "resulting date '#{d}' is different from expected '#{e}'!")
    }
  end
  # ---------------------------------------------------------------------------


  private


  def get_fixtures()
    [
      "14/15 Gennaio 2012",
      "11 novembre 2012",
      "3/4 Dicembre 2011",
      "20-21 aprile 2013"
    ]
  end

  def get_expectations()
    [
      "2012-01-14",
      "2012-11-11",
      "2011-12-03",
      "2013-04-20"
    ]
  end
  # ---------------------------------------------------------------------------
end
