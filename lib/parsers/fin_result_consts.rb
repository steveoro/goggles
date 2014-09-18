# encoding: utf-8

require 'parsers/context_type_def'
require 'parsers/token_extractor'


=begin

= FinResultConsts

  - Goggles framework vers.:  4.00.503
  - author: Steve A.

 Value object/Container module that stores all the common constant definitions
 included by the parsing classes for processing text data files of the type
 'fin_result' (either layout 'FIN' or 'FIN2').

 Each constant defines several RegExp that relay directly to this specific kind
 of text file and will be most certainly useless for other layouts.

=end
module FinResultConsts                              # == HEADER CONTEXT TYPES definitions: ==

  # "Meeting Header" context type definition.
  CNT_TYPE_MEETING_HEADER = ContextTypeDef.new(
    :meeting_header,
    [
      /(\s*(Distanze speciali|((\d{1,3}\D{1,2}|[IXVMCDL]{1,8})\s(\S+|Trof|Region))))|(\d{1,2}((\/|-|\,)\d{1,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})/ui,
      /(\s*Manifestazione organizzata da)|(\s*(Distanze speciali|((\d{1,3}\D{1,2}|[IXVMCDL]{1,8})\s(\S+|Trof|Region))))/ui,
      /(\d{1,2}((\/|-|\,)\d{1,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})|(\s*Manifestazione organizzata da)|/ui
    ],
    nil,                                            # parent context
    4                                               # line_timeout (line after which these checks will be skipped)
  )

  # "Category Header" context type definition.
  CNT_TYPE_CATEGORY_HEADER = ContextTypeDef.new(
    :category_header,
    [
      /^\s*(\r\n|\n|$)/ui,  # matches any kind of newline, an empty line or a line with only invisible chars
      /(?<!\dx)(50\s|100\s|200\s|400\s|800\s|1500\s) *(stile|misti|dorso|rana|farf|SL|DO|RA|FA|MI|MX|DF|DS|RN).*(maschi|femmi)/i,
      /^-{25}/
    ]
  )

  # "Relay Header" context type definition.
  CNT_TYPE_RELAY_HEADER = ContextTypeDef.new(
    :relay_header,
    [
      /^\s*(\r\n|\n|$)/ui,
      /(mistaff|staff).*\s+\d{1,2}x\d{2,3}\s+(stile|mi|sl|mx).*\s+-\s+cat/i,
      /^-{25}/
    ]
  )

  # "Team Ranking" (header) context type definition.
  CNT_TYPE_TEAM_RANKING = ContextTypeDef.new(
    :team_ranking,
    [
      /classifica(\s+di)?(\s+societ)?/ui,
      /^\s*(\r\n|\n|$)/ui
    ]
  )

  # "Statistics" (header) context type definition.
  CNT_TYPE_STATS = ContextTypeDef.new(
    :stats,
    [
      /^\s*(\r\n|\n|$)/ui,
      /statistiche/ui,
      /^\s*(\r\n|\n|$)/ui
    ]
  )                                                 # == DETAIL CONTEXT TYPES definitions: ==

  # "Result row" (detail) context type definition.
  CNT_TYPE_RESULT_ROW = ContextTypeDef.new(
    :result_row,
    [
      /(Ritir.*|Squal.*|\d{1,2}'\d\d"\d\d) +\d{1,4}[\,|\.]\d\d$/i
    ],
    :category_header                                # parent context
  )

  # "Ralay row" (detail) context type definition.
  CNT_TYPE_RELAY_ROW = ContextTypeDef.new(
    :relay_row,
    [
      /Ritir.*|Squal.*|(\d{1,2}'\d\d"\d\d +\d{1,4}[\,|\.]\d\d)$/i
    ],
    :relay_header
  )

  # "Ranking" (detail) context type definition.
  CNT_TYPE_RANKING_ROW = ContextTypeDef.new(
    :ranking_row,
    [
      /\s+\d{1,6}[\,|\.]\d\d$/ui
    ],
    :team_ranking
  )

  # "Statistics / Teams in total" (detail) context type definition.
  CNT_TYPE_STATS_TEAMS_TOT = ContextTypeDef.new(
    :stats_teams_tot,
    [ /Numero di soc.+\siscritte\s/ui ],
    :stats
  )

  # "Statistics / Teams presence" (detail) context type definition.
  CNT_TYPE_STATS_TEAMS_PRESENCE = ContextTypeDef.new(
    :stats_teams_presence,
    [ /Numero di soc.+\spartecipanti\s/ui ],
    :stats
  )

  # "Statistics / Swimmers in tot." (detail) context type definition.
  CNT_TYPE_STATS_SWIMMER_TOT = ContextTypeDef.new(
    :stats_swimmer_tot,
    [ /Numero totale di atleti iscritti\s/ui ],
    :stats
  )

  # "Statistics / Swimmers presence" (detail) context type definition.
  CNT_TYPE_STATS_SWIMMER_PRESENCE = ContextTypeDef.new(
    :stats_swimmer_presence,
    [ /Numero di atleti partecipanti\s/ui ],
    :stats
  )
  # ----------------------------------------------------------------------------
  #++

  # Commodity array of all the ContextTypeDefs constants defined.
  ALL_CONTEXT_TYPE_DEFS = [
    CNT_TYPE_MEETING_HEADER,
    CNT_TYPE_CATEGORY_HEADER,
    CNT_TYPE_RELAY_HEADER,
    CNT_TYPE_TEAM_RANKING,
    CNT_TYPE_STATS,
    CNT_TYPE_RESULT_ROW,
    CNT_TYPE_RELAY_ROW,
    CNT_TYPE_RANKING_ROW,
    CNT_TYPE_STATS_TEAMS_TOT,
    CNT_TYPE_STATS_TEAMS_PRESENCE,
    CNT_TYPE_STATS_SWIMMER_TOT,
    CNT_TYPE_STATS_SWIMMER_PRESENCE
  ]
  # ----------------------------------------------------------------------------
  #++


  # "meeting_header.title" token extractor definition
  TOK_EXT_MEETING_HEADER_TITLE = TokenExtractor.new(
    :title,
    /\s*(Distanze speciali|((\d{1,3}\D{1,2}|\s*[IXV]{1,8})\s(\w+|Trof)|Trofeo|Regionali|Campionati))/ui,
    # Alt. version: (define another constant if this turns out to be more efficient of the one above)
    # /\s*(Distanze speciali|((\d{1,3}\D{1,2}|\s*[IXV]{1,8})\s(\S+|Trof)|Regionali|Campionati))/ui,
    /$/ui,
    3                                               # line_timeout
  )

  # "meeting_header.meeting_dates" token extractor definition
  TOK_EXT_MEETING_HEADER_MEETING_DATES = TokenExtractor.new(
    :meeting_dates,
#    /\d{1,2}((\/|-|\,)\d{1,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4}/ui,
    /\d{0,2}((\/|-|\,)\d{0,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4}/ui,
    /\z/ui,
    3                                               # line_timeout
  )

  # "meeting_header.organization" token extractor definition
  TOK_EXT_MEETING_HEADER_ORGANIZATION = TokenExtractor.new(
    :organization,
    /(?<=manifestazione organizzata da )/ui,
    /\z/ui,
    3                                               # line_timeout
  )
  # ----------------------------------------------------------------------------
  #++

  # "category_header.distance" token extractor definition
  TOK_EXT_CATEGORY_HEADER_DISTANCE = TokenExtractor.new(
    :distance,
    /(?<!\dx)(50 |100 |200 |400 |800 |1500 ) */ui,
    / *(stile|mi|do|ra|fa|sl|MX|DF|DS|RN).*/ui
  )

  # "category_header.style" token extractor definition
  TOK_EXT_CATEGORY_HEADER_STYLE = TokenExtractor.new(
    :style,
    / *(stile|mi|do|ra|fa|sl|MX|DF|DS|RN).*/ui,
    / *(maschi|femmi)/ui
  )

  # "category_header.gender" token extractor definition
  TOK_EXT_CATEGORY_HEADER_GENDER = TokenExtractor.new(
    :gender,
    / *(maschi|femmi)/ui,
    # Alt. vers.: /\s+(maschi|femmi)/ui
    /\s+-\s+categoria/ui
  )

  # "category_header.category_group" token extractor definition
  TOK_EXT_CATEGORY_HEADER_CATEGORY_GROUP = TokenExtractor.new(
    :category_group,
    / *((master|under)\s\d\d|[MU]\d\d)/ui,
    / *tempo base */ui
  )

  # "category_header.base_time" token extractor definition
  TOK_EXT_CATEGORY_HEADER_BASE_TIME = TokenExtractor.new(
    :base_time,
    /\d{1,2}'\d\d"\d\d$/u,
    9                                               # (max size)
  )
  # ----------------------------------------------------------------------------
  #++

  # "relay_header.type" token extractor definition
  TOK_EXT_RELAY_HEADER_TYPE = TokenExtractor.new(
    :type,
    /(mistaff|staff).*\s+\d{1,2}x\d{2,3}\s+(stile|mi|sl|mx)/i,
    /\s+-\s+cat/ui
  )

  # "relay_header.distance" token extractor definition
  TOK_EXT_RELAY_HEADER_DISTANCE = TokenExtractor.new(
    :distance,
    /\dx\d{2,3}\s+(stile|mi|sl|mx)/ui,
    4                                               # (max size)
  )

  # "relay_header.style" token extractor definition
  TOK_EXT_RELAY_HEADER_STYLE = TokenExtractor.new(
    :style,
    /(?<=\d\s)\s*(stile|mi|sl|mx)/ui,
    /\s+(-\s+cat|masch|femm)/ui
  )

  # "relay_header.category_group" token extractor definition
  TOK_EXT_RELAY_HEADER_CATEGORY_GROUP = TokenExtractor.new(
    :category_group,
    /M\d\d0\-\d\d\d/ui,
    7                                               # (max size)
    # Alt. vers. (instead of '7'): /\s*tempo base\s*/ui
  )

  # "relay_header.base_time" token extractor definition
  TOK_EXT_RELAY_HEADER_BASE_TIME = TokenExtractor.new(
    :base_time,
    /\s\d{1,2}'\d\d"\d\d/ui,
    9                                               # (max size)
  )
  # ----------------------------------------------------------------------------
  #++

  # "result_row.result_position" token extractor definition
  TOK_EXT_RESULT_ROW_RESULT_POSITION = TokenExtractor.new(
    :result_position,
    / \d{1,3}(?= {1,3})/ui,
    / (?=[a-z]+)/ui
  )

  # "result_row.team_code" token extractor definition
  TOK_EXT_RESULT_ROW_TEAM_CODE = TokenExtractor.new(
    :team_code,
    /(\w\w\w-\d{6})/ui,
    10                                              # (max size)
  )

  # "result_row.swimmer_name" token extractor definition
  TOK_EXT_RESULT_ROW_SWIMMER_NAME = TokenExtractor.new(
    :swimmer_name,
    /(?<=[\sa-z0-9-]{10}|[\sa-z0-9-]{18})\s(\D{25})/ui,
    29                                              # (max size)
  )

  # "result_row.swimmer_year" token extractor definition
  TOK_EXT_RESULT_ROW_SWIMMER_YEAR = TokenExtractor.new(
    :swimmer_year,
    /\b\d{4} +(?=\D+)/ui,
    4                                               # (max size)
  )

  # "result_row.team_name" token extractor definition
  TOK_EXT_RESULT_ROW_TEAM_NAME = TokenExtractor.new(
    :team_name,
    # Slow vers: /([a-zA-ZÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝß]+[\ |\-|\.|\`|\']{1,3})+ {3,}(Ritirat|Squalif|\d{1,2}'\d\d"\d\d)/u,
    # [Steve, 20130809] Regexp is too slow!! (And doesn't work for team names with numbers in it.) Using Fixnum absolute index instead:
    49,                                             # (starting idx)
    26                                              # (max size)
  )

  # "result_row.result_time" token extractor definition
  TOK_EXT_RESULT_ROW_RESULT_TIME = TokenExtractor.new(
    :result_time,
    / (Ritir.*|Squal.*|\d{1,2}'\d\d"\d\d)/ui,
    # Alt. vers.: /(Ritirat|Squalif|\d{1,2}'\d\d"\d\d) +\d{1,4}[\,|\.]\d\d$/i,
    8                                               # (max size)
  )

  # "result_row.result_score" token extractor definition
  TOK_EXT_RESULT_ROW_RESULT_SCORE = TokenExtractor.new(
    :result_score,
    /\b\d{1,4}[\,|\.]\d\d$/ui,
    7                                               # (max size)
  )
  # ----------------------------------------------------------------------------
  #++

  # "relay_row.result_position" token extractor definition
  TOK_EXT_RELAY_ROW_RESULT_POSITION = TokenExtractor.new(
    :result_position,
    8,                                              # (starting idx)
    /(?<=\s{3}\d|gara|\s{18})\s+\w+/ui
#    12                                              # (max size)
  )

  # "relay_row.team_name" token extractor definition
  TOK_EXT_RELAY_ROW_TEAM_NAME = TokenExtractor.new(
    :team_name,
    /(\s{3,5}.{25}\s{8,12})(?=Ritir|Squal|\d{1,2}'\d{2}"\d{2})/ui,
    25                                              # (max size)
  )

  # "relay_row.result_time" token extractor definition
  TOK_EXT_RELAY_ROW_RESULT_TIME = TokenExtractor.new(
    :result_time,
#    / (Ritirat|Squalif|\d{1,2}'\d\d"\d\d)/ui,
    59,                                             # (starting idx)
    /(\s\d{1,4}[\,|\.]\d\d$|(?<=Squalif\.)$)/ui
#    8                                               # (max size)
  )

  # "relay_row.result_score" token extractor definition
  TOK_EXT_RELAY_ROW_RESULT_SCORE = TokenExtractor.new(
    :result_score,
    /\s\d{1,4}[\,|\.]\d\d$/ui,
#    68,                                             # (starting idx)
    8                                               # (max size)
  )
  # ----------------------------------------------------------------------------
  #++

  # "ranking_row.result_position" token extractor definition
  TOK_EXT_RANKING_ROW_RESULT_POSITION = TokenExtractor.new(
    :result_position,
    8,
    7                                               # (max size)
  )

  # "ranking_row.team_code" token extractor definition
  TOK_EXT_RANKING_ROW_TEAM_CODE = TokenExtractor.new(
    :team_code,
    /(?<=\s)\w\w\w-\d{6}/ui,
    10                                              # (max size)
  )

  # "ranking_row.team_name" token extractor definition
  TOK_EXT_RANKING_ROW_TEAM_NAME = TokenExtractor.new(
    :team_name,
    /(?<=(\w{3}-\d{6}\s{2})|(\d\s{6})|(\s{19}))\w+/ui,
    /\s\d{1,6}[\,|\.]\d\d$/ui
  )

  # "ranking_row.result_score" token extractor definition
  TOK_EXT_RANKING_ROW_RESULT_SCORE = TokenExtractor.new(
    :result_score,
    /\s\d{1,6}[\,|\.]\d\d$/ui,
    /$/ui
  )
  # ----------------------------------------------------------------------------
  #++

  # "stats_team_tot.total" token extractor definition
  TOK_EXT_STATS_TEAM_TOTAL = TokenExtractor.new(
    :total,
    /\d/ui,
    10                                              # (max size)
  )
  # ----------------------------------------------------------------------------
  #++

  # Commodity array of all the TokenExtractor constants defined.
  ALL_TOKEN_EXTRACTOR = [
    TOK_EXT_MEETING_HEADER_TITLE,
    TOK_EXT_MEETING_HEADER_MEETING_DATES,
    TOK_EXT_MEETING_HEADER_ORGANIZATION,
    TOK_EXT_CATEGORY_HEADER_DISTANCE,
    TOK_EXT_CATEGORY_HEADER_STYLE,
    TOK_EXT_CATEGORY_HEADER_GENDER,
    TOK_EXT_CATEGORY_HEADER_CATEGORY_GROUP,
    TOK_EXT_CATEGORY_HEADER_BASE_TIME,
    TOK_EXT_RELAY_HEADER_TYPE,
    TOK_EXT_RELAY_HEADER_DISTANCE,
    TOK_EXT_RELAY_HEADER_STYLE,
    TOK_EXT_RELAY_HEADER_CATEGORY_GROUP,
    TOK_EXT_RELAY_HEADER_BASE_TIME,
    TOK_EXT_RESULT_ROW_RESULT_POSITION,
    TOK_EXT_RESULT_ROW_TEAM_CODE,
    TOK_EXT_RESULT_ROW_SWIMMER_NAME,
    TOK_EXT_RESULT_ROW_SWIMMER_YEAR,
    TOK_EXT_RESULT_ROW_TEAM_NAME,
    TOK_EXT_RESULT_ROW_RESULT_TIME,
    TOK_EXT_RESULT_ROW_RESULT_SCORE,
    TOK_EXT_RELAY_ROW_RESULT_POSITION,
    TOK_EXT_RELAY_ROW_TEAM_NAME,
    TOK_EXT_RELAY_ROW_RESULT_TIME,
    TOK_EXT_RELAY_ROW_RESULT_SCORE,
    TOK_EXT_RANKING_ROW_RESULT_POSITION,
    TOK_EXT_RANKING_ROW_TEAM_CODE,
    TOK_EXT_RANKING_ROW_TEAM_NAME,
    TOK_EXT_RANKING_ROW_RESULT_SCORE,
    TOK_EXT_STATS_TEAM_TOTAL
  ]
  # ----------------------------------------------------------------------------
  #++
end
