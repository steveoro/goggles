# encoding: utf-8

require 'parsers/txt_result_defs'
require 'parsers/context_type_def'
require 'parsers/context_detector'
require 'parsers/token_extractor'
require 'parsers/fin_result_consts'


=begin

= FinResultDefs

  - Goggles framework vers.:  4.00.505
  - author: Steve A.

 Value object/Container class for the lists of ContextDetector and TokenExtractor
 classes and all the other structures required by the parser processing
 text data files of type 'fin_result'.

=end
class FinResultDefs < TxtResultDefs
  include FinResultConsts

  # This logger will be used by each ContextDetector instance defined internally.
  attr_reader :logger
  # ----------------------------------------------------------------------------
  #++


  # Creates a new instance, storing the parameters for the parsing.
  #
  # The logger specified here will be passed on to each ContextDetector
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
      meeting_header:   ContextDetector.new( CNT_TYPE_MEETING_HEADER, logger ),
      category_header:  ContextDetector.new( CNT_TYPE_CATEGORY_HEADER, logger ),
      relay_header:     ContextDetector.new( CNT_TYPE_RELAY_HEADER, logger ),
      team_ranking:     ContextDetector.new( CNT_TYPE_TEAM_RANKING, logger ),
      stats:            ContextDetector.new( CNT_TYPE_STATS, logger ),
                                                      # DETAIL CONTEXT(s) def. arrays:
      result_row:   ContextDetector.new( CNT_TYPE_RESULT_ROW, logger ),
      relay_row:    ContextDetector.new( CNT_TYPE_RELAY_ROW, logger ),
      ranking_row:  ContextDetector.new( CNT_TYPE_RANKING_ROW, logger ),

      stats_teams_tot:        ContextDetector.new( CNT_TYPE_STATS_TEAMS_TOT, logger ),
      stats_teams_presence:   ContextDetector.new( CNT_TYPE_STATS_TEAMS_PRESENCE, logger ),
      stats_swimmer_tot:      ContextDetector.new( CNT_TYPE_STATS_SWIMMER_TOT, logger ),
      stats_swimmer_presence: ContextDetector.new( CNT_TYPE_STATS_SWIMMER_PRESENCE, logger )
    }

    # == String tokenizer type hash
    # An Hash of row type symbols pointing to an array of arrays, in which each
    # single element array is a TokenExtractor instance, used to define each token
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
          TOK_EXT_MEETING_HEADER_TITLE,
          TOK_EXT_MEETING_HEADER_MEETING_DATES,
        ],
        # -- Fields to be extracted: :organization OR :title
        [
          TOK_EXT_MEETING_HEADER_ORGANIZATION,
          TOK_EXT_MEETING_HEADER_TITLE
        ],
        # -- Fields to be extracted: :meeting_dates OR :organization
        [
          TOK_EXT_MEETING_HEADER_MEETING_DATES,
          TOK_EXT_MEETING_HEADER_ORGANIZATION,
        ]
      ],

      category_header: [                              # 3 row-type conditions => 3 cached rows => the tokenizer list must have 3 elements
        nil,
        # -- Fields to be extracted: :distance, :style, :gender, :category_group, :base_time
        [
          TOK_EXT_CATEGORY_HEADER_DISTANCE,
          TOK_EXT_CATEGORY_HEADER_STYLE,
          TOK_EXT_CATEGORY_HEADER_GENDER,
          TOK_EXT_CATEGORY_HEADER_CATEGORY_GROUP,
          TOK_EXT_CATEGORY_HEADER_BASE_TIME
        ],
        nil
      ],

      # -- Fields to be extracted: :type, :distance, :style, :gender (can be nil), :category_group, :base_time
      relay_header: [
        nil,
        [
          TOK_EXT_RELAY_HEADER_TYPE,
          TOK_EXT_RELAY_HEADER_DISTANCE,
          TOK_EXT_RELAY_HEADER_STYLE,
          TOK_EXT_CATEGORY_HEADER_GENDER,
          TOK_EXT_RELAY_HEADER_CATEGORY_GROUP,
          TOK_EXT_RELAY_HEADER_BASE_TIME
        ],
        nil
      ],

      # -- Fields to be extracted: (nothing, 2 lines in cache)
      team_ranking: [
        nil, nil
      ],

      # -- Fields to be extracted: (nothing, 3 lines in cache)
      stats: [
        nil, nil, nil
      ],

      result_row: [                                 # 1 condition => 1 cached row
        [                                           # => the tokenizer list must have 1 element (which is 1 array of 2-item arrays)
          TOK_EXT_RESULT_ROW_RESULT_POSITION,
          TOK_EXT_RESULT_ROW_TEAM_CODE,
          TOK_EXT_RESULT_ROW_SWIMMER_NAME,
          TOK_EXT_RESULT_ROW_SWIMMER_YEAR,
          TOK_EXT_RESULT_ROW_TEAM_NAME,
          TOK_EXT_RESULT_ROW_RESULT_TIME,
          TOK_EXT_RESULT_ROW_RESULT_SCORE
        ]
      ],

      # -- Fields to be extracted: :result_position, :team_name, :result_time, :result_score
      relay_row: [
        [                                             # => the tokenizer list must have 1 element (which is 1 array of 2-item arrays)
          TOK_EXT_RELAY_ROW_RESULT_POSITION,
          TOK_EXT_RELAY_ROW_TEAM_NAME,
          TOK_EXT_RELAY_ROW_RESULT_TIME,
          TOK_EXT_RELAY_ROW_RESULT_SCORE
        ]
      ],

      # -- Fields to be extracted: :result_position, :team_code, :team_name, :result_score
      ranking_row: [
        [
          TOK_EXT_RANKING_ROW_RESULT_POSITION,
          TOK_EXT_RANKING_ROW_TEAM_CODE,
          TOK_EXT_RANKING_ROW_TEAM_NAME,
          TOK_EXT_RANKING_ROW_RESULT_SCORE
        ]
      ],

      # -- Fields to be extracted: :total (for all rows)
      stats_teams_tot: [
        [
          TOK_EXT_STATS_TEAM_TOTAL
        ]
      ],
      stats_teams_presence: [
        [
          TOK_EXT_STATS_TEAM_TOTAL
        ]
      ],
      stats_swimmer_tot: [
        [
          TOK_EXT_STATS_TEAM_TOTAL
        ]
      ],
      stats_swimmer_presence: [
        [
          TOK_EXT_STATS_TEAM_TOTAL
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
      category_header: [                            # 3 row-type conditions => 3 cached rows => the tokenizer list must have 3 elements
        nil,
        [ :distance, :style, :gender, :category_group, :base_time ],
        nil
      ],
      relay_header: [
        nil,
        [ :type, :distance, :style, :gender, :category_group, :base_time ],
        nil
      ],

      result_row: [                                 # 1 condition => 1 cached row => the tokenizer list must have 1 element (which is 1 array)
        [
          :result_position,
          :team_code,
          :swimmer_name,
          :swimmer_year,
          :team_name,
          :result_time,
          :result_score
        ]
      ],
      relay_row: [
        [ :result_position, :team_name, :result_time, :result_score ]
      ],

      team_ranking: [                               # 2 row-type conditions => 2 cached rows => the tokenizer list must have 2 elements
        nil,
        nil
      ],
      ranking_row: [
        [ :result_position, :team_code, :team_name, :result_score ]
      ],

      stats: [                                      # 3 row-type conditions => 2 cached rows => the tokenizer list must have 3 elements
        nil, nil, nil
      ],
      stats_teams_tot:        [ [ :total ] ],
      stats_teams_presence:   [ [ :total ] ],
      stats_swimmer_tot:      [ [ :total ] ],
      stats_swimmer_presence: [ [ :total ] ]
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
      meeting_header:  [:title],
      category_header: [:distance, :style, :gender, :category_group],
      relay_header:    [:type, :category_group]     # (type includes also the gender token)
    }
                                                    # === Internal structure integrity checks: ===
                                                    # Pre-check format type definition:
    raise "Malformed parser Hash!" unless (@context_types.size == @tokenizer_types.size) && (@tokenizer_types.size == @tokenizer_fields.size)

    @context_types.each { |key, detector|
      raise "Missing parser Hash key '#{key}'!" unless ( @tokenizer_types.has_key?(key) && @tokenizer_fields.has_key?(key) )
      rails "Parser Hash element '#{key}' points to an invalid detector instance!" unless detector.instance_of?(ContextDetector)
    }
  end
  # ----------------------------------------------------------------------------
  #++
end
