# encoding: utf-8

=begin

= V3::ContextType

  - Goggles framework vers.:  4.00.819
  - author: Steve A.

 Defines a single context type for data parsing in text files.

 A single "context type" is used to define the detection features of a single group
 of several "alike" ContextDao instances.

 For example, a single "event_row" context type may refer to several instances
 of ContextDao, each one storing different entity (attribute) values for
 same context type. Like this:

    ContextType: "event_row" (recognized with "context switch")

    - Associated stored contexts:
          +----------> ContextDao: name: "event_row", values: "50 SL, M35"
                            +----------> EntityDao: name: "metres", value: "50"
                            +----------> EntityDao: name: "style", value: "SL"
                            +----------> EntityDao: name: "category", value: "M35"
          +----------> ContextDao: name: "event_row", values: "50 SL, M40"
                            [...]
          +----------> ContextDao: name: "event_row", values: "50 SL, M44"
                            [...]
          [...]

 Each context type may refer to a parent context type (by specifying just its name)
 since ContextDaos can be nested within a parent.

 Each context type may be toggled ON by several conditions (each defined as a RegExp).
 When all of them are true, they mark a "context switch" during the parsing phase.

 This allows to define several TokenExtractor groups in every single context, and when
 all conditions are met and the "context switch" occurs, all other extractors
 not beloging to the same context will not be applied.
 (That is, multiple token extractor could possibly result appliable to the same group
  of cached data tokens.)

 See the ContextDetector and TokenExtractor classes for more info.


=== Members:

 - <tt>:context_name</tt> is the symbol naming this context

 - <tt>:conditions</tt> is an array of String/Regexp; each String or
   Regexp must have a successful match on consequent lines (starting from
   the current one) for the context change to be detected.
   In other words, the context of the parsing text will be changed
   as long as there are N consecutive lines of text matching all
   the N corresponding Regexp (with <tt>conditions.size = N</tt>).
   If the current line to be checked is a String, an exact (equal) match
   will be required to be successful; otherwise, for Regexp, the stardard
   Regexp matching operator will be used.

 - <tt>:line_timeout</tt> when set greater than 0, will be the maximum
   line number after which the check will be skipped (returning always
   false).

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
  # detected *parent* context must have the same name .
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
    unless args.instance_of?( Hash )
      raise ArgumentError.new('args must be an Hash of options!')
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
