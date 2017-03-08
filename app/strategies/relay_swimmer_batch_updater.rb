require 'wrappers/timing'
require 'timing_parser'
require 'common/validation_error_tools'


#
# == RelaySwimmerBatchUpdater
#
# Strategy to log either the update or the creation of MeetingRelaySwimmer rows.
#
# @author   Steve A.
# @version  6.090
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
    raise ArgumentError.new('the current_user must be a TeamManager!') unless current_user.team_managers.count > 0
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


  # Edits an existing row id assuming its new timing value is specified as
  # an incremental timing (as a string).
  #
  # If the parsing of the text value fails or the text value is nil or empty,
  # the lap time is assumed to be *cleared*. That, currently, equals to the row
  # being deleted.
  #
  # This method updates also the internal counters of the whole batch operation,
  # as well as the progressive SQL diff log file.
  # (Which should be serialized by some other external method at the end of the
  # whole batch of edits or insertions.)
  #
  # == Returns:
  #
  # +true+ if successful, +false+ in case of errors, a deleted row instance in
  # case of row deletion.
  #
  def edit_existing_row( meeting_relay_swimmer_id, swimmer_id, incremental_timing_text_value )
    # TODO FIND badge_id
    # TODO FIND stroke_type_id

###############################
    mrs = MeetingRelaySwimmer.find_by_id( meeting_relay_swimmer_id )
    timing = TimingParser.parse( incremental_timing_text_value )
    is_ok = true
    if timing && mrs                          # Update w/ new value:
      mrs = prepare_passage_fields( mrs, timing )
      is_ok = mrs.save
      if is_ok
        sql_attributes = mrs.attributes.select do |key,val|
          [
            'id', 'minutes', 'seconds', 'hundreds',
            'minutes_from_start', 'seconds_from_start', 'hundreds_from_start',
            'user_id'
          ].include?( key.to_s )
        end
        sql_diff_text_log << to_sql_update( mrs, false, sql_attributes, "\r\n" )
        @edited_rows_count += 1
      else
        sql_diff_text_log << "-- UPDATE VALIDATION FAILURE: #{ ValidationErrorTools.recursive_error_for( mrs ) }\r\n" if mrs.invalid?
        sql_diff_text_log << "-- UPDATE FAILURE: #{ $! }\r\n" if $!
        @errors_count += 1
      end

    elsif timing.nil? && mrs                  # Erase existing row:
      is_ok = mrs.destroy
      if is_ok
        sql_diff_text_log << to_sql_delete( mrs, false, "\r\n" )
        @destroyed_rows_count += 1
      else
        sql_diff_text_log << "-- DESTROY FAILURE: #{ $! }\r\n" if $!
        @errors_count += 1
      end
    end
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # Creates a new passage row given its parent mrr id and its associated passage
  # type id and its new value for the incremental timing  specified as a string parameter.
  #
  # If the parsing of the text value fails or the text value is nil or empty,
  # the new passage is not created.
  #
  # This method updates also the internal counters of the whole batch operation,
  # as well as the progressive SQL diff log file.
  # (Which should be serialized by some other external method at the end of the
  # whole batch of edits or creations.)
  #
  # == Returns:
  # +true+ if successful, +false+ otherwise
  #
  def create_new_row( mrr_id, relay_order, swimmer_id, incremental_timing_text_value, reaction_time = nil )
    # TODO FIND badge_id
    # TODO FIND stroke_type_id

###############################
    timing = TimingParser.parse( incremental_timing_text_value )
    is_ok = true
    if timing                                       # Create the new row:
      passage = prepare_passage_fields( Passage.new, timing, mrr_id, passage_type_id )
      is_ok = passage.save
      if is_ok
        sql_diff_text_log << to_sql_insert( passage, false, "\r\n" )
        @created_rows_count += 1
      else
        sql_diff_text_log << "-- INSERT VALIDATION FAILURE: #{ ValidationErrorTools.recursive_error_for( passage ) }\r\n" if passage.invalid?
        sql_diff_text_log << "-- INSERT FAILURE: #{ $! }\r\n" if $!
        @errors_count += 1
      end
    else
      sql_diff_text_log << "-- INSERT SKIPPED FOR INVALID PARSING: '#{ incremental_timing_text_value }', MRR ID: #{ mrr_id }, passage_type_id: #{ passage_type_id }\r\n"
      is_ok = false
      @errors_count += 1
    end
    is_ok
  end
  #-- -------------------------------------------------------------------------
  #++


  # Estabilsh if a pasage is a delta
  # A passage is a delta if passage timing is the time swam in the passage distance
  # First passage is always a delta
  # A passage is a delta if lesser than prevvoius one
  # A passage is a delta if greater than prevvoius one but
  # not more 50% of difference with previous distance swam (average speed per meter).
  # (so a passage is incremental only if greater than previous one)
  #
  # EG 1.
  #  50: 3000 -> delta (first passage)
  # 100: 6130 -> incremental (50 in 6130 is a variation greater than 50% of previous one)
  # 150: 9300 -> incremental (50 in 9300 is a variation lesser than 50% of previous one)
  # EG 2.
  #  50: 3000 -> delta (first passage)
  # 100: 3130 -> delta (50 in 3130 is a variation lesser than 50% of previous one)
  # 150: 3270 -> delta (50 in 3270 is a variation lesser than 50% of previous one)
  #
  def is_delta?( passage )
    is_delta = false

    # Is incremental (not delta) if passage time swam equal to mrr time swam
    if passage.get_timing_instance == passage.get_final_time
      is_delta = false
    else
      previous_passage = passage.get_previous_passage
      if previous_passage
        total_time_before = previous_passage.compute_incremental_time
        # Is delta if passage time swam smaller than time swam before
        if total_time_before > passage.get_timing_instance
          is_delta = true
        # Is delta if passage swam speed per meter smaller than average swam speed per meter * 50%
        elsif (passage.get_timing_instance.to_hundreds / passage.compute_distance_swam) <= (( passage.get_final_time.to_hundreds / passage.get_total_distance ) * 1.5 )
          is_delta = true
        # Is incremental if passage swam speed per meter greater than average swam speed per meter * 50%
        else
          is_delta = false
        end
      # Is delta if first passage (or no previous one)
      else
        is_delta = true
      end
    end
    is_delta
  end


  private


  # Prepares the required timing fields for the specified passage instance row,
  # given a parsed timing instance containing the values used to update the Passage.
  #
  # === Returns:
  # The updated Passage instance
  #
  def prepare_passage_fields( passage, timing, mrr_id = nil, passage_type_id = nil )
    passage.user_id = @current_user.id
    if mrr_id
      mrr = MeetingRelayResult.find( mrr_id )
      passage.meeting_program_id = mrr.meeting_program_id
      passage.meeting_individual_result_id = mrr_id
      passage.swimmer_id = mrr.swimmer_id
      passage.team_id = mrr.team_id
    end
    passage.passage_type_id = passage_type_id if passage_type_id

    prev_timing = passage.get_previous_passage ? passage.get_previous_passage.compute_incremental_time : nil

    # Detrminates if passage is delta or incremental
    #is_delta = false
    passage.minutes  = timing.minutes
    passage.seconds  = timing.seconds
    passage.hundreds = timing.hundreds
    is_delta = is_delta?( passage )

    if is_delta == true
      # Timing is the delta.
      # Should calculate time from start
      passage.minutes  = timing.minutes
      passage.seconds  = timing.seconds
      passage.hundreds = timing.hundreds
      passage.minutes_from_start  = timing.minutes + ( prev_timing ? prev_timing.minutes : 0 )
      passage.seconds_from_start  = timing.seconds + ( prev_timing ? prev_timing.seconds : 0 )
      passage.hundreds_from_start = timing.hundreds + ( prev_timing ? prev_timing.hundreds : 0 )
    else
      # Timing is the incremental.
      # Should calculate delta time
      delta_timing = prev_timing ? timing - prev_timing : timing
      passage.minutes  = delta_timing.minutes
      passage.seconds  = delta_timing.seconds
      passage.hundreds = delta_timing.hundreds
      passage.minutes_from_start  = timing.minutes
      passage.seconds_from_start  = timing.seconds
      passage.hundreds_from_start = timing.hundreds
    end
# DEBUG
    puts "\r\n- MRR ID #{mrr_id} : " << passage.inspect
    passage
  end
  #-- -------------------------------------------------------------------------
  #++
end