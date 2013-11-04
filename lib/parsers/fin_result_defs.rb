# encoding: utf-8

require 'parsers/context_detector'
require 'parsers/token_extractor'


=begin

= FinResultDefs

  - Goggles framework vers.:  4.00.81.20131104
  - author: Steve A.

 Container class for the lists of ContextDetector and TokenExtractor
 classes and all the other structures required by the parser processing
 text data files of type 'fin_result'.

=end
class FinResultDefs

  attr_accessor :full_pathname, :show_progress, :logger
  # ---------------------------------------------------------------------------
  # ---------------------------------------------------------------------------


  # Creates a new instance.
  #
  def initialize( full_pathname, logger = nil )
    self.full_pathname = full_pathname
    self.logger = logger

    # == Context type parser hash - an Hash of row type symbols pointing to an array of conditions to be satisfied.
    #
    # Parsing a row type implies detecting the context on which the tokens of the row will be extracted.
    #
    # To successfully parse a row type (thus defining the current context of the tokenizer),
    # for each type symbol here enlisted, all of its value elements must result true, equal or "satisfied",
    # for the type of context to be reckognized as "active".
    #
    # For instance, for the type :category_header, 3 consecutive lines of the parsed file must satisfy
    # the conditions inside its element array (respectively at index 0, 1 and 2).
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
      :meeting_header => ContextDetector.new(
        :meeting_header,
        [
          /(\s*(\d{1,3}\D{1,2}\s\S+|Trof|Region))|(\d{1,2}((\/|-|\,)\d{1,2})?\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})/ui,
          /(\s*Manifestazione organizzata da)|(\s*(\d{1,3}\D{1,2}\s\S+|Trof|Region))/ui,
          /(\d{1,2}((\/|-|\,)\d{1,2})?\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})|(\s*Manifestazione organizzata da)/ui
        ],
        logger,
        nil,                                          # parent context
        4                                             # line_timeout (line after which these checks will be skipped)
      ),
      :category_header => ContextDetector.new(
        :category_header,
        [
          '',
          /(?<!\dx)(50 |100 |200 |400 |800 |1500 ) *(stile|misti|dorso|rana|farf|SL|DO|RA|FA|MI|MX|DF|DS|RN).*(maschi|femmi)/i,
          /^--------------------------/
        ],
        logger
      ),
      :relay_header => ContextDetector.new(
        :relay_header,
        [
          '',
          /(mistaff|staff).*\s+\d{1,2}x\d{2,3}\s+(stile|mi|sl|mx).*\s+-\s+cat/i,
          /^--------------------------/
        ],
        logger
      ),
      :team_ranking => ContextDetector.new(
        :team_ranking,
        [
          /classifica(\s+di)?(\s+societ)?/ui,
          ''
        ],
        logger
      ),
                                                      # DETAIL CONTEXT(s) def. arrays:
      :result_row => ContextDetector.new(
        :result_row,
        [
          /(Ritir.*|Squal.*|\d{1,2}'\d\d"\d\d) +\d{1,4}[\,|\.]\d\d$/i
        ],
        logger,
        :category_header                              # parent context
      ),
      :relay_row => ContextDetector.new(
        :relay_row,
        [
          /Ritir.*|Squal.*|(\d{1,2}'\d\d"\d\d +\d{1,4}[\,|\.]\d\d)$/i
        ],
        logger,
        :relay_header    
      ),
      :ranking_row => ContextDetector.new(
        :ranking_row,
        [
          /\s+\d{1,6}[\,|\.]\d\d$/ui
        ],
        logger,
        :team_ranking    
      )
    }

    # == String tokenizer type hash - an Hash of row type symbols pointing to an array of arrays,
    # in which each single element array is a TokenExtractor instance, used to define each token
    # boundary inside the currently parsed row.
    #
    # For each context defined by the row_types array, and for each possible row, an array
    # of conditions must be defined to detect the starting and ending position from which the token must be
    # extracted. (see ++TokenExtractor++ class).
    #
    # Use nil or an empty array to skip token extraction for the current line of context. If the
    # "starting condition" applies successfully but the following condition doesn't, the end of line is
    # considered the actual token end boundary.
    #
    @tokenizer_types = {
      :meeting_header => [
        # -- Fields to be extracted: :title OR :meeting_dates
        [
          TokenExtractor.new(
            :title,
            /\s*(\d{1,3}\D\s)?(\w+|Trof|Region)/ui,
            /$/ui,
            3                                         # line_timeout
          ),
          TokenExtractor.new(
            :meeting_dates,
            /\d{1,2}((\/|-|\,)\d{1,2})?\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4}/ui,
            /$/ui,
            3                                         # line_timeout
          )
        ],
        # -- Fields to be extracted: :organization OR :title
        [
          TokenExtractor.new(
            :organization,
            /(?<=manifestazione organizzata da)\s/ui,
            /$/ui,
            3                                         # line_timeout
          ),
          TokenExtractor.new(
            :title,
            /\s*(\d{1,3}\D{1,2}\s\S+|Trof|Region)/ui,
            /$/ui,
            3                                         # line_timeout
          )
        ],
        # -- Fields to be extracted: :meeting_dates OR :organization
        [
          TokenExtractor.new(
            :meeting_dates,
            /\d{1,2}((\/|-|\,)\d{1,2})?\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4}/ui,
            /$/ui,
            3                                         # line_timeout
          ),
          TokenExtractor.new(
            :organization,
            /(?<=manifestazione organizzata da)\s/ui,
            /$/ui,
            3                                         # line_timeout
          )
        ]
      ],

      :category_header => [                           # 3 row-type conditions => 3 cached rows => the tokenizer list must have 3 elements 
        nil,
        # -- Fields to be extracted: :distance, :style, :gender, :category_group, :base_time
        [
          TokenExtractor.new(                         # RegExp for distance:
            :distance,
            /(?<!\dx)(50 |100 |200 |400 |800 |1500 ) */ui,
            / *(stile|mi|do|ra|fa|sl|MX|DF|DS|RN).*/ui
          ),
          TokenExtractor.new(
            :style,
            / *(stile|mi|do|ra|fa|sl|MX|DF|DS|RN).*/ui,
            / *(maschi|femmi)/ui
          ),
          TokenExtractor.new(
            :gender,
            / *(maschi|femmi)/ui,
            / * - *categoria/ui
          ),
          TokenExtractor.new(
            :category_group,
            / *(master|under) */ui,
            / *tempo base */ui
          ),
          TokenExtractor.new(
            :base_time,
            /\d{1,2}'\d\d"\d\d$/u,
            9
          )
        ],
        nil
      ],

      # -- Fields to be extracted: :type, :distance, :style, :gender (can be nil), :category_group, :base_time
      :relay_header => [
        nil,
        [
          TokenExtractor.new(
            :type,
            /(mistaff|staff).*\s+\d{1,2}x\d{2,3}\s+(stile|mi|sl|mx)/i,
            /\s+-\s+cat/ui
          ),
          TokenExtractor.new(
            :distance,
            /\dx\d{2,3}\s+(stile|mi|sl|mx)/ui,
            4
          ),
          TokenExtractor.new(
            :style,
            /(?<=\d\s)\s*(stile|mi|sl|mx)/ui,
            /\s+(-\s+cat|masch|femm)/ui
          ),
          TokenExtractor.new(
            :gender,
            /\s+(maschi|femmi)/ui,
            /\s+-\s+categoria/ui
          ),
          TokenExtractor.new(
            :category_group,
            /M\d\d0\-\d\d\d/ui,
            7
  #          /\s*tempo base\s*/ui
          ),
          TokenExtractor.new(
            :base_time,
            /\s\d{1,2}'\d\d"\d\d/ui,
            9
          )
        ],
        nil
      ],

      # -- Fields to be extracted: (nothing, 2 lines in cache)
      :team_ranking => [
        nil, nil
      ],
  
      :result_row => [                                # 1 condition => 1 cached row
        [                                             # => the tokenizer list must have 1 element (which is 1 array of 2-item arrays)
          TokenExtractor.new(
            :result_position,
            / \d{1,3}(?= {1,3})/ui,
            / (?=[a-z]+)/ui
          ),
          TokenExtractor.new(
            :team_code,
            /(\w\w\w-\d{6})/ui,
            10
          ),
          TokenExtractor.new(
            :swimmer_name,
            /(?<=[\sa-z0-9-]{10}|[\sa-z0-9-]{18})\s(\D{25})/ui,
            29
          ),
          TokenExtractor.new(
            :swimmer_year,
            /\b\d{4} +(?=\D+)/ui,
            4
          ),
          TokenExtractor.new(
            :team_name,
            # [Steve, 20130809] Regexp is too slow!! (And doesn't work for team names with numbers in it.) Using Fixnum absolute index instead:
  #          /([a-zA-ZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝß]+[\ |\-|\.|\`|\']{1,3})+ {3,}(Ritirat|Squalif|\d{1,2}'\d\d"\d\d)/u,
            48,
            26
          ),
          TokenExtractor.new(
            :result_time,
  #          /(Ritirat|Squalif|\d{1,2}'\d\d"\d\d) +\d{1,4}[\,|\.]\d\d$/i,
            / (Ritir.*|Squal.*|\d{1,2}'\d\d"\d\d)/ui,
            8
          ),
          TokenExtractor.new(
            :result_score,
            /\b\d{1,4}[\,|\.]\d\d$/ui,
            7
          )
        ]
      ],

      # -- Fields to be extracted: :result_position, :team_name, :result_time, :result_score
      :relay_row => [
        [                                             # => the tokenizer list must have 1 element (which is 1 array of 2-item arrays)
          TokenExtractor.new(
            :result_position,
  #          / \d{1,3}(?= {1,3})/ui,
  #          / (?=[a-z]+)/ui
            8,
            12
          ),
          TokenExtractor.new(
            :team_name,
            24,
            25
          ),
          TokenExtractor.new(
            :result_time,
  #          / (Ritirat|Squalif|\d{1,2}'\d\d"\d\d)/ui,
            59,
            8
          ),
          TokenExtractor.new(
            :result_score,
  #          /\b\d{1,4}[\,|\.]\d\d$/ui,
            68,
            7
          )
        ]
      ],

      # -- Fields to be extracted: :result_position, :team_code, :team_name, :result_score
      :ranking_row => [
        [
          TokenExtractor.new(
            :result_position,
            8,
            /(?<=\d)\s+\S+/ui
          ),
          TokenExtractor.new(
            :team_code,
            /\w\w\w-\d{6}/ui,
            10
          ),
          TokenExtractor.new(
            :team_name,
            /(?<=\w{3}-\d{6})\s{2}\w+|(?<=\d\s{6})\w+/ui,
            /\s\d{1,6}[\,|\.]\d\d$/ui
          ),
          TokenExtractor.new(
            :result_score,
            /\s\d{1,6}[\,|\.]\d\d$/ui,
            /$/ui
          )
        ]
      ]
    }

    # == String tokenizer field names Hash - an Hash of field names enlisted in arrays, one for each
    # possible row type symbol defined for @tokenizer_types.
    #
    # Note that each field name is supposed to be unique among all the arrays belonging to the same
    # tokenizer type; otherwise, when not null, the last value found will overwrite any
    # other existing key having the same symbol.
    #
    @tokenizer_fields = {
      :meeting_header => [                           # 3 row-type conditions => 3 cached rows => the tokenizer list must have 3 elements
        [ :title, :meeting_dates ],
        [ :organization, :title ],
        [ :meeting_dates, :organization ]
      ],
      :category_header => [                           # 3 row-type conditions => 3 cached rows => the tokenizer list must have 3 elements
        nil,
        [ :distance, :style, :gender, :category_group, :base_time ],
        nil
      ],
      :relay_header => [
        nil,
        [ :type, :distance, :style, :gender, :category_group, :base_time ],
        nil
      ],

      :result_row => [                                # 1 condition => 1 cached row => the tokenizer list must have 1 element (which is 1 array)
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
      :relay_row => [
        [ :result_position, :team_name, :result_time, :result_score ]
      ],
  
      :team_ranking => [                              # 2 row-type conditions => 2 cached rows => the tokenizer list must have 2 elements
        nil,
        nil
      ],
      :ranking_row => [
        [ :result_position, :team_code, :team_name, :result_score ]
      ]
    }

    # == Context Group Keys Hash - this Hash contains as each item value the array of all
    # the key field for a specific context symbol.
    # The field names must be taken from @tokenizer_fields and these will be concatenated
    # together to form the unique key representing a single context data page on the result hash.
    #
    # If no key is defined for a specific context symbol, each entry will be treated as unique
    # and added to the result array of data pages.
    #
    @context_keys = {
      :meeting_header =>  [:title],
      :category_header => [:distance, :style, :gender, :category_group],
      :relay_header =>    [:type, :category_group]    # (type includes also the gender token)
    }
  end
  # ---------------------------------------------------------------------------


  # Returns the Array of all defined context types key syms.
  # 
  def get_context_keys()
    return @context_types.keys
  end


  # Returns the Array of all the *required* (that is, guaranteed to be
  # created) output field keys for a specified context symbol.
  # Returns an empty array if the +context_sym+ is not found.
  # 
  def get_required_field_keys( context_sym )
    return @context_keys[ context_sym ] ? @context_keys[ context_sym ] : []
  end


  # Returns the Array of _possible_ field symbols used to populate the value item Hash
  # (indexed by the key :fields) of the returned parse_result[context_sym].
  #
  # Please note that not all returned fields in the Array may be present or used in
  # any returned row. (Empty or blank fields are stripped out and then compacted
  # from the resulting array of values.)
  # 
  def get_field_list_for( context_sym )
    return [] if @tokenizer_fields[ context_sym ].nil?
    @tokenizer_fields[ context_sym ].flatten.compact.uniq
  end
  # ---------------------------------------------------------------------------


  # Returns the ContextDetector instance associated with the context symbol specified.
  # 
  def get_detector_for( context_sym )
    return {} if @context_types[ context_sym ].nil?
    @context_types[ context_sym ]
  end


  # Returns an Hash of field name symbols as keys with their corresponding
  # @tokenizer_types instances as values. ( {<field_name_sym> => <corresponding_tokenizer_instance>, ...} )
  # 
  def get_tokenizers_for( context_sym )
    return {} if @tokenizer_fields[ context_sym ].nil? || @tokenizer_types[ context_sym ].nil?
    keys = @tokenizer_fields[ context_sym ].flatten.compact
    values = @tokenizer_types[ context_sym ].flatten.compact
    result_hash = {}
    keys.each_with_index{ |k, i|
      result_hash[ k ] = values[i]
    }
    result_hash 
  end
  # ---------------------------------------------------------------------------
end
