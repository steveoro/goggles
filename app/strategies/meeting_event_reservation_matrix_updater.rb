# encoding: utf-8
require 'common/validation_error_tools'


=begin

= MeetingEventReservationMatrixUpdater

 - Goggles framework vers.:  6.030
 - author: Steve A.

 Strategy class used to update the existing matrix of MeetingEventReservation rows on the DB,
 one for each available event, times each registered athlete (events x swimmers).

 Check out also the companion class for this one, MeetingEventReservationMatrixCreator,
 which creates the matrix of rows itself.

 Each updated database row is logged through the SqlConvertable's exposed method
 #sql_diff_text_log in a single output "diff" text, created after #call.

 In case of failure, the strategy fails silently, logging the actual errors inside
 the same generated SQL diff text.

 Keep in mind that serialization of this diff SQL text is delegated to external
 objects.

=end
class MeetingEventReservationMatrixUpdater < MeetingReservationMatrixProcessor

  # Executes the creator given the stored parameters.
  # Returns +true+ in case of no errors, +false+ otherwise.
  #
  def call
    super
    return false unless (@total_errors == 0)

# TODO ****************************************************
# (update all changed rows)

    # Relay-type events are not always there, so we skip the whole loop when none are found:
    if get_events_list.count > 0
      # Loop on each matrix item and create a row, if missing:
      get_badges_list.each do |badge|
        get_events_list.each do |event|
          create_relay_reservation_if_missing( badge, event )
        end
      end
    end
    return (@total_errors == 0)
  end
  #-- --------------------------------------------------------------------------
  #++


  private


  # Creates a new MeetingReservation row if no pre-existing rows are found.
  # When the row keys are already found, nothing is done.
  #
  def create_badge_reservation_if_missing( badge )
    # Check any previous existence:
    reservation_count = MeetingReservation.where(
      meeting_id:       @meeting.id,
      team_id:          @team_affiliation.team_id,
      swimmer_id:       badge.swimmer_id,
      badge_id:         badge.id
    ).count

    if reservation_count == 0
      # Build the new row
      reservation = prepare_new_badge_reservation( badge )
      # Save it and check for errors:
      is_ok = reservation.save
      if is_ok
        sql_diff_text_log << to_sql_insert( reservation, false, "\r\n" )
        @processed_rows += 1
      else
        sql_diff_text_log << "-- INSERT VALIDATION FAILURE: #{ ValidationErrorTools.recursive_error_for( reservation ) }\r\n" if reservation.invalid?
        sql_diff_text_log << "-- INSERT FAILURE: #{ $! }\r\n" if $!
        @total_errors += 1
      end
    # else: silently skip the addition
    end
  end


  # Creates a new MeetingEventReservation row if no pre-existing rows are found
  # associated to the same N-tuple (meeting, team, swimmer, badge, meeting_event).
  # When the row keys are already found, nothing is done.
  #
  def create_event_reservation_if_missing( badge, event )
    # Check any previous existence:
    reservation_count = MeetingEventReservation.where(
      meeting_id:       @meeting.id,
      team_id:          @team_affiliation.team_id,
      swimmer_id:       badge.swimmer_id,
      badge_id:         badge.id,
      meeting_event_id: event.id
    ).count

    if reservation_count == 0
      # Build the new row
      reservation = prepare_new_event_reservation( badge, event )
      # Save it and check for errors:
      is_ok = reservation.save
      if is_ok
        sql_diff_text_log << to_sql_insert( reservation, false, "\r\n" )
        @processed_rows += 1
      else
        sql_diff_text_log << "-- INSERT VALIDATION FAILURE: #{ ValidationErrorTools.recursive_error_for( reservation ) }\r\n" if reservation.invalid?
        sql_diff_text_log << "-- INSERT FAILURE: #{ $! }\r\n" if $!
        @total_errors += 1
      end
    # else: silently skip the addition
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  # Prepares the members for a new MeetingReservation row.
  #
  def prepare_new_badge_reservation( badge )
    MeetingReservation.new(
      meeting_id:       @meeting.id,
      team_id:          @team_affiliation.team_id,
      swimmer_id:       badge.swimmer_id,
      badge_id:         badge.id,
      user_id:          @current_user.id,
      is_not_coming:    false,
      has_confirmed:    false
    )
  end


  # Prepares the members for a new MeetingEventReservation row.
  #
  def prepare_new_event_reservation( badge, event )
    # Retrieve last MIR (when possibile), to fill-in with suggested enrollment timing:
    swimmer = badge.swimmer
    last_mir = swimmer.meeting_individual_results
      .joins(:meeting_event).where(['event_type_id = ?', event.event_type_id])
      .last

    MeetingEventReservation.new(
      meeting_id:       @meeting.id,
      team_id:          @team_affiliation.team_id,
      swimmer_id:       swimmer.id,
      badge_id:         badge.id,
      meeting_event_id: event.id,
      user_id:          @current_user.id,
      is_doing_this:    false,
      suggested_minutes:  last_mir ? last_mir.minutes : 0,
      suggested_seconds:  last_mir ? last_mir.seconds : 0,
      suggested_hundreds: last_mir ? last_mir.hundreds : 0
    )
  end
  #-- --------------------------------------------------------------------------
  #++
end
