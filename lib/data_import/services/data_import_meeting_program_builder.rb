# encoding: utf-8

require 'common/format'
require 'data_import/strategies/result_time_parser'
require 'data_import/services/data_import_entity_builder'
require 'data_import/services/data_import_time_standard_builder'


=begin

= DataImportMeetingProgramBuilder

  - Goggles framework vers.:  4.00.603
  - author: Steve A.

 Specialized +DataImportEntityBuilder+ for searching (or adding brand new)
 MeetingProgram entity rows.

=end
class DataImportMeetingProgramBuilder < DataImportEntityBuilder

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
  # can be either a primary or secondary entity row.
  #
  # == Returns
  #   #result_id as:
  #     - positive (#id) for a freshly added row into DataImportMeetingProgram;
  #     - negative (- #id) for a matching existing or commited row in MeetingProgram;
  #     - 0 on error/unable to process.
  #
  # @raise ArgumentError unless <tt>season</tt> and <tt>meeting_session</tt> are both not-nil.
  # @raise ArgumentError unless <tt>gender_type</tt> is a valid GenderType.
  # @raise ArgumentError unless <tt>category_type</tt> is a valid CategoryType.
  # @raise ArgumentError unless <tt>stroke_type</tt> is a valid StrokeType.
  #
  def self.build_from_parameters( data_import_session, season, meeting_session,
                                  header_row, header_index,
                                  gender_type, category_type, stroke_type,
                                  length_in_meters, scheduled_date,
                                  detail_rows_size )
    raise ArgumentError.new("Both season and meeting_session must be not nil!")          if season.nil? || meeting_session.nil?
    raise ArgumentError.new("'gender_type' must be a valid instance of GenderType!")     unless gender_type.instance_of?(GenderType)
    raise ArgumentError.new("'category_type' must be a valid instance of CategoryType!") unless category_type.instance_of?(CategoryType)
    raise ArgumentError.new("'stroke_type' must be a valid instance of StrokeType!")     unless stroke_type.instance_of?(StrokeType)
# DEBUG
#    puts "\r\nMeetingProgram -- build_from_parameters: #{header_row.inspect}\r\n=> length_in_meters: #{length_in_meters}"
#    puts "=> #{gender_type.inspect}\r\n=> #{category_type.inspect}\r\n=> #{stroke_type.inspect}\r\n=> #{scheduled_date.inspect}"

    self.build( data_import_session ) do
      entity  MeetingProgram

      set_up do
        # NOTE:
        # header_row[:fields] => [ :type, :distance, :style, :gender, :category_group, :base_time ]
        @import_text = header_row[:import_text]
        # Note: header_index will give a new event_order for each combination of [ :distance, :style, :gender, :category_group ]
        @event_order = header_index + 1             # (Actually, this counts each single Heat as an event)
        base_time    = header_row[:fields][:base_time]
        @mins, @secs, @hds = ResultTimeParser.new( 0, base_time ).parse.mins_secs_hds_array
        # Quick'n'dirty trick: compute approx. begin_time using scheduled_date + header_index * (mins, secs, hds) of base time
        heat_number_approx = ( detail_rows_size / 8 ) + 1
        esteemed_meeting_mins = heat_number_approx * (@mins.to_i < 3 ? 2 : @mins.to_i + 2)
        esteemed_hours = 8 + (esteemed_meeting_mins / 60)
# DEBUG
#        puts( "\r\nMeeting program parsing: base_time='#{base_time}' ... #{@mins}:#{@secs}.#{@hds}, (#{header_row[:fields].inspect})" )
#        puts( "scheduled_date=#{scheduled_date}, header_index=#{header_index} * heat_number_approx='#{heat_number_approx}', esteemed_hours=#{esteemed_hours}, esteemed_meeting_mins=#{esteemed_meeting_mins}" )
#        @phase_1_log << "\r\nMeeting program parsing: base_time='#{base_time}' ... #{mins}:#{secs}.#{hds}, (#{header_row[:fields].inspect})\r\n"
#        @phase_1_log << "scheduled_date=#{scheduled_date}, header_index=#{header_index} * heat_number_approx='#{heat_number_approx}', esteemed_hours=#{esteemed_hours}, @esteemed_meeting_mins=#{esteemed_meeting_mins}\r\n"
        @begin_time = Time.utc(
          scheduled_date.year, scheduled_date.month, scheduled_date.day + (esteemed_hours/24),
          esteemed_hours % 24,
          esteemed_meeting_mins % 60
        )
# DEBUG
#        puts( "begin_time: #{@begin_time}" )
#        @phase_1_log << "begin_time=#{@begin_time}\r\n"
        # Get the pool type:
        @pool_type_id = ( meeting_session.swimming_pool ?
          meeting_session.swimming_pool.pool_type_id :
          PoolType::MT50_ID
        )
# DEBUG
#        puts( "@pool_type_id => #{@pool_type_id.inspect}" )
#        puts( "Searching EventType where length_in_meters=#{length_in_meters}, stroke_type_id=#{stroke_type.id}, is_a_relay: #{category_type.is_a_relay}..." )
        if category_type.is_a_relay
          @event_type  = EventType.parse_relay_event_type_from_import_text(
            stroke_type.id,
            header_row[:fields][:type],
            length_in_meters
          )
        else
          @event_type  = EventType.where(
            length_in_meters: length_in_meters,
            stroke_type_id:   stroke_type.id,
            is_a_relay:       false
          ).first
        end
# DEBUG
#        puts( "@event_type => #{@event_type.inspect}" )
        raise "Event type not found for length_in_meters: #{length_in_meters}, stroke_type.code: #{stroke_type.code}, is_a_relay: #{category_type.is_a_relay}!" unless @event_type

        # Find the parent MeetingEvent using the meeting_session:
        @meeting_event = MeetingEvent.where(
          [ "(meeting_session_id = ?) AND (event_type_id = ?)", meeting_session.id, @event_type.id ]
        ).first if meeting_session.instance_of?(MeetingSession)
# DEBUG
#        puts( "@meeting_event =>#{@meeting_event.inspect}" )
        # Define also the base time or standard time, if any:
        @time_standard = DataImportTimeStandardBuilder.build_from_parameters(
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
          "(data_import_session_id = ?) AND " +
          "(#{meeting_session.instance_of?(MeetingSession) ? '' : 'data_import_'}meeting_session_id = ?) AND " +
          "(event_type_id = ?) AND (category_type_id = ?) AND (gender_type_id = ?)",
          data_import_session.id, meeting_session.id,
          @event_type.id, category_type.id, gender_type.id
        ]
        default_search
# DEBUG
#        puts "primary_search_ok!" if primary_search_ok?
#        puts "secondary_search_ok!" if secondary_search_ok?
      end


      if_not_found do
# DEBUG
#        puts "NOT found! Adding new DataImportMeetingProgram with: event_type=#{@event_type.inspect}, order=#{header_index}, #{header_row[:fields][:distance].to_i} mt., stroke_type_id=#{stroke_type.id}, category_type_id=#{category_type.id}..."
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
          meeting_session_id:             meeting_session.instance_of?(MeetingSession)           ? meeting_session.id : nil,
          data_import_meeting_session_id: meeting_session.instance_of?(DataImportMeetingSession) ? meeting_session.id : nil
        )
        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
