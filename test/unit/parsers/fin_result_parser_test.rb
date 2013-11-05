# encoding: utf-8

require 'test_helper'
require 'parsers/fin_result_parser'


class FinResultParserTest < ActiveSupport::TestCase

  test "respond to class main methods" do
    [
      'parse_txt_file'
    ].each do |method_name|
      assert FinResultParser.respond_to?(method_name), "doesn't respond to '#{method_name}'!"
    end
  end
  # ---------------------------------------------------------------------------


  test "sample data files returning a full result Hash" do
    [
      File.join(Rails.root, 'test/fixtures/samples/ris20111203riccione-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20121112bologna-sample.txt'),
      File.join(Rails.root, 'test/fixtures/samples/ris20120114ravenna-sample.txt')
    ].each_with_index do | src_file, file_idx |
      puts "\r\n=== Testing with file #{src_file}:"

      result_hash = FinResultParser.parse_txt_file( src_file, true )
      parsing_defs = FinResultDefs.new( '' ) # no filename, no logger defined

      # Expected fixture files STATS:
      #
      # File 'ris20111120riccione-sample.txt':
      # Total 'meeting_header' data pages : 1 / 204 lines found
      # Total 'category_header' data pages : 6 / 204 lines found
      # Total 'relay_header' data pages : 0 / 204 lines found
      # Total 'team_ranking' data pages : 1 / 204 lines found
      # Total 'result_row' data pages : 144 / 204 lines found
      # Total 'relay_row' data pages : 0 / 204 lines found
      # Total 'ranking_row' data pages : 134 / 204 lines found
      # Total read lines ....... : 308 (including garbage)
      #
      # File 'ris20121112bologna-sample.txt':
      # Total 'meeting_header' data pages : 1 / 229 lines found
      # Total 'category_header' data pages : 15 / 229 lines found
      # Total 'relay_header' data pages : 5 / 229 lines found
      # Total 'team_ranking' data pages : 1 / 229 lines found
      # Total 'result_row' data pages : 127 / 229 lines found
      # Total 'relay_row' data pages : 26 / 229 lines found
      # Total 'ranking_row' data pages : 56 / 229 lines found
      # Total read lines ....... : 399 (including garbage)
      #
      # File 'ris20120114ravenna-sample.txt':
      # Total 'meeting_header' data pages : 1 / 176 lines found
      # Total 'category_header' data pages : 11 / 176 lines found
      # Total 'relay_header' data pages : 0 / 176 lines found
      # Total 'team_ranking' data pages : 1 / 176 lines found
      # Total 'result_row' data pages : 75 / 176 lines found
      # Total 'relay_row' data pages : 0 / 176 lines found
      # Total 'ranking_row' data pages : 88 / 176 lines found
      # Total read lines ....... : 376 (including garbage)
      #
      case file_idx
      when 0                                        # "ris20111120riccione-sample"
        expected_values = {
          :meeting_header   => 1,
          :category_header  => 6,   :result_row       => 144,
          :relay_header     => 0,   :relay_row        => 0,
          :team_ranking     => 1,   :ranking_row      => 134,
          :line_count       => 308
        }
      when 1                                        # "ris20121112bologna-sample"
        expected_values = {
          :meeting_header   => 1,
          :category_header  => 15,  :result_row       => 127,
          :relay_header     => 5,   :relay_row        => 26,
          :team_ranking     => 1,   :ranking_row      => 56,
          :line_count       => 399
        }
      when 2                                        # "ris20120114ravenna-sample"
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
#        puts "    - Array first element:\r\n      #{val[0].inspect}"
#        puts "    - Array element -3:\r\n      #{val[-3].inspect}"
#        puts "    - Array element -2:\r\n      #{val[-2].inspect}"
#        puts "    - Array element -1:\r\n      #{val[-1].inspect}"
#      }
                                                    # Check result classes:
      parsing_defs.get_context_keys().each { |context_key|
        assert parse_result.has_key?( context_key ), "parse_result doesn't have the context key '#{context_key}'!"
        context_data_pages = parse_result[ context_key ]
        assert( context_data_pages.instance_of?( Array ), "parse_result[ :#{context_key} ] is not an Array!" )

        context_data_pages.each_with_index{ |data_page, idx|
          assert( data_page.instance_of?( Hash ), "The data page n.#{idx} for :#{context_key} (parse_result[:#{context_key}][#{idx}]) is not an Hash!" )
          [ :id, :fields, :import_text ].each do |key|
            assert( data_page.has_key?(key), "parse_result[:#{context_key}][#{idx}] doesn't have the :#{key} key!" )
          end

          required_field_list = parsing_defs.get_required_field_keys( context_key )

          parsing_defs.get_field_list_for( context_key ).each do |field_sym|
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
end
