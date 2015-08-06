# encoding: utf-8

require_relative '../../data_import/v3/dao/context_type'
require_relative '../../data_import/v3/services/token_extractor'


=begin

= V3::FinResultConsts

  - Goggles framework vers.:  4.00.749
  - author: Steve A.819

 Container module that stores all the common definitions
 included by the parsing classes for processing text data files of the type
 'fin_startlist' (either layout 'FIN' or 'FIN2').

 Each member object defines several RegExp that relay directly to this
 specific kind of text file and will be most certainly useless for other
 layouts.

=end
module V3::FinStartListConsts                           # == HEADER CONTEXT TYPES definitions: ==
  extend ActiveSupport::Concern

  # "Meeting Header" context type definition.
  def context_type_meeting_header
    V3::ContextType.new(
      :meeting_header,
      conditions: [
        /(\s*(Distanze speciali|((\d{1,3}\D{1,2}|[IXVMCDL]{1,8})\s(\S+|Trof|Region))))|(\d{1,2}((\/|-|\,)\d{1,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})/i,
        /(\s*Manifestazione organizzata da)|(\s*(Distanze speciali|((\d{1,3}\D{1,2}|[IXVMCDL]{1,8})\s(\S+|Trof|Region))))/i,
        /(\d{1,2}((\/|-|\,)\d{1,2})*\s(gen|feb|mar|apr|mag|giu|lug|ago|set|ott|nov|dic).*\s\d{4})|(\s*Manifestazione organizzata da)|/i
      ],
      line_timeout: 4
    )
  end

  # "Event Individual" context type definition.
  #
  def context_type_event_individual
    V3::ContextType.new(
      :event_individual,
      conditions: [
        /(?<=^)(?<length_in_meters>50|100|200|400|800|1500)\s{1,2}(?<stroke_type>stile|misti|dorso|rana|farf|SL|DO|RA|FA|MI|MX|DF|DS|RN)(?=$|\Z|\n|\r|\0)/ui,
        /(?<empty>^\s*|^\r\n|^\n|$|^\Z)/
      ]
    )
  end
                                                    # == DETAIL CONTEXT TYPES definitions: ==
  # "Entry row" (detail) context type definition.
  #
  def context_type_entry_row
    V3::ContextType.new(
      :entry_row,
      conditions: [
        /(?<=\s)(?<timing>\d{1,2}['\.\:\s]\d\d["\.\:\s]\d\d)/ui
      ],
      parent_context_name: :event_individual
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # Returns the list of all the V3::ContextTypes member objects defined.
  # (Commodity method used only inside specs.)
  def get_context_types_list
    [
      context_type_meeting_header,
      context_type_event_individual,
      context_type_entry_row
    ]
  end
  # ----------------------------------------------------------------------------
  #++


  # "meeting_header.title" token extractor definition
  #
  def tokenizer_meeting_header_title
    V3::TokenExtractor.new(
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
    V3::TokenExtractor.new(
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
    V3::TokenExtractor.new(
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
  def tokenizer_event_individual_distance
    V3::TokenExtractor.new(
      :distance,
      /(?<!\dx)(50|100|200|400|800|1500)\s+/i,
      /\s+(stile|mi|do|ra|fa|sl|MX|DF|DS|RN).*/i
    )
  end

  # "category_header.style" token extractor definition
  #
  def tokenizer_event_individual_style
    V3::TokenExtractor.new(
      :style,
      /\s*(stile|mi|do|ra|fa|sl|MX|DF|DS|RN).*/i,
      /\s*(maschi|femmi)/i
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # "entry_row.entry_order" token extractor definition
  #
  def tokenizer_entry_row_entry_order
    V3::TokenExtractor.new(
      :entry_order,
      /\s*\d{1,3}(?= {1,3})/i,
      /\s(?=[a-z]+)/i
    )
  end

  # "entry_row.swimmer_name" token extractor definition
  #
  def tokenizer_entry_row_swimmer_name
    V3::TokenExtractor.new(
      :swimmer_name,
      /
        (?<=\d\s)
        \s*
        (?<swimmer_name>\D{25,28})
        \D*
        (?=\s)
      /uix,
      /
        \s
        ((?<gender>m|f)\s\s)?
        (?<year>
          \d{4}|
          (u|m)\s\d{1,2}|
          (u|m)\d{1,2}
        )
        (?=\s\d{1,2}\s|\s|(f|m)\s)
      /uix
    )
  end

  # "entry_row.category_group" token extractor definition
  #
  def tokenizer_entry_row_category_group
    V3::TokenExtractor.new(
      :category_group,
      /\s
        (?<year>
          \d{4}|
          (u|m)\s\d{1,2}|
          (u|m)\d{1,2}
        )
        (?=\s\d{1,2}\s|\s|(f|m)\s)
      /ix,
      /(?<=\d{4}\s|\d{2}\s\d{2}|\s(u|m)\s\d{2}|\s(u|m)\d{2}\s)(?<end>\s.)/i
    )
  end

  # "entry_row.team_name" token extractor definition
  #
  def tokenizer_entry_row_team_name
    V3::TokenExtractor.new(
      :team_name,
      /
        (?<=\d\d\s)
        \s*
        (?<team_name>.{25,36})
        \s*
        (?=(?<timing>\d{1,2}['\.\:\s]\d\d["\.\:\s]\d\d))
      /uix,
      /(?<timing>\s\d{1,2}['\.\:\s]\d\d["\.\:\s]\d\d)/i
    )
  end

  # "entry_row.entry_time" token extractor definition
  #
  def tokenizer_entry_row_entry_time
    V3::TokenExtractor.new(
      :entry_time,
      /(?<timing>\d{1,2}['\.\:\s]\d\d["\.\:\s]\d\d)/i,
      8                                             # (max size)
    )
  end
  # ----------------------------------------------------------------------------
  #++

  # Returns the list of all the V3::TokenExtractor object members defined.
  # (Commodity method used only inside specs.)
  def get_tokenizers_list
    [
      tokenizer_meeting_header_title,
      tokenizer_meeting_header_meeting_dates,
      tokenizer_meeting_header_organization,

      tokenizer_event_individual_distance,
      tokenizer_event_individual_style,

      tokenizer_entry_row_entry_order,
      tokenizer_entry_row_swimmer_name,
      tokenizer_entry_row_category_group,
      tokenizer_entry_row_team_name,
      tokenizer_entry_row_entry_time
    ]
  end
  # ----------------------------------------------------------------------------
  #++
end
