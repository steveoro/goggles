# encoding: utf-8

require 'common/format'
require_relative '../../../data_import/v2/services/data_import_entity_builder'
require_relative '../../../data_import/v2/services/data_import_meeting_builder'


=begin

= V2::DataImportMeetingSessionBuilder

  - Goggles framework vers.:  4.00.737
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 MeetingSession entity rows.

=end
class V2::DataImportMeetingSessionBuilder < V2::DataImportEntityBuilder

  # Searches for an existing MeetingSession given the parameters, or it adds a new one, if not found.
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
  def self.build_from_parameters( data_import_session, meeting,
                                  header_fields_dao,
                                  meeting_dates_text,
                                  scheduled_date,
                                  force_missing_meeting_creation = false )
# DEBUG
#    puts "\r\nMeetingSession -- build_from_parameters: meeting=#{meeting.inspect}, scheduled_date=#{scheduled_date}, #{header_fields_dao}"
    self.build( data_import_session ) do
      entity  MeetingSession

      set_up do
        @meeting = meeting
        if meeting.nil?
# DEBUG
#          puts "Searching a missing Meeting..."
          @meeting = V2::DataImportMeetingBuilder.build_from_parameters(
            data_import_session,
            nil,  # season
            header_fields_dao,
            nil,
            meeting_dates_text,
            force_missing_meeting_creation
          ).result_row
        end
        @description = "#{I18n.t(:meeting_session, { scope: [:activerecord, :models] })} #1"
        @warm_up_time  = Time.utc(
          scheduled_date.year, scheduled_date.month, scheduled_date.day,
          7, 30                                         # (UTC time)
        )
        @begin_time  = Time.utc(
          scheduled_date.year, scheduled_date.month, scheduled_date.day,
          8, 00                                         # (UTC time)
        )
      end

      search do
        primary     [
          "(scheduled_date = ?) AND (meeting_id = ?)",
          scheduled_date,
          # The following check allows us to forcibly fail the primary search when
          # there's a recognized secondary entity already:
          ( @meeting.instance_of?(Meeting) ? @meeting.id : 0 )
        ]
        secondary   [
          "(data_import_session_id = ?) AND (scheduled_date = ?) AND " +
          "(#{@meeting.instance_of?(Meeting) ? '' : 'data_import_'}meeting_id = ?)",
          data_import_session.id, scheduled_date,
          @meeting.id
        ]
        default_search
# DEBUG
#        puts "primary_search_ok!" if primary_search_ok?
#        puts "secondary_search_ok!" if secondary_search_ok?
      end

      custom_logic do
        if primary_search_ok?
          V2::DataImportMeetingSessionBuilder.fix_existing_invalid_meeting_session( @result_row )
        end
      end

      if_not_found do
# DEBUG
#        puts "NOT found! meeting ID=#{@meeting.id}"
        if force_missing_meeting_creation           # Get swimming_pool first:
          swimming_pool = SwimmingPool.where([
            "(nick_name LIKE ?)", "#{header_fields_dao.code_name }%"
          ]).first

          attributes_for_creation(
            data_import_session_id: data_import_session.id,
            import_text:            meeting_dates_text.instance_of?(String) && meeting_dates_text.size > 0 ? meeting_dates_text : '-',
            scheduled_date:         scheduled_date,
            warm_up_time:           @warm_up_time,
            begin_time:             @begin_time,
            description:            @description,
            # FIXME We are unable to process more than 1 session from the results,
            #       but this is far from correct:
            session_order:          1,
            user_id:                1, # (don't care)
            swimming_pool_id:       swimming_pool ? swimming_pool.id : nil,
            day_part_type_id:       DayPartType::MORNING_ID,
            meeting_id:             @meeting.instance_of?(Meeting)           ? @meeting.id : nil,
            data_import_meeting_id: @meeting.instance_of?(DataImportMeeting) ? @meeting.id : nil
          )
          add_new
        else
          raise "Matching Meeting NOT found but meeting structure creation is disabled!"
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Checks if a meeting_session instance is invalid (validation usually fails for
  # a missing description) and fixes it.
  #
  def self.fix_existing_invalid_meeting_session( meeting_session )
    # [Steve, bugfix 2013115]: Make sure that the pre-existing meeting session
    # doesn't have an empty description:
    if meeting_session.instance_of?(MeetingSession) && meeting_session.description.to_s.empty?
#      logger.info( "Fixing meeting session empty description..." )
#      @phase_1_log ||= ''
#      @phase_1_log << "Fixing meeting session empty description...\r\n"
      meeting_session.description = meeting_session.get_order_with_date
      meeting_session.save!
    end
    meeting_session
  end
  #-- -------------------------------------------------------------------------
  #++
end
