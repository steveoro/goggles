# encoding: utf-8

require_relative '../../data_import/v2/context_type_def'
require_relative '../../data_import/v2/services/token_extractor'


=begin

= V2::FinResultConsts

  - Goggles framework vers.:  4.00.711
  - author: Steve A.

 Container module that stores all the common definitions
 included by the parsing classes for processing text data files of the type
 'fin_result' (either layout 'FIN' or 'FIN2').

 Each member object defines several RegExp that relay directly to this
 specific kind of text file and will be most certainly useless for other
 layouts.

=end
module V2::Fin2ResultConsts                             # == HEADER CONTEXT TYPES definitions: ==
  extend ActiveSupport::Concern

  # "Meeting Header" context type definition.
  def context_type_meeting_header
    V2::ContextTypeDef.new(
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
    V2::ContextTypeDef.new(
      :event_individual,
      [
#        /(?<anything>^.*)/i,
#        /(?<empty>^\s*\n|^\r\n|^\z)/i,
        /-{60}/,
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
    V2::ContextTypeDef.new(
      :event_relay,
      [
        /(Mistaffetta|Staffetta)/
#        /Torna a inizio pagina|^\s*|^\r\n|^\n|$|^\Z/i,
#        /(Mistaffetta|Staffetta)\s\dx\d{2,4}\s\w|-{80}/,
#        /
#          (?<empty>^\s*\n|^\r\n|^\z)|
#          (?<relay>\s{3}-{3}\s{1,3}(Mistaffetta|Staffetta)\s\dx\d{2,4}\s\w)
#        /ix
#       OLD 2nd line above was: (?<empty>^\s*\n|^\r\n|^\z)|

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
    V2::ContextTypeDef.new(
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
    V2::ContextTypeDef.new(
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
    V2::ContextTypeDef.new(
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
    V2::ContextTypeDef.new(
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
    V2::ContextTypeDef.new(
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
    V2::ContextTypeDef.new(
      :stats_details_1,
      [
        /\ssociet.\siscritte\s/i,
        /(?<anything>^.*)/i,
        /\ssociet.\spartecipanti\s/i,
        /(?<anything>^.*)/i,

        /\satleti\siscritti\s/i,
        /(?<anything>^.*)/i,
        /(?<anything>^.*)/i,

        /\satleti\spartecipanti\s/i,
        /(?<anything>^.*)/i,
        /(?<anything>^.*)/i,

        /\siscrizioni\salle\sgare\s/i,
        /\sgare\sdisputate\s/i,
        /(?<anything>^.*)/i,
        /(?<anything>^.*)/i,

        /\ssqualifiche\s/i,
      ],
      :stats
    )
  end

  # "Statistics details section" context type definition, format type #2.
  #
  def context_type_stats_details_type2
    V2::ContextTypeDef.new(
      :stats_details_2,
      [
        /\ssociet\D\siscritte\s/i,
        /\ssociet\D\spresenti\s/i,
        /(?<anything>^.*)/i,

        /\satleti\siscritti\s/i,
        /\satleti\spresenti\s/i,
        /\sPercentuale\sAssenti\s/i,
        /\sAtleta\sPresente\scon\suna\sgara\s/i,
        /(?<anything>^.*)/i,

        /\sIscrizioni\sGare\s/i,
        /\sGare\sDisputate\s/i,
        /\sAssenza\sGare\s/i,
        /\sPercentuale\sGare\sNon\sDisputate\s/i,
        /(?<anything>^.*)/i,

        /\sStaffette\sDisputate\s/i,
        /(?<anything>^.*)/i,

        /\sSqualifiche\s/i,
        /\sRitiri\s/i
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
    V2::TokenExtractor.new(
      :title,
      /((?<roman>(([IXVMCDL]{1,6})(?<cardinal>°|ª|\^|�|\.o)?\s))(?<type>(Tr|Meeting|Gara|(?<special>region|distanze|campion))\D*\s)|(\d{1,2}(\g<cardinal>))|\g<type>)/i,
      /$/i,
      4                                             # line_timeout
    )
  end

  # "meeting_header.meeting_dates" token extractor definition
  #
  def tokenizer_meeting_header_meeting_dates
    V2::TokenExtractor.new(
      :meeting_dates,
      /(?<wholedate>(?<=\s\-\s|\s\-\-\-\s|\s\s|^)(?<weekday>(dom|lun|mar|mer|gio|ven|sab)\D*\s)?((?<twodigitsep>(\d{1,2})(\/|-|\,|\s)){1,4}(?<month>\d{1,2}|(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic)\D*))(\/|-|\,|\s)(?<year>\d{2,4}))/i,
      /(?<=\d{2})(?<separator>\s+\-{1,3}\s+|\s\s|$|\r|\n)/i,
      4                                             # line_timeout
    )
  end

  # "meeting_header.organization" token extractor definition
  #
  def tokenizer_meeting_header_organization
    V2::TokenExtractor.new(
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
      /\s*(stile|mi|do|ra|fa|sl|MX|DF|DS|RN)\D*/i,
      /\s*(maschi|femmi)/i
    )
  end

  # "category_header.gender" token extractor definition
  #
  def tokenizer_category_header_gender
    V2::TokenExtractor.new(
      :gender,
      /\s*(maschi|femmi)/i,
      /(?<=ile|chi|ine)(\s+\-{3}|\s+\-\s+categoria)/i
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
      /(?<=ile|chi|ine|ero|sta|sti)(\s+\-{3}|\s+\-\s+categoria)/i
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
      /(
        (\s+\-\s+categoria)|
        (\s{3}\-{3}(\n|$)|\smista(\n|$|\s{3}\-{3})|\smasch|\sfemm)
      )/ix
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # "result_row.result_position" token extractor definition
  #
  def tokenizer_result_row_result_position
    V2::TokenExtractor.new(
      :result_position,
      /fc|fg|\d{1,3}(?=\s{1,3})/i,
      /\s(?=[a-z]+)/i
    )
  end

  # "result_row.team_code" token extractor definition
  #
  def tokenizer_result_row_team_code
    V2::TokenExtractor.new(
      :team_code,
      /(?<team_code>\w{3}\-.\d{5}|\w{3}.\d{5})\s/i,
#      /(?<=\w{3}\-.\d{5}|\w{3}.\d{5}\s)/i
      9                                             # (max size)
    )
  end

  # "result_row.swimmer_name" token extractor definition
  #
  def tokenizer_result_row_swimmer_name
    V2::TokenExtractor.new(
      :swimmer_name,
      /(?<=fc\s|fc\s\s|fg\s|fg\s\s|\d\s|\d\s\s|\D{3}\-.\d{5}\s|\D{3}.\d{5}\s)(\D{22})\D*\s/i,
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
    V2::TokenExtractor.new(
      :swimmer_year,
      /\s(?<year>\d{4}|(u|m)\s\d{1,2})(?=\s\d{1,2}\s|\s|(f|m)\s)/i,
      /(?<=\d{3}\s0|\d{2}\s\d{2}|\s(u|m)\s\d{2})(?<end>\s.)/i
#      /(?<=\d{3}\s0\s|\d{2}\s\d{2}\s|\s(u|m)\s\d{2}\s)(?<end>\D)/i
#      4                                             # (max size)
    )
  end

  # "result_row.team_name" token extractor definition
  #
  def tokenizer_result_row_team_name
    V2::TokenExtractor.new(
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
    V2::TokenExtractor.new(
      :result_time,
      / (Ritir.*|Squal.*|\d{2}\s\d{2}\s\d{2})/i,
      8                                             # (max size)
    )
  end

  # "result_row.result_score" token extractor definition
  #
  def tokenizer_result_row_result_score
    V2::TokenExtractor.new(
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
    V2::TokenExtractor.new(
      :result_position,
      0,                                            # (starting idx)
      2                                             # (max size)
    )
  end

  # "relay_row.team_name" token extractor definition
  #
  def tokenizer_relay_row_team_name
    V2::TokenExtractor.new(
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
    V2::TokenExtractor.new(
      :category,
      /(?<=\s)(?<category>\d{2,3}\s\((\D|U25)\))/i,
      7                                             # (max size)
    )
  end

  # "relay_row.result_time" token extractor definition
  #
  def tokenizer_relay_row_result_time
    V2::TokenExtractor.new(
      :result_time,
      /
        (?<=\s\d{3}\s\(\D\)\s|\s\d{2}\s\(U25\)\s)
        \s?
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
    V2::TokenExtractor.new(
      :result_position,
      /(?<rank>^\s?\d{1,2})(?=\s\s|\)\s)/i,
      /(?<=\d)(\)\s|°\s|\s\s)/i
    )
  end

  # "ranking_row.team_code" token extractor definition
  #
  def tokenizer_ranking_row_team_code
    V2::TokenExtractor.new(
      :team_code,
      /(?<=\s)(?<teamcode>\w{3}.\d{5})(?=\s)/i,
      9                                             # (max size)
    )
  end

  # "ranking_row.team_name" token extractor definition
  #
  def tokenizer_ranking_row_team_name
    V2::TokenExtractor.new(
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
    V2::TokenExtractor.new(
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
      tokenizer_relay_header_type,
      tokenizer_relay_header_distance,
      tokenizer_relay_header_style,
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
