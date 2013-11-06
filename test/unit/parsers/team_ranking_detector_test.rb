# encoding: utf-8

require 'test_helper'


class TeamRankingDetectorTest < ActiveSupport::TestCase

  test "team_ranking_detector" do
    txts = get_header_fixtures()
    txts.each_with_index { |row, index|
      is_a_match = row =~ /classifica(\s+di)?(\s+societ)?/ui
      puts "Testing '#{row}'..."
      assert_not_nil( is_a_match )
    }
  end
  # ---------------------------------------------------------------------------

  test "ranking_row_detector" do
    txts = get_chart_fixtures()
    txts.each_with_index { |row, index|
      is_a_match = row =~ /\s+\d{1,6}[\,|\.]\d\d$/ui
      puts "Testing '#{row}'..."
      assert_not_nil( is_a_match )
    }
  end
  # ---------------------------------------------------------------------------


  test "team_code_detector" do
    txts = get_chart_fixtures()
    expectations = get_team_code_expectations()
    txts.each_with_index { |row, index|
      match_idx = row =~ /\w\w\w-\d{6}/ui
      puts "Testing team_code for '#{row}'..."
      if index < 5
        assert( match_idx >= 0, "match_idx was expected to be >= 0! (and is nil)" )
        expected_value = expectations[index]
        tokenized_value = row[ match_idx .. match_idx+10 ].strip
        assert_equal( expected_value, tokenized_value, "tokenized_value result='#{tokenized_value}' is different from expected='#{expected_value}'!")
      else
        assert_nil( match_idx )
      end
    }
  end


  test "team_score_detector" do
    txts = get_chart_fixtures()
    expectations = get_score_expectations()
    txts.each_with_index { |row, index|
      match_idx = row =~ /\s\d{1,6}[\,|\.]\d\d$/ui
      end_idx   = row =~ /$/ui
      puts "Testing team_score for '#{row}'..."
      assert( match_idx >= 0, "match_idx was expected to be >= 0! (and is nil)" )
      assert( end_idx >= 0, "end_idx was expected to be >= 0! (and is nil)" )
      expected_value = expectations[index]
      tokenized_value = row[ match_idx .. end_idx ].strip
      assert_equal( expected_value, tokenized_value, "tokenized_value result='#{tokenized_value}' is different from expected='#{expected_value}'!")
    }
  end


  test "team_name_detector" do
    txts = get_chart_fixtures()
    expectations = get_name_expectations()
    txts.each_with_index { |row, index|
      match_idx = row =~ /(?<=\w{3}-\d{6})\s{2}\w+|(?<=\d\s{6})\w+/ui
      end_idx   = row =~ /\s\d{1,6}[\,|\.]\d\d$/ui
      puts "Testing team_name for '#{row}'..."
      assert( match_idx >= 0, "match_idx was expected to be >= 0! (and is nil)" )
      assert( end_idx >= 0, "end_idx was expected to be >= 0! (and is nil)" )
      expected_value = expectations[index]
      tokenized_value = row[ match_idx .. end_idx ].strip
      assert_equal( expected_value, tokenized_value, "tokenized_value result='#{tokenized_value}' is different from expected='#{expected_value}'!")
    }
  end
  # ---------------------------------------------------------------------------


  private


  def get_header_fixtures()
    [
      "                                  Classifica Società                                 ",
      "                                Classifica di Società                                ",
      "                                      Classifica                                     ",
      "Classifica di Società",
      "Classifica Società",
      "Classifica"
    ]
  end

  def get_chart_fixtures()
    [
      "            1   EMI-001444  ESTENSE NUOTO CSI                 62525,95",
      "            2   EMI-001481  N MODENESI                        58272,35",
      "            3   EMI-001451  RINASCITA TEAM ROMA               46753,95",
      "            4   EMI-001457  NUOTO CLUB 2000                   37724,16",
      "            5   EMI-001452  AQUATIC TEAM RAVENN               29332,89",
      "            1      N MODENESI                        66495,23",
      "            2      CN UISP BOLOGNA                   44667,70",
      "            3      NUOTO CLUB 2000                   37112,33",
      "            4      NUOVO NUOTO                       31562,33",
      "            5      AS MOLINELLA NUOTO                24085,60"
    ]
  end

  def get_team_code_expectations()
    [
      "EMI-001444",
      "EMI-001481",
      "EMI-001451",
      "EMI-001457",
      "EMI-001452",
      '',
      '',
      '',
      '',
      ''
    ]
  end

  def get_score_expectations()
    [
      "62525,95",
      "58272,35",
      "46753,95",
      "37724,16",
      "29332,89",
      "66495,23",
      "44667,70",
      "37112,33",
      "31562,33",
      "24085,60"
    ]
  end

  def get_name_expectations()
    [
      "ESTENSE NUOTO CSI",
      "N MODENESI",
      "RINASCITA TEAM ROMA",
      "NUOTO CLUB 2000",
      "AQUATIC TEAM RAVENN",
      "N MODENESI",
      "CN UISP BOLOGNA",
      "NUOTO CLUB 2000",
      "NUOVO NUOTO",
      "AS MOLINELLA NUOTO"
    ]
  end
  # ---------------------------------------------------------------------------
end
