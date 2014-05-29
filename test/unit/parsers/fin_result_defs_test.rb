# encoding: utf-8

require 'test_helper'
require 'parsers/fin_result_defs'


class FinResultDefsTest < ActiveSupport::TestCase

  test "respond to main methods" do
    parsing_defs = FinResultDefs.new( '' )
    [
      'get_context_types', 'get_context_keys', 'get_required_field_keys',
      'get_field_list_for', 'get_detector_for', 'is_a_parent',
      'get_tokenizers_for', 'get_tokenizer_types_for',
      'get_tokenizer_fields_for'
    ].each do |method_name|
      assert( parsing_defs.respond_to?(method_name), "doesn't respond to '#{method_name}'!" )
    end
  end
  # ---------------------------------------------------------------------------


  test "get_field_list_for all defined contexts" do
    parsing_defs = FinResultDefs.new( '' )
    parsing_defs.get_context_keys().each do |key|
      field_list = parsing_defs.get_field_list_for( key )
      assert( field_list.instance_of?( Array ), "field_list for '#{key}' is not an Array!" )
      # XXX [Steve, 20131007] Note that the field_list *may* be an empty
      # array, as it is the case for team_ranking header, which does not
      # have any valuable fields to be extracted (and just serves the
      # purpose of "context discriminator")
      # Thus, nothing more can be tested for the resulting field_list Array!
    end
  end
  # ---------------------------------------------------------------------------


  test "get_tokenizers_for all defined contexts" do
    parsing_defs = FinResultDefs.new( '' )
    parsing_defs.get_context_keys().each do |key|
      result_hash = parsing_defs.get_tokenizers_for( key )
      assert( result_hash.instance_of?( Hash ), "result_hash for '#{key}' is not an Hash" )
      # XXX [Steve, 20131007] Note that the result_hash *may* be an empty
      # Hash, as it is the case for team_ranking header, which does not
      # have any valuable fields to be extracted (and just serves the
      # purpose of "context discriminator")
      # Thus, nothing more can be tested for the resulting result_hash!
# DEBUG
      puts "\r\n--- get_tokenizers_for(#{key}) result_hash inspect:"
      puts result_hash.inspect
    end
  end
  # ---------------------------------------------------------------------------


  test "tokenizer types for result_rows" do
    # Define some local samples with dedicated substring ranges to extract the exact confirmation
    # values for the assertions we're about to make:
    format_1_samples = [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "       1   BIBBIBBI  FRANCESCA            1981   MILANO  NUOTO CSI           1'19\"58  650,73",
      "       2   DIDDIEFFIGGI  FEDERICA         1980   ROMA  NUOTO SSD  AR         1'17\"73  682,05",
      "           FAKE  GINA                     1983   NEVAH.S.C.A.RL.            Ritirata    0,00",
      "           SUPAFAKE  CAMILLA              1982   MY GOODNESS OH YEAH        Squalif.    0,00"
    ]
    format_1_ranges = {
        :result_position  => [0,8],
        :team_code        => nil,
        :swimmer_name     => [10,40],
        :swimmer_year     => [41,46],
        team_name: [48,70],
        :result_time      => [75,85],
        :result_score     => [86,95]
    }
    process_format_samples_for_result_row( format_1_samples, format_1_ranges )

    format_2_samples = [
    #            10        20        30        40        50        60        70        80        90
    #  0123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-123456789-12345
      "  3 EMI-020270 1979 CHIEREGATO  SARA              NUOTO OTELLO PUTINA         1'30\"60  828,15",
      "  4 VEN-002165 1979 SAMBIN  SILVIA                ACQUAVIVA 2001 SRL          1'36\"99  773,58",
      "    EMI-024761 1982 GAMBETTI  FRANCESCA           ESTENSE NUOTO CSI          Squalif.    0,00",
      "    EMI-012345 1983 MEGAFAKE JAMIE                OH-MY OH-MY                Ritirato    0,00"
    ]
    format_2_ranges = {
        :result_position  => [0,3],
        :team_code        => [4,14],
        :swimmer_name     => [20,45],
        :swimmer_year     => [15,19],
        team_name: [50,73],
        :result_time      => [75,86],
        :result_score     => [87,95]
    }
    process_format_samples_for_result_row( format_2_samples, format_2_ranges )
  end
  # ---------------------------------------------------------------------------


  private


  def process_format_samples_for_result_row( format_sample_array, format_range_array )
    parsing_defs = FinResultDefs.new( '' )
    tokenizer_hash = parsing_defs.get_tokenizers_for(:result_row)

    format_sample_array.each{ |sample_row|
# DEBUG
      puts "\r\n--- Checking regexp on <<#{sample_row}>>..."
      format_range_array.each{ |field_name, range_array|
        expected_value  = range_array.nil? ? '' : ( sample_row[ range_array[0] .. range_array[1] ] ).strip
        token_extractor = tokenizer_hash[ field_name ]
        extracted_value = ( token_extractor.tokenize( sample_row ) ).strip
# DEBUG
        puts "  - Searching '#{field_name}' using #{token_extractor}"
        puts "    Expected => '#{expected_value}' VS '#{extracted_value}' (extracted)"

        assert( expected_value == extracted_value, "extracted token ('#{extracted_value}') differs from expected value ('#{expected_value}')!" )
        token_extractor.clear()
      }
    }
  end
end
