#
# == ContextDef
#
# Defines a single context for data parsing in text files.
#
# @author   Steve A.
# @version  4.00.459
#
class ContextTypeDef

  # Creates a new instance, given a context_name (or symbol),
  # an Array of RegExp conditions to be met for the context to be
  # reckognized, an optional parent context name (or symbol) and
  # an optional line timeout for the context to be detected as soon as
  # the parent context is reckognized.
  #
  # The parent context name defines an additional prerequisite that
  # must be fulfilled for context detection. When not +nil+, the previously
  # detected context must have the same name .
  #
  def initialize( context_name, condition_array, parent_context_name = nil, line_timeout = 0 )
    @context_name = context_name
    @condition_array = condition_array
    @parent_context_name = parent_context_name
    @line_timeout = line_timeout
  end
  #-- --------------------------------------------------------------------------
  #++

  # Context name getter
  def context_name
    @context_name
  end

  # Condition array getter
  def condition_array
    @condition_array
  end

  # Parent context name getter. It can be nil.
  def parent_context_name
    @parent_context_name
  end

  # Line time-out getter. It can be 0 (but always not-nil).
  def line_timeout
    @line_timeout
  end
  #-- --------------------------------------------------------------------------
  #++

  # Checks something.
  #
  def todo()
    # TODO
  end
  #-- --------------------------------------------------------------------------
  #++
end
