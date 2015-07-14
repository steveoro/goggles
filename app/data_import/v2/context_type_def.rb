# encoding: utf-8

=begin

= ContextDef

  - Goggles framework vers.:  4.00.461
  - author: Steve A.

 Defines a single context for data parsing in text files.

=end
class V2::ContextTypeDef

  attr_reader :context_name, :condition_array, :parent_context_name, :line_timeout


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
  def initialize( context_name, condition_array, parent_context_name = nil, line_timeout = 0 )
    unless context_name.instance_of?( Symbol ) ||
           ( context_name.instance_of?( String ) && context_name.size > 0 )
      raise ArgumentError.new('context_name cannot be nil or empty!')
    end
    raise ArgumentError.new('condition_array must be an Array!') unless condition_array.instance_of?( Array )
    @context_name = context_name
    @condition_array = condition_array
    @parent_context_name = parent_context_name
    @line_timeout = line_timeout
  end
  #-- --------------------------------------------------------------------------
  #++


  # "Equals" operator.
  def ==( other_object )
    return false unless other_object.instance_of?( V2::ContextTypeDef )
    (
      @context_name == other_object.context_name &&
      @condition_array == other_object.condition_array &&
      @parent_context_name == other_object.parent_context_name &&
      @line_timeout == other_object.line_timeout
    )
  end


  # Convert the current instance to a readable string
  def to_s
    "[ContextTypeDef: #{@context_name.upcase}, #{@condition_array.size} condition(s)" +
    ( @parent_context_name ? ", parent: '#{@parent_context_name}'" : '' ) +
    ( @line_timeout ? ", timeout: #{@line_timeout}" : '' ) + ']'
  end
  #-- --------------------------------------------------------------------------
  #++
end
