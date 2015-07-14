# encoding: utf-8

require 'common/format'
require_relative '../../../data_import/v2/strategies/result_time_parser'
require_relative '../../../data_import/v2/services/data_import_entity_builder'
require_relative '../../../data_import/v2/services/data_import_time_standard_builder'
require_relative '../../../data_import/v2/dao/csi_result_dao'


=begin

= V2::DataImportMeetingProgramBuilder

  - Goggles framework vers.:  4.00.757
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 MeetingProgram entity rows.

=end
class V2::DataImportMeetingProgramBuilder < V2::DataImportEntityBuilder

  # Searches for an existing MeetingProgram given the parameters, or it adds a new one,
  # if none are found.
  #
  # This entity builder class does *not* rebuild any missing link in the meeting-data
  # hierachy tree.
  #
  # In order to find an existing MeetingProgram, the corresponding MeetingEvent must
  # exist and point to the specified MeetingSession. Otherwise a (secondary) DataImportMeetingProgram
  # row will be created and the corresponding MeetingEvent creation will be delegated
  # to Phase-3.
  # (In other words, this won't create a missing MeetingEvent when a match is not found.)
  #
  # Note that both <tt>season</tt> and <tt>meeting_session</tt> must be not +nil+ and
  # must correspond only to a primary entity row. In this implementation an error is raised
  # if they contain any secondary entity rows.
  #
  # This is due to the fact that the association towards MeetingEvent(s) is not possibile
  # at this stage unless the MeetingSession(s) are already committed.
  # (Consequently, they can only represent primary entities.)
  #
  # == Returns
  #   #result_id as:
  #     - positive (#id) for a freshly added row into DataImportMeetingProgram;
  #     - negative (- #id) for a matching existing or commited row in MeetingProgram;
  #     - 0 on error/unable to process.
  #
  # @raise ArgumentError unless <tt>season</tt> is a valid Season.
  # @raise ArgumentError unless <tt>meeting_session</tt> is a valid MeetingSession or DataImportMeetingSession.
  # @raise ArgumentError unless <tt>gender_type</tt> is a valid GenderType.
  # @raise ArgumentError unless <tt>category_type</tt> is a valid CategoryType.
  # @raise ArgumentError unless <tt>stroke_type</tt> is a valid StrokeType.
  #
  def self.build_from_parameters( data_import_session, season, meeting_session,
                                  header_row, header_index,
                                  gender_type, category_type, stroke_type,
                                  length_in_meters, scheduled_date,
                                  detail_rows_size, previous_begin_time = nil,
                                  previous_duration_in_secs = 120 )
    raise ArgumentError.new("'season' must be a valid instance of Season!")                   unless season.instance_of?(Season)
    raise ArgumentError.new("'meeting_session' must be a valid instance of MeetingSession or DataImportMeetingSession!")  unless meeting_session.instance_of?(MeetingSession) || meeting_session.instance_of?(DataImportMeetingSession)
    raise ArgumentError.new("'gender_type' must be a valid instance of GenderType!")          unless gender_type.instance_of?(GenderType)
    raise ArgumentError.new("'category_type' must be a valid instance of CategoryType!")      unless category_type.instance_of?(CategoryType)
    raise ArgumentError.new("'stroke_type' must be a valid instance of StrokeType!")          unless stroke_type.instance_of?(StrokeType)
# DEBUG
#    puts "\r\nMeetingProgram -- build_from_parameters: #{header_row.inspect}\r\n=> length_in_meters: #{length_in_meters}"
#    puts "=> #{gender_type.inspect}\r\n=> #{category_type.inspect}\r\n=> #{stroke_type.inspect}\r\n=> #{scheduled_date.inspect}"

    self.build( data_import_session ) do
      entity  MeetingProgram

      set_up do
        @import_text     = nil
        base_time        = nil
        relay_type_token = nil

        if header_row.instance_of?( Hash )
          # NOTE:
          # header_row[:fields] => [ :type, :distance, :style, :gender, :category_group, :base_time ]
# DEBUG
#          puts( "\r\n- header_row[:fields] => #{header_row[:fields].inspect}" )
          @import_text     = header_row[:import_text]
          base_time        = header_row[:fields][:base_time]
          relay_type_token = header_row[:fields][:type]
        elsif header_row.instance_of?( CsiResultDAO )
          @import_text = header_row.to_s
          # No base time in CSI result data
          # FIXME Missing relay info for CSI result data
        end
        # Note: header_index will give a new event_order for each combination of [ :distance, :style, :gender, :category_group ]
        @event_order = header_index + 1             # (Actually, this counts each single Heat as an event)

        @begin_time, @mins, @secs, @hds = V2::DataImportMeetingProgramBuilder.get_begin_time_and_base_time_members(
          scheduled_date,
          @event_order,
          detail_rows_size,
          base_time,
          previous_begin_time,
          previous_duration_in_secs
        )

        @event_type = V2::DataImportMeetingProgramBuilder.get_event_type(
          category_type,
          length_in_meters,
          stroke_type.id,
          relay_type_token
        )
        raise "Event type not found for length_in_meters: #{length_in_meters}, stroke_type.code: #{stroke_type.code}, is_a_relay: #{category_type.is_a_relay}!" unless @event_type

        # Retrieve the parent MeetingEvent, if possible, just to get to the correct session:
        meeting_id = ( ( meeting_session.respond_to?( :meeting ) && meeting_session.meeting ) ? meeting_session.meeting : nil )
        unless meeting_id
          meeting_id = ( ( meeting_session.respond_to?( :data_import_meeting ) && meeting_session.data_import_meeting ) ?
                         meeting_session.data_import_meeting : nil )
        end
        # This will result always in a nil MeetingEvent if the Meeting ID comes from a DataImportMeetingSession:
        @meeting_event = V2::DataImportMeetingProgramBuilder.get_meeting_event( meeting_id, @event_type.id )

        # Use the correct MeetingSession or fallback to the default (specified as a parameter):
        @meeting_session = @meeting_event ? @meeting_event.meeting_session : meeting_session

        # Get the pool type or fallback to a default:
        @pool_type_id = ( @meeting_session.swimming_pool ?
          @meeting_session.swimming_pool.pool_type_id :
          PoolType::MT50_ID
        )
# DEBUG
#        puts( "@pool_type_id => #{@pool_type_id.inspect}" )

        # Define also the base time or standard time, if any:
        @time_standard = V2::DataImportTimeStandardBuilder.build_from_parameters(
          data_import_session,
          season,
          @event_type.id,
          category_type.id,
          gender_type.id,
          @pool_type_id,
          @mins,
          @secs,
          @hds
        ).result_row if ( @mins.to_i > 0 || @secs.to_i > 0 || @hds.to_i > 0 )
# DEBUG
#        puts( "@time_standard => #{@time_standard.inspect}" )
      end


      search do
# DEBUG
#        puts( "Seeking existing MeetingProgram..." )
        primary     [
          "(meeting_event_id = ?) AND (category_type_id = ?) AND (gender_type_id = ?)",
          ( @meeting_event.instance_of?(MeetingEvent) ? @meeting_event.id : 0 ),
          category_type.id, gender_type.id
        ]

        secondary   [
          "(data_import_session_id = ?) AND " <<
          "(#{@meeting_session.instance_of?(MeetingSession) ? '' : 'data_import_'}meeting_session_id = ?) AND " <<
          "(event_type_id = ?) AND (category_type_id = ?) AND (gender_type_id = ?)",
          data_import_session.id, @meeting_session.id,
          @event_type.id, category_type.id, gender_type.id
        ]

        default_search
# DEBUG
#        puts "primary_search_ok!" if primary_search_ok?
#        puts "secondary_search_ok!" if secondary_search_ok?
      end


      if_not_found do
# DEBUG
#        puts "NOT found! Adding new DataImportMeetingProgram with: event_type=#{@event_type.inspect}, order=#{header_index}, #{header_row.inspect} mt., stroke_type_id=#{stroke_type.id}, category_type_id=#{category_type.id}..."
        attributes_for_creation(
          data_import_session_id:         data_import_session.id,
          import_text:                    @import_text,
          event_order:                    @event_order,
          begin_time:                     @begin_time,
          event_type_id:                  @event_type.id,
          category_type_id:               category_type.id,
          gender_type_id:                 gender_type.id,
          minutes:                        @mins,
          seconds:                        @secs,
          hundreds:                       @hds,
          is_out_of_race:                 false,    # FIXME This is not parsed at all
          # (This is just a guess, since this is the phase-2 processing of a "fin-result" type file)
          heat_type_id:                   HeatType::FINALS_ID,
          time_standard_id:               @time_standard ? @time_standard.id : nil,
          user_id:                        1, # (don't care)
          meeting_session_id:             @meeting_session.instance_of?(MeetingSession)           ? @meeting_session.id : nil,
          data_import_meeting_session_id: @meeting_session.instance_of?(DataImportMeetingSession) ? @meeting_session.id : nil
        )
        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Prepares and returns the list of values for the internal members (in this order):
  #
  # - @begin_time, the esteemation Program start, as a Time instance.
  # - @mins, @secs, @hds integer values used in the base time search/create step
  #
  def self.get_begin_time_and_base_time_members( scheduled_date, event_order, total_entries,
                                                 base_time, previous_begin_time,
                                                 previous_duration_in_secs )
    mins, secs, hds = V2::ResultTimeParser.new( 0, base_time ).parse.mins_secs_hds_array
    begin_time = BeginTimeCalculator.compute_from_previous(
      scheduled_date,
      event_order,
      total_entries,                              # Athletes in total for this program
      mins,                                       # Base time minutes
      previous_begin_time,
      previous_duration_in_secs,
      8,                                          # Average occupancy of pool lanes
      8                                           # Starting hour for the meeting
    )
# DEBUG
#    puts(
#      "\r\nMeeting program parsing: base_time='#{base_time}' => #{mins}:#{'%02d' % secs}.#{'%02d' % hds}" <<
#      "\r\n- scheduled_date=#{scheduled_date}, event_order: #{event_order}, total_entries=#{total_entries}, previous_begin_time='#{previous_begin_time}'" <<
#      "\r\n=> resulting begin_time: #{begin_time}"
#    )
    [
      begin_time, mins, secs, hds
    ]
  end


  # Returns the correct EventType, or +nil+ when none is found.
  #
  def self.get_event_type( category_type, length_in_meters, stroke_type_id, relay_type_text_token )
# DEBUG
#    puts( "\r\nSearching EventType where type='#{relay_type_text_token}', length_in_meters=#{length_in_meters}, stroke_type_id=#{stroke_type_id}, is_a_relay: #{category_type.is_a_relay}..." )
    event_type = category_type.is_a_relay ?
      EventType.parse_relay_event_type_from_import_text( stroke_type_id, relay_type_text_token ) :
      EventType.where(
        length_in_meters: length_in_meters,
        stroke_type_id:   stroke_type_id,
        is_a_relay:       false
      ).first
# DEBUG
#    puts( "=> event_type: #{event_type.inspect}" )
    event_type
  end


  # Returns the parent MeetingEvent using the meeting ID and the event type, or +nil+
  # when none is found.
  # This works only for already serialized Meetings, with existing MeetingSessions and
  # events.
  #
  def self.get_meeting_event( meeting_id, event_type_id )
    possible_meeting_session_ids = MeetingSession.where( meeting_id: meeting_id ).map{ |ms| ms.id }
    meeting_event = MeetingEvent.where(
      meeting_session_id: possible_meeting_session_ids,
      event_type_id:      event_type_id,
      heat_type_id:       HeatType::FINALS_ID
    ).first
# DEBUG
#    puts(
#      "- possible_meeting_session_ids: #{possible_meeting_session_ids.inspect}" <<
#      "\r\n=> meeting_event: #{meeting_event.inspect}"
#    )
    meeting_event
  end
  #-- -------------------------------------------------------------------------
  #++
end
