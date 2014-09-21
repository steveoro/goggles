# encoding: utf-8

require 'fileutils'
require 'common/format'
require 'parsers/context_detector'
require 'parsers/token_extractor'
require 'parsers/fin_result_defs'
require 'parsers/fin_result_parser_tools'
require 'parsers/txt_parse_service'
                                                    # The following applies only to Ruby <= 1.9.2
require 'iconv' unless String.method_defined?( :encode )



=begin

= FinResultParser

  - Goggles framework vers.:  4.00.509
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

  # Set this to true or false to enable or disable debugging output, L3.
  #
  DEBUG_EXTRA_VERBOSE = false
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
  #             id: <category_header_id>, fields: <hash_of_category_header_fields_with_values>,
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
  # - <hash_of_category_header_fields_with_values>
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
    log_somehow( logger, "\r\n-- FinResultParser::parse_txt_file(#{full_pathname}):", true, :info )
    parsing_defs  = FinResultDefs.new( logger )
    parse_service = TxtParseService.new( parsing_defs )
    full_text_file_contents = ""
                                                    # Scan each line of the file until gets reaches EOF:
    File.open( full_pathname ) do |f|
      f.each_line do |curr_line|
        log_somehow( logger, "Reading line #{parse_service.line_count}...: <<#{curr_line}>>", DEBUG_VERBOSE )
        curr_line = force_valid_encoding( curr_line )
        full_text_file_contents << curr_line
        any_detection = false
                                                    # -- DETAIL Context detection:
        parsing_defs.context_types_children_of( parse_service.previous_parent_context ).each do |context_name, detector|
          log_somehow( logger, "Prioritizing on children of #{context_name}...", DEBUG_EXTRA_VERBOSE )
          any_detection = parse_service.parse( detector, curr_line )
        end unless parse_service.previous_parent_context.nil?
                                                    # Clear parent context only when no DETAIL are recognized:
        if parse_service.previous_parent_context && !any_detection
          parse_service.clear_parent_context
          log_somehow( logger, "   No possible CHILDREN/DETAIL contexts recognized, parent context set to nil.", DEBUG_VERBOSE )
        end
                                                    # -- HEADER (& ALL) Context detection: for each context type defined...
        parsing_defs.context_types.each do |context_name, detector|
          parse_service.parse( detector, curr_line )
        end unless any_detection                    # Do not loop on all if we already have a matching child context
        parse_service.increase_line_count
      end
    end                                             # (automatically closes the file)

    log_somehow(
      logger,
      "\r\n---------------------------------------------\r\n" +
      "------------------ STATS: -------------------\r\n" +
      "---------------------------------------------\r\n\r\nFile '#{File.basename( full_pathname )}':",
      true, :info
    )

    tot_data_rows = 0                               # Count total data rows, just for "fun stats"
    parse_service.result.each { |context_name, result_page_array|
      log_somehow( logger, "Total '#{context_name}' data pages : #{result_page_array.size} / #{parse_service.total_data_rows} lines found", true, :info )
      tot_data_rows += result_page_array.size       # ASSERT: expect( tot_data_rows == parse_service.total_data_rows )
    }
    log_somehow(
      logger,
      "\r\nTotal read lines ....... : #{parse_service.line_count} (including garbage)" +
      "\r\nProtocol efficiency .... : #{(( parse_service.total_data_rows.to_f) / parse_service.line_count.to_f * 10000.0).round / 100.0} %" +
      "\r\nFile done.\r\n---------------------------------------------\r\n\r\n\r\n",
      true, :info
    )

    {
      parse_result:             parse_service.result,
      line_count:               parse_service.line_count,
      total_data_rows:          tot_data_rows,
      full_text_file_contents:  full_text_file_contents
    }
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # This will handle file encoding & invalid char sequences using a
  # forced encoding for the specified string, returning a new UTF-8
  # string.
  #
  def self.force_valid_encoding( curr_line )
    if String.method_defined?( :encode )
      if curr_line.force_encoding( "ISO-8859-1" ).valid_encoding?
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


  # Either uses the logger, if defined or outputs the message directly on the console using puts.
  # The condition_for_logging is checked before allowing any logging.
  def self.log_somehow( logger, msg, condition_for_logging, logging_method_sym = :debug )
    return unless condition_for_logging
    if logger && logger.respond_to?( logging_method_sym )
      logger.send( logging_method_sym, msg )
    else
      puts( msg )
    end
  end

  # Returns a unique string ID for the context_name and token_hash specified
  #
  def self.compose_memstorage_key( parsing_defs, context_name, token_hash, logger = nil )
    return nil if ( parsing_defs.required_keys( context_name ).size < 1 )
    all_keys_list  = parsing_defs.required_keys( context_name ).flatten.compact
    log_somehow(
      logger,
      "\r\n*** all_keys_list= #{all_keys_list.inspect}" +
      "** token_hash= #{token_hash.inspect}",
      DEBUG_VERBOSE
    )
    ( token_hash.reject{ |key, val| !all_keys_list.include?(key) } ).values.join('-')
  end


  # Tokenize a group of cached lines, recognized as belonging to a specific "context",
  # defined by the conditions specified inside the dedicated structures.
  #
  # === Returns
  # An Hash composed of all the tokens extracted for each passed cached row, all
  # merged into a single container. Duplicate field names will be overwritten as new
  # hash keys (L.I.F.O.). (That is, if 2 different cached rows have same-named fields
  # for token extraction, only the last extracted field with the same name will survive
  # the flatten+merge operation.)
  #
  def self.tokenize_context_cache( parsing_defs, context_name, row_cache_array, logger = nil, current_line_number = 0 )
    tokenizer_context_list = parsing_defs.tokenizer_types_for( context_name )
    raise "Tokenizer context list not found for context '#{context_name}'!" unless tokenizer_context_list.kind_of?(Array)
    token_list = []
    prev_token_start = nil                          # Clear previous token starting index before the loop
                                                    # For each cached row:
    row_cache_array.each_with_index { |row, row_idx|
                                                    # Retrieve the list of tokenizers for the current row:
      tokenizer_row_list = tokenizer_context_list[ row_idx ]
      row_to_be_parsed   = row_cache_array[ row_idx ]
      token_start = nil                             # Clear token starting index before processing the whole row
      token_field = nil
      prev_token_field = nil
                                                    # The tokenizer row-list may or may not be defined: we must check it
      if ( tokenizer_row_list.kind_of?(Array) && tokenizer_row_list.size > 0 )
        token_list << {}                            # Add a new row item to the resulting token list of rows
                                                    # For each tokenizer row list...
        tokenizer_row_list.each_with_index { |token_extractor, tok_idx|
          token_field = ( parsing_defs.tokenizer_fields_for( context_name ) )[row_idx][tok_idx]
# DEBUG (commented out due to excessive detail)
#          log_somehow( logger, "-- Processing token '#{token_field}' using #{token_extractor}...", DEBUG_EXTRA_VERBOSE )
          token = token_extractor.tokenize( row_to_be_parsed, current_line_number )
# DEBUG (commented out due to excessive detail)
#          log_somehow( logger, "   Extracted '#{token}'.", DEBUG_EXTRA_VERBOSE )
          token_extractor.clear()                   # Add to the token list only if it contains anything
          token_list.last[ token_field ] = token if token && token.length > 0
        }
      end
    }

    result_token_hash = {}
    token_list.flatten.each{|sub_hash| result_token_hash.merge!(sub_hash) }
    log_somehow( logger, "-- Returning token list: #{result_token_hash.inspect}", DEBUG_VERBOSE )
    result_token_hash
  end
  #-- -------------------------------------------------------------------------
  #++
end
