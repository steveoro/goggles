# encoding: utf-8

require 'fileutils'
require 'common/format'
require 'common/encoding_tools'

require_relative '../../../data_import/v3/dao/context_type'
require_relative '../../../data_import/v3/fin_result_defs'
require_relative '../../../data_import/v3/fin2_result_defs'
require_relative '../../../data_import/v3/fin_startlist_defs'

require_relative '../../../data_import/v3/strategies/fin_result_parser'
# require_relative '../../../data_import/v3/strategies/csi_result_parser'


=begin

= V3::FileFormatParser

  - Goggles framework vers.:  4.00.823
  - author: Steve A.

 Strategy class dedicated to detect which format a data-import text file
 belongs to.

=== Typical usage:

    parsing_defs = V3::FileFormatParser.new( full_pathname ).parse

=end
class V3::FileFormatParser


  # V3::ContextType definition for detecting "FIN result"-type files.
  FIN1_RESULT_TYPEDEF = V3::ContextType.new(
    :fin_result,
    conditions: [
      /^\s*|\r\n|\n|$|\Z/i,
      /(50\s|100\s|200\s|400\s|800\s|1500\s) *(stile|misti|dorso|rana|farf|SL|DO|RA|FA|MI|MX|DF|DS|RN).*(maschi|femmi)/i,
      /-{80}/,
      /(\d{1,2}'\d\d"\d\d) +\d{1,4}[\,|\.]\d\d(\r\n|\n|$|\Z)/i
    ]
  )

  # V3::ContextType definition for detecting "FIN2 result"-type files.
  FIN2_RESULT_TYPEDEF = V3::ContextType.new(
    :fin2_result,
    conditions: [
      /^\s*|^\r\n|^\n|$|^\Z/i,
      /-{80}/,
      /\s{3}-{3}\s{1,3}4x|50\s|100\s|200\s|400\s|800\s|1500\s/i,
      /-{80}|^\s*|^\r\n|^\n|$|^\Z|\s{2,4}Atleta\s{20,24}Cat/i,
      /\d{1,2}\s{2,3}\w\w|\s{2,4}Atleta\s{20,24}Cat|-{80}|^\s*|^\r\n|^\n|$|^\Z/i,
      /\d{1,2}\s{2,3}\w\w|-{80}|^\s*|^\r\n|^\n|$|^\Z/i,
      /\d{1,2}\s{2,3}\w\w|^\s*|^\r\n|^\n|$|^\Z/i
    ]
  )

  # V3::ContextType definition for detecting "FIN starting list"-type files.
  FIN1_STARTLIST_TYPEDEF = V3::ContextType.new(
    :fin_startlist,
    conditions: [
      /^\s*|^\r\n|^\n|$|^\Z/i,
      /(?<timing>\d{1,2}['\.\:\s]\d\d["\.\:\s]\d\d)(?=\s\n|\s\r|\s$|\r|\n|$)/i,
      /(?<timing>\d{1,2}['\.\:\s]\d\d["\.\:\s]\d\d)(?=\s\n|\s\r|\s$|\r|\n|$)/i
    ]
  )

  # V3::ContextType definition for detecting "CSI result list"-type files.
  CSI_RESULT_TYPEDEF = V3::ContextType.new(
    :csi_result,
    conditions: [
      /^nome\,c,\d+;anno\,n,\d+/ui,
      /\w+\s+\w+;\d{4};/ui
    ]
  )
  #-- -------------------------------------------------------------------------
  #++


  attr_reader :parsing_defs, :content_parser


  # Creates a new instance.
  def initialize( full_pathname )
    @full_pathname = full_pathname
    parse
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Parses the text lines from the filename to detect which V3::TxtResultDefs instance
  # has to be used to perform the actual parsing of the whole file.
  #
  # This works on the assumption that, in order to recognize all of the possible
  # data-import text file formats, suffice is to read a few lines of the file itself from the
  # beginning of it.
  #
  # == Returns:
  # - a V3::TxtResultDefs sibling class instance, depending on the type of the file,
  #   or +nil+, when the file type is not recognized.
  #
  def parse()
    result = nil
    line_count = 0
    detector_fin1_res = V3::ContextDetector.new( FIN1_RESULT_TYPEDEF )
    detector_fin2_res = V3::ContextDetector.new( FIN2_RESULT_TYPEDEF )
    detector_fin1_sta = V3::ContextDetector.new( FIN1_STARTLIST_TYPEDEF )
    detector_csi_res  = V3::ContextDetector.new( CSI_RESULT_TYPEDEF )

    File.open( @full_pathname ) do |f|
      f.each_line do |curr_line|                    # Make sure each line has a valid UTF-8 sequence of characters:
        curr_line = EncodingTools.force_valid_encoding( curr_line )
        line_count += 1
                                                    # While reading the file line by line, detect the type:
        if detector_fin1_res.feed_and_detect( curr_line, line_count, nil )
          @parsing_defs   = V3::FinResultDefs.new()
          @content_parser = V3::FinResultParser.new( @full_pathname, @parsing_defs )
          break                                     # Break as soon as we have a match (FIFO wins)

        elsif detector_fin2_res.feed_and_detect( curr_line, line_count, nil )
          @parsing_defs   = V3::Fin2ResultDefs.new()
          @content_parser = V3::FinResultParser.new( @full_pathname, @parsing_defs )
          break

        elsif detector_fin1_sta.feed_and_detect( curr_line, line_count, nil )
          @parsing_defs   = V3::FinStartListDefs.new()
          @content_parser = V3::FinResultParser.new( @full_pathname, @parsing_defs )
          break

        elsif detector_csi_res.feed_and_detect( curr_line, line_count, nil )
          # TODO Adapt CsiResultParser
          @parsing_defs = nil
          @content_parser = nil
          break

        else
          nil
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
