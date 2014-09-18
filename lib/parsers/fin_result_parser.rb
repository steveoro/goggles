# encoding: utf-8

require 'fileutils'
require 'common/format'
require 'parsers/context_detector'
require 'parsers/token_extractor'
require 'parsers/fin_result_defs'
require 'parsers/fin_result_parser_tools'
                                                    # The following applies only to Ruby <= 1.9.2
require 'iconv' unless String.method_defined?( :encode )



=begin

= FinResultParser

  - Goggles framework vers.:  4.00.503
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
  # ----------------------------------------------------------------------------
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
  def self.parse_txt_file( full_pathname, show_progress = DEBUG_VERBOSE, logger = nil )
    log_somehow( logger, "\r\n-- FinResultParser::parse_txt_file(#{full_pathname}):", true, :info )
                                                    # Store the basename of the file, just for reference
    source_file_name = File.basename( full_pathname )
    line_count = 0                                  # File lines
    tot_rows = 0                                    # Total data rows extracted
    previous_key = {}                               # Previously unique key Hash, one for each parsed context
    previous_parent_context = nil
    index_to_check = 0
    previous_rows = {}
    parse_result = {}
    full_text_file_contents = ""
    parsing_defs = FinResultDefs.new( source_file_name, logger )
                                                    # Scan each line of the file until gets reaches EOF:
    File.open( full_pathname ) do |f|
      f.each_line { |curr_line|                     # Handle invalid char sequences using forced encoding:
        log_somehow( logger, "Reading line #{line_count}...: <<#{curr_line}>>", DEBUG_VERBOSE )
        if String.method_defined?( :encode )
          if curr_line.force_encoding("ISO-8859-1").valid_encoding?
            curr_line = curr_line.force_encoding("ISO-8859-1").encode("UTF-8", { invalid: :replace, undef: :replace, replace: '' }).rstrip
          elsif curr_line.force_encoding("UTF-16").valid_encoding?
            curr_line = curr_line.force_encoding("UTF-16").encode("UTF-8", { invalid: :replace, undef: :replace, replace: '' }).rstrip
          end
        else
          ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
          curr_line = ic.iconv(curr_line)
        end
        full_text_file_contents << curr_line
        any_detection = false
                                                    # For each context type defined...
        parsing_defs.context_types.each do |context_sym, detector|
          log_somehow( logger, "Using #{detector}...", DEBUG_EXTRA_VERBOSE )
                                                    # Init parse result data pages if necessary:
          parse_result[ context_sym ] = [] if parse_result[ context_sym ].nil?
                                                    # Run checkings for current line:
          is_detected = detector.feed_and_detect( curr_line, line_count, previous_parent_context )

          if ( is_detected )                        # === DETECTION SUCCESSFULL ===
            any_detection = true
            log_somehow( logger, "=> Context switched to '#{context_sym}'. Token extraction in progress...", DEBUG_VERBOSE )
            cached_rows = detector.dump_line_cache
            token_hash = tokenize_context_cache(
                parsing_defs, context_sym,
                cached_rows,
                logger, line_count + 1
            )

            if detector.is_a_parent_context         # *** CONTEXT -is- PARENT: HEADER
              previous_parent_context = context_sym
                                                    # There must be a unique key defined for this context
              if ( parsing_defs.required_keys( context_sym ).size < 1 )
                key_string = line_count + 1         # nil key definition arrays happens only when in context with no usable fields to be extracted! (As in :team_ranking)
                log_somehow(
                  logger,
                  "---WARNING: missing unique key definition for context '#{context_sym}'!\r\n" +
                  "            Using current line count (#{line_count+1}) as unique ID.",
                  DEBUG_VERBOSE, :warn
                )
              else                                  # Extract unique key and store new current context page
                key_string = compose_memstorage_key( parsing_defs, context_sym, token_hash, logger )
              end
              log_somehow( logger, "   Adding new context '#{context_sym}', key_string='#{key_string}'.", show_progress )

              parse_result[ context_sym ] << {
                id:           key_string,
                fields:       token_hash,
                import_text:  cached_rows.join("\r\n")
              }
              tot_rows += 1                         # Increase data rows stat only when actually adding any data
                                                    # Store new unique key in previous_key hash linked by current context (which may be a new parent context for other sub-pages)
              previous_key[ context_sym ] = key_string
                                                    # *** CONTEXT -is- CHILD: DETAIL
            else                                    # Current context depends on another? ("L1" parse result)
              parent_context = detector.parent_context_name
                                                    # No change in parent context?
              if ( parent_context == previous_parent_context )
                                                    # There must be already a unique key stored for the other (parent) context
                if previous_key[ parent_context ].nil?
                  log_somehow(
                    logger,
                    "---WARNING: missing unique key for parent context '#{parent_context}' (parent of '#{context_sym}').\r\n" +
                    "            Cannot add '#{context_sym}' data page.",
                    true, :warn
                  )
                else                                # Retrieve pre-stored unique key of parent context and store new current context page
                  log_somehow( logger, "   Found (parent) key_string='#{previous_key[ parent_context ] }'.", DEBUG_VERBOSE )
                  log_somehow( logger, "   Adding new context '#{context_sym}', key_string='#{previous_key[ parent_context ] }'", show_progress )

                  parse_result[ context_sym ] << {
                    id:           previous_key[ parent_context ],
                    fields:       token_hash,
                    import_text:  cached_rows.join("\r\n")
                  }
                  tot_rows += 1                     # Increase data rows stat only when actually adding any data
                end
                # ELSE: parent context changed or different? => quietly skip the storing!

                # [Steve, 20130918]
                # Note that, as of this version, this happens for all result_rows since both the
                # contexts :result_row and :relay_row have the same defining RegExp. Since the loop
                # checks each single defined context for possible multiple context assignment
                # (it doesn't stop after the first successfull reckognition and works in a FIFO way,
                # allowing the possibility to have a single text line that spawns multiple contexts
                # of data), defining a parent_context_name in the ContextDetector instance is the
                # only correct method to uniquely identify two context with the same RegExp.
              end
            end
            log_somehow( logger, "   Parse_result fields = #{parse_result[ context_sym ].last[:fields].inspect}", DEBUG_VERY_VERBOSE && parse_result[ context_sym ].last )

#          else                                     # === DETECTION UNSUCCESSFUL ===
            # ( nothing to do -- left here in case we need to log also this )
          end
        end                                         # ---(end loop on ContextDetectors)---
        unless any_detection                        # Clear parent context when nothing is recognized:
          previous_parent_context = nil
          log_somehow( logger, "   Nothing recognized, parent context set to nil.", DEBUG_VERBOSE )
        end
        line_count += 1
      }
    end                                             # (automatically closes the file)

    log_somehow(
      logger,
      "\r\n---------------------------------------------\r\n" +
      "------------------ STATS: -------------------\r\n" +
      "---------------------------------------------\r\n\r\nFile '#{source_file_name}':",
      true, :info
    )
    tot_data_rows = 0                               # Count total data rows, just for "fun stats"
    parse_result.each { |context_sym, data_page_array|
      log_somehow( logger, "Total '#{context_sym}' data pages : #{data_page_array.size} / #{tot_rows} lines found", true, :info )
      tot_data_rows += data_page_array.size         # ASSERT: expect( tot_data_rows == tot_rows )
    }
    log_somehow(
      logger,
      "\r\nTotal read lines ....... : #{line_count} (including garbage)" +
      "Protocol efficiency .... : #{(( tot_rows.to_f)/line_count.to_f * 10000.0).round / 100.0} %" +
      "File done.\r\n---------------------------------------------\r\n\r\n\r\n",
      true, :info
    )

    {
      parse_result:             parse_result,
      line_count:               line_count,
      total_data_rows:          tot_data_rows,
      full_text_file_contents:  full_text_file_contents
    }
  end
  # ----------------------------------------------------------------------------
  #++


  private


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

  # Returns a unique string ID for the context_sym and token_hash specified
  #
  def self.compose_memstorage_key( parsing_defs, context_sym, token_hash, logger = nil )
    return nil if ( parsing_defs.required_keys( context_sym ).size < 1 )
    all_keys_list  = parsing_defs.required_keys( context_sym ).flatten.compact
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
  def self.tokenize_context_cache( parsing_defs, context_sym, row_cache_array, logger = nil, current_line_number = 0 )
    tokenizer_context_list = parsing_defs.tokenizer_types_for( context_sym )
    raise "Tokenizer context list not found for context '#{context_sym}'!" unless tokenizer_context_list.kind_of?(Array)
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
          token_field = ( parsing_defs.tokenizer_fields_for( context_sym ) )[row_idx][tok_idx]
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
  # ----------------------------------------------------------------------------
  #++
end
