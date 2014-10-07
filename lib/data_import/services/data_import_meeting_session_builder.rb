# encoding: utf-8

require 'common/format'
require 'data_import/services/data_import_entity_builder'


=begin

= DataImportMeetingSessionBuilder

  - Goggles framework vers.:  4.00.549
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 MeetingSession entity rows.

=end
class DataImportMeetingSessionBuilder < DataImportEntityBuilder

  # Searches for an existing MeetingSession given the parameters, or it adds a new one, if not found.
  #
  # Since Meetings data structure is deemed to be critical, the creation of a missing
  # meeting-session can be toggled by the dedicated flag.
  #
  def self.build_from_parameters( data_import_session, meeting_id,
                                  meeting_dates_text, scheduled_date,
                                  header_fields_dao, force_missing_meeting_creation )
# DEBUG
    puts "\r\nMeetingSession, build_from_parameters: meeting_id=#{meeting_id}, scheduled_date=#{scheduled_date}, header_fields_dao=#{header_fields_dao}"
    self.build( data_import_session ) do
      entity  MeetingSession

      set_up do
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
          ( meeting_id < 0 ? -meeting_id : meeting_id )
        ]
        secondary   [
          "(data_import_session_id = ?) AND (scheduled_date = ?) AND " +
          "(#{meeting_id < 0 ? '' : 'data_import_'}meeting_id = ?)",
          data_import_session.id, scheduled_date,
          ( meeting_id < 0 ? -meeting_id : meeting_id )
        ]
        default_search
# DEBUG
        puts "primary_search_ok!" if primary_search_ok?
        puts "secondary_search_ok!" if secondary_search_ok?
      end

      custom_logic do
        if primary_search_ok?
          fix_existing_invalid_meeting_session( @result_row )
        end
      end

      if_not_found do
# DEBUG
        puts "NOT found!"
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
            meeting_id:             meeting_id.to_i < 0 ? -meeting_id : nil,
            data_import_meeting_id: meeting_id.to_i < 0 ? nil : meeting_id
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
      logger.info( "Fixing meeting session empty description..." )
      @phase_1_log ||= ''
      @phase_1_log << "Fixing meeting session empty description...\r\n"
      meeting_session.description = meeting_session.get_order_with_date
      meeting_session.save!
    end
    meeting_session
  end
  #-- -------------------------------------------------------------------------
  #++
end
