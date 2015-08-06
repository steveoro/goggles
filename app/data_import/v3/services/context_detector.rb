# encoding: utf-8
require_relative '../../../data_import/v3/tools_logging'
require_relative '../../../data_import/v3/dao/context_type'


=begin

= V2::ContextDetector

  - Goggles framework vers.:  4.00.819
  - author: Steve A.

 Service class delegated to ContextType recognition.

 The class is designed to be fed one line at a time (coherently with
 reading long files). It caches its source feed and detects a possible
 "context change" when the number of lines fed in is enough to fulfill
 all the checks required by the array of conditions that define the
 context itself.
 At implementation level, each condition can be either a String (exact match)
 or a Regexp (Regexp match).

 The "feed text" must result in a successful match for it to be stored
 into the internal buffer cache and, thus, all the stored "conditions"
 must be applied for a successful "context change".
 (The internal counter for matching increases only upon successful matching.)

 The context detected is cached and stored up and until the next
 unsuccessful line check or until an immediate call to </tt>dump_line_cache()</tt>.
 (Since after the next feed it would be compromised.)

 Furthermore, clearing the instance with </tt>clear()</tt> is usually
 unnecessary but it could be useful when using the same instance on
 different source data (specially in test, when running against different
 fixture files or while running specs examples using the same subject).

=end
class V3::ContextDetector
  include Tools::Logging::V3

  attr_reader :context_type, :current_context, :detection_index

  # Set this to true or false to enable or disable debugging output, L1.
  #
  DEBUG_VERBOSE                                     = true

  # Set this to true or false to enable or disable debugging output, L2.
  #
  DEBUG_VERY_VERBOSE                                = true

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
  def initialize( context_type )
    raise ArgumentError.new('context_type must be an V3::ContextType!') unless context_type.instance_of?( V3::ContextType )
    @context_type = context_type
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

  # Returns +true+ if the context defined with this instance
  # is in the progress of being recognized.
  #
  def detection_is_in_progress()
    ( 0 < @detection_index ) && ( @detection_index < @context_type.conditions.size )
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
  # recognized *parent* context, if any.
  #
  # Returns +true+ if a context is successfully recognized.
  # Always +false+ otherwise.
  #
  def feed_and_detect( text_line, current_line_number, previous_parent_context_name )
    log(
      "\r\nContextDetector: called for #{@context_type}.\r\n" +
      "                 Processing line #{current_line_number} (timeout: #{@context_type.line_timeout}), cond. array size: #{@context_type.conditions.size},\r\n" +
      "                 prev. context: <#{previous_parent_context_name.inspect}> (expecting: <#{@context_type.parent_context_name.inspect}>)",
      DEBUG_VERBOSE
    )
    if ( (@context_type.line_timeout > 0) && (current_line_number > @context_type.line_timeout) )
      log("                 => \033[1;31;40mfalse\033[0m for line timeout.", DEBUG_VERY_VERBOSE)
      return false
    end
    if @context_type.conditions.size < 1
      log("                 => \033[1;31;40mfalse\033[0m for NO conditions defined.", DEBUG_VERY_VERBOSE)
      return false
    end
    if !is_a_parent_context && ( @context_type.parent_context_name != previous_parent_context_name )
      log("                 => \033[1;31;40mfalse\033[0m for different PARENT context (inside CHILD context).", DEBUG_VERY_VERBOSE)
      return false
    end
    is_context_detected = false

    condition_to_check = @context_type.conditions[ @detection_index ]
    log("                 Curr. line: <#{text_line}>", DEBUG_EXTRA_VERBOSE )
                                                    # Check if the current line condition applies:
    if ( condition_to_check.kind_of?( String ) )
      log("                 Checking line:#{current_line_number} with String=<#{condition_to_check.inspect}>...", DEBUG_EXTRA_VERBOSE)
      is_condition_ok = ( text_line == condition_to_check )
    elsif ( condition_to_check.kind_of?( Regexp ) )
      log("                 Checking line:#{current_line_number} with Regexp=<#{condition_to_check.inspect}>...", DEBUG_EXTRA_VERBOSE)
      is_condition_ok = !( text_line =~ condition_to_check ).nil?
    end
                                                    # Condition satisfied?
    if ( is_condition_ok )
      log("                 CONDITION OK for \033[1;37;40m#{ @context_type.context_name.to_s.upcase }\033[0m.", DEBUG_VERY_VERBOSE)
                                                    # Store current line in buffer:
      @array_of_lines << text_line
      @detection_index += 1                         # Increase successful detections
      log("                 @detection_index=#{@detection_index} VS #{@context_type.conditions.size}, successful check in progress...", DEBUG_VERY_VERBOSE)
                                                    # Successful matches are enough for a CONTEXT DETECTION?
      if ( @detection_index == @context_type.conditions.size )
        log("                 \033[32m==> context '\033[1;33;40m#{ @context_type.context_name.to_s.upcase }\033[0m\033[32m' DETECTED <==\033[0m", DEBUG_VERBOSE)
        is_context_detected = true
        @current_context  = @context_type
        @detection_index = 0
      end
    else
      log("                 => \033[1;31;40mno match\033[0m.", DEBUG_VERY_VERBOSE)
      clear()
    end
    log("---------------- (ContextDetector end)", DEBUG_VERBOSE)
    is_context_detected
  end
  #-- --------------------------------------------------------------------------
  #++


  # Convert the current instance to a readable string
  def to_s
    "[V3::ContextDetector] => #{@context_type}" + ( @current_context ? ", current: '#{@current_context}'" : '' )
  end
  #-- --------------------------------------------------------------------------
  #++
end
