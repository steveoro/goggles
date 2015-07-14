# encoding: utf-8

require 'common/format'
require_relative '../../../data_import/v2/services/data_import_entity_builder'


=begin

= V2::DataImportSeasonBuilder

  - Goggles framework vers.:  4.00.583
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 Season entity rows.

=end
class V2::DataImportSeasonBuilder < V2::DataImportEntityBuilder

  # Searches for an existing Season given the parameters, or it adds a new one,
  # when not found.
  #
  # == Parameters:
  #
  # - <tt>header_date</tt> can either be the actual Date instance parsed from the
  #   filename of the datafile, or the unparsed, source text token (from the filename)
  #   containing the date of the meeting results being parsed.
  #   This parameter will yield the values for the current season and its fields,
  #   assuming the date falls into the most common range defining an academic year
  #   (which is from the start of September for the starting year until the following
  #    September of the next year).
  #
  # - <tt>season_type_id</tt>, when not specified, is assumed to be ID=1 (code: 'MASFIN')
  #
  # - <tt>edition</tt>, when not specified, is assumed to be 0.
  #
  # - <tt>force_missing_meeting_creation</tt>, false when not specified.
  #
  # Since Meetings data structure is deemed to be critical, the creation of any missing
  # link in the meeting data structure can be toggled by the dedicated flag.
  #
  # When enabled, this implementation searches and/or recreates also any missing row
  # up the season (included).
  #
  # === Basic Chain of existance:
  #
  #   Season
  #     -> Meeting
  #         -> MeetingSession (SwimmingPool)
  #             -> MeetingEvent
  #                 -> MeetingProgram
  #                     -> MeetingIndividualResult (Team, Swimmer, Badge)
  #                     -> MeetingRelayResult (Team)
  #         -> MeetingTeamScore (Team)
  #
  def self.build_from_parameters( data_import_session, header_date,
                                  season_type_id = 1, edition = 0,
                                  force_missing_meeting_creation = false )
# DEBUG
#    puts "\r\nSeason -- build_from_parameters: #{header_date}, season_type: #{season_type_id}, edition: #{edition}"
    self.build( data_import_session ) do
      entity            Season

      set_up do                                   # Set the fields:
        @header_date    = header_date.kind_of?(Date) ?
                          header_date : ( header_date.instance_of?(String) ? Date.parse( header_date ) : Date.today )
        @description    = I18n.t( 'admin_import.missing_data_warning' )
        year            = @header_date.month < 9 ? @header_date.year - 1 : @header_date.year
        # FIXME This is an approximation, it should include most of the seasons:
        @begin_date     = "#{year}-09-01" # Date.parse( "#{year}-09-01" )
        @end_date       = "#{year + 1}-09-01" # Date.parse( "#{year + 1}-08-30" )
        @header_year    = "#{year}/#{year+1}" # "#{@begin_date.year}/#{@end_date.year}",
        @season_type_id = season_type_id
        @edition        = edition
      end
                                                  # Search phase:
      search do
        primary    [
          "(season_type_id = ?) AND (begin_date >= ?) AND (end_date <= ?)",
          @season_type_id, @begin_date, @end_date
        ]
        secondary  [
          "(data_import_session_id = ?) AND (season_type_id = ?) AND (begin_date >= ?) AND (end_date <= ?)",
          data_import_session.id, @season_type_id, @begin_date, @end_date
        ]
        default_search
      end

      attributes_for_creation(
        data_import_session_id: data_import_session.id,
        import_text:            @header_date,
        description:            @description,
        begin_date:             @begin_date,
        end_date:               @end_date,
        season_type_id:         @season_type_id,
        header_year:            @header_year,
        edition:                @edition
      )

      if_not_found do
        if force_missing_meeting_creation
# DEBUG
#          puts "Creating a new DataImportSeason..."
          add_new
        else
          raise "Matching Season NOT found but meeting-data creation is disabled!"
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
