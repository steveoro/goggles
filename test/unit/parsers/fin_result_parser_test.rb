# encoding: utf-8

require 'test_helper'
require 'parsers/fin_result_parser'


class FinResultParserTest < ActiveSupport::TestCase

  test "respond to class main methods" do
    [
      'parse_txt_file', 'get_context_keys', 'get_required_field_keys',
      'get_field_list_for', 'get_tokenizers_for'
    ].each do |method_name|
      assert FinResultParser.respond_to?(method_name), "doesn't respond to '#{method_name}'!"
    end
  end
  # ---------------------------------------------------------------------------


  test "get_field_list_for all defined contexts" do
    FinResultParser.get_context_keys().each do |key|
      field_list = FinResultParser.get_field_list_for( key )
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
    FinResultParser.get_context_keys().each do |key|
      result_hash = FinResultParser.get_tokenizers_for( key )
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


  test "sample data files returning a full result Hash" do
    [
      './test/unit/parsers/sample_result_2012bologna.txt',
      './test/unit/parsers/sample_result_2012ravenna.txt'
    ].each_with_index do | src_file, file_idx |
      puts "\r\n=== Testing with file #{src_file}:"

      result_hash = FinResultParser.parse_txt_file( src_file, true )
      # Expected fixture files STATS:
      #
      # File 'sample_result_2012bologna.txt':
      # Total 'meeting_header' data pages : 1 / 229 lines found
      # Total 'category_header' data pages : 15 / 229 lines found
      # Total 'relay_header' data pages : 5 / 229 lines found
      # Total 'team_ranking' data pages : 1 / 229 lines found
      # Total 'result_row' data pages : 127 / 229 lines found
      # Total 'relay_row' data pages : 24 / 229 lines found
      # Total 'ranking_row' data pages : 56 / 229 lines found
      # Total read lines ....... : 399 (including garbage)
      # Protocol efficiency .... : 57.39 %
      #
      # File 'sample_result_2012ravenna.txt':
      # Total 'meeting_header' data pages : 1 / 176 lines found
      # Total 'category_header' data pages : 11 / 176 lines found
      # Total 'relay_header' data pages : 0 / 176 lines found
      # Total 'team_ranking' data pages : 1 / 176 lines found
      # Total 'result_row' data pages : 75 / 176 lines found
      # Total 'relay_row' data pages : 0 / 176 lines found
      # Total 'ranking_row' data pages : 88 / 176 lines found
      # Total read lines ....... : 376 (including garbage)
      # Protocol efficiency .... : 46.81 %
      #
      if ( file_idx == 0 )                          # "sample_result_2012bologna"
        expected_values = {
          :meeting_header   => 1,
          :category_header  => 15,  :result_row       => 127,
          :relay_header     => 5,   :relay_row        => 24,
          :team_ranking     => 1,   :ranking_row      => 56,
          :line_count       => 399
        }
      else                                          # "sample_result_2012ravenna"
        expected_values = { 
          :meeting_header   => 1,
          :category_header  => 11,  :result_row       => 75,
          :relay_header     => 0,   :relay_row        => 0,
          :team_ranking     => 1,   :ranking_row      => 88,
          :line_count       => 376
        }
      end

      assert( result_hash.instance_of?( Hash ), "result hash is not an Hash!" )
      [ :parse_result, :line_count, :total_data_rows, :full_text_file_contents ].each do |key|
        assert result_hash.has_key?(key), "result hash doesn't have the '#{key}' key!"
      end
                                                    # Test file length:
      assert( result_hash[:line_count] == expected_values[:line_count], "Found file line_count == #{result_hash[:line_count]} instead of #{expected_values[:line_count]}!" )

      parse_result = result_hash[:parse_result]
      assert( parse_result.instance_of?( Hash ), "parse_result is not an Hash!" )
# DEBUG
#      puts "\r\n--- result_hash[:parse_result] inspect, file #{src_file}:"
#      result_hash[:parse_result].each{ |key, val|
#        puts "    - key '#{key}' |=> #{val.class}, size=#{val.size}"
#        puts "    - Array first element: #{val[0].inspect}"
#        puts "    - Array element -3:    #{val[-3].inspect}"
#        puts "    - Array element -2:    #{val[-2].inspect}"
#        puts "    - Array element -1:    #{val[-1].inspect}"
#      }
                                                    # Check result classes:
      FinResultParser.get_context_keys().each { |context_key|
        assert parse_result.has_key?( context_key ), "parse_result doesn't have the context key '#{context_key}'!"
        context_data_pages = parse_result[ context_key ]
        assert( context_data_pages.instance_of?( Array ), "parse_result[ :#{context_key} ] is not an Array!" )

        context_data_pages.each_with_index{ |data_page, idx|
          assert( data_page.instance_of?( Hash ), "The data page n.#{idx} for :#{context_key} (parse_result[:#{context_key}][#{idx}]) is not an Hash!" )
          [ :id, :fields, :import_text ].each do |key|
            assert( data_page.has_key?(key), "parse_result[:#{context_key}][#{idx}] doesn't have the :#{key} key!" )
          end

          required_field_list = FinResultParser.get_required_field_keys( context_key )
          FinResultParser.get_field_list_for( context_key ).each do |field_sym|
            if required_field_list.include?( field_sym )
              assert( data_page[:fields].has_key?(field_sym), "parse_result[:#{context_key}][:fields] doesn't have the required field :#{field_sym}!" )
            end
          end
        }
                                                    # Check the results also for each context_key:
        assert( context_data_pages.size == expected_values[context_key], "Found parse_result[:#{context_key}].size == #{context_data_pages.size} instead of #{expected_values[context_key]}!" )
      }                                             # -- end of loop on context keys --
    end                                             # -- end of loop on file names --
  end
  # ---------------------------------------------------------------------------
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
        :team_name        => [48,70],
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
        :team_name        => [50,73],
        :result_time      => [75,86],
        :result_score     => [87,95]
    }
    process_format_samples_for_result_row( format_2_samples, format_2_ranges )
  end
  # ---------------------------------------------------------------------------


  private


  def process_format_samples_for_result_row( format_sample_array, format_range_array )
    tokenizer_hash = FinResultParser.get_tokenizers_for(:result_row)

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
