# encoding: utf-8
require_relative '../../../data_import/v3/tools_logging'
require_relative '../../../data_import/v3/services/context_detector'
require_relative '../../../data_import/v3/dao/parse_result'
require_relative '../../../data_import/v3/dao/entity_dao'
require_relative '../../../data_import/v3/dao/context_dao'
require_relative '../../../data_import/v3/strategies/dao_factory'


=begin

= V3::TxtParseService

  - Goggles framework vers.:  4.00.819
  - author: Steve A.

 Service class delegated to the parsing of a single line of text,
 given the current and previous context definition.

 Stores the overall progress of the parsing it has performed but it
 should be controlled externally by a dedicated Strategy class.

=== The typical usage involves:

 - creating a dedicated parse definition holder-object, typically
   by subclassing V3::TxtResultDefs and specifing this in the constructor;

 - for each available line of text to be parsed:
   - for each defined V3::ContextDetector (inside the above V3::TxtResultDefs sibling):
     - call #parse() on the current line and detector to see if there's a match

 - obtain the parsing result either by #result or, more specifically,
   by calling #result_for( context_name )

=end
class V3::TxtParseService
  include Tools::Logging::V3

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

  attr_reader :result, :full_pathname, :line_count, :total_data_rows, :previous_parent_context
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new instance, given a <tt>parsing_definitions</tt> V2::TxtResultDefs
  # kind of object.
  #
  # === Options:
  #
  # - :full_pathname => the full pathname to the parsed file;
  # - :logger => override for the logger instance; defaults to parsing_definitions.logger
  #
  def initialize( parsing_definitions, full_pathname )
    @parsing_defs   = parsing_definitions
    @full_pathname  = full_pathname
    clear
  end
  # ----------------------------------------------------------------------------
  #++

  # Clears the internal #result member that stores all recognized context data
  # so far.
  def clear()
    @result = V3::ParseResult.new( @full_pathname )
    @line_count = 0                                 # current line count
    @total_data_rows = 0                            # total extracted rows with "meaningful" data
    # Previously detected parent context: we split the variable in two, because
    # a detected "context switch may set the context name even before the actual
    # ContextDao instance is created - which happens only at the end of the parsing
    # of a bunch of buffered lines.
    @previous_detected_parent_context_name = nil
    @previous_parent_context = nil
  end

  # Clears just the previously recognized parent context.
  def clear_parent_context
    @previous_detected_parent_context_name = nil
    @previous_parent_context = nil
  end

  # Increases the overall counter of the all the different lines of text parsed.
  #
  # It should be called only when the processing of a single line has been completed
  # by all of the available V2::ContextDetector objects.
  def increase_line_count
    @line_count += 1
  end

  # Returns the V3::ContextDAO result liat (obtained so far) for the specified <tt>context_name</tt>.
  def result_for( context_name )
    @result.get_contexts_named( context_name )
  end
  # ----------------------------------------------------------------------------
  #++


  # Parses the specified (current) line of text, given its position inside the whole
  # file and the previously detected parent context name.
  #
  # This method is assumed to be called iteratively by looping on several different
  # ContextDetector instances, to try the detection against the same <tt>current_line</tt>
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
    # Store current context type name:
    context_name = detector.context_type.context_name
    log("Using #{detector}...", DEBUG_EXTRA_VERBOSE)
                                                    # Run checkings for current line:
    anything_detected = detector.feed_and_detect( current_line, @line_count, @previous_detected_parent_context_name )

    if ( anything_detected )                              # === DETECTION SUCCESSFULL ===
      log("=> Context switched to '\033[1;33;40m#{ context_name.to_s.upcase }\033[0m'. Token extraction in progress...", DEBUG_VERBOSE)
      cached_rows = detector.dump_line_cache
      token_hash  = tokenize_context_cache( context_name, cached_rows )

      if detector.is_a_parent_context               # *** CONTEXT -is- PARENT: HEADER
        @previous_detected_parent_context_name = context_name
        # Any values to be stored?
        if token_hash.instance_of?( Hash ) && ( token_hash.values.size > 0 )
          log("   Adding new PARENT context '#{context_name}'.", DEBUG_VERBOSE)
          add_context_with_entities( context_name, token_hash, cached_rows, true )
        end
                                                    # *** CONTEXT -is- CHILD: DETAIL
      else                                          # Current context depends on another? ("L1" parse result)
                                                    # No change in parent context and values to be stored are present?
        if ( detector.parent_context_name == @previous_detected_parent_context_name ) &&
           token_hash.instance_of?( Hash ) && ( token_hash.values.size > 0 )
          log("   Adding new CHILD row '#{context_name}'.", DEBUG_VERBOSE)
          add_context_with_entities( context_name, token_hash, cached_rows, false )
        end
        # ELSE: parent context changed or different? => quietly skip the storing!
      end
      log("   @result: #{ @result.get_contexts_named(context_name).last }>", DEBUG_VERY_VERBOSE)

    else                                     # === DETECTION UNSUCCESSFUL (perhaps is "in progress") ===
      # We must report false only if we are sure nothing has been recognized
      # so far to prevent premature parent context reset by the external parser
      # (otherwise "in progress" recognitions will be halted if reported as "not detected"):
      anything_detected = detector.detection_is_in_progress
      log("   Parent context still valid, detection in progress...", DEBUG_VERY_VERBOSE) if anything_detected
    end
    anything_detected
  end
  # ----------------------------------------------------------------------------
  #++


  # Assuming the parsing has already ended, this will yield to the logger a mini-report
  # about all the parsing stats collected so far.
  # (Useful only when the parsing of a whole file is actually finished.)
  #
  # === Returns:
  # The total number of data rows parsed.
  #
  def log_parsing_stats
    log(
      "\r\n---------------------------------------------\r\n" +
      "------------------ STATS: -------------------\r\n" +
      "---------------------------------------------\r\n" +
      "r\nFile '#{ @full_pathname ? File.basename(@full_pathname) : '(?)' }':",
      true, :info
    )
    tot_data_rows = 0                               # Count total data rows, just for "fun stats"
    @result.context_list.each do |key_id, context_dao|
      log("- #{context_dao}, #{context_dao.entity_list.size} entities / #{@total_data_rows} lines found", true, :info)
      tot_data_rows += context_dao.entity_list.size
      # ASSERT: expect( tot_data_rows == parse_service.total_data_rows )
    end
    log(
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


  # Adds new data (context with entities) to the @result and increases the total data rows.
  #
  def add_context_with_entities( context_name, token_hash, cached_rows, is_a_parent )
    current_context = nil

    if is_a_parent
      current_context = @previous_parent_context = @result.new_context( context_name, nil )
    else
      current_context = @result.new_context( context_name, @previous_parent_context )
    end
    current_context.text_token = cached_rows.join("\r\n")
                                                    # Create an entity for each parsable token:
    token_hash.each do |field_name, field_value|
      entity = @result.new_entity( field_name, @previous_parent_context )
      entity.text_token = field_value
    end
    @total_data_rows += 1                           # Increase data rows stat only when actually adding any data
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
#          log("-- Processing token '#{token_field}' using #{token_extractor}...", DEBUG_EXTRA_VERBOSE)
          token = token_extractor.tokenize( row, @line_count + 1 )
# DEBUG (commented out due to excessive detail)
#          log("   Extracted '#{token}'.", DEBUG_EXTRA_VERBOSE)
          token_extractor.clear()                   # Add to the token list only if it contains anything
          token_list.last[ token_field ] = token if token && token.length > 0
        end
      end
    end

    result_token_hash = {}
    token_list.flatten.each { |sub_hash| result_token_hash.merge!(sub_hash) }
    log("-- Returning token list: #{result_token_hash.inspect}", DEBUG_VERBOSE)
    result_token_hash
  end
  #-- -------------------------------------------------------------------------
  #++
end
