# encoding: utf-8

require 'data_import/context_type_def'
require 'data_import/services/token_extractor'


=begin

= FinResultConsts

  - Goggles framework vers.:  4.00.655
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
        /
          (?<empty>^\s*|^\r\n|^\n|$|^\Z)|
          (?<organization>(?<=manifestazione organizzata da )(.+))|
          (?<wholedate>(?<=\s\-\s|\s\-\-\-\s|\s\s|^)(?<weekday>(dom|lun|mar|mer|gio|ven|sab)\D*\s)?((?<twodigitsep>(\d{1,2})(\/|-|\,|\s)){1,4}(?<month>\d{1,2}|(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic)\D*))(\/|-|\,|\s)(?<year>\d{2,4}))|
          (?<title>(?<roman>(([IXVMCDL]{1,6})(?<cardinal>°|ª|\^|�|\.o)?\s))(?<type>(Tr|Meeting|Gara|(?<special>region|distanze|campion))\D*\s)|(\d{1,2}(\g<cardinal>))|\g<type>)
        /ix,
        /
          (?<empty>^\s*|^\r\n|^\n|$|^\Z)|
          (?<organization>(?<=manifestazione organizzata da )(.+))|
          (?<wholedate>(?<=\s\-\s|\s\-\-\-\s|\s\s|^)(?<weekday>(dom|lun|mar|mer|gio|ven|sab)\D*\s)?((?<twodigitsep>(\d{1,2})(\/|-|\,|\s)){1,4}(?<month>\d{1,2}|(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic)\D*))(\/|-|\,|\s)(?<year>\d{2,4}))|
          (?<title>(?<roman>(([IXVMCDL]{1,6})(?<cardinal>°|ª|\^|�|\.o)?\s))(?<type>(Tr|Meeting|Gara|(?<special>region|distanze|campion))\D*\s)|(\d{1,2}(\g<cardinal>))|\g<type>)
        /ix,
        /
          (?<empty>^\s*|^\r\n|^\n|$|^\Z)|
          (?<organization>(?<=manifestazione organizzata da )(.+))|
          (?<wholedate>(?<=\s\-\s|\s\-\-\-\s|\s\s|^)(?<weekday>(dom|lun|mar|mer|gio|ven|sab)\D*\s)?((?<twodigitsep>(\d{1,2})(\/|-|\,|\s)){1,4}(?<month>\d{1,2}|(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic)\D*))(\/|-|\,|\s)(?<year>\d{2,4}))|
          (?<title>(?<roman>(([IXVMCDL]{1,6})(?<cardinal>°|ª|\^|�|\.o)?\s))(?<type>(Tr|Meeting|Gara|(?<special>region|distanze|campion))\D*\s)|(\d{1,2}(\g<cardinal>))|\g<type>)
        /ix,
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
        /(?<empty>^\s*\n|^\r\n|^\z)/i,
        /-{80}/,
        /(?<style>\s{3}-{3}\s{1,3}(?<distance>50|100|200|400|800|1500))\s(?<stroke>\w+)/i
#        /-{80}|^\s*|^\r\n|^\n|$|^\Z|\s{2,4}Atleta\s{20,24}Cat/i,
#        /\d{1,2}\s{2,3}\w\w|\s{2,4}Atleta\s{20,24}Cat|-{80}|^\s*|^\r\n|^\n|$|^\Z/i,
#        /\d{1,2}\s{2,3}\w\w|-{80}|^\s*|^\r\n|^\n|$|^\Z/i,
#        /\d{1,2}\s{2,3}\w\w|^\s*|^\r\n|^\n|$|^\Z/i
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
        /
          (?<empty>^\s*\n|^\r\n|^\z)|
          (?<relay>\s{3}-{3}\s{1,3}(Mistaffetta|Staffetta)\s\dx\d{2,4}\s\w)
        /ix
#        /-{80}|^\s*|^\r\n|^\n|$|^\Z|\s{2,4}Societ/i,
#        /\d{1,2}\s{2,3}\w\w|\s{2,4}Societ|-{80}|^\s*|^\r\n|^\n|$|^\Z/i,
#        /\d{1,2}\s{2,3}\w\w|-{80}|^\s*|^\r\n|^\n|$|^\Z/i,
#        /\d{1,2}\s{2,3}\w\w|^\s*|^\r\n|^\n|$|^\Z/i
      ]
    )
  end

  # "Team Ranking" (header) context type definition.
  #
  def context_type_team_ranking
    ContextTypeDef.new(
      :team_ranking,
      [
        /classifica(\s+di)?(\s+societ)/i
#        /(?<empty>^\s*\n|^\r\n|^\z)/i
      ]
    )
  end

  # "Statistics" (header) context type definition.
  #
  def context_type_stats
    ContextTypeDef.new(
      :stats,
      [
        /(statistiche(?!\ssocie.+)|statistica\sfinale)/i
#        /(?<empty>^\s*\n|^\r\n|^\z)/i
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
        /(?<timing>\d{1,2}\s\d\d\s\d\d)\s{1,2}+(?<score>\d{1,4}[\,|\.]\d\d)?/i
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
        /(?<=\(U25\)|\([A-Z]\))\s{1,2}(?<timing>\d{1,2}\s\d\d\s\d\d)\s{1,2}+/i
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
        /\s+(?<score>\d{1,6}[\,|\.]\d{2,3})\s+/i
      ],
      :team_ranking
    )
  end


  # "Statistics details section" context type definition, format type #1.
  #
  def context_type_stats_details_type1
    ContextTypeDef.new(
      :stats_details_1,
      [
        /\ssociet.\siscritte\s/i,
        /^.*/i,                                     # (anything)
        /\ssociet.\spartecipanti\s/i,
        /^.*/i,                                     # (anything)

        /\satleti\siscritti\s/i,
        /^.*/i,
        /^.*/i,                                     # (anything)

        /\satleti\spartecipanti\s/i,
        /^.*/i,
        /^.*/i,                                     # (anything)

        /\siscrizioni\salle\sgare\s/i,
        /\sgare\sdisputate\s/i,
        /^.*/i,
        /^.*/i,                                     # (anything)

        /\ssqualifiche\s/i,
      ],
      :stats
    )
  end

  # "Statistics details section" context type definition, format type #2.
  #
  def context_type_stats_details_type2
    ContextTypeDef.new(
      :stats_details_2,
      [
        /\ssociet\D\siscritte\s/i,
        /\ssociet\D\spresenti\s/i,
        /^.*/i,                                     # (anything)

        /\satleti\siscritti\s/i,
        /\satleti\spresenti\s/i,
        /\sPercentuale\sAssenti\s/i,
        /\sAtleta\sPresente\scon\suna\sgara\s/i,
        /^.*/i,                                     # (anything)

        /\sIscrizioni\sGare\s/i,
        /\sGare\sDisputate\s/i,
        /\sAssenza\sGare\s/i,
        /\sPercentuale\sGare\sNon\sDisputate\s/i,
        /^.*/i,                                     # (anything)

        /\sStaffette\sDisputate\s/i,
        /^.*/i,                                     # (anything)

        /\sSqualifiche\s/i,
        /\sRitiri\s/i
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
      context_type_stats_details_type1,
      context_type_stats_details_type2
    ]
  end
  # ----------------------------------------------------------------------------
  #++


  # "meeting_header.title" token extractor definition
  #
  def tokenizer_meeting_header_title
    TokenExtractor.new(
      :title,
      /((?<roman>(([IXVMCDL]{1,6})(?<cardinal>°|ª|\^|�|\.o)?\s))(?<type>(Tr|Meeting|Gara|(?<special>region|distanze|campion))\D*\s)|(\d{1,2}(\g<cardinal>))|\g<type>)/i,
      /$/i,
      4                                             # line_timeout
    )
  end

  # "meeting_header.meeting_dates" token extractor definition
  #
  def tokenizer_meeting_header_meeting_dates
    TokenExtractor.new(
      :meeting_dates,
      /(?<wholedate>(?<=\s\-\s|\s\-\-\-\s|\s\s|^)(?<weekday>(dom|lun|mar|mer|gio|ven|sab)\D*\s)?((?<twodigitsep>(\d{1,2})(\/|-|\,|\s)){1,4}(?<month>\d{1,2}|(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic)\D*))(\/|-|\,|\s)(?<year>\d{2,4}))/i,
      /(?<=\d{2})(?<separator>\s+\-{1,3}\s+|\s\s|$|\r|\n)/i,
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
      /\s*(stile|mi|do|ra|fa|sl|MX|DF|DS|RN)\D*/i,
      /\s*(maschi|femmi)/i
    )
  end

  # "category_header.gender" token extractor definition
  #
  def tokenizer_category_header_gender
    TokenExtractor.new(
      :gender,
      /\s*(maschi|femmi)/i,
      # Alt. vers.: /\s+(maschi|femmi)/ui
      /(\s+\-\s+categoria|\s{3}\-{3}(\Z|\n))/i
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
      /(\s+\-\s+categoria|\s{3}\-{3}(\Z|\n))/i
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
      /(\s+\-\s+categoria|\s{3}\-{3}(\Z|\n)|\smista\s{3}\-{3}|\smasch|\sfemm)/i
    )
  end

# TODO [BEGIN] #########################################################
# The following 2 are actually MISSING from the header and must be
# extracted from the detail:

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
# TODO [END] #########################################################
  # ----------------------------------------------------------------------------
  #++

  # "result_row.result_position" token extractor definition
  #
  def tokenizer_result_row_result_position
    TokenExtractor.new(
      :result_position,
      /fc|fg|\d{1,3}(?=\s{1,3})/i,
      /\s(?=[a-z]+)/i
    )
  end

  # "result_row.team_code" token extractor definition
  #
  def tokenizer_result_row_team_code
    TokenExtractor.new(
      :team_code,
      /(\w{3}-?\d{6})/i,
      /(?<=\w{3}\-\d{6}|\w{3}\d{6})\s/i
#      10                                            # (max size)
    )
  end

  # "result_row.swimmer_name" token extractor definition
  #
  def tokenizer_result_row_swimmer_name
    TokenExtractor.new(
      :swimmer_name,
      /(?<=fc\s|fc\s\s|fg\s|fg\s\s|\d\s|\d\s\s|\D{3}\-\d{6}\s|\D{3}\d{6}\s)(\D{22})\D*\s/i,
      /
        (?=
          (\s\d{4}\s\d\d\s(f|m)\s)|
          (\s\d{4}\s0\s(f|m)\s)|
          (\s(u|m)\s\d\d\s(f|m)\s)|
          (\s(u|m)\s\d\d)
          \s
        )
      /ix,                                          # x: free-format (ignore spaces)
    )
  end

  # "result_row.swimmer_year" token extractor definition
  #
  def tokenizer_result_row_swimmer_year
    TokenExtractor.new(
      :swimmer_year,
      /\s(?<year>\d{4}|(u|m)\s\d{1,2})(?=\s\d{1,2}\s|\s|(f|m)\s)/i,
      4                                             # (max size)
    )
  end

  # "result_row.team_name" token extractor definition
  #
  def tokenizer_result_row_team_name
    TokenExtractor.new(
      :team_name,
      /
        (?<=
          \s
          (\d{4}\s\d\d\s(f|m)\s)|
          (\d{4}\s0\s(f|m)\s)|
          ((u|m)\s\d\d\s(f|m)\s)|
          ((u|m)\s\d\d)
          \s
        )
        (?<teamname>(?!(f|m)\s)[\w0-9\.\'\s]{2,26})
      /ix,                                          # x: free-format (ignore spaces)
      25                                            # (max size)
    )
  end

  # "result_row.result_time" token extractor definition
  #
  def tokenizer_result_row_result_time
    TokenExtractor.new(
      :result_time,
      / (Ritir.*|Squal.*|\d{2}\s\d{2}\s\d{2})/i,
      8                                             # (max size)
    )
  end

  # "result_row.result_score" token extractor definition
  #
  def tokenizer_result_row_result_score
    TokenExtractor.new(
      :result_score,
      /\b(?<score>\d{1,4}[\,|\.]\d\d)(?=\s*(\D\D\s\(\D\d\d\))?(\r\n|\n|$|\Z))/i,
      /(?<=\d[\,|\.]\d\d)(\s|\r\n|\n|$|\Z)/i
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # "relay_row.result_position" token extractor definition
  #
  def tokenizer_relay_row_result_position
    TokenExtractor.new(
      :result_position,
      0,                                            # (starting idx)
      2                                             # (max size)
    )
  end

  # "relay_row.team_name" token extractor definition
  #
  def tokenizer_relay_row_team_name
    TokenExtractor.new(
      :team_name,
      /
        (?<=^\d\d\s|^\d\s\s)
        (?<teamname>[\w0-9\.\'\s]{2,26})
      /ix,
      25                                            # (max size)
    )
  end

  # "relay_row.category" token extractor definition
  #
  def tokenizer_relay_row_category
    TokenExtractor.new(
      :category,
      /(?<=\s)(?<category>\d{3}\s\(\D\))/i,
      7                                             # (max size)
    )
  end

  # "relay_row.result_time" token extractor definition
  #
  def tokenizer_relay_row_result_time
    TokenExtractor.new(
      :result_time,
      /
        (?<=\s\d{3}\s\(\D\)\s\s|\s\d{3}\s\(\D\)\s)
        (?<timing>Ritir.*|Squal.*|\d{2}\s\d{2}\s\d{2})
      /ix,
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
      /(?<rank>^\s?\d{1,2})(?=\s\s|\)\s)/i,
      /(?<=\d)(\)\s|°\s|\s\s)/i
    )
  end

  # "ranking_row.team_code" token extractor definition
  #
  def tokenizer_ranking_row_team_code
    TokenExtractor.new(
      :team_code,
      /(?<=\s)(?<teamcode>\w\w\w\d{6})(?=\s)/i,
      9                                             # (max size)
    )
  end

  # "ranking_row.team_name" token extractor definition
  #
  def tokenizer_ranking_row_team_name
    TokenExtractor.new(
      :team_name,
      /
        (?<=\s\s|\d\s)
        (?<teamname>.{2,31})
        (?=\s{1,5}[\w\.\s]{14,16}\s{1,5}\d{1,6}\,\d{1,3})
      /ix,
      30                                            # (max size)
    )
  end

  # "ranking_row.result_score" token extractor definition
  #
  def tokenizer_ranking_row_result_score
    TokenExtractor.new(
      :result_score,
      /(?<=\s\s)(?<score>\d{1,6}(?:\,|\.)\d{1,3})(?=\s\s)/i,
      /
        (?<=\d(?:\,|\.)\d\d\d|\d(?:\,|\.)\d\d|\d(?:\,|\.)\d)
        (\s\s)
      /ix
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
      tokenizer_relay_row_category,
      tokenizer_relay_row_result_time,
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
