# encoding: utf-8


=begin

= TxtResultDefs

  - Goggles framework vers.:  4.00.505
  - author: Steve A.

 Base class for any sibling that needs to define lists of ContextDetector and
 TokenExtractor(s) for a specific file format.
 classes and all the other structures required by the parser processing
 text data files of type 'fin_result'.

=end
class TxtResultDefs

  attr_reader :context_types, :context_keys, :tokenizer_types, :tokenizer_fields
  # ----------------------------------------------------------------------------
  #++


  # Creates a new instance.
  #
  def initialize()
  end
  # ----------------------------------------------------------------------------
  #++

  # Returns just the Array of all defined context key symbols.
  #
  def defined_keys()
    @context_types.keys
  end

  # Returns the Array of all the *required* (that is, guaranteed to be
  # created) output field keys for a specified context symbol.
  # Returns an empty array if the +context_sym+ is not found.
  #
  def required_keys( context_sym )
    return @context_keys[ context_sym ] ? @context_keys[ context_sym ] : []
  end

  # Returns the Array of _possible_ field symbols used to populate the value item Hash
  # (indexed by the key :fields) of the returned parse_result[context_sym].
  #
  # Please note that not all returned fields in the Array may be present or used in
  # any returned row. (Empty or blank fields are stripped out and then compacted
  # from the resulting array of values.)
  #
  def field_list_for( context_sym )
    return [] if @tokenizer_fields[ context_sym ].nil?
    @tokenizer_fields[ context_sym ].flatten.compact.uniq
  end
  # ----------------------------------------------------------------------------
  #++


  # Returns the specific ContextDetector instance associated with the context
  # symbol specified.
  # Returns +nil+ when not found.
  #
  def detector_for( context_sym )
    @context_types[ context_sym ]
  end


  # Returns +true+ if the specified context symbol points to a ContextDetector
  # instance that is root or has a +nil+ parent context.
  #
  def is_a_parent( context_sym )
    detector = detector_for( context_sym )
    ( detector.nil? || detector.is_a_parent_context() )
  end
  # ----------------------------------------------------------------------------
  #++

  # Returns an Hash of field name symbols as keys with their corresponding
  # @tokenizer_types instances as values.
  # ( {<field_name_sym> => <corresponding_tokenizer_instance>, ...} )
  #
  # Note that this is "flattened" version of the same result
  # obtained from #tokenizer_types_for( context_sym ).
  #
  def tokenizers_for( context_sym )
    return {} if @tokenizer_fields[ context_sym ].nil? || @tokenizer_types[ context_sym ].nil?
    keys = @tokenizer_fields[ context_sym ].flatten.compact
    values = @tokenizer_types[ context_sym ].flatten.compact
    result_hash = {}
    keys.each_with_index{ |k, i|
      result_hash[ k ] = values[i]
    }
    result_hash
  end

  # Returns the intact structure of the tokenizer type defined for
  # the specified context symbol, or +nil+ when not found.
  #
  # The returned value is the Array (lines) of Array of TokenExtractor
  # instances (fields), with one TokenExtractor defined for each field
  # that must be extracted, and grouped together in lines (belonging
  # to the same context -- thus the array of array).
  #
  # This complex structure is actually used only by the parser
  # instance itself.
  #
  def tokenizer_types_for( context_sym )
    @tokenizer_types[ context_sym ]
  end

  # Returns the intact structure of the tokenizer fields defined for
  # the specified context symbol, or +nil+ when not found.
  #
  # The returned value is somehow similar in structure to the
  # one returned by #tokenizer_types_for( context_sym ),
  # but simpler, since it just has a matrix of field names (in symbols)
  # with one list of row symbols for each row of context defined.
  #
  # This complex structure is actually used only by the parser
  # instance itself.
  #
  def tokenizer_fields_for( context_sym )
    @tokenizer_fields[ context_sym ]
  end
  # ----------------------------------------------------------------------------
  #++

  # Returns a copy of <tt>#context_types</tt> Hash containing just a selection of
  # all ContextTypeDef instances that require <tt>parent_context_name</tt> as their
  # recognized parent context.
  #
  def context_types_children_of( parent_context_name )
    @context_types.select{ |key, context| context.parent_context_name == parent_context_name }
  end
  # ----------------------------------------------------------------------------
  #++
end
