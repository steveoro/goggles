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

  - Goggles framework vers.:  4.00.458
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
  DEBUG_VERBOSE                                     = false

  # Set this to true or false to enable or disable debugging output, L2.
  #
  DEBUG_VERY_VERBOSE                                = false

  # Set this to true or false to enable or disable debugging output, L3.
  #
  DEBUG_EXTRA_VERBOSE                               = false
  # ---------------------------------------------------------------------------


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
    logger.info( "\r\n-- FinResultParser::parse_txt_file(#{full_pathname}):" ) if logger
                                                    # Store the basename of the file, just for reference
    source_file_name = File.basename( full_pathname )
    line_count = 0                                  # File lines
    tot_rows = 0                                    # Total data rows extracted
    previous_key = {}                               # Previously unique key Hash, one for each parsed context
    previous_parent_context = nil
    condition_ok = true
    index_to_check = 0
    previous_rows = {}
    parse_result = {}
    full_text_file_contents = ""
    parsing_defs = FinResultDefs.new( source_file_name, logger )
                                                    # Scan each line of the file until gets reaches EOF:
    File.open( full_pathname ) do |f|
      f.each_line { |curr_line|                     # Handle invalid char sequences using forced encoding:
        logger.debug( "Reading line #{line_count}...: <<#{curr_line}>>" ) if (logger && DEBUG_VERBOSE)
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
                                                    # For each context type defined...
        parsing_defs.get_context_types().each { |context_sym, detector|
          if DEBUG_EXTRA_VERBOSE
            logger ? logger.debug( "Using #{detector}..." ) : puts( "Using #{detector}..." )
          end
                                                    # Init parse result data pages if necessary:
          parse_result[ context_sym ] = [] if parse_result[ context_sym ].nil?
                                                    # Run checkings for current line:
          is_detected = detector.feed_and_detect( curr_line, line_count, previous_parent_context )

          if ( is_detected )                        # === DETECTION SUCCESSFULL ===
            logger.debug( "=> Context switched to '#{context_sym}'. Token extraction in progress..." ) if (logger && DEBUG_VERBOSE)
            cached_rows = detector.dump_line_cache()
            token_hash = tokenize_context_cache(
                parsing_defs, context_sym,
                cached_rows,
                logger, line_count + 1
            )

            if detector.is_a_parent_context()       # *** CONTEXT -is- PARENT: HEADER
              previous_parent_context = context_sym
                                                    # There must be a unique key defined for this context
              if ( parsing_defs.get_required_field_keys( context_sym ).size < 1 )
                key_string = line_count + 1         # nil key definition arrays happens only when in context with no usable fields to be extracted! (As in :team_ranking)
                if logger
                  if DEBUG_VERBOSE
                    logger.warn( "---WARNING: missing unique key definition for context '#{context_sym}'!" )
                    logger.warn( "            Using current line count (#{line_count+1}) as unique ID." )
                  end
                else
                  if DEBUG_VERBOSE
                    puts( "---WARNING: missing unique key definition for context '#{context_sym}'!" )
                    puts( "            Using current line count (#{key_string}) as unique ID." )
                  end
                end
              else                                  # Extract unique key and store new current context page
                key_string = compose_memstorage_key( parsing_defs, context_sym, token_hash, logger )
              end

              if show_progress
                logger ? logger.debug("   Adding new context '#{context_sym}', key_string='#{key_string}'.") : puts("   Adding new context '#{context_sym}', key_string='#{key_string}'.")
              end

              parse_result[ context_sym ] << {
                id: key_string, fields: token_hash,
                import_text: cached_rows.join("\r\n")
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
                  if logger
                    logger.warn("---WARNING: missing unique key for parent context '#{parent_context}' (parent of '#{context_sym}').")
                    logger.warn("            Cannot add '#{context_sym}' data page.")
                  else
                    puts("---WARNING: missing unique key for parent context '#{parent_context}' (parent of '#{context_sym}').")
                    puts("            Cannot add '#{context_sym}' data page.")
                  end
                else                                # Retrieve pre-stored unique key of parent context and store new current context page
                  if DEBUG_VERBOSE
                    logger ? logger.debug("   Found (parent) key_string='#{previous_key[ parent_context ] }'.") : puts("   Found (parent) key_string='#{previous_key[ parent_context ] }'.")
                  end
                  if show_progress
                    logger ? logger.debug("   Adding new context '#{context_sym}', key_string='#{previous_key[ parent_context ] }'.") : puts("   Adding new context '#{context_sym}', key_string='#{previous_key[ parent_context ] }'")
                  end
                  parse_result[ context_sym ] << {
                    id: previous_key[ parent_context ],
                    fields: token_hash,
                    import_text: cached_rows.join("\r\n")
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
            if DEBUG_VERY_VERBOSE && parse_result[ context_sym ].last
              logger ? logger.debug("   Parse_result fields = #{parse_result[ context_sym ].last[:fields].inspect}") : puts("   Parse_result fields = #{parse_result[ context_sym ].last[:fields].inspect}\r\n")
            end
          # else                                    # === DETECTION UNSUCCESSFULL ===
            # ( nothing to do )
          end
        }
        line_count += 1
      }
    end                                             # (automatically closes the file)

    if logger
      logger.info( "\r\n---------------------------------------------\r\n------------------ STATS: -------------------\r\n---------------------------------------------\r\n\r\nFile '#{source_file_name}':" )
    else
      puts( "\r\n---------------------------------------------\r\n------------------ STATS: -------------------\r\n---------------------------------------------\r\n\r\nFile '#{source_file_name}':" )
    end
    tot_data_rows = 0                               # Count total data rows, just for "fun stats"
    parse_result.each { |context_sym, data_page_array|
      if logger
        logger.info( "Total '#{context_sym}' data pages : #{data_page_array.size} / #{tot_rows} lines found" )
      else
        puts( "Total '#{context_sym}' data pages : #{data_page_array.size} / #{tot_rows} lines found" )
      end
      tot_data_rows += data_page_array.size         # (ASSERT: it should be that tot_data_rows == tot_rows)
    }

    if logger
      logger.info( "\r\nTotal read lines ....... : #{line_count} (including garbage)" )
      logger.info( "Protocol efficiency .... : #{(( tot_rows.to_f)/line_count.to_f * 10000.0).round / 100.0} %" )
      logger.info( "File done.\r\n---------------------------------------------\r\n\r\n\r\n" )
    else
      puts( "Total read lines ....... : #{line_count} (including garbage)" )
      puts( "Protocol efficiency .... : #{(( tot_rows.to_f)/line_count.to_f * 10000.0).round / 100.0} %" )
      puts( "File done.\r\n---------------------------------------------\r\n\r\n\r\n" )
    end

    {
      parse_result: parse_result,
      line_count: line_count,
      total_data_rows: tot_data_rows,
      full_text_file_contents: full_text_file_contents
    }
  end
  # ---------------------------------------------------------------------------


  private


  # Returns a unique string ID for the context_sym and token_hash specified
  #
  def self.compose_memstorage_key( parsing_defs, context_sym, token_hash, logger = nil )
    return nil if ( parsing_defs.get_required_field_keys( context_sym ).size < 1 )
    all_keys_list  = parsing_defs.get_required_field_keys( context_sym ).flatten.compact
    logger.debug( "\r\n*** all_keys_list= #{all_keys_list.inspect}" ) if (logger && DEBUG_VERBOSE)
    logger.debug( "** token_hash= #{token_hash.inspect}" ) if (logger && DEBUG_VERBOSE)
    ( token_hash.reject{ |key, val| !all_keys_list.include?(key) } ).values.join
  end


  # Tokenize a group of cached lines, reckognized as belonging to a specific "context",
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
    tokenizer_context_list = parsing_defs.get_tokenizer_types_for( context_sym )
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
          token_field = ( parsing_defs.get_tokenizer_fields_for( context_sym ) )[row_idx][tok_idx]
# DEBUG
#          logger.debug( "-- Processing token '#{token_field}' using #{token_extractor}..." ) if (logger && DEBUG_VERY_VERBOSE)
#          puts( "-- Processing token '#{token_field}' using #{token_extractor}..." ) if (DEBUG_VERBOSE)
          token = token_extractor.tokenize( row_to_be_parsed, current_line_number )
# DEBUG
#          logger.debug( "   Extracted '#{token}'." ) if (logger && DEBUG_VERBOSE)
#          puts( "   Extracted '#{token}'." ) if (DEBUG_VERBOSE)
          token_extractor.clear()                   # Add to the token list only if it contains anything
          token_list.last[ token_field ] = token if token && token.length > 0
        }
      end
    }

    result_token_hash = {}
    token_list.flatten.each{|sub_hash| result_token_hash.merge!(sub_hash) }
    logger.debug( "-- Returning token list: #{result_token_hash.inspect}" ) if (logger && DEBUG_VERBOSE)
    result_token_hash
  end
  # ---------------------------------------------------------------------------

end
# -----------------------------------------------------------------------------
