# encoding: utf-8

=begin

= ContextDetector

  - Goggles framework vers.:  4.00.461
  - author: Steve A.

 Utility class for detecting context changes in the text scanned
 by the parser classes.

 The class is designed to be fed one line at a time (coherently with
 reading long files), caching its source feed and detecting a possible
 "context change" when the number of lines fed in is enough to fulfill
 all the checks required by the array of conditions that define the
 context itself.
 Each condition can be either a String (exact match) or a Regexp (Regexp match).

 The "feed text" must result in a successful match for it to be stored
 into the internal buffer cache and, thus, all the stored "conditions"
 must be applied for a successful "context change".
 (The internal counter for matching increases only upon successful matching.)

 The context detected is cached and stored up and until the next
 unsuccessful line check or until an immediate call to </tt>dump_line_cache()</tt>.
 (Since after the next feed it would be compromised.)

 Furthermore, clearing the instance with </tt>clear()</tt> is usually
 unnecessary but it could be useful when using the same instance on
 different source files.


=== Members:

 - <tt>:context_name</tt> is the symbol naming this context

 - <tt>:condition_array</tt> is an array of String/Regexp; each String or
   Regexp must have a successful match on consequent lines (starting from
   the current one) for the context change to be detected.
   In other words, the context of the parsing text will be changed
   as long as there are N consecutive lines of text matching all
   the N corresponding Regexp (with <tt>condition_array.size = N</tt>).
   If the current line to be checked is a String, an exact (equal) match
   will be required to be successful; otherwise, for Regexp, the stardard
   Regexp matching operator will be used.

 - <tt>:line_timeout</tt> when set greater than 0, will be the maximum
   line number after which the check will be skipped (returning always
   false).

=end
class ContextDetector

  attr_reader :context_type, :logger, :current_context

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


  # Creates a new instance.
  #
  #
  #
  # Parent context name defines an additiona prerequisite that
  # must be fulfilled for context detection: when not +nil+
  # pre-defined parent context must be equal to previously
  # detected context (specified upon each new line feed).
  #
  def initialize( context_type, logger = nil )
    raise IllegalArgumentException.new('context_type must be an ContextTypeDef!') unless context_type.instance_of?( ContextTypeDef )
    @context_type = context_type
    @logger = logger
    @current_context = nil
    @array_of_lines = []
    @detection_index = 0                            # Current starting index for matching inside the array_of_regexp
  end


  # Clears the cached results. This method is useful only if the same instance
  # is used for different source texts.
  #
  def clear()
    @current_context = nil
    @array_of_lines = []
    @detection_index = 0
  end

  # Returns the name of the parent context
  #
  def parent_context_name()
    @context_type.parent_context_name
  end

  # Returns +true+ if the context defined with this instance
  # is a "root/parent" (that is, an instance with no parents).
  #
  def is_a_parent_context()
    @context_type.parent_context_name.nil?
  end

  # Returns the current buffered lines cache, automatically
  # clearing it afterwards.
  #
  def dump_line_cache()
    dump_cache = @array_of_lines.dup
    @array_of_lines = []
    dump_cache
  end
  #-- -------------------------------------------------------------------------
  #++


  # Feeds one more line into the instance. Takes into account also the previously
  # recognized context, if any.
  #
  # Returns +true+ if a context is successfully recognized.
  # Always +false+ otherwise.
  #
  def feed_and_detect( text_line, current_line_number, previous_context_name )
    return false if ( (@context_type.line_timeout > 0) && (current_line_number > @context_type.line_timeout) )
    return false if @context_type.condition_array.size < 1
    return false if ( @context_type.parent_context_name != previous_context_name )
    is_context_detected = false

    condition_to_check = @context_type.condition_array[ @detection_index ]
    if DEBUG_EXTRA_VERBOSE
      @logger ? @logger.debug("ContextDetector: curr line:\r\n<#{text_line}>") : puts("ContextDetector: curr line:\r\n<#{text_line}>")
    end
                                                    # Check if the current line condition applies:
    if ( condition_to_check.kind_of?( String ) )
      if DEBUG_EXTRA_VERBOSE
        @logger ? @logger.debug("ContextDetector: checking line:#{current_line_number} with String=<#{condition_to_check.inspect}>...") : puts("ContextDetector: checking line:#{current_line_number} with String=<#{condition_to_check.inspect}>...")
      end
      is_condition_ok = ( text_line == condition_to_check )
    elsif ( condition_to_check.kind_of?( Regexp ) )
      if DEBUG_EXTRA_VERBOSE
        @logger ? @logger.debug("ContextDetector: checking line:#{current_line_number} with Regexp=<#{condition_to_check.inspect}>...") : puts("ContextDetector: checking line:#{current_line_number} with Regexp=<#{condition_to_check.inspect}>...")
      end
      is_condition_ok = !( text_line =~ condition_to_check ).nil?
    end
                                                    # Condition satisfied?
    if ( is_condition_ok )
      if DEBUG_VERY_VERBOSE
        @logger ? @logger.debug( "ContextDetector: condition OK for '#{@context_type.context_name}>'." ) : puts( "ContextDetector: condition OK for '#{@context_type.context_name}>'." )
      end
                                                    # Store current line in buffer:
      @array_of_lines << text_line
      @detection_index += 1                         # Increase successful detections
      if DEBUG_VERY_VERBOSE
        @logger ? @logger.debug( "ContextDetector: @detection_index=#{@detection_index} VS #{@context_type.condition_array.size}, successful check in progress..." ) :
                  puts( "ContextDetector: @detection_index=#{@detection_index} VS #{@context_type.condition_array.size}, successful check in progress..." )
      end
                                                    # Successful matches are enough for a CONTEXT DETECTION?
      if ( @detection_index == @context_type.condition_array.size )
        @logger.debug( "ContextDetector: ==> context '#{@context_type.context_name}' DETECTED <==" ) if (@logger && DEBUG_VERBOSE)
        is_context_detected = true
        @current_context  = @context_type
        @detection_index = 0
      end
    else
      clear()
    end
    is_context_detected
  end
  #-- --------------------------------------------------------------------------
  #++


  # Convert the current instance to a readable string
  def to_s
    "[ContextDetector] => #{@context_type}" + ( @current_context ? ", current: '#{@current_context}'" : '' )
  end
  #-- --------------------------------------------------------------------------
  #++
end
