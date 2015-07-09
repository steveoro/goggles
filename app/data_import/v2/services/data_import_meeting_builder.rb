# encoding: utf-8

require 'common/format'
require_relative '../../../data_import/v2/services/data_import_entity_builder'
require_relative '../../../data_import/v2/services/data_import_season_builder'


=begin

= DataImportMeetingBuilder

  - Goggles framework vers.:  4.00.737
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 Meeting entity rows.

=end
class DataImportMeetingBuilder < DataImportEntityBuilder

  # Searches for an existing Meeting given the parameters, or it adds a new one,
  # if not found.
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
  def self.build_from_parameters( data_import_session, season,
                                  header_fields_dao,
                                  meeting_header_row = nil,
                                  meeting_dates_text = nil,
                                  force_missing_meeting_creation = false )
# DEBUG
#    puts "\r\n- DataImportMeetingBuilder.build_from_parameters: #{header_fields_dao}"
    self.build( data_import_session ) do
      entity      Meeting

      set_up do                                   # Set the fields:
        @season = season
        if season.nil?
# DEBUG
#          puts "Searching a missing Season..."
          @season = DataImportSeasonBuilder.build_from_parameters(
            data_import_session,
            header_fields_dao.header_date,
            1, # season_type_id
            0, # edition
            force_missing_meeting_creation
          ).result_row
        end

        if meeting_header_row
          @title        = meeting_header_row[:fields][:title]
          @organization = meeting_header_row[:fields][:organization]
          @notes        = (meeting_dates_text ? "#{meeting_dates_text}\r\n" : '') +
                          (@organization ? "#{@organization}" : '')
        end
        @description = ( @title ? @title : "#{header_fields_dao.code_name } (#{Format.a_date(header_fields_dao.header_date)})" )
      end
                                                  # Search conditions:
      search do
        primary    [
          "(header_date = ?) AND (code = ?) AND (season_id = ?)",
          header_fields_dao.header_date, header_fields_dao.code_name,
          # The following check allows us to forcibly fail the primary search when
          # there's a recognized secondary entity already:
          ( @season.instance_of?(Season) ? @season.id : 0 )
        ]
        secondary  [
          "(data_import_session_id = ?) AND (header_date = ?) AND (code = ?) AND " +
          "(#{ @season.instance_of?(Season) ? '' : 'data_import_' }season_id = ?)",
          data_import_session.id, header_fields_dao.header_date, header_fields_dao.code_name,
          @season.id
        ]
        default_search
      end

      attributes_for_creation(
        data_import_session_id: data_import_session.id,
        import_text:            meeting_header_row.instance_of?(Hash) ? meeting_header_row[:import_text] : '-',
        description:            @description,
        # [Steve, 20131025] No default value for this one:
#       entry_deadline:         header_fields_dao.header_date - 14, # (This is just a guess)
        are_results_acquired:   true,
        is_under_25_admitted:   true, # (This is just a guess)
        configuration_file:     header_fields_dao.full_pathname,
        header_date:            header_fields_dao.header_date,
        code:                   header_fields_dao.code_name,
        header_year:            header_fields_dao.header_year,
        edition:                header_fields_dao.edition, # (This is just a guess)
        edition_type_id:        header_fields_dao.edition_type_id,
        timing_type_id:         header_fields_dao.timing_type_id,
        # TODO/FUTURE DEV:
#       individual_score_computation_type_id: 0,
#       relay_score_computation_type_id: 0,
#       team_score_computation_type_id: 0,
        notes:                  @notes,
        season_id:              @season.instance_of?(Season)           ? @season.id : nil,
        data_import_season_id:  @season.instance_of?(DataImportSeason) ? @season.id : nil,
        user_id:                1 # (don't care)
      )

      if_not_found do
        if force_missing_meeting_creation
# DEBUG
#          puts "Creating a new DataImportMeeting..."
          add_new
        else
          raise "Matching Meeting NOT found but meeting-data creation is disabled!"
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
