# encoding: utf-8

require_relative '../../../data_import/v3/builders/entity_builder'


=begin

= V3::MeetingRelaySwimmerBuilder

  - Goggles framework vers.:  4.00.815
  - author: Steve A.

 Specialized +EntityBuilder+ for searching (or adding brand new)
 MeetingRelaySwimmer entity rows.

=end
class V3::MeetingRelaySwimmerBuilder < V3::EntityBuilder

  # Searches for an existing MeetingRelaySwimmer given the parameters and adds
  # a new one if no matches are found and a corresponding existing Swimmer or
  # DataImportSwimmer is valid.
  #
  # This method assumes all the parameter have been already "established" as
  # model instance. (That is: meeting_relay_result, swimmer_badge and stroke_type,
  # with this last one derived by the relay type and the current relay order of
  # the sub-detail row being processed.)
  #
  # == Returns
  # +nil+ in case of invalid parameters.
  #
  # #result_id as:
  #     - positive (#id) for a freshly added row into DataImportMeetingRelaySwimmer;
  #     - negative (- #id) for a matching existing or commited row in MeetingRelaySwimmer;
  #     - 0 on error/unable to process.
  #
  def self.build_from_parameters( data_import_session, meeting_relay_result, import_text,
                                  swimmer_badge, relay_order, stroke_type, reaction_time = nil,
                                  minutes = nil, seconds = nil, hundreds = nil )
    raise ArgumentError.new(
      "meeting_relay_result, swimmer_badge and stroke_type must be not nil!"
    ) if meeting_relay_result.nil? || swimmer_badge.nil? || stroke_type.nil?
# DEBUG
    puts "\r\nV3::MeetingRelaySwimmerBuilder.build_from_parameters: data_import_session ID: #{data_import_session.id}, " <<
         "swimmer_badge: #{swimmer_badge.inspect}, MRR: #{meeting_relay_result.inspect}"
    self.build( data_import_session ) do
      entity      MeetingRelaySwimmer

      set_up do
        @swimmer = if swimmer_badge.swimmer
          swimmer_badge.swimmer
        elsif meeting_relay_result.respond_to?(:data_import_swimmer)
          swimmer_badge.data_import_swimmer
        else
          nil
        end

        @team = if swimmer_badge.team
          swimmer_badge.team
        elsif swimmer_badge.respond_to?(:data_import_team)
          swimmer_badge.data_import_team
        else
          nil
        end
        if @swimmer.nil? || @team.nil?
          set_result(nil)
          raise ArgumentError.new("Unable to find a @swimmer or a @team for swimmer badge: #{ swimmer_badge.inspect }")
        end
      end

      search do
        primary   [
          "(meeting_relay_result_id = ?) AND (swimmer_id = ?) ",
          ( meeting_relay_result.instance_of?(MeetingRelayResult) ? meeting_relay_result.id : 0 ),
          ( @swimmer.instance_of?(Swimmer) ? @swimmer.id : 0 )
        ]
        secondary [
          "(data_import_session_id = ?) AND " <<
          "(#{meeting_relay_result.instance_of?(MeetingRelayResult) ? '' : 'data_import_'}meeting_relay_result_id = ?) AND " <<
          "(#{@swimmer.instance_of?(Swimmer) ? '' : 'data_import_'}swimmer_id = ?)",
          data_import_session.id,
          meeting_relay_result.id,
          @swimmer.id
        ]
        default_search
# DEBUG
        puts "primary search ok!" if primary_search_ok?
        puts "secondary search ok!" if secondary_search_ok?
      end

      if_not_found do
# DEBUG
        puts "NOT found!"
        attributes_for_creation(
          data_import_session_id: data_import_session.id,
          import_text:            import_text,
          reaction_time:          reaction_time,
          minutes:                minutes,
          seconds:                seconds,
          hundreds:               hundreds,
          relay_order:            relay_order,
          stroke_type_id:         stroke_type.id,

          swimmer_id:             @swimmer.instance_of?(Swimmer)              ? @swimmer.id : nil,
          data_import_swimmer_id: @swimmer.instance_of?(DataImportSwimmer)    ? @swimmer.id : nil,
          team_id:                @team.instance_of?(Team)                    ? @team.id    : nil,
          data_import_team_id:    @team.instance_of?(DataImportTeam)          ? @team.id    : nil,
          badge_id:               swimmer_badge.instance_of?(Badge)           ? swimmer_badge.id   : nil,
          data_import_badge_id:   swimmer_badge.instance_of?(DataImportBadge) ? swimmer_badge.id   : nil,

          meeting_relay_result_id:              meeting_relay_result.instance_of?(MeetingRelayResult)           ? meeting_relay_result.id  : nil,
          data_import_meeting_relay_result_id:  meeting_relay_result.instance_of?(DataImportMeetingRelayResult) ? meeting_relay_result.id  : nil,

          user_id:                1 # (don't care)
        )
        add_new
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
