# encoding: utf-8

require 'fileutils'
require 'common/format'
require 'data_import/services/context_detector'
require 'data_import/services/token_extractor'
require 'data_import/fin_result_defs'
require 'data_import/services/txt_parse_service'
                                                    # The following applies only to Ruby <= 1.9.2
require 'iconv' unless String.method_defined?( :encode )



=begin

= FinResultParser

  - Goggles framework vers.:  4.00.513
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
  DEBUG_VERY_VERBOSE  = false
  #-- -------------------------------------------------------------------------
  #++


  # Read and parse a single txt file into a complex Hash structure in memory.
  # Returned data storage is divided into each "context" page found, whose format
  # is specified by @context_types, @tokenizer_types, @tokenizer_fields and @context_keys.
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
  #       line_count: tot_file_lines_read,
  #       total_data_rows: sum_of_data_pages_sizes,
  #       full_text_file_contents: full_text_file_contents
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
  def self.parse_txt_file( full_pathname, logger = nil )
    parsing_defs  = FinResultDefs.new( logger )
    service = TxtParseService.new( parsing_defs )
    service.log_somehow( logger, "\r\n-- FinResultParser::parse_txt_file(#{ full_pathname }):", true, :info )
    full_text_file_contents = ""
                                                    # Scan each line of the file until gets reaches EOF:
    File.open( full_pathname ) do |f|
      f.each_line do |curr_line|                    # Make sure each line has a valid UTF-8 sequence of characters:
        curr_line = force_valid_encoding( curr_line )
        service.log_somehow( logger, "Reading line #{service.line_count}...: <<#{curr_line}>>", DEBUG_VERY_VERBOSE )
        full_text_file_contents << curr_line
        any_detection = false
                                                    # -- DETAIL Context detection:
        parsing_defs.context_types_children_of( service.previous_parent_context ).each do |context_name, detector|
          service.log_somehow( logger, "Prioritizing on children of #{service.previous_parent_context.to_s.upcase}: checking #{context_name.to_s.upcase}...", DEBUG_VERY_VERBOSE )
          any_detection = service.parse( detector, curr_line )
        end unless service.previous_parent_context.nil?
                                                    # Clear parent context only when no DETAIL are recognized:
        if service.previous_parent_context && !any_detection
          service.clear_parent_context
          service.log_somehow( logger, "   No possible CHILDREN/DETAIL contexts recognized, parent context set to nil.", DEBUG_VERBOSE )
        end
                                                    # -- HEADER (& ALL) Context detection: for each context type defined...
        parsing_defs.context_types.each do |context_name, detector|
          service.parse( detector, curr_line )
        end unless any_detection                    # Do not loop on all if we already have a matching child context
        service.increase_line_count
      end
    end                                             # (automatically closes the file)
    tot_data_rows = service.log_parsing_stats( full_pathname )

    {
      parse_result:             service.result,
      line_count:               service.line_count,
      total_data_rows:          tot_data_rows,
      full_text_file_contents:  full_text_file_contents
    }
  end
  #-- -------------------------------------------------------------------------
  #++

  # Forces the character encoding a single string/line of text.
  #
  # This will handle file encoding & invalid char sequences using a
  # forced encoding for the specified string, returning a new UTF-8
  # string.
  #
  # === Returns:
  # The same string forcibly encoded in UTF-8.
  #
  def self.force_valid_encoding( curr_line )
    if String.method_defined?( :encode )
      return curr_line if curr_line.valid_encoding?

      if curr_line.force_encoding( "UTF-8" ).valid_encoding?
        curr_line = curr_line.force_encoding("UTF-8").rstrip

      elsif curr_line.force_encoding( "ISO-8859-1" ).valid_encoding?
        curr_line = curr_line.force_encoding("ISO-8859-1")
          .encode( "UTF-8", { invalid: :replace, undef: :replace, replace: '' } )
          .rstrip

      elsif curr_line.force_encoding( "UTF-16" ).valid_encoding?
        curr_line = curr_line.force_encoding("UTF-16")
          .encode( "UTF-8", { invalid: :replace, undef: :replace, replace: '' } )
          .rstrip
      end
    else
      ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
      curr_line = ic.iconv(curr_line)
    end
    curr_line
  end
  #-- -------------------------------------------------------------------------
  #++
end
