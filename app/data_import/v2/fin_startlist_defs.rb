# encoding: utf-8

require_relative '../../data_import/v2/txt_result_defs'
require_relative '../../data_import/v2/context_type_def'
require_relative '../../data_import/v2/services/context_detector'
require_relative '../../data_import/v2/services/token_extractor'
require_relative '../../data_import/v2/fin_startlist_consts'


=begin

= V2::FinResultDefs

  - Goggles framework vers.:  4.00.749
  - author: Steve A.

 Value object/Container class for the lists of V2::ContextDetector and V2::TokenExtractor
 classes and all the other structures required by the parser processing
 text data files of type 'fin_startlist'.

=end
class V2::FinStartListDefs < V2::TxtResultDefs
  include V2::FinStartListConsts

  # This logger will be used by each V2::ContextDetector instance defined internally.
  attr_reader :logger
  # ----------------------------------------------------------------------------
  #++

  # Creates a new instance, storing the parameters for the parsing.
  #
  # The logger specified here will be passed on to each V2::ContextDetector
  # instance defined internally.
  #
  def initialize( logger = nil )
    @logger = logger

    # == Context type parser hash
    # An Hash of row type symbols pointing to an array of conditions to be satisfied.
    #
    # Parsing a row type implies detecting the context in which the tokens of the
    # row will be extracted.
    #
    # To successfully parse a row type (thus defining the current context of the tokenizer),
    # for each type symbol here enlisted, all of its value elements must result true,
    # equal or "satisfied", for the type of context to be recognized as "active".
    #
    # For instance, for the type :category_header, 3 consecutive lines of the parsed
    # file must satisfy the conditions inside its element array (respectively at
    # index 0, 1 and 2).
    # Whereas, for the type :result_row a single condition is defined as enough.
    #
    # If the condition is a String, the equal operator is used (=).
    # If the condition is a RegExp, the search operator is used (=~).
    #
    # Contexts are served in F.I.F.O. order (first detected, first served), but no skipping is made in
    # case more than one rule is found to be true (That is, one single line may return more than one
    # context of data, if the conditions are loose enough).
    #
    @context_types = {                                # HEADER CONTEXT(s) def. arrays:
      meeting_header:   V2::ContextDetector.new( context_type_meeting_header, logger ),
      event_individual: V2::ContextDetector.new( context_type_event_individual, logger ),
                                                      # DETAIL CONTEXT(s) def. arrays:
      entry_row:        V2::ContextDetector.new( context_type_entry_row, logger )
    }

    # == String tokenizer type hash
    # An Hash of row type symbols pointing to an array of arrays, in which each
    # single element array is a V2::TokenExtractor instance, used to define each token
    # boundary inside the currently parsed row.
    #
    # For each context defined by the row_types array, and for each possible row,
    # an array of conditions must be defined to detect the starting and ending position
    # from which the token must be extracted. (see ++TokenExtractor++ class).
    #
    # Use +nil+ or an empty array to skip token extraction for the current line
    # of context. If the "starting condition" applies successfully but the following
    # condition doesn't, the end of line is considered the actual token end boundary.
    #
    @tokenizer_types = {
      meeting_header: [
        # -- Fields to be extracted: :title OR :meeting_dates
        [
          tokenizer_meeting_header_title,
          tokenizer_meeting_header_meeting_dates,
        ],
        # -- Fields to be extracted: :organization OR :title
        [
          tokenizer_meeting_header_organization,
          tokenizer_meeting_header_title
        ],
        # -- Fields to be extracted: :meeting_dates OR :organization
        [
          tokenizer_meeting_header_meeting_dates,
          tokenizer_meeting_header_organization,
        ]
      ],

      event_individual: [                              # 2 row-type conditions => 2 cached rows => the tokenizer list must have 2 elements
        # -- Fields to be extracted: :distance, :style
        [
          tokenizer_event_individual_distance,
          tokenizer_event_individual_style
        ],
        nil
      ],

      # -- Fields to be extracted:
      # [ :entry_order, :swimmer_name, :category_group, :team_name, :entry_time ]
      entry_row: [                                  # 1 condition => 1 cached row
        [                                           # => the tokenizer list must have 1 element (which is 1 array of 2-item arrays)
          tokenizer_entry_row_entry_order,
          tokenizer_entry_row_swimmer_name,
          tokenizer_entry_row_category_group,
          tokenizer_entry_row_team_name,
          tokenizer_entry_row_entry_time
        ]
      ]
    }

    # == String tokenizer field names Hash
    # An Hash of field names enlisted in arrays, one for each possible row type
    # symbol defined for @tokenizer_types.
    #
    # Note that each field name is supposed to be unique among all the arrays
    # belonging to the same tokenizer type; otherwise, when not null, the last
    # value found will overwrite any other existing key having the same symbol.
    #
    @tokenizer_fields = {
      meeting_header: [                             # 3 row-type conditions => 3 cached rows => the tokenizer list must have 3 elements
        [ :title, :meeting_dates ],
        [ :organization, :title ],
        [ :meeting_dates, :organization ]
      ],
      event_individual: [                           # 2 row-type conditions => 3 cached rows => the tokenizer list must have 2 elements
        [ :distance, :style ],
        nil
      ],

      entry_row: [                                  # 1 condition => 1 cached row => the tokenizer list must have 1 element (which is 1 array)
        [
          :entry_order,
          :swimmer_name,
          :category_group,
          :team_name,
          :entry_time
        ]
      ]
    }

    # == Context Group Keys Hash
    # This Hash contains as each item value the array of all the key field for
    # a specific context symbol.
    # The field names must be taken from @tokenizer_fields and these will be
    # concatenated together to form the unique key representing a single context
    # data page on the result hash.
    #
    # If no key is defined for a specific context symbol, each entry will be
    # treated as unique and added to the result array of data pages.
    #
    @context_keys = {
      meeting_header:   [:title],
      event_individual: [:distance, :style]
    }
                                                    # === Internal structure integrity checks: ===
                                                    # Pre-check format type definition:
    raise "Malformed parser Hash!" unless (@context_types.size == @tokenizer_types.size) && (@tokenizer_types.size == @tokenizer_fields.size)

    @context_types.each { |key, detector|
      raise "Missing parser Hash key '#{key}'!" unless ( @tokenizer_types.has_key?(key) && @tokenizer_fields.has_key?(key) )
      raise "Parser Hash element '#{key}' points to an invalid detector instance!" unless detector.instance_of?( V2::ContextDetector )
    }
  end
  # ----------------------------------------------------------------------------
  #++
end
