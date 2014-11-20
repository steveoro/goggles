# encoding: utf-8

require 'data_import/context_type_def'
require 'data_import/services/token_extractor'


=begin

= FinResultConsts

  - Goggles framework vers.:  4.00.631
  - author: Steve A.

 Container module that stores all the common definitions
 included by the parsing classes for processing text data files of the type
 'fin_result' (either layout 'FIN' or 'FIN2').

 Each member object defines several RegExp that relay directly to this
 specific kind of text file and will be most certainly useless for other
 layouts.

=end
module Fin2ResultConsts                             # == HEADER CONTEXT TYPES definitions: ==
  extend ActiveSupport::Concern

  # "Meeting Header" context type definition.
  def context_type_meeting_header
    ContextTypeDef.new(
      :meeting_header,
      [
        /^\s*|^\r\n|^\n|$|^\Z|\s*(Distanze speciali|(\d{1,3}\D{1,2}|[IXVMCDL]{1,8})\s(\S+|Tr|Region))|(\d{1,2}((\/|-|\,)\d{1,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})/i,
        /\s*Manifestazione organizzata da|\s*(Distanze speciali|(\d{1,3}\D{1,2}|[IXVMCDL]{1,8})\s(\S+|Tr|Region))|(\d{1,2}((\/|-|\,)\d{1,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})/i,
        /(\d{1,2}((\/|-|\,)\d{1,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})|(\s*Manifestazione organizzata da)|^\s*|^\r\n|^\n|$|^\Z|(mistaff|50|100|200|400|800|1500)/i
      ],
      nil,                                          # parent context
      4                                             # line_timeout (line after which these checks will be skipped)
    )
  end

  # "Result/Category Header" context type definition.
  #
  def context_type_event_individual
    ContextTypeDef.new(
      :event_individual,
      [
        /^\s*|^\r\n|^\n|$|^\Z/i,
        /-{80}/,
        /\s{3}-{3}\s{1,3}50\s|100\s|200\s|400\s|800\s|1500\s/i,
        /-{80}|^\s*|^\r\n|^\n|$|^\Z|\s{2,4}Atleta\s{20,24}Cat/i,
        /\d{1,2}\s{2,3}\w\w|\s{2,4}Atleta\s{20,24}Cat|-{80}|^\s*|^\r\n|^\n|$|^\Z/i,
        /\d{1,2}\s{2,3}\w\w|-{80}|^\s*|^\r\n|^\n|$|^\Z/i,
        /\d{1,2}\s{2,3}\w\w|^\s*|^\r\n|^\n|$|^\Z/i
      ]
    )
  end

  # "Relay Header" context type definition.
  #
  def context_type_event_relay
    ContextTypeDef.new(
      :event_relay,
      [
        /Torna a inizio pagina|^\s*|^\r\n|^\n|$|^\Z/i,
        /(Mistaffetta|Staffetta)\s\dx\d{2,4}\s\w|-{80}/,
        /^\s*|^\r\n|^\n|$|^\Z|\s{3}-{3}\s{1,3}(Mistaffetta|Staffetta)\s\dx\d{2,4}\s\w/i,
        /-{80}|^\s*|^\r\n|^\n|$|^\Z|\s{2,4}Societ/i,
        /\d{1,2}\s{2,3}\w\w|\s{2,4}Societ|-{80}|^\s*|^\r\n|^\n|$|^\Z/i,
        /\d{1,2}\s{2,3}\w\w|-{80}|^\s*|^\r\n|^\n|$|^\Z/i,
        /\d{1,2}\s{2,3}\w\w|^\s*|^\r\n|^\n|$|^\Z/i
      ]
    )
  end

# TODO #################
  # "Team Ranking" (header) context type definition.
  #
  def context_type_team_ranking
    ContextTypeDef.new(
      :team_ranking,
      [
        /classifica(\s+di)?(\s+societ)?/i,
        /^\s*(\r\n|\n|$|\Z)/i
      ]
    )
  end

  # "Statistics" (header) context type definition.
  #
  def context_type_stats
    ContextTypeDef.new(
      :stats,
      [
        /statistiche(?!\ssocie.+)/i,
        /^\s*(\r\n|\n|$|\Z)/i
      ]
    )
  end
                                                    # == DETAIL CONTEXT TYPES definitions: ==
  # "Result row" (detail) context type definition.
  #
  def context_type_result_row
    ContextTypeDef.new(
      :result_row,
      [
        /(Ritir.*|Squal.*|\d{1,2}'\d\d"\d\d) +\d{1,4}[\,|\.]\d\d(\r\n|\n|$|\Z)/i
      ],
      :event_individual                              # parent context
    )
  end

  # "Ralay row" (detail) context type definition.
  #
  def context_type_relay_row
    ContextTypeDef.new(
      :relay_row,
      [
        /Ritir.*|Squal.*|(\d{1,2}'\d\d"\d\d +\d{1,4}[\,|\.]\d\d)(\r\n|\n|$|\Z)/i
      ],
      :event_relay
    )
  end

  # "Team Ranking detail row" context type definition.
  #
  def context_type_ranking_row
    ContextTypeDef.new(
      :ranking_row,
      [
        /\s+\d{1,6}[\,|\.]\d\d(\r\n|\n|$|\Z)/i
      ],
      :team_ranking
    )
  end

  # "Statistics details section" context type definition.
  #
  def context_type_stats_details
    ContextTypeDef.new(
      :stats_details,
      [
        /numero di soc.+\siscritte\s/i,
        /^.*/i,                                     # (anything)
        /numero di soc.+\spartecipanti\s/i,

        /^\s*(\r\n|\n|$|\Z)/i,                      # (empty)

        /numero tot.+\sdi atleti iscritti\s/i,
        /^.*/i,
        /^.*/i,
        /^.*/i,
        /^.*/i,

        /^\s*(\r\n|\n|$|\Z)/i,

        /numero di atleti partecipanti\s/i,
        /^.*/i,
        /^.*/i,
        /^.*/i,

        /^\s*(\r\n|\n|$|\Z)/i,

        /numero tot.+\sdi iscrizioni alle gare\s/i,
        /^.*/i,
        /^.*/i,

        /^\s*(\r\n|\n|$|\Z)/i,

        /numero tot.+\sdi gare disputate\s/i,
        /^.*/i,

        /^\s*(\r\n|\n|$|\Z)/i,

        /^.*/i,
        /^.*/i,
        /numero di squalifiche\s/i,
        /numero di ritiri\s/i
      ],
      :stats
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # Returns the list of all the ContextTypeDefs member objects defined.
  # (Commodity method used only inside specs.)
  def get_context_types_list
    [
      context_type_meeting_header,
      context_type_event_individual,
      context_type_event_relay,
      context_type_team_ranking,
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
    TokenExtractor.new(
      :title,
      /\-?\s*(Distanze speciali|Campionat|((\d{1,3}|[IXVMCDL]{1,6})([°^�]|\.o)?\s?(Tr|Meeting|Region)?))/i,
      /$/i,
      4                                             # line_timeout
    )
  end

  # "meeting_header.meeting_dates" token extractor definition
  #
  def tokenizer_meeting_header_meeting_dates
    TokenExtractor.new(
      :meeting_dates,
      /\d{0,2}((\/|-|\,)\d{0,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4}/i,
      /\z/i,
      4                                             # line_timeout
    )
  end

  # "meeting_header.organization" token extractor definition
  #
  def tokenizer_meeting_header_organization
    TokenExtractor.new(
      :organization,
      /(?<=manifestazione organizzata da )/i,
      /\z/i,
      4                                               # line_timeout
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # "category_header.distance" token extractor definition
  #
  def tokenizer_category_header_distance
    TokenExtractor.new(
      :distance,
      /(?<!\dx)(50 |100 |200 |400 |800 |1500 ) */i,
      / *(stile|mi|do|ra|fa|sl|MX|DF|DS|RN).*/i
    )
  end

  # "category_header.style" token extractor definition
  #
  def tokenizer_category_header_style
    TokenExtractor.new(
      :style,
      / *(stile|mi|do|ra|fa|sl|MX|DF|DS|RN).*/i,
      / *(maschi|femmi)/i
    )
  end

  # "category_header.gender" token extractor definition
  #
  def tokenizer_category_header_gender
    TokenExtractor.new(
      :gender,
      / *(maschi|femmi)/i,
      # Alt. vers.: /\s+(maschi|femmi)/ui
      /\s+-\s+categoria/i
    )
  end

  # "category_header.category_group" token extractor definition
  #
  def tokenizer_category_header_group
    TokenExtractor.new(
      :category_group,
      / *((master|under)\s\d\d|[MU]\d\d)/i,
      / *tempo base */i
    )
  end

  # "category_header.base_time" token extractor definition
  #
  def tokenizer_category_header_base_time
    TokenExtractor.new(
      :base_time,
      /\d{1,2}'\d\d"\d\d$/,
      9                                             # (max size)
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # "relay_header.type" token extractor definition
  #
  def tokenizer_relay_header_type
    TokenExtractor.new(
      :type,
      /(mistaff|staff).*\s+\d{1,2}x\d{2,3}\s+(stile|mi|sl|mx)/i,
      /\s+-\s+cat/i
    )
  end

  # "relay_header.distance" token extractor definition
  #
  def tokenizer_relay_header_distance
    TokenExtractor.new(
      :distance,
      /\dx\d{2,3}\s+(stile|mi|sl|mx)/i,
      4                                             # (max size)
    )
  end

  # "relay_header.style" token extractor definition
  #
  def tokenizer_relay_header_style
    TokenExtractor.new(
      :style,
      /(?<=\d\s)\s*(stile|mi|sl|mx)/i,
      /\s+(-\s+cat|masch|femm)/i
    )
  end

  # "relay_header.category_group" token extractor definition
  #
  def tokenizer_relay_header_category_group
    TokenExtractor.new(
      :category_group,
      /M\d\d0\-\d\d\d/i,
      7                                             # (max size)
      # Alt. vers. (instead of '7'): /\s*tempo base\s*/ui
    )
  end

  # "relay_header.base_time" token extractor definition
  #
  def tokenizer_relay_header_base_time
    TokenExtractor.new(
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
    TokenExtractor.new(
      :result_position,
      / \d{1,3}(?= {1,3})/i,
      / (?=[a-z]+)/i
    )
  end

  # "result_row.team_code" token extractor definition
  #
  def tokenizer_result_row_team_code
    TokenExtractor.new(
      :team_code,
      /(\w\w\w-\d{6})/i,
      10                                            # (max size)
    )
  end

  # "result_row.swimmer_name" token extractor definition
  #
  def tokenizer_result_row_swimmer_name
    TokenExtractor.new(
      :swimmer_name,
      /(?<=[\sa-z0-9-]{10}|[\sa-z0-9-]{18})\s(\D{25})/i,
      29                                            # (max size)
    )
  end

  # "result_row.swimmer_year" token extractor definition
  #
  def tokenizer_result_row_swimmer_year
    TokenExtractor.new(
      :swimmer_year,
      /\b\d{4} +(?=\D+)/i,
      4                                             # (max size)
    )
  end

  # "result_row.team_name" token extractor definition
  #
  def tokenizer_result_row_team_name
    TokenExtractor.new(
      :team_name,
      # [Steve, 20130809] Regexp is too slow!! (And doesn't work for team names with numbers in it.) Using Fixnum absolute index instead:
      49,                                           # (starting idx)
      26                                            # (max size)
    )
  end

  # "result_row.result_time" token extractor definition
  #
  def tokenizer_result_row_result_time
    TokenExtractor.new(
      :result_time,
      / (Ritir.*|Squal.*|\d{1,2}'\d\d"\d\d)/i,
      # Alt. vers.: /(Ritirat|Squalif|\d{1,2}'\d\d"\d\d) +\d{1,4}[\,|\.]\d\d$/i,
      8                                             # (max size)
    )
  end

  # "result_row.result_score" token extractor definition
  #
  def tokenizer_result_row_result_score
    TokenExtractor.new(
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
    TokenExtractor.new(
      :result_position,
      8,                                            # (starting idx)
      /(?<=\s{3}\d|gara|\s{18})\s+\w+/i
  #    12                                            # (max size)
    )
  end

  # "relay_row.team_name" token extractor definition
  #
  def tokenizer_relay_row_team_name
    TokenExtractor.new(
      :team_name,
      /(\s{3,5}.{25}\s{8,12})(?=Ritir|Squal|\d{1,2}'\d{2}"\d{2})/i,
      25                                            # (max size)
    )
  end

  # "relay_row.result_time" token extractor definition
  #
  def tokenizer_relay_row_result_time
    TokenExtractor.new(
      :result_time,
  #    / (Ritirat|Squalif|\d{1,2}'\d\d"\d\d)/ui,
      59,                                           # (starting idx)
      /(\s\d{1,4}[\,|\.]\d\d$|(?<=Squalif\.)(\r\n|\n|$|\Z))/i
  #    8                                             # (max size)
    )
  end

  # "relay_row.result_score" token extractor definition
  #
  def tokenizer_relay_row_result_score
    TokenExtractor.new(
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
    TokenExtractor.new(
      :result_position,
      /^\s*\d{0,6}°?\s+\w+/i,
      /(?<=\d|\s{12})(°|\s)/i                   # (max size)
    )
  end

  # "ranking_row.team_code" token extractor definition
  #
  def tokenizer_ranking_row_team_code
    TokenExtractor.new(
      :team_code,
      /(?<=\s)\w\w\w-\d{6}/i,
      10                                            # (max size)
    )
  end

  # "ranking_row.team_name" token extractor definition
  #
  def tokenizer_ranking_row_team_name
    TokenExtractor.new(
      :team_name,
      /(?<=\w{3}-\d{6}\s{2}|\d\s{6}|\s{19}|\d°\s)\w+/i,
      /\s+(\d{1,6}[\,|\.]\d\d)(\s+|\r\n|\n|$|\Z)/i
#      /\s\d{1,6}[\,|\.]\d\d(\r\n|\n|$|\Z)/i
    )
  end

  # "ranking_row.result_score" token extractor definition
  #
  def tokenizer_ranking_row_result_score
    TokenExtractor.new(
      :result_score,
      /\s+(\d{1,6}[\,|\.]\d\d)(\s+|\r\n|\n|$|\Z)/i,
      /(?<=\d[\,|\.]\d\d)(\s+|\r\n|\n|$|\Z)/i  # \s+\d{1,6}[\,|\.]\d\d(\s+|\r\n|\n|$|\Z)
#      /$/i  # \s+\d{1,6}[\,|\.]\d\d(\s+|\r\n|\n|$|\Z)
    )
  end

  # ----------------------------------------------------------------------------
  #++

  # "stats_details.teams_tot" token extractor definition
  #
  def tokenizer_stats_teams_tot
    TokenExtractor.new(
      :teams_tot,
      /\s{2}\d/i,
      10                                            # (max size)
    )
  end

  # "stats_details.teams_presence" token extractor definition
  #
  def tokenizer_stats_teams_presence
    TokenExtractor.new(
      :teams_presence,
      /\s{2}\d/i,
      10
    )
  end

  # "stats_details.swimmer_tot" token extractor definition
  #
  def tokenizer_stats_swimmers_tot
    TokenExtractor.new(
      :swimmer_tot,
      /\s{2}\d/i,
      10
    )
  end

  # "stats_details.swimmer_presence" token extractor definition
  #
  def tokenizer_stats_swimmers_presence
    TokenExtractor.new(
      :swimmer_presence,
      /\s{2}\d/i,
      10
    )
  end

  # "stats_details.entries_tot" token extractor definition
  #
  def tokenizer_stats_entries_tot
    TokenExtractor.new(
      :entries_tot,
      /\s{2}\d+/i,
      10
    )
  end

  # "stats_details.entries_presence" token extractor definition
  #
  def tokenizer_stats_entries_presence
    TokenExtractor.new(
      :entries_presence,
      /\s{2}\d+/i,
      10
    )
  end

  # "stats_details.disqual_tot" token extractor definition
  #
  def tokenizer_stats_disqual_tot
    TokenExtractor.new(
      :disqual_tot,
      /\s{2}\d/i,
      10
    )
  end

  # "stats_details.withdrawals_tot" token extractor definition
  #
  def tokenizer_stats_withdrawals_tot
    TokenExtractor.new(
      :withdrawals_tot,
      /\s{2}\d/i,
      10
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # Returns the list of all the TokenExtractor object members defined.
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
