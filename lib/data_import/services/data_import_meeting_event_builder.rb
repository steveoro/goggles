# encoding: utf-8

require 'common/format'
require 'data_import/services/data_import_entity_builder'
require 'data_import/services/data_import_meeting_session_builder'


=begin

= DataImportMeetingEventBuilder

  - Goggles framework vers.:  4.00.583
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 MeetingEvent entity rows.

=end
class DataImportMeetingEventBuilder < DataImportEntityBuilder

  # Searches for an existing MeetingEvent given the parameters, or it adds a new one,
  # if not found.
  #
  # This entity builder class does *not* rebuild any missing link in the meeting-data
  # hierachy tree.
  #
  # Note that <tt>meeting_session</tt> can only be an actual primary entity (MeetingSession)
  # and not a secondary one (DataImportMeetingSession)
  #
  # == Returns
  #   #result_id as:
  #     - positive when freshly added into MeetingEvent;
  #     - negative IDs only for already existing/commited rows in MeetingEvent;
  #     - 0 only on error/unable to process.
  #
  # === Basic Chain of existance:
  #
  #   Season
  #     -> Meeting
  #         -> MeetingSession (SwimmingPool)
  #
  # @raise ArgumentError unless <tt>meeting_session</tt> is a valid instance of MeetingSession.
  #
  def self.build_from_parameters( data_import_session, meeting_session, event_type,
                                  heat_type, event_order, begin_time, is_out_of_race )
    raise ArgumentError.new("'meeting_session' must be a valid instance of MeetingSession!") unless meeting_session.instance_of?( MeetingSession )
# DEBUG
#    puts "\r\nMeetingEvent -- build_from_parameters: #{meeting_session.inspect}"
    self.build( data_import_session ) do
      entity              MeetingEvent
                                                  # Search conditions:
      search do
        primary(
          meeting_session_id: meeting_session.id,
          event_type_id:      event_type.id,
          heat_type_id:       heat_type.id,
        )
        default_search
      end

      # This will override what is the default secondary entity ('DataImportMeetingEvent', which does not exist):
      entity_for_creation MeetingEvent

      attributes_for_creation(
        meeting_session_id: meeting_session.id,
        event_type_id:      event_type.id,
        heat_type_id:       heat_type.id,
        event_order:        event_order,
        begin_time:         begin_time,
        is_out_of_race:     is_out_of_race,
        is_autofilled:      true
      )

      if_not_found do
# DEBUG
#        puts "Creating a new MeetingEvent..."
        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
