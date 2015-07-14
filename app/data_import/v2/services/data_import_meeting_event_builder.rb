# encoding: utf-8

require 'common/format'
require_relative '../../../data_import/v2/services/data_import_entity_builder'
require_relative '../../../data_import/v2/services/data_import_meeting_session_builder'


=begin

= V2::DataImportMeetingEventBuilder

  - Goggles framework vers.:  4.00.633
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 MeetingEvent entity rows.

=end
class V2::DataImportMeetingEventBuilder < V2::DataImportEntityBuilder

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
#    puts "- event_order: #{event_order.inspect}"
#    puts "- begin_time:  #{begin_time.inspect}"
#    puts "- event_type:  #{event_type.inspect}"
#    puts "- heat_type:   #{heat_type.inspect}"
    self.build( data_import_session ) do
      entity              MeetingEvent

      set_up do
        @possible_meeting_session_ids = MeetingSession.where( meeting_id: meeting_session.meeting_id ).map{ |ms| ms.id }
# DEBUG
#        puts "\r\n- @possible_meeting_session_ids: #{@possible_meeting_session_ids.inspect}"
      end
                                                  # Search conditions:
      search do
        primary(
          meeting_session_id: @possible_meeting_session_ids,
          event_type_id:      event_type.id,
          heat_type_id:       heat_type.id
        )
        default_search
      end

      # This will override what is the default secondary entity ('DataImportMeetingEvent', which does not exist):
      entity_for_creation MeetingEvent

      attributes_for_creation(
        # [Steve, 201412] We'll always create a missing MeetingEvents using the default
        # MeetingSession, since we have no way of knowing which one is right among all
        # the possibile values:
        meeting_session_id: meeting_session.id,
        event_type_id:      event_type.id,
        heat_type_id:       heat_type.id,
        event_order:        event_order,
        begin_time:         begin_time,
        is_out_of_race:     is_out_of_race,
        is_autofilled:      true,
        user_id:            1 # don't care
      )

      if_not_found do
# DEBUG
#        puts "NOT found! Creating a new MeetingEvent..."
#        puts "- meeting_session.id: #{meeting_session.id}"
        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
