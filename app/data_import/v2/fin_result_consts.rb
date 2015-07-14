# encoding: utf-8

require_relative '../../data_import/v2/context_type_def'
require_relative '../../data_import/v2/services/token_extractor'


=begin

= V2::FinResultConsts

  - Goggles framework vers.:  4.00.791
  - author: Steve A.

 Container module that stores all the common definitions
 included by the parsing classes for processing text data files of the type
 'fin_result' (either layout 'FIN' or 'FIN2').

 Each member object defines several RegExp that relay directly to this
 specific kind of text file and will be most certainly useless for other
 layouts.

=end
module V2::FinResultConsts                              # == HEADER CONTEXT TYPES definitions: ==
  extend ActiveSupport::Concern

  # "Meeting Header" context type definition.
  def context_type_meeting_header
    V2::ContextTypeDef.new(
      :meeting_header,
      [
        /(\s*(Distanze speciali|((\d{1,3}\D{1,2}|[IXVMCDL]{1,8})\s(\S+|Trof|Region))))|(\d{1,2}((\/|-|\,)\d{1,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})/i,
        /(\s*Manifestazione organizzata da)|(\s*(Distanze speciali|((\d{1,3}\D{1,2}|[IXVMCDL]{1,8})\s(\S+|Trof|Region))))/i,
        /(\d{1,2}((\/|-|\,)\d{1,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})|(\s*Manifestazione organizzata da)|/i
      ],
      nil,                                          # parent context
      4                                             # line_timeout (line after which these checks will be skipped)
    )
  end

  # "Category Header" context type definition.
  #
  def context_type_category_header
    V2::ContextTypeDef.new(
      :category_header,
      [
        /^\s*(\r\n|\n|$|\Z)/i,  # matches any kind of newline, an empty line or a line with only invisible chars
        /(?<!\dx)(50\s|100\s|200\s|400\s|800\s|1500\s) *(stile|misti|dorso|rana|farf|SL|DO|RA|FA|MI|MX|DF|DS|RN).*(maschi|femmi)/i,
        /^-{25}/
      ]
    )
  end

  # "Relay Header" context type definition.
  #
  def context_type_relay_header
    V2::ContextTypeDef.new(
      :relay_header,
      [
        /^\s*(\r\n|\n|$|\Z)/i,
        /(mistaff|staff).*\s+\d{1,2}x\d{2,3}\s+(stile|mi|sl|mx).*\s+-\s+cat/i,
        /^-{25}/
      ]
    )
  end

  # "Team Ranking" (header) context type definition.
  #
  def context_type_team_ranking
    V2::ContextTypeDef.new(
      :team_ranking,
      [
        /(classifica)(\s+di)?(\s+societ.)?/i
#        /(?<anything>^.*)/i
#        /(?<empty>^\s*\n|^\r\n|^\z)/i
#        /^\s*(\r\n|\n|$|\Z)/i
      ]
    )
  end

  # "Team Stats" (header) context type definition.
  #
  def context_type_team_stats
    V2::ContextTypeDef.new(
      :team_stats,
      [
        /statistiche\s+societ./i
      ]
    )
  end

  # "Meeting Statistics" (header) context type definition.
  #
  def context_type_stats
    V2::ContextTypeDef.new(
      :stats,
      [
        /statistiche(?!\ssocie.+)/i
#        /(?<anything>^.*)/i
#        /(?<empty>^\s*\n|^\r\n|^\z)/i
#        /^\s*(\r\n|\n|$|\Z)/i
      ]
    )
  end
                                                    # == DETAIL CONTEXT TYPES definitions: ==
  # "Result row" (detail) context type definition.
  #
  def context_type_result_row
    V2::ContextTypeDef.new(
      :result_row,
      [
        /(Ritir.*|Squal.*|\d{1,2}'\d\d"\d\d) +\d{1,4}[\,|\.]\d\d(\r\n|\n|$|\Z)/i
      ],
      :category_header                              # parent context
    )
  end

  # "Ralay row" (detail) context type definition.
  #
  def context_type_relay_row
    V2::ContextTypeDef.new(
      :relay_row,
      [
        /(?=\s{4}(?<timing>Ritir|Squal|\d{1,2}'\d{2}"\d{2}))/uix
        # Old version:
#        /Ritir.*|Squal.*|(\d{1,2}'\d\d"\d\d +\d{1,4}[\,|\.]\d\d)(\r\n|\n|$|\Z)/i
      ],
      :relay_header
    )
  end

  # "Team Ranking detail row" context type definition.
  #
  def context_type_ranking_row
    V2::ContextTypeDef.new(
      :ranking_row,
      [
       /
          (?<=\s)
          (?<decimal_score>
            (?<thousand>\d{1,3}\.)*\d{1,3}
            (?<decimals>[\,|\.]\d\d)
            (?<endline>\s+|\r\n|\n|$|\Z)
            (?!\D+)
          )|
          (?<score_comma>
            \s+\d+[\,|\.]\d\d
            (?!\s\s\d\d\s\s)
          )|
          (?<score_stats>
            \s+\d+[\,|\.]\d\d
            (?=\s\s\d\d\s\s)
          )|
          (?<=\s\s\s\s)(?<integer_score>
            \s+\d+(?=\r|\n|$|\Z)
          )
       /iux
       # This one looks for a siplyfied version of the ranking score:
#        /\s+(((\d{1,3}\.)*\d{1,3}|\d{1,})([\,|\.]\d\d)?)(\s+|\r\n|\n|$|\Z)/i
      ],
      :team_ranking
    )
  end

  # "Statistics details section" context type definition.
  #
  def context_type_stats_details
    V2::ContextTypeDef.new(
      :stats_details,
      [
        /numero di soc.+\siscritte\s/i,
        /(?<anything>^.*)/i,
        /numero di soc.+\spartecipanti\s/i,
        /(?<anything>^.*)/i,

        /numero tot.+\sdi atleti iscritti\s/i,
        /(?<anything>^.*)/i,
        /(?<anything>^.*)/i,
        /(?<anything>^.*)/i,
        /(?<anything>^.*)/i,
        /(?<anything>^.*)/i,

        /numero di atleti partecipanti\s/i,
        /(?<anything>^.*)/i,
        /(?<anything>^.*)/i,
        /(?<anything>^.*)/i,
        /(?<anything>^.*)/i,

        /numero tot.+\sdi iscrizioni alle gare\s/i,
        /(?<anything>^.*)/i,
        /(?<anything>^.*)/i,
        /(?<anything>^.*)/i,

        /numero tot.+\sdi gare disputate\s/i,
        /(?<anything>^.*)/i,
        /(?<anything>^.*)/i,

        /(?<anything>^.*)/i,
        /(?<anything>^.*)/i,
        /numero di squalifiche\s/i,
        /numero di ritiri\s/i
      ],
      :stats
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # Returns the list of all the V2::ContextTypeDefs member objects defined.
  # (Commodity method used only inside specs.)
  def get_context_types_list
    [
      context_type_meeting_header,
      context_type_category_header,
      context_type_relay_header,
      context_type_team_ranking,
      context_type_team_stats,
      context_type_stats,
      context_type_result_row,
      context_type_relay_row,
      context_type_ranking_row,
      context_type_stats_details
    ]
  end
  # ----------------------------------------------------------------------------
  #++


  # "meeting_header.title" token extractor definition
  #
  def tokenizer_meeting_header_title
    V2::TokenExtractor.new(
      :title,
      /((?<roman>(([IXVMCDL]{1,6})(?<cardinal>°|ª|\^|�|\.o)?\s))(?<type>(Tr|Meeting|Gara|(?<special>region|distanze|campion))\D*\s)|(\d{1,2}(\g<cardinal>))|\g<type>)/i,
      # Old version; /((?<roman>(([IXVMCDL]{1,6})(?<cardinal>°|ª|\^|�|\.o)?\s))(?<type>(Tr|Meeting|Gara|(?<special>region|distanze|campion))\D*\s)|(\d{1,2}(\g<cardinal>))|\g<type>)/i,
      /$/i,
      3                                             # line_timeout
    )
  end

  # "meeting_header.meeting_dates" token extractor definition
  #
  def tokenizer_meeting_header_meeting_dates
    V2::TokenExtractor.new(
      :meeting_dates,
      /(?<wholedate>(?<=\s\-\s|\s\-\-\-\s|\s\s|^)(?<weekday>(dom|lun|mar|mer|gio|ven|sab)\D*\s)?((?<twodigitsep>(\d{1,2})(\/|-|\,|\s)){1,4}(?<month>\d{1,2}|(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic)\D*))(\/|-|\,|\s)(?<year>\d{2,4}))/i,
      # Old version: /\d{0,2}((\/|-|\,)\d{0,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4}/i,
      /(?<=\d{2})(?<separator>\s+\-{1,3}\s+|\s\s|$|\r|\n)/i,
      3                                             # line_timeout
    )
  end

  # "meeting_header.organization" token extractor definition
  #
  def tokenizer_meeting_header_organization
    V2::TokenExtractor.new(
      :organization,
      /(?<=manifestazione organizzata da )/i,
      /\z/i,
      3                                               # line_timeout
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # "category_header.distance" token extractor definition
  #
  def tokenizer_category_header_distance
    V2::TokenExtractor.new(
      :distance,
      /(?<!\dx)(50 |100 |200 |400 |800 |1500 ) */i,
      / *(stile|mi|do|ra|fa|sl|MX|DF|DS|RN).*/i
    )
  end

  # "category_header.style" token extractor definition
  #
  def tokenizer_category_header_style
    V2::TokenExtractor.new(
      :style,
      / *(stile|mi|do|ra|fa|sl|MX|DF|DS|RN).*/i,
      / *(maschi|femmi)/i
    )
  end

  # "category_header.gender" token extractor definition
  #
  def tokenizer_category_header_gender
    V2::TokenExtractor.new(
      :gender,
      / *(maschi|femmi)/i,
      # Alt. vers.: /\s+(maschi|femmi)/ui
      /\s+-\s+categoria/i
    )
  end

  # "category_header.category_group" token extractor definition
  #
  def tokenizer_category_header_group
    V2::TokenExtractor.new(
      :category_group,
      / *((master|under)\s\d\d|[MU]\d\d)/i,
      / *tempo base */i
    )
  end

  # "category_header.base_time" token extractor definition
  #
  def tokenizer_category_header_base_time
    V2::TokenExtractor.new(
      :base_time,
      /\d{1,2}'\d\d"\d\d/,
      9                                             # (max size)
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # "relay_header.type" token extractor definition
  #
  def tokenizer_relay_header_type
    V2::TokenExtractor.new(
      :type,
      /(mistaff|staff).*\s+\d{1,2}x\d{2,3}\s+(stile|mi|sl|mx)/i,
      /\s+-\s+cat/i
    )
  end

  # "relay_header.distance" token extractor definition
  #
  def tokenizer_relay_header_distance
    V2::TokenExtractor.new(
      :distance,
      /\dx\d{2,3}\s+(stile|mi|sl|mx)/i,
      4                                             # (max size)
    )
  end

  # "relay_header.style" token extractor definition
  #
  def tokenizer_relay_header_style
    V2::TokenExtractor.new(
      :style,
      /(?<=\d\s)\s*(stile|mi|sl|mx)/i,
      /\s+(-\s+cat|masch|femm)/i
    )
  end

  # "relay_header.category_group" token extractor definition
  #
  def tokenizer_relay_header_category_group
    V2::TokenExtractor.new(
      :category_group,
      /M\d\d0\-\d\d\d/i,
      7                                             # (max size)
      # Alt. vers. (instead of '7'): /\s*tempo base\s*/ui
    )
  end

  # "relay_header.base_time" token extractor definition
  #
  def tokenizer_relay_header_base_time
    V2::TokenExtractor.new(
      :base_time,
      /\s\d{1,2}'\d\d"\d\d/i,
      9                                             # (max size)
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # "result_row.result_position" token extractor definition
  #
  def tokenizer_result_row_result_position
    V2::TokenExtractor.new(
      :result_position,
      0,
      /
        (?<team_code>
          \s(\w\w\w-\d{6})
        )|
        (?<swimmer_name>
          (
            (?<=[\sa-z0-9-]{10})|
            (?<=[\sa-z0-9-]{18})
          )\s(\D{25})
        )
      /uix
    )
  end

  # "result_row.team_code" token extractor definition
  #
  def tokenizer_result_row_team_code
    V2::TokenExtractor.new(
      :team_code,
      /(\w\w\w-\d{6})/i,
      10                                            # (max size)
    )
  end

  # "result_row.swimmer_name" token extractor definition
  #
  def tokenizer_result_row_swimmer_name
    V2::TokenExtractor.new(
      :swimmer_name,
      /
        (
          (?<=[\sa-z0-9-]{10})|
          (?<=[\sa-z0-9-]{18})
        )\s(\D{25})
      /uix,
      29                                            # (max size)
    )
  end

  # "result_row.swimmer_year" token extractor definition
  #
  def tokenizer_result_row_swimmer_year
    V2::TokenExtractor.new(
      :swimmer_year,
      /\b\d{4} +(?=\D+)/i,
      4                                             # (max size)
    )
  end

  # "result_row.team_name" token extractor definition
  #
  def tokenizer_result_row_team_name
    V2::TokenExtractor.new(
      :team_name,
      # [Steve, 20130809] Regexp is too slow!! (And doesn't work for team names with numbers in it.) Using Fixnum absolute index instead:
      49,                                           # (starting idx)
      26                                            # (max size)
    )
  end

  # "result_row.result_time" token extractor definition
  #
  def tokenizer_result_row_result_time
    V2::TokenExtractor.new(
      :result_time,
      / (Ritir.*|Squal.*|\d{1,2}'\d\d"\d\d)/i,
      # Alt. vers.: /(Ritirat|Squalif|\d{1,2}'\d\d"\d\d) +\d{1,4}[\,|\.]\d\d$/i,
      8                                             # (max size)
    )
  end

  # "result_row.result_score" token extractor definition
  #
  def tokenizer_result_row_result_score
    V2::TokenExtractor.new(
      :result_score,
      /\b\d{1,4}[\,|\.]\d\d(\r\n|\n|$|\Z)/i,
      7                                             # (max size)
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # "relay_row.result_position" token extractor definition
  #
  def tokenizer_relay_row_result_position
    V2::TokenExtractor.new(
      :result_position,
      /^\s+(\d|fuori|fg|f\.g\.)/i,
#      8,                                            # (starting idx)
      /(?<=\d\s)\s|(?<=fuori gara)\s|(?<=f\.g\.)\s|(?<=fg)\s/i
#      10                                            # (max size)
    )
  end

  # "relay_row.team_name" token extractor definition
  #
  def tokenizer_relay_row_team_name
    V2::TokenExtractor.new(
      :team_name,
      /
        (
          (?<=\d\s{4})(\s+(?<t1>[a-z]+.{24,29}))|
          (?<=^\s\s)(\s+(?!fuori\sgara)(?<t2>[a-z]+.{24,29}))|
          (?<=\d{6}\s{3})((?<t3>[a-z]+.{24,29}))|

          (?<=Fuori\sgara\s\s)(\s+(?<t4>[a-z]+.{24,29}))|
          (?<=\sf\.g\.)(\s+(?<t5>[a-z]+.{24,29})})|
          (?<=\sfg)(\s+(?<t6>[a-z]+.{24,29}))
        )
        \s{4,20}
        (?=(?<timing>Ritir|Squal|\d{1,2}'\d{2}"\d{2}))
      /uix,
#      /(?<=\s{3})(.{25,29}\s{6,12})(?=Ritir|Squal|\d{1,2}'\d{2}"\d{2})/i,
      /
        (?<=\S)(\s{6,65})
        (?=(?<timing>Ritir|Squal|\d{1,2}'\d{2}"\d{2}))
      /uix
#      25                                            # (max size)
    )
  end

  # "relay_row.result_time" token extractor definition
  #
  def tokenizer_relay_row_result_time
    V2::TokenExtractor.new(
      :result_time,
  #    / (Ritirat|Squalif|\d{1,2}'\d\d"\d\d)/ui,
      59,                                           # (starting idx)
      /
        (\s\d{1,4}[\,|\.]\d\d|
        (?<=\ssqualif\.|\ssqualificata)(.*))
      /uix
#      /(\s\d{1,4}[\,|\.]\d\d$|(?<=Squalif\.)(\r\n|\n|$|\Z))/i
  #    8                                             # (max size)
    )
  end

  # "relay_row.result_score" token extractor definition
  #
  def tokenizer_relay_row_result_score
    V2::TokenExtractor.new(
      :result_score,
      /\s\d{1,4}[\,|\.]\d\d(\r\n|\n|$|\Z)/i,
  #    68,                                           # (starting idx)
      8                                             # (max size)
    )
  end

  # ----------------------------------------------------------------------------
  #++

  # "ranking_row.result_position" token extractor definition
  #
  def tokenizer_ranking_row_result_position
    V2::TokenExtractor.new(
      :result_position,
      0,
      /(.)(?=[a-z°)])/i
    )
  end

  # "ranking_row.team_code" token extractor definition
  #
  def tokenizer_ranking_row_team_code
    V2::TokenExtractor.new(
      :team_code,
      /(?<=\s)\w\w\w-\d{6}/i,
      10                                            # (max size)
    )
  end

  # "ranking_row.team_name" token extractor definition
  #
  def tokenizer_ranking_row_team_name
    V2::TokenExtractor.new(
      :team_name,
      /
        (?!\w{3}-\d{6}\s\s)
        (
          (?<=\w{3}-\d{6}\s\s)\w|
          (?<=\w{3}-\d{6}\s-\s)\w|
          (?<=\d°\s)\w|
          (?<=\d°\s\s)\w|
          (?<=\s{19})\w|
          (?<=\d\s{3})\w|
          (?<=\d\s{4})\w|
          (?<=\d\s{5})\w|
          (?<=\d\s{6})\w|
          (?<=\d\s{7})\w|
          (?<=\d\s{8})\w|
          (?<=\d\)\s{3})\w
        )
      /uix,
      /
        (?<=\s)
        (?<decimal_score>
          (?<thousand>\d{1,3}\.)*\d{1,3}
          (?<decimals>[\,|\.]\d\d)
          (?<endline>\s+|\r\n|\n|$|\Z)
          (?!\D+)
        )|
        (?<score_comma>
          \s+\d+[\,|\.]\d\d
          (?!\s\s\d\d\s\s)
        )|
        (?<score_stats>
          \s+\d+[\,|\.]\d\d
          (?=\s\s\d\d\s\s)
        )|
        (?<=\s\s\s\s)(?<integer_score>
          \s+\d+(?=\r|\n|$|\Z)
        )|
        (Squalif.)
     /iux
#      /\s+(((\d{1,3}\.)*\d{1,3}|\d{1,})[\,|\.]\d\d)(\s+|\r\n|\n|$|\Z)/i
    )
  end

  # "ranking_row.result_score" token extractor definition
  #
  def tokenizer_ranking_row_result_score
    V2::TokenExtractor.new(
      :result_score,
      /
        (?<=\s)
        (?<decimal_score>
          (?<thousand>\d{1,3}\.)*\d{1,3}
          (?<decimals>[\,|\.]\d\d)
          (?<endline>\s+|\r\n|\n|$|\Z)
          (?!\D+)
        )|
        (?<score_comma>
          \s+\d+[\,|\.]\d\d
          (?!\s\s\d\d\s\s)
        )|
        (?<score_stats>
          \s+\d+[\,|\.]\d\d
          (?=\s\s\d\d\s\s)
        )|
        (?<=\s\s\s\s)(?<integer_score>
          \s+\d+(?=\r|\n|$|\Z)
        )
      /iux,
      /
        (
          (?<=\d\n)|
          (?<=\d[\,|\.]\d\d)
        )
        (\s+|\r\n|\r|\n|$|\Z)
      /iux
    )
  end

  # ----------------------------------------------------------------------------
  #++

  # "stats_details.teams_tot" token extractor definition
  #
  def tokenizer_stats_teams_tot
    V2::TokenExtractor.new(
      :teams_tot,
      /\s{2}\d/i,
      10                                            # (max size)
    )
  end

  # "stats_details.teams_presence" token extractor definition
  #
  def tokenizer_stats_teams_presence
    V2::TokenExtractor.new(
      :teams_presence,
      /\s{2}\d/i,
      10
    )
  end

  # "stats_details.swimmer_tot" token extractor definition
  #
  def tokenizer_stats_swimmers_tot
    V2::TokenExtractor.new(
      :swimmer_tot,
      /\s{2}\d/i,
      10
    )
  end

  # "stats_details.swimmer_presence" token extractor definition
  #
  def tokenizer_stats_swimmers_presence
    V2::TokenExtractor.new(
      :swimmer_presence,
      /\s{2}\d/i,
      10
    )
  end

  # "stats_details.entries_tot" token extractor definition
  #
  def tokenizer_stats_entries_tot
    V2::TokenExtractor.new(
      :entries_tot,
      /\s{2}\d+/i,
      10
    )
  end

  # "stats_details.entries_presence" token extractor definition
  #
  def tokenizer_stats_entries_presence
    V2::TokenExtractor.new(
      :entries_presence,
      /\s{2}\d+/i,
      10
    )
  end

  # "stats_details.disqual_tot" token extractor definition
  #
  def tokenizer_stats_disqual_tot
    V2::TokenExtractor.new(
      :disqual_tot,
      /\s{2}\d/i,
      10
    )
  end

  # "stats_details.withdrawals_tot" token extractor definition
  #
  def tokenizer_stats_withdrawals_tot
    V2::TokenExtractor.new(
      :withdrawals_tot,
      /\s{2}\d/i,
      10
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # Returns the list of all the V2::TokenExtractor object members defined.
  # (Commodity method used only inside specs.)
  def get_tokenizers_list
    [
      tokenizer_meeting_header_title,
      tokenizer_meeting_header_meeting_dates,
      tokenizer_meeting_header_organization,
      tokenizer_category_header_distance,
      tokenizer_category_header_style,
      tokenizer_category_header_gender,
      tokenizer_category_header_group,
      tokenizer_category_header_base_time,
      tokenizer_relay_header_type,
      tokenizer_relay_header_distance,
      tokenizer_relay_header_style,
      tokenizer_relay_header_category_group,
      tokenizer_relay_header_base_time,
      tokenizer_result_row_result_position,
      tokenizer_result_row_team_code,
      tokenizer_result_row_swimmer_name,
      tokenizer_result_row_swimmer_year,
      tokenizer_result_row_team_name,
      tokenizer_result_row_result_time,
      tokenizer_result_row_result_score,
      tokenizer_relay_row_result_position,
      tokenizer_relay_row_team_name,
      tokenizer_relay_row_result_time,
      tokenizer_relay_row_result_score,
      tokenizer_ranking_row_result_position,
      tokenizer_ranking_row_team_code,
      tokenizer_ranking_row_team_name,
      tokenizer_ranking_row_result_score,
      tokenizer_stats_teams_tot,
      tokenizer_stats_teams_presence,
      tokenizer_stats_swimmers_tot,
      tokenizer_stats_swimmers_presence,
      tokenizer_stats_entries_tot,
      tokenizer_stats_entries_presence,
      tokenizer_stats_disqual_tot,
      tokenizer_stats_withdrawals_tot
    ]
  end
  # ----------------------------------------------------------------------------
  #++
end
