# encoding: utf-8

require 'fileutils'
require 'common/format'
require 'parsers/token_extractor'
require 'parsers/fin_result_parser_tools'
                                                    # The following applies only to Ruby <= 1.9.2   
require 'iconv' unless String.method_defined?( :encode )



# == FinResultParser
#
# Dedicated parser for FIN Results.
# FIN Results are swimming meeting result text files, written mostly in UTF-8 italian
# locale (since F.I.N. is the Italian Swimming Federation).
#
# All the RegExp used by this Parser class assume the file to be processed is compliant
# with the format used in these kind of files. 
#
class FinResultParser

  # Set this to true or false to enable or disable debugging output, L1.
  #
  DEBUG_VERBOSE                                     = true

  # Set this to true or false to enable or disable debugging output, L2.
  #
  DEBUG_VERY_VERBOSE                                = false

  # Set this to true or false to enable or disable debugging output, L3.
  #
  DEBUG_EXTRA_VERBOSE                               = false


  # [Steve, 20130703] Here are reported some of the samples with which the following RegExp were
  # tested.
  #
  #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> MEETING HEADER TYPE SAMPLE #1:
  #                               10° Trofeo Città di Ravenna Master                              
  #                    Manifestazione organizzata da Rinascita Team Romagna asd                   
  #                                  Ravenna - 14/15 Gennaio 2012
  #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> MEETING HEADER TYPE SAMPLE #2:
  #11 novembre 2012  
  #10° Trofeo De Akker Team ASI
  #Manifestazione organizzata da De Akker
  #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CATEGORY HEADER + DETAIL SAMPLES TYPE #1:
  #
  #        100 misti  maschile   -  Categoria  Master 40             Tempo Base   :  0'59"22
  #----------------------------------------------------------------------------------------------
  #       1   YYYYYYYYYY  RAFFAELE           1972   NUOTOPIÙ ACADEMY AS         1'00"82  973,69
  #       2   YYYYYY  ALESSANDRO             1969   LEAENA SSD                  1'05"52  903,85
  #       3   YYYYYY  MASSIMO                1973   NUOTOPIÙ ACADEMY AS         1'06"58  889,46
  #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CATEGORY HEADER + DETAIL SAMPLES TYPE #2:
  #
  #        50 dorso  femminile  -  Categoria  Master 40              Tempo Base   :  0'32"01
  #----------------------------------------------------------------------------------------------
  #  1 EMI-123456 1972 ZZZZZZZ  ELISA                NUOTATORI RAVENNATI         0'41"37  773,75
  #  2 EMI-123456 1971 ZZZZZZ  VERONICA              NUOTO CLUB 2000             0'42"00  762,14
  #  3 EMI-123456 1971 ZZZZZZ  BARBARA               CSI NUOTO OBER FERR         0'43"46  736,54
  #  4 EMI-123456 1972 ZZZZZZZ  RAFFAELLA            ESTENSE NUOTO CSI           0'44"19  724,37
  #>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> SAMPLES END.


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
    :meeting_header => [
      /\s*(\d{1,3}\D{1,2}\s\S+|Trof|Region)|\d\d((\/|-|\,)\d\d)?\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4}/ui,
      /\s*Manifestazione organizzata da|\s*(\d{1,3}\D{1,2}\s\S+|Trof|Region)/ui,
      /\d\d((\/|-|\,)\d\d)?\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4}|\s*Manifestazione organizzata da/ui
    ],

    :category_header => [
      '',
      /(?<!\dx)(50 |100 |200 |400 |800 |1500 ) *(stile|misti|dorso|rana|farf|SL|DO|RA|FA|MI|MX|DF|DS|RN).*(maschi|femmi)/i,
      /^--------------------------/
    ],
    :relay_header => [
      '',
      /(mistaff|staff).*\s+\d{1,2}x\d{2,3}\s+(stile|mi|sl|mx).*\s+-\s+cat/i,
      /^--------------------------/
    ],
    :team_ranking => [
      /classifica(\s+di)?(\s+societ)?/ui,
      ''
    ],
                                                    # DETAIL CONTEXT(s) def. arrays:
    :result_row => [
      /(Ritir.*|Squal.*|\d{1,2}'\d\d"\d\d) +\d{1,4}[\,|\.]\d\d$/i
    ],
    :relay_row => [
      /(Ritir.*|Squal.*|\d{1,2}'\d\d"\d\d) +\d{1,4}[\,|\.]\d\d$/i
    ],
    :ranking_row => [
      /\s+\d{1,6}[\,|\.]\d\d$/ui
    ]
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
          /\s*(\d{1,3}\D{1,2}\s\S+|Trof|Region)/ui,
          /$/ui
        ),
        TokenExtractor.new(
          :meeting_dates,
          /\d\d((\/|-|\,)\d\d)?\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4}/ui,
          /$/ui
        )
      ],
      # -- Fields to be extracted: :organization OR :title
      [
        TokenExtractor.new(
          :organization,
          /(?<=manifestazione organizzata da)\s/ui,
          /$/ui
        ),
        TokenExtractor.new(
          :title,
          /\s*(\d{1,3}\D{1,2}\s\S+|Trof|Region)/ui,
          /$/ui
        )
      ],
      # -- Fields to be extracted: :meeting_dates OR :organization
      [
        TokenExtractor.new(
          :meeting_dates,
          /\d\d((\/|-|\,)\d\d)?\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4}/ui,
          /$/ui
        ),
        TokenExtractor.new(
          :organization,
          /(?<=manifestazione organizzata da)\s/ui,
          /$/ui
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

    # -- Fields to be extracted: :type, :distance, :style, :category_group, :base_time
    :relay_header => [
      nil,
      [
        TokenExtractor.new(
          :type,
          /(mistaff|staff).*\s+\d{1,2}x\d{2,3}\s+(stile|mi|sl|mx).*\s+-\s+cat/i,
          /\s+-\s+cat/ui
        ),
        TokenExtractor.new(
          :distance,
          /\dx\d{2,3}\s+(stile|mi|sl|mx)/ui,
          4
        ),
        TokenExtractor.new(
          :style,
          /(?<=\d\s)\s*(stile|mi|sl|mx).*/ui,
          /\s-\s/ui
        ),
        TokenExtractor.new(
          :category_group,
          /\s*(M\d\d0\-\d\d\d)*/ui,
          /tempo base\s*/ui
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
      [ :type, :distance, :style, :category_group, :base_time ],
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
    :relay_header =>    [:type, :category_group]
  }


  # == Context Group Hash - this Hash links in hierarchical order the context "pages" among themselves.
  # Each context symbol enlisted here as a key will be dependant (thus, literally "grouped by") its
  # value symbol.
  # (That is, for each "value symbol" change, a new page of the "key symbol" will be added.)
  #
  @context_groups = {
    :result_row  => :category_header,
    :relay_row   => :relay_header,
    :ranking_row => :team_ranking
  }


  # Read and parse a single txt file into a complex Hash structure in memory.
  # Returned data storage is divided into each "context" page found, whose format
  # is specified by @context_types, @tokenizer_types, @tokenizer_fields, @context_keys
  # and @context_groups.
  #
  # === Returns:
  #
  # An Hash having the structure:
  #
  #     {
  #       :parse_result => {
  #         :category_header => [
  #           {
  #             :id => <category_header_id>, :fields => <hash_of_category_header_fields_with_values>,
  #             :import_text => last_line_of_text_used_to_extract_all_fields
  #           }
  #           ... (one Hash for each single <category_header_id>)
  #         ]
  #         :result_row      => [
  #           {
  #             :id => <category_header_id>, :fields => <hash_of_result_row_fields_with_values>,
  #             :import_text => last_line_of_text_used_to_extract_all_fields
  #           }
  #           ... (at least, one Hash for each single <category_header_id>, which acts as a "context page index")
  #         ]
  #       },
  #       :line_count               => tot_file_lines_read,
  #       :total_data_rows          => sum_of_data_pages_sizes,
  #       :full_text_file_contents  => full_text_file_contents
  #     }
  #
  #
  # ...Where:
  #
  # - <category_header_id>
  #   is a composed string-concatenation key obtained from the current values of
  #   distance + style + gender [+ category_group] (this last one, only when found).
  #
  # - <hash_of_category_header_fields_with_values>
  #   has the same keys as the @context_keys[:category_header] Array
  #   (Note that the *last* field may/may not be included for certain categories),
  #   with a new composed Hash element ({:id => computed_id, :fields => field_value_hash}) added for each
  #   possible value found of the above fields. 
  #
  # - <hash_of_result_row_fields_with_values>
  #   has the same keys as the flattened array @tokenizer_fields[:result_row]
  #   (Note that the *first* field may/may not be included for certain categories),
  #   with a new composed Hash element ({:id => computed_id, :fields => field_value_hash}) added for each
  #   possible value found of the above fields. 
  #
  def self.parse_txt_file( full_pathname, show_progress = DEBUG_VERBOSE, logger = nil )
    logger.info( "\r\n-- FinResultParser::parse_txt_file(#{full_pathname}):" ) if logger
                                                    # Pre-check format type definition:
    raise "Malformed parser Hash!" unless (@context_types.size == @tokenizer_types.size) && (@tokenizer_types.size == @tokenizer_fields.size)
    @context_types.each { |key, array_val|
      raise "Missing parser Hash key '#{key}'!" unless ( @tokenizer_types.has_key?(key) && @tokenizer_fields.has_key?(key) )
      raise "Parser Hash element '#{key}' points to a wrong-sized array!" unless (array_val.size == @tokenizer_types[key].size) && (array_val.size == @tokenizer_fields[key].size)
    }
                                                    # Store the basename of the file, just for reference
    source_file_name = File.basename( full_pathname )
    line_count = 0                                  # File lines
    tot_rows = 0                                    # Total data rows extracted
    previous_key = {}                               # Previously unique key Hash, one for each parsed context
    previous_parent_context = nil
    condition_ok = true
    index_to_check = 0
    previous_rows = {}
    parse_result = {}
    full_text_file_contents = ""

                                                    # Scan each line of the file until gets reaches EOF:
    File.open( full_pathname ) do |f|
      f.each_line { |curr_line|                     # Handle invalid char sequences using forced encoding:
        logger.debug( "Reading line #{line_count}...: <<#{curr_line}>>" ) if (logger && DEBUG_VERBOSE)
        if String.method_defined?( :encode )
          if curr_line.force_encoding("ISO-8859-1").valid_encoding?
            curr_line = curr_line.force_encoding("ISO-8859-1").encode("UTF-8", {:invalid => :replace, :undef => :replace, :replace => '', }).rstrip
          elsif curr_line.force_encoding("UTF-16").valid_encoding?
            curr_line = curr_line.force_encoding("UTF-16").encode("UTF-8", {:invalid => :replace, :undef => :replace, :replace => '', }).rstrip
          end
        else
          ic = Iconv.new('UTF-8', 'UTF-8//IGNORE')
          curr_line = ic.iconv(curr_line)
        end
        full_text_file_contents << curr_line
                                                    # For each context type defined...
        @context_types.each { |context_sym, condition_array|
          if DEBUG_EXTRA_VERBOSE
            logger ? logger.debug( "Checking context #{context_sym}..." ) : puts( "Checking context #{context_sym}..." )
          end
                                                    # Init parse result data pages if necessary:
          parse_result[ context_sym ] = [] if parse_result[ context_sym ].nil?
                                                    # Do we have any condition list to check for?
          if ( condition_array.kind_of?( Array ) && condition_array.size > 0 )
                                                    # Retrieve index for the condition of the current context
            index_to_check = ( previous_rows[ context_sym ].nil? ? 0 : previous_rows[ context_sym ].size )
            raise "Malformed array of conditions in parse_txt_file!" if ( index_to_check >= condition_array.size )
                                                    # Retrieve condition to check:
            condition_to_check = condition_array[ index_to_check ]
            if DEBUG_EXTRA_VERBOSE
              logger ? logger.debug("Curr line: <#{curr_line}>") : puts("Curr line: <#{curr_line}>")
            end
                                                    # Check if condition applies:
            if ( condition_to_check.kind_of?( String ) )
              if DEBUG_EXTRA_VERBOSE
                logger ? logger.debug("Checking with String condition <#{condition_to_check.inspect}>...") : puts("Checking with String condition <#{condition_to_check.inspect}>...")
              end
              condition_ok = ( curr_line == condition_to_check )
            elsif ( condition_to_check.kind_of?( Regexp ) )
              if DEBUG_EXTRA_VERBOSE
                logger ? logger.debug("Checking with Regexp condition <#{condition_to_check.inspect}>...") : puts("Checking with Regexp condition <#{condition_to_check.inspect}>...")
              end
              condition_ok = !( curr_line =~ condition_to_check ).nil?
            end
                                                    # Condition satisfied => Store current line in cache:
            if ( condition_ok )
              if DEBUG_VERY_VERBOSE
                logger ? logger.debug( "Condition OK for '#{context_sym}>'." ) : puts( "Condition OK for '#{context_sym}>'." )
              end
              if ( previous_rows[ context_sym ].nil? )
                previous_rows[ context_sym ] = [ curr_line ]
              else
                previous_rows[ context_sym ] << curr_line
              end
              if DEBUG_VERY_VERBOSE
                logger ?  logger.debug( "previous_rows[#{context_sym}].size=#{previous_rows[ context_sym ].size} VS #{condition_array.size}." ) :
                          puts( "previous_rows[#{context_sym}].size=#{previous_rows[ context_sym ].size} VS #{condition_array.size}." )
              end
                                                    # Have we reached the end of the condition list? => TOKENIZE context cache! 
              if ( previous_rows[ context_sym ].size == condition_array.size )
                logger.debug( "=> Context switched to '#{context_sym}'. Token extraction in progress..." ) if (logger && DEBUG_VERBOSE)
                token_hash = tokenize_context_cache( context_sym, previous_rows[ context_sym ], logger )
                                                    # Current context does NOT depend on another? ("L0" parse result)
                if @context_groups[ context_sym ].nil?
                  previous_parent_context = context_sym
                                                    # There must be a unique key defined for this context
                  if @context_keys[ context_sym ].nil?
                    key_string = line_count + 1     # nil key definition arrays happens only when in context with no usable fields to be extracted! (As in :team_ranking)
                    if logger
                      if DEBUG_VERBOSE
                        logger.warn( "---WARNING: missing unique key definition for context '#{context_sym}'!" )
                        logger.warn( "            Using current line count (#{line_count+1}) as unique ID." )
                      end
                    else
                      if DEBUG_VERBOSE
                        puts( "---WARNING: missing unique key definition for context '#{context_sym}'!" )
                        puts( "            Using current line count (#{key_string}) as unique ID." )
                      end
                    end
                  else                              # Extract unique key and store new current context page
                    key_string = compose_memstorage_key( context_sym, token_hash, logger )
                  end
                  if show_progress
                    logger ? logger.debug("   Adding new context '#{context_sym}', key_string='#{key_string}'.") : puts("   Adding new context '#{context_sym}', key_string='#{key_string}'.")
                  end
                  parse_result[ context_sym ] << { :id => key_string, :fields => token_hash, :import_text => previous_rows[context_sym].join("\r\n") }
                  tot_rows += 1                     # Increase data rows stat only when actually adding any data
                                                    # Store new unique key in previous_key hash linked by current context (which may be a new parent context for other sub-pages)
                  previous_key[ context_sym ] = key_string
                                                    # Current context depends on another? ("L1" parse result)
                else
                  parent_context = @context_groups[ context_sym ]
                                                    # No change in parent context?
                  if ( parent_context == previous_parent_context )
                                                    # There must be already a unique key stored for the other (parent) context
                    if previous_key[ parent_context ].nil?
                      if logger
                        logger.warn("---WARNING: missing unique key for parent context '#{parent_context}' (parent of '#{context_sym}').")
                        logger.warn("            Cannot add '#{context_sym}' data page.")
                      else
                        puts("---WARNING: missing unique key for parent context '#{parent_context}' (parent of '#{context_sym}').")
                        puts("            Cannot add '#{context_sym}' data page.")
                      end
                    else                              # Retrieve pre-stored unique key of parent context and store new current context page
                      if DEBUG_VERBOSE
                        logger ? logger.debug("   Found (parent) key_string='#{previous_key[ parent_context ]}'.") : puts("   Found (parent) key_string='#{previous_key[ parent_context ]}'.")
                      end
                      if show_progress
                        logger ? logger.debug("   Adding new context '#{context_sym}', key_string='#{previous_key[ parent_context ]}'.") : puts("   Adding new context '#{context_sym}', key_string='#{previous_key[ parent_context ]}'")
                      end
                      parse_result[ context_sym ] << { :id => previous_key[ parent_context ], :fields => token_hash, :import_text => curr_line }
                      tot_rows += 1                   # Increase data rows stat only when actually adding any data
                    end

                    # ELSE: parent context changed or different? => quietly skip the storing!

                    # [Steve, 20130918]
                    # Note that, as of this version, this happens for all result_rows since both the
                    # contexts :result_row and :relay_row have the same defining RegExp. Since the loop
                    # checks each single defined context for possible multiple context assignment
                    # (it doesn't stop after the first successfull reckognition and works in a FIFO way,
                    # allowing the possibility to have a single text line that spawns multiple contexts
                    # of data), the grouping/dependancy defined with @context_groups is the only correct
                    # method to uniquely identify two context with the same RegExp.
                  end
                end

                previous_rows[ context_sym ] = []   # Clear the cache afterwards
                if DEBUG_VERY_VERBOSE && parse_result[ context_sym ].last
                  logger ? logger.debug("   Parse_result fields = #{parse_result[ context_sym ].last[:fields].inspect}") : puts("   Parse_result fields = #{parse_result[ context_sym ].last[:fields].inspect}\r\n")
                end
              end
                                                    # Condition not satisfied => Clear context cache:
            else
                previous_rows[ context_sym ] = []
            end
          end
        }

        line_count += 1
      }
    end                                             # (automatically closes the file)

    if logger
      logger.info( "\r\n---------------------------------------------\r\n------------------ STATS: -------------------\r\n---------------------------------------------\r\n\r\nFile '#{source_file_name}':" )
    else
      puts( "\r\n---------------------------------------------\r\n------------------ STATS: -------------------\r\n---------------------------------------------\r\n\r\nFile '#{source_file_name}':" )
    end
    tot_data_rows = 0                               # Count total data rows, just for "fun stats"
    parse_result.each { |context_sym, data_page_array|
      if logger
        logger.info( "Total '#{context_sym}' data pages : #{data_page_array.size} / #{tot_rows} lines found" )
      else
        puts( "Total '#{context_sym}' data pages : #{data_page_array.size} / #{tot_rows} lines found" )
      end
      tot_data_rows += data_page_array.size         # (ASSERT: it should be that tot_data_rows == tot_rows)
    }
    if logger
      logger.info( "\r\nTotal read lines ....... : #{line_count} (including garbage)" )
      logger.info( "Protocol efficiency .... : #{(( tot_rows.to_f)/line_count.to_f * 10000.0).round / 100.0} %" )
      logger.info( "File done.\r\n---------------------------------------------\r\n\r\n\r\n" )
    else
      puts( "Total read lines ....... : #{line_count} (including garbage)" )
      puts( "Protocol efficiency .... : #{(( tot_rows.to_f)/line_count.to_f * 10000.0).round / 100.0} %" )
      puts( "File done.\r\n---------------------------------------------\r\n\r\n\r\n" )
    end 

    {
      :parse_result             => parse_result,
      :line_count               => line_count,
      :total_data_rows          => tot_data_rows,
      :full_text_file_contents  => full_text_file_contents
    }
  end
  # ---------------------------------------------------------------------------


  # Returns the Array of all defined context types key syms.
  # 
  def self.get_context_keys()
    return @context_types.keys
  end


  # Returns the Array of all the *required* (that is, guaranteed to be
  # created) output field keys for a specified context symbol.
  # Returns an empty array if the +context_sym+ is not found.
  # 
  def self.get_required_field_keys( context_sym )
    return @context_keys[ context_sym ] ? @context_keys[ context_sym ] : []
  end


  # Returns the Array of _possible_ field symbols used to populate the value item Hash
  # (indexed by the key :fields) of the returned parse_result[context_sym].
  #
  # Please note that not all returned fields in the Array may be present or used in
  # any returned row. (Empty or blank fields are stripped out and then compacted
  # from the resulting array of values.)
  # 
  def self.get_field_list_for( context_sym )
    return [] if @tokenizer_fields[ context_sym ].nil?
    @tokenizer_fields[ context_sym ].flatten.compact.uniq
  end
  # ---------------------------------------------------------------------------


  # Returns an Hash of field name symbols as keys with their corresponding
  # @tokenizer_types instances as values. ( {<field_name_sym> => <corresponding_tokenizer_instance>, ...} )
  # 
  def self.get_tokenizers_for( context_sym )
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


  private


  # Returns a unique string ID for the context_sym and token_hash specified
  # 
  def self.compose_memstorage_key( context_sym, token_hash, logger = nil )
    return nil if @context_keys[ context_sym ].nil?
    all_keys_list  = @context_keys[ context_sym ].flatten.compact
    logger.debug( "\r\n*** all_keys_list= #{all_keys_list.inspect}" ) if (logger && DEBUG_VERBOSE)
    logger.debug( "** token_hash= #{token_hash.inspect}" ) if (logger && DEBUG_VERBOSE)
    ( token_hash.reject{ |key, val| !all_keys_list.include?(key) } ).values.join
  end


  # Tokenize a group of cached lines, reckognized as belonging to a specific "context",
  # defined by the conditions specified inside the dedicated structures.
  #
  # === Returns
  # An Hash composed of all the tokens extracted for each passed cached row, all
  # merged into a single container. Duplicate field names will be overwritten as new
  # hash keys (L.I.F.O.). (That is, if 2 different cached rows have same-named fields
  # for token extraction, only the last extracted field with the same name will survive
  # the flatten+merge operation.)
  #
  def self.tokenize_context_cache( context_sym, row_cache_array, logger = nil )
    tokenizer_context_list = @tokenizer_types[ context_sym ]
    raise "Tokenizer context list not found for context '#{context_sym}'!" unless tokenizer_context_list.kind_of?(Array)
    token_list = []
    prev_token_start = nil                          # Clear previous token starting index before the loop
                                                    # For each cached row:
    row_cache_array.each_with_index { |row, row_idx|
                                                    # Retrieve the list of tokenizers for the current row:
      tokenizer_row_list = tokenizer_context_list[ row_idx ]
      row_to_be_parsed   = row_cache_array[ row_idx ]
      token_start = nil                             # Clear token starting index before processing the whole row
      token_field = nil
      prev_token_field = nil
                                                    # The tokenizer row-list may or may not be defined: we must check it
      if ( tokenizer_row_list.kind_of?(Array) && tokenizer_row_list.size > 0 )
        token_list << {}                            # Add a new row item to the resulting token list of rows
                                                    # For each tokenizer row list...
        tokenizer_row_list.each_with_index { |token_extractor, tok_idx|
          token_field = @tokenizer_fields[ context_sym ][row_idx][tok_idx]
# DEBUG
          logger.debug( "-- Processing token '#{token_field}' using #{token_extractor}..." ) if (logger && DEBUG_VERY_VERBOSE)
          puts( "-- Processing token '#{token_field}' using #{token_extractor}..." ) if (DEBUG_VERBOSE)
          token = token_extractor.tokenize( row_to_be_parsed )
# DEBUG
          logger.debug( "   Extracted '#{token}'." ) if (logger && DEBUG_VERBOSE)
          puts( "   Extracted '#{token}'." ) if (DEBUG_VERBOSE)
          token_extractor.clear()                   # Add to the token list only if it contains anything
          token_list.last[ token_field ] = token if token && token.length > 0
        }
      end
    }

    result_token_hash = {}
    token_list.flatten.each{|sub_hash| result_token_hash.merge!(sub_hash) }
    logger.debug( "-- Returning token list: #{result_token_hash.inspect}" ) if (logger && DEBUG_VERBOSE)
    result_token_hash
  end
  # ---------------------------------------------------------------------------

end
# -----------------------------------------------------------------------------
