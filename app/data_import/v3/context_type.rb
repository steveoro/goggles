# encoding: utf-8

=begin

= V3::ContextType

  - Goggles framework vers.:  4.00.815
  - author: Steve A.

 Defines a single context type for data parsing in text files.

 Each context type may be toggled ON by several conditions (each defined as a RegExp).
 When all of them are true, they mark a "context switch" during the parsing phase.

 Since several ContextExtractor groups may be defined in a single contexts, having
 a "context switch" will exclude all the extractors not beloging to the same context
 to be applied.

 See the ContextExtractor class for more info.

=end
class V3::ContextType

  attr_reader   :context_name, :conditions, :parent_context_name, :line_timeout


  # Creates a new instance, given a context_name (or symbol),
  # an Array of String values or RegExp conditions to be met for the context to be
  # recognized, an optional parent context name (or symbol) and
  # an optional line timeout for the context to be detected as soon as
  # the parent context is recognized.
  #
  # When a condition is a String it is matched with equals (==). When it's a Regexp,
  # is matched with the matching operator (=~).
  #
  # The parent context name defines an additional _prerequisite_ that
  # must be fulfilled for context detection. When not +nil+, the previously
  # detected context must have the same name .
  # (For sake of clarity, parent_context_name is _not_ the previously recognized
  # context during the parsing, but it's checked against it.)
  #
  # === Options:
  #
  # - :conditions => an array of RegExp conditions to be satisfied;
  # - :parent_context_name => the name of the parent context (which must in turn be satisfied
  #   for the context switch to occur);
  # - :line_timeout => maximum line number for this context to be applied.
  #
  def initialize( context_name, args = {} )
    unless context_name.instance_of?( Symbol ) ||
           ( context_name.instance_of?( String ) && context_name.size > 0 )
      raise ArgumentError.new('context_name cannot be nil or empty!')
    end
    @context_name        = context_name
    @conditions          = args[:conditions]          ? args[:conditions]          : []
    @parent_context_name = args[:parent_context_name] ? args[:parent_context_name] : nil
    @line_timeout        = args[:line_timeout]        ? args[:line_timeout]        : 0
    raise ArgumentError.new('condition_array must be an Array!') unless @conditions.instance_of?( Array )
  end
  #-- --------------------------------------------------------------------------
  #++


  # "Equals" operator.
  def ==( other_object )
    return false unless other_object.instance_of?( V3::ContextType )
    (
      @context_name == other_object.context_name &&
      @conditions == other_object.conditions &&
      @parent_context_name == other_object.parent_context_name &&
      @line_timeout == other_object.line_timeout
    )
  end


  # Convert the current instance to a readable string
  def to_s
    "[V3::ContextType: #{@context_name.upcase}, #{@conditions.size} condition(s)" +
    ( @parent_context_name ? ", parent: '#{@parent_context_name}'" : '' ) +
    ( @line_timeout ? ", timeout: #{@line_timeout}" : '' ) + ']'
  end
  #-- --------------------------------------------------------------------------
  #++
end
