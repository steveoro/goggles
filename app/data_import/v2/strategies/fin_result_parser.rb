# encoding: utf-8

require 'fileutils'
require 'common/format'
require 'common/encoding_tools'

require_relative '../../../data_import/v2/services/context_detector'
require_relative '../../../data_import/v2/services/token_extractor'
require_relative '../../../data_import/v2/strategies/file_format_parser'
require_relative '../../../data_import/v2/txt_result_defs'
require_relative '../../../data_import/v2/fin_result_defs'
require_relative '../../../data_import/v2/fin2_result_defs'
require_relative '../../../data_import/v2/fin_startlist_defs'
require_relative '../../../data_import/v2/services/txt_parse_service'
                                                    # The following applies only to Ruby <= 1.9.2
require 'iconv' unless String.method_defined?( :encode )



=begin

= FinResultParser

  - Goggles framework vers.:  4.00.749
  - author: Steve A.

 Dedicated parser for FIN Results.
 FIN Results are swimming meeting result text files, written mostly in UTF-8 italian
 locale (since F.I.N. is the Italian Swimming Federation).

 All the RegExp used by this Parser class assume the file to be processed is compliant
 with the format used in these kind of files.

=end
class FinResultParser

  # Set this to true or false to enable or disable debugging output, L1.
  #
  DEBUG_VERBOSE       = true

  # Set this to true or false to enable or disable debugging output, L2.
  #
  DEBUG_VERY_VERBOSE  = true
  #-- -------------------------------------------------------------------------
  #++


  # Read and parse a single txt file into a complex Hash structure in memory.
  # Returned data storage is divided into each "context" page found, whose format
  # is specified by @context_types, @tokenizer_types, @tokenizer_fields and @context_keys.
  #
  # It's possible to force a specific file format for the parsing by specifying
  # an instance of a sibling of TxtResultDef as +parsing_defs+.
  #
  # === Returns:
  #
  # An Hash having the structure:
  #
  #     {
  #       parse_result: {
  #         :category_header => [
  #           {
  #             id: <category_header_id>, fields: <hash_of_category_header_fields_dao_with_values>,
  #             import_text: last_line_of_text_used_to_extract_all_fields
  #           }
  #           ... (one Hash for each single <category_header_id>)
  #         ]
  #         :result_row      => [
  #           {
  #             id: <category_header_id>, fields: <hash_of_result_row_fields_with_values>,
  #             import_text: last_line_of_text_used_to_extract_all_fields
  #           }
  #           ... (at least, one Hash for each single <category_header_id>, which acts as a "context page index")
  #         ]
  #       },
  #
  #       parsing_defs:             parsing_defs_used_for_the_parsing,
  #       line_count:               tot_file_lines_read,
  #       total_data_rows:          sum_of_data_pages_sizes,
  #       full_text_file_contents:  full_text_file_contents
  #     }
  #
  #
  # ...Where:
  #
  # - <category_header_id>
  #   is a composed string-concatenation key obtained from the current values of
  #   distance + style + gender [+ category_group] (this last one, only when found).
  #
  # - <hash_of_category_header_fields_dao_with_values>
  #   has the same keys as the @context_keys[:category_header] Array
  #   (Note that the *last* field may/may not be included for certain categories),
  #   with a new composed Hash element ({id: computed_id, fields: field_value_hash}) added for each
  #   possible value found of the above fields.
  #
  # - <hash_of_result_row_fields_with_values>
  #   has the same keys as the flattened array @tokenizer_fields[:result_row]
  #   (Note that the *first* field may/may not be included for certain categories),
  #   with a new composed Hash element ({id: computed_id, fields: field_value_hash}) added for each
  #   possible value found of the above fields.
  #
  def self.parse_txt_file( full_pathname, logger = nil, parsing_defs = nil )
    parsing_defs = parsing_defs || FileFormatParser.new( full_pathname ).parse( logger )
    raise ArgumentError.new("File format for '#{full_pathname}' NOT recognized!") if parsing_defs.nil?

    service = TxtParseService.new( parsing_defs )
    service.log_somehow( logger, "\r\n-- FinResultParser::parse_txt_file(#{ full_pathname }):", true, :info )
    full_text_file_contents = ""
                                                    # Scan each line of the file until gets reaches EOF:
    File.open( full_pathname ) do |f|
      f.each_line do |curr_line|                    # Make sure each line has a valid UTF-8 sequence of characters:
        curr_line = EncodingTools.force_valid_encoding( curr_line )
        service.log_somehow( logger, "Reading line #{service.line_count}...: <<#{curr_line}>>", DEBUG_VERY_VERBOSE )
        full_text_file_contents << curr_line
                                                    # -- HEADER (& ALL) Context detection: for each context type defined...
        parsing_defs.context_types.each do |context_name, detector|
          service.parse( detector, curr_line )
        end # unless any_children_detection           # Do not loop on all if we already have a matching child context
        service.increase_line_count
      end
    end                                             # (automatically closes the file)
    tot_data_rows = service.log_parsing_stats( full_pathname )

    {
      parse_result:             service.result,
      parsing_defs:             parsing_defs,
      line_count:               service.line_count,
      total_data_rows:          tot_data_rows,
      full_text_file_contents:  full_text_file_contents
    }
  end
  #-- -------------------------------------------------------------------------
  #++
end
