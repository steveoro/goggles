require 'wrappers/timing'
require 'timing_parser'
require 'common/validation_error_tools'


#
# == RelaySwimmerBatchUpdater
#
# Strategy to log either the update or the creation of MeetingRelaySwimmer rows.
#
# @author   Steve A.
# @version  6.092
#
class RelaySwimmerBatchUpdater
  include SqlConvertable

  attr_reader :edited_rows_count, :created_rows_count, :destroyed_rows_count,
              :errors_count

  # Creates a new instance, given the current user that has "recorded" this batch
  # of operations.
  #
  # This strategy works only if the current_user is a TeamManager for at least
  # a TeamAffiliation.
  #
  def initialize( current_user )
    raise ArgumentError.new('current_user must be defined!') unless current_user.instance_of?( User )
    raise ArgumentError.new('the current_user must be a TeamManager!') unless current_user.team_managers.exists?
    @edited_rows_count = 0
    @created_rows_count = 0
    @destroyed_rows_count = 0
    @errors_count = 0
    @current_user = current_user
    @managed_team_ids = current_user.team_managers.map{ |tm| tm.team }.uniq.map{ |team| team.id }
    create_sql_diff_header( "RelaySwimmerBatchUpdater: recorded from actions by #{ current_user }" )
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the expected stroke_type.id for a specific relay phase (in standard order),
  # according to the MeetingRelayResult's stroke_type.
  #
  # (This is obviously needed only by mixed-style relays but it can be safely called
  #  by any relay stroke type.)
  #
  def self.get_fractionist_stroke_type_id_by( mrr_stroke_type_id, relay_order )
    if mrr_stroke_type_id == StrokeType::MIXED_RELAY_ID
      case relay_order
      when 1
        return StrokeType::BACKSTROKE_ID
      when 2
        return StrokeType::BREASTSTROKE_ID
      when 3
        return StrokeType::BUTTERFLY_ID
      else
        return StrokeType::FREESTYLE_ID
      end
    else
      return mrr_stroke_type_id
    end
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the total number of processed rows (excluding the skipped ones).
  #
  def processed_rows
    @edited_rows_count + @created_rows_count + @destroyed_rows_count
  end

  # Edits an existing row id assuming its new timing value is specified as
  # an incremental timing (as a string).
  #
  # This method updates also the internal counters of the whole batch operation,
  # as well as the progressive SQL diff log file.
  # (Which should be serialized by some other external method at the end of the
  # whole batch of edits or insertions.)
  #
  # == Returns:
  #
  # The specified MeetingRelaySwimmer instance (which will result updated only when successful).
  # (Use #error_count to check the actual errors. This won't be reset in between calls.)
  # nil only in case of row skipping.
  #
  def edit_existing_row( mrr, mrs, swimmer_id, badge_id, incremental_timing_text_value, reaction_time_text = nil )
    return nil unless swimmer_id.present? && badge_id.present?
    timing = TimingParser.parse( incremental_timing_text_value )
    is_ok  = mrs.instance_of?(MeetingRelaySwimmer) && mrr.instance_of?(MeetingRelayResult)
    reaction_time = TimingParser.parse( reaction_time_text ) if reaction_time_text

    if is_ok
      if is_an_actual_update_of( mrs, swimmer_id, badge_id, timing )
        mrs.stroke_type_id = RelaySwimmerBatchUpdater.get_fractionist_stroke_type_id_by( mrr.event_type.stroke_type_id, mrs.relay_order )
        mrs.swimmer_id = swimmer_id
        mrs.badge_id   = badge_id
        mrs.hundreds   = timing ? timing.hundreds : 0
        mrs.seconds    = timing ? timing.seconds : 0
        mrs.minutes    = timing ? timing.minutes : 0
        mrs.user_id    = @current_user.id
        # This should be already ok, but it depends from the external caller:
        mrs.meeting_relay_result_id = mrr.id
        mrs.reaction_time = reaction_time if reaction_time
        if mrs.save
          sql_attributes = mrs.attributes.select do |key|
            [
              'id', 'minutes', 'seconds', 'hundreds',
              # Currently unsupported: (must be either a number or not null)
#              'reaction_time',
              'stroke_type_id', 'swimmer_id', 'badge_id', 'user_id',
              'meeting_relay_result_id'
            ].include?( key.to_s )
          end
          sql_diff_text_log << to_sql_update( mrs, false, sql_attributes, "\r\n" )
          @edited_rows_count += 1
        else
          sql_diff_text_log << "-- UPDATE VALIDATION FAILURE: #{ ValidationErrorTools.recursive_error_for( mrs ) }\r\n" if mrs.invalid?
          sql_diff_text_log << "-- UPDATE FAILURE: #{ $! }\r\n" if $!
          @errors_count += 1
        end
      else
        # (No changes for the current row / no-op)
        sql_diff_text_log << "-- (No changes for MRS.id #{ mrs.id })\r\n"
      end
    else
      sql_diff_text_log << "-- Possible Timing parse failure (timing: <#{ incremental_timing_text_value }>) or invalid instances specified in caller!\r\n"
      sql_diff_text_log << "-- Skipping editing for MRR.id: #{ mrr ? mrr.id : nil } / MRS.id: #{ mrs ? mrs.id : nil }...\r\n"
      @errors_count += 1
    end
    mrs
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new row given its parent mrr id and its values specified as a string parameter.
  #
  # This method updates also the internal counters of the whole batch operation,
  # as well as the progressive SQL diff log file.
  # (Which should be serialized by some other external method at the end of the
  # whole batch of edits or creations.)
  #
  # == Returns:
  #
  # The created instance; nil otherwise.
  #
  def create_new_row( mrr, relay_order, swimmer_id, badge_id, incremental_timing_text_value, reaction_time_text = nil )
    return nil unless swimmer_id.present? && badge_id.present? && relay_order.present?
    timing = TimingParser.parse( incremental_timing_text_value )
    is_ok  = mrr.instance_of?(MeetingRelayResult)
    reaction_time = TimingParser.parse( reaction_time_text ) if reaction_time_text
    mrs = nil

    if is_ok
      team_id   = mrr.team_id
      season_id = mrr.season.id
      mrs = MeetingRelaySwimmer.new(
        meeting_relay_result_id: mrr.id,
        relay_order:      relay_order.to_i,
        stroke_type_id:   RelaySwimmerBatchUpdater.get_fractionist_stroke_type_id_by( mrr.event_type.stroke_type_id, relay_order ),
        swimmer_id:       swimmer_id.to_i,
        badge_id:         badge_id,
        # Currently unsupported: (must be either a number or not null)
#        reaction_time:    reaction_time,
        hundreds:         timing ? timing.hundreds : 0,
        seconds:          timing ? timing.seconds : 0,
        minutes:          timing ? timing.minutes : 0,
        user_id:          @current_user.id
      )
      if mrs.save
        sql_diff_text_log << to_sql_insert( mrs, false, "\r\n" )
        @created_rows_count += 1
      else
        sql_diff_text_log << "-- INSERT VALIDATION FAILURE: #{ ValidationErrorTools.recursive_error_for( mrs ) }\r\n" if mrs.invalid?
        sql_diff_text_log << "-- INSERT FAILURE: #{ $! }\r\n" if $!
        @errors_count += 1
      end
    else
      sql_diff_text_log << "-- Possible Timing parse failure (timing: <#{ incremental_timing_text_value }>) or invalid instances specified in caller! (relay_order: #{ relay_order }, swimmer_id: #{ swimmer_id })\r\n"
      sql_diff_text_log << "-- Skipping editing for MRR.id: #{ mrr ? mrr.id : nil }...\r\n"
      @errors_count += 1
    end
    mrs
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Returns true if the specified constitute any actual changes to the specified
  # instance of MeetingRelaySwimmer; false otherwise.
  #
  def is_an_actual_update_of( mrs, swimmer_id, badge_id, timing )
    ( timing.instance_of?(Timing) && mrs.get_timing_instance.to_hundreds != timing.to_hundreds ) ||
    ( mrs.swimmer_id != swimmer_id.to_i ) ||
    ( mrs.badge_id != badge_id.to_i )
  end
  #-- -------------------------------------------------------------------------
  #++
end