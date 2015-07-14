# encoding: utf-8
require_relative '../../../data_import/v2/tools_logging'
require_relative '../../../data_import/v2/services/context_detector'


=begin

= V2::TxtParseService

  - Goggles framework vers.:  4.00.657
  - author: Steve A.

 Service class delegated to the parsing of a single line of text,
 given the current and previous context definition.

 Stores the overall progress of the parsing it has performed but it
 should be controlled externally by a dedicated Strategy class.

=== The typical usage involves:

 - creating a dedicated parse definition holder-object, typically
   by subclassing V2::TxtResultDefs and specifing this in the constructor;

 - for each available line of text to be parsed:
   - for each defined V2::ContextDetector (inside the above V2::TxtResultDefs sibling):
     - call #parse() on the current line and detector to see if there's a match

 - obtain the parsing result either by #result or, more specifically,
   by calling #result_for( context_name )

=end
class V2::TxtParseService
  include Tools::Logging

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

  attr_reader :result, :line_count, :total_data_rows, :previous_parent_context
  # ----------------------------------------------------------------------------
  #++


  # Creates a new instance, given a <tt>parsing_definitions</tt> V2::TxtResultDefs
  # kind of object.
  #
  def initialize( parsing_definitions )
    @parsing_defs = parsing_definitions
    clear
  end
  # ----------------------------------------------------------------------------
  #++

  # Clears the internal #result member that stores all recognized context data
  # so far.
  def clear()
    @result = {}                                    # parse result Hash
    @line_count = 0                                 # current line count
    @total_data_rows = 0                            # total extracted rows with "meaningful" data
    @previous_parent_context = nil                  # previously detected parent context
    @previous_key = {}                              # previous result key created with #compose_memstorage_key()
  end

  # Clears just the previously recognized parent context.
  def clear_parent_context
    @previous_parent_context = nil
  end

  # Increases the overall counter of the all the different lines of text parsed.
  #
  # It should be called only when the processing of a single line has been completed
  # by all of the available V2::ContextDetector objects.
  def increase_line_count
    @line_count += 1
  end

  # Returns the parsing result (obtained so far) for the specified <tt>context_name</tt>.
  def result_for( context_name )
    @result[ context_name ]
  end
  # ----------------------------------------------------------------------------
  #++


  # Parses the specified (current) line of text, given its position inside the whole
  # file and the previously detected parent context name.
  #
  # This method is assumed to be called iteratively by looping on several different
  # V2::ContextDetector instances, to try the detection against the same <tt>current_line</tt>
  # text specified. It will automatically store the progress for any successful parsing.
  #
  # #parse(), actually, doesn't increase the internal <tt>line_count</tt> and the counter
  # for the overall progress of parsed lines should be increased externally by calling
  # the dedicated #increase_line_count.
  #
  # The parsing result for the specified +detector+ is accessible through:
  #
  #    > txt_parse_service_instance.result_for( detector.context_name )
  #
  # === Returns:
  # - +true+ for a successful or a partial detection (a detection "in progress"), +false+ otherwise.
  #
  def parse( detector, current_line )
    logger = @parsing_defs.logger
    context_name = detector.context_type.context_name
    log_somehow( logger, "Using #{detector}...", DEBUG_EXTRA_VERBOSE )
                                                    # Init parse result data pages if necessary:
    @result[ context_name ] = [] if @result[ context_name ].nil?
                                                    # Run checkings for current line:
    anything_detected = detector.feed_and_detect( current_line, @line_count, @previous_parent_context )

    if ( anything_detected )                              # === DETECTION SUCCESSFULL ===
      log_somehow( logger, "=> Context switched to '\033[1;33;40m#{ context_name.to_s.upcase }\033[0m'. Token extraction in progress...", DEBUG_VERBOSE )
      cached_rows = detector.dump_line_cache
      token_hash  = tokenize_context_cache( context_name, cached_rows )

      if detector.is_a_parent_context               # *** CONTEXT -is- PARENT: HEADER
        @previous_parent_context = context_name
        if token_hash.instance_of?( Hash ) && ( token_hash.keys.size > 0 )
                                                    # There must be a unique key defined for this context
          if ( @parsing_defs.required_keys( context_name ).size < 1 )
            key_string = @line_count + 1            # nil key definition arrays happens only when in context with no usable fields to be extracted! (As in :team_ranking or :stats)
            log_somehow(
              logger,
              "---WARNING: missing unique key definition for context '#{context_name}'!\r\n" +
              "            Using current line count (#{@line_count + 1}) as unique ID.",
              DEBUG_VERBOSE, :warn
            )
          else                                      # Extract unique key and store new current context page
            key_string = compose_memstorage_key( context_name, token_hash )
          end
          log_somehow( logger, "   Adding new PARENT context '#{context_name}', key_string='#{key_string}'.", DEBUG_VERBOSE )
          add_a_data_row( context_name, key_string, token_hash, cached_rows )
          # Store new unique key in @previous_key hash linked by current context
          # (which may be a new parent context for other sub-pages)
          @previous_key[ context_name ] = key_string
        end
                                                    # *** CONTEXT -is- CHILD: DETAIL
      else                                          # Current context depends on another? ("L1" parse result)
        parent_context = detector.parent_context_name
                                                    # No change in parent context?
        if ( parent_context == @previous_parent_context ) &&
           token_hash.instance_of?( Hash ) && ( token_hash.keys.size > 0 )
          # [Steve, 20140919]
          # The "@previous_key" mechanism was used in the previous version of
          # this implementation as a fail-safe to detect whether a data storage
          # was wrongly detected.
          # It seems that the :id field of the parse result hash is not used
          # anymore, as of this version.

          # FIXME Really seems that we keep result hashes with duplicated (:id=>key_string), without any compact()/reduce operation...
                                                    # There must be already a unique key stored for the other (parent) context
          key_string = @previous_key[ parent_context ]
          if key_string.nil?
            # Since nil key definition arrays happens only inside already *unique* parent contexts,
            # with no usable fields to be extracted (as in :team_ranking or :stats), we can safely
            # use the current line number as the key ID.
            key_string = @line_count + 1
#            key_string = parent_context.to_s
            log_somehow(
              logger,
              "---WARNING: missing unique key definition for context '#{context_name}'!\r\n" +
              "            Using current line count (#{@line_count + 1}) as unique ID.",
#              "            Using parent context name ('#{key_string}') as unique ID.",
              DEBUG_VERBOSE, :warn
            )
          else                                      # Retrieve pre-stored unique key of parent context and store new current context page
            log_somehow(
              logger,
              "   Found (parent) key_string='#{@previous_key[ parent_context ] }'.",
              DEBUG_VERBOSE
            )
          end
          log_somehow( logger, "   Adding new CHILD row '#{context_name}', key_string='#{key_string}'", DEBUG_VERBOSE )
          add_a_data_row( context_name, key_string, token_hash, cached_rows )

          # ELSE: parent context changed or different? => quietly skip the storing!

          # [Steve, 20130918]
          # Note that, as of this version, this happens for all result_rows since both the
          # contexts :result_row and :relay_row have the same defining RegExp. Since the loop
          # checks each single defined context for possible multiple context assignment
          # (it doesn't stop after the first successfull reckognition and works in a FIFO way,
          # allowing the possibility to have a single text line that spawns multiple contexts
          # of data), defining a parent_context_name in the V2::ContextDetector instance is the
          # only correct method to uniquely identify two context with the same RegExp.
        end
      end
      if @result[ context_name ].last.instance_of?( Hash )
        log_somehow( logger, "   @result fields = #{@result[ context_name ].last[:fields].inspect}", DEBUG_VERY_VERBOSE && @result[ context_name ].last )
      else
        log_somehow( logger, "   @result fields = NIL!", DEBUG_VERY_VERBOSE )
        log_somehow( logger, "   @result import_text = <#{@result[:import_text].inspect}>", DEBUG_VERY_VERBOSE )
      end

    else                                     # === DETECTION UNSUCCESSFUL (perhaps is "in progress") ===
      # We must report false only if we are sure nothing has been recognized
      # so far to prevent premature parent context reset by the external parser
      # (otherwise "in progress" recognitions will be halted if reported as "not detected"):
      anything_detected = detector.detection_is_in_progress
      log_somehow( logger, "   Parent context still valid, detection in progress...", DEBUG_VERY_VERBOSE ) if anything_detected
    end
    anything_detected
  end
  # ----------------------------------------------------------------------------
  #++


  # Assuming the parsing has already ended, this will yield to the logger a mini-report
  # about all the parsing stats collected so far.
  # (Useful only when the parsing of a whole file is actually finished.)
  #
  # === Params:
  # - the full_pathname of the parsed text file (for logging purposes)
  #
  # === Returns:
  # The total number of data rows parsed.
  #
  def log_parsing_stats( full_pathname )
    log_somehow(
      @parsing_defs.logger,
      "\r\n---------------------------------------------\r\n" +
      "------------------ STATS: -------------------\r\n" +
      "---------------------------------------------\r\n\r\nFile '#{File.basename( full_pathname )}':",
      true, :info
    )
    tot_data_rows = 0                               # Count total data rows, just for "fun stats"
    @result.each { |context_name, result_page_array|
      log_somehow( @parsing_defs.logger, "Total '#{context_name}' data pages : #{result_page_array.size} / #{@total_data_rows} lines found", true, :info )
      tot_data_rows += result_page_array.size       # ASSERT: expect( tot_data_rows == parse_service.total_data_rows )
    }
    log_somehow(
      @parsing_defs.logger,
      "\r\nTotal read lines ....... : #{@line_count} (including garbage)" +
      "\r\nProtocol efficiency .... : #{@line_count == 0 ? 0 : ( @total_data_rows.to_f / @line_count.to_f * 10000.0 ).round / 100.0} %" +
      "\r\nFile done.\r\n---------------------------------------------\r\n\r\n\r\n",
      true, :info
    )
    tot_data_rows
  end
  # ----------------------------------------------------------------------------
  #++


  private


  # Returns a unique string ID for the context_name and token_hash specified
  #
  def compose_memstorage_key( context_name, token_hash )
    return nil if ( @parsing_defs.required_keys( context_name ).size < 1 )
    all_keys_list  = @parsing_defs.required_keys( context_name ).flatten.compact
    log_somehow(
      @parsing_defs.logger,
      "\r\n*** all_keys_list= #{ all_keys_list.inspect }" +
      "** token_hash= #{ token_hash.inspect }",
      DEBUG_VERBOSE
    )
    ( token_hash.reject{ |key, val| !all_keys_list.include?(key) } ).values.join('-')
  end


  # Adds a new data row to the @result and increases the total data rows.
  #
  def add_a_data_row( context_name, key_string, token_hash, cached_rows )
    @result[ context_name ] << {
      id:           key_string,
      fields:       token_hash,
      import_text:  cached_rows.join("\r\n")
    }
    @total_data_rows += 1                     # Increase data rows stat only when actually adding any data
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
  def tokenize_context_cache( context_name, cached_rows )
    tokenizer_context_list = @parsing_defs.tokenizer_types_for( context_name )
    raise "Tokenizer context list not found for context '#{context_name}'!" unless tokenizer_context_list.kind_of?(Array)
    token_list = []
                                                    # For each cached row:
    cached_rows.each_with_index do |row, row_idx|
                                                    # Retrieve the list of tokenizers for the current row:
      tokenizer_row_list = tokenizer_context_list[ row_idx ]
      token_field        = nil
      prev_token_field   = nil
                                                    # The tokenizer row-list may or may not be defined: we must check it
      if ( tokenizer_row_list.kind_of?(Array) && tokenizer_row_list.size > 0 )
        token_list << {}                            # Add a new row item to the resulting token list of rows
                                                    # For each tokenizer row list...
        tokenizer_row_list.each_with_index do |token_extractor, tok_idx|
          token_field = ( @parsing_defs.tokenizer_fields_for( context_name ) )[ row_idx ][ tok_idx ]
# DEBUG (commented out due to excessive detail)
#          log_somehow( @parsing_defs.logger, "-- Processing token '#{token_field}' using #{token_extractor}...", DEBUG_EXTRA_VERBOSE )
          token = token_extractor.tokenize( row, @line_count + 1 )
# DEBUG (commented out due to excessive detail)
#          log_somehow( @parsing_defs.logger, "   Extracted '#{token}'.", DEBUG_EXTRA_VERBOSE )
          token_extractor.clear()                   # Add to the token list only if it contains anything
          token_list.last[ token_field ] = token if token && token.length > 0
        end
      end
    end

    result_token_hash = {}
    token_list.flatten.each { |sub_hash| result_token_hash.merge!(sub_hash) }
    log_somehow( @parsing_defs.logger, "-- Returning token list: #{result_token_hash.inspect}", DEBUG_VERBOSE )
    result_token_hash
  end
  #-- -------------------------------------------------------------------------
  #++
end
