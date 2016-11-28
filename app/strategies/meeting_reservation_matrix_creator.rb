# encoding: utf-8
require 'common/validation_error_tools'


=begin

= MeetingReservationMatrixCreator

 - Goggles framework vers.:  6.015
 - author: Steve A.

 Strategy class used to build-up a list of reservations plus a full matrix of
 a total of (Events x Athletes) rows of MeetingEventReservation directly on the
 database, given a specific:

 - Meeting instance
 - TeamAffiliation instance, somehow linked to the current_user instance
 - the current_user (User) instance

 Meeting is used to build-up the list of possibile events
 TeamAffiliation is used to collect the full list of associated Swimmers for the
 specific season/academic year.

 Together with the matrix of event reservations, a single list of MeetingReservation
 rows is also created on the database, representing each one a single "header"
 for each row of the matrix.

 Each record of these "headers" contains some normalized data for each athlete/badge
 (mainly: free notes, a couple of boolean flags and all the redundant keys addressing
 the specific reservation.

 Each added database row (both for MeetingReservation and MeetingEventReservation)
 is logged through the SqlConvertable's expposted method #sql_diff_text_log in a
 single output "diff" text, created after #call.

 In case of failure, the strategy fails silently, logging the actual errors inside
 the same generated SQL diff text.

 Keep in mind that serialization of this diff SQL text is delegated to external
 objects.

=end
class MeetingReservationMatrixCreator
  include SqlConvertable

  attr_reader :meeting, :team_affiliation, :current_user,
              :created_rows_count, :total_errors

  # Creates a new creator instance, given:
  #
  # - a valid Meeting instance
  # - a valid TeamAffiliation instance
  # - the current_user (User) instance
  #
  def initialize( params )
    @meeting          = params[ :meeting ]
    @team_affiliation = params[ :team_affiliation ]
    @current_user     = params[ :current_user ]
    @total_errors     = 0
    @created_rows_count = 0
    create_sql_diff_header( "MeetingReservationMatrixCreator: recorded from actions by #{ @current_user }" )
  end
  #-- --------------------------------------------------------------------------
  #++


  # Executes the creator given the stored parameters.
  # Returns +true+ in case of no errors, +false+ otherwise.
  #
  def call
    unless @meeting.instance_of?( Meeting ) &&
           @team_affiliation.instance_of?( TeamAffiliation ) &&
           @current_user.instance_of?( User )
      @total_errors = 1
      create_sql_diff_footer( "INVALID PARAMETERS! Exiting..." )
      return false
    end

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


  # Returns a list of MeetingEvents for the selected @meeting.
  # Returns an empty array in case of invalid parameter.
  #
  def expected_rows_count
    # Use memoization to avoid requering.
    @memoized_expected_count ||= get_badges_list.count * (get_events_list.count + 1)
    # (The actual matrix is composed by badges x events event reservations.
    #  The additional column is the single list of tot. badges, 1 for each header
    #  badge reservation)
  end
  #-- --------------------------------------------------------------------------
  #++


  private


  # Returns a list of MeetingEvents for the selected @meeting.
  # Returns an empty array in case of invalid parameter.
  #
  def get_events_list
    # Use memoization to avoid requering:
    @memoized_event_list ||= if @meeting.instance_of?( Meeting )
      @meeting.meeting_events.all
    else
      []
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  # Returns a list of Badges for the selected @team_affiliation
  # Returns an empty array in case of invalid parameter.
  #
  def get_badges_list
    # Use memoization to avoid requering:
    @memoized_badges_list ||= if @team_affiliation.instance_of?( TeamAffiliation )
      @team_affiliation.badges.all
    else
      []
    end
  end
  #-- --------------------------------------------------------------------------
  #++


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
        @created_rows_count += 1
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
        @created_rows_count += 1
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
      has_payed:        false
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

      suggested_minutes:  last_mir ? last_mir.minutes : 0,
      suggested_seconds:  last_mir ? last_mir.seconds : 0,
      suggested_hundreds: last_mir ? last_mir.hundreds : 0
    )
  end
  #-- --------------------------------------------------------------------------
  #++
end
