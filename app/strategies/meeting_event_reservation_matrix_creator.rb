# encoding: utf-8
require 'common/validation_error_tools'


=begin

= MeetingEventReservationMatrixCreator

 - Goggles framework vers.:  6.034
 - author: Steve A.

 Strategy class used to build-up a list of reservations plus a full matrix of rows
 composed of a total of "tot. Ind. Events" x "tot. Athletes" of MeetingEventReservation
 records stored directly on the database.

 While this class is used to actually build a vector together with a matrix,
 check out also its companion class, MeetingRelayReservationMatrixCreator, which
 is used to build up a plain and simple matrix of relay reservations rows.

 The creation of the matrix of reservation rows requires a specific:

 - Meeting instance
 - TeamAffiliation instance, somehow linked to the current_user instance
 - the current_user (User) instance

 Meeting is used to build-up the list of possibile (individual) events
 TeamAffiliation is used to collect the full list of associated Swimmers for the
 specific season/academic year.

 Together with the matrix of event reservations, a single list of MeetingReservation
 rows is also created on the database, representing each one a single "header"
 for each row of the matrix.

 Each record of these "headers" contains some normalized data for each athlete/badge
 (mainly: free notes, a couple of boolean flags and all the redundant keys addressing
 the specific reservation.

 Each added database row (both for MeetingReservation and MeetingEventReservation)
 is logged through the SqlConvertable's exposed method #sql_diff_text_log in a
 single output "diff" text, created after #call.

 In case of failure, the strategy fails silently, logging the actual errors inside
 the same generated SQL diff text.

 Keep in mind that serialization of this diff SQL text is delegated to external
 objects.

=end
class MeetingEventReservationMatrixCreator < MeetingReservationMatrixProcessor

  # Executes the creator given the stored parameters.
  # Returns +true+ in case of no errors, +false+ otherwise.
  #
  def call
    super
    return false unless (@total_errors == 0)

    # Loop on each matrix item and create a row, if missing:
    get_badges_list.each do |badge|
      create_badge_reservation_if_missing( badge )
      get_events_list.each do |event|
        create_event_reservation_if_missing( badge, event )
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
    best_finder = SwimmerBestFinder.new( swimmer )
    seasonal_best = best_finder.get_involved_season_best_for_event(
      best_finder.get_contemporary_seasons_involved_into( @meeting.season ),
      event.event_type,
      @meeting.pool_types.first
    )
    # [Steve] Old ugly method:
    #last_mir = swimmer.meeting_individual_results
    #  .joins(:meeting_event).where(['event_type_id = ?', event.event_type_id])
    #  .last

    MeetingEventReservation.new(
      meeting_id:       @meeting.id,
      team_id:          @team_affiliation.team_id,
      swimmer_id:       swimmer.id,
      badge_id:         badge.id,
      meeting_event_id: event.id,
      user_id:          @current_user.id,
      is_doing_this:    false,
      suggested_minutes:  seasonal_best ? seasonal_best.minutes : 0,
      suggested_seconds:  seasonal_best ? seasonal_best.seconds : 0,
      suggested_hundreds: seasonal_best ? seasonal_best.hundreds : 0
    )
  end
  #-- --------------------------------------------------------------------------
  #++
end
