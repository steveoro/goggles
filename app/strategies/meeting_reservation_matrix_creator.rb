# encoding: utf-8
require 'common/validation_error_tools'


=begin

= MeetingReservationMatrixCreator

 - Goggles framework vers.:  6.015
 - author: Steve A.

 Strategy class used to build-up a matrix of (Events x Athletes) total rows of
 MeetingReservation directly on the database, given a specific:

 - Meeting instance
 - TeamAffiliation instance, somehow linked to the current_user instance
 - the current_user (User) instance

 Meeting is used to build-up the list of possibile events
 TeamAffiliation is used to collect the list of associated Swimmers

 Each added row is logged through the SqlConvertable's expposted method #sql_diff_text_log

 In case of failure, the strategy fails silently, logging the actual errors inside
 the created output SQL diff text, and counting the errors in the dedicated member.

=end
class MeetingReservationMatrixCreator
  include SqlConvertable

  attr_reader :meeting, :team_affiliation, :current_user,
              :expected_rows_count, :created_rows_count,
              :total_errors

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
    @created_rows_count  = 0
    @expected_rows_count = 0
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

    # Initialize the expected row count:
    @expected_rows_count = get_badges_list.count * get_events_list.count

    # Loop on each matrix item and create a row, if missing:
    get_badges_list.each do |badge|
      get_events_list.each do |event|
        create_reservation_if_missing( badge, event )
      end
    end
    return (@total_errors == 0)
  end
  #-- --------------------------------------------------------------------------
  #++


  private


  # Returns a list of MeetingEvents for the selected @meeting.
  # Returns an empty array in case of invalid parameter.
  #
  def get_events_list
    # Use memoization to avoid requering:
    @event_list ||= if @meeting.instance_of?( Meeting )
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
    @badges_list ||= if @team_affiliation.instance_of?( TeamAffiliation )
      @team_affiliation.badges.all
    else
      []
    end
  end
  #-- --------------------------------------------------------------------------
  #++


  # Creates a new MeetingReservation row if no pre-existing rows are found
  # associated to the same N-tuple (meeting, team, swimmer, badge, meeting_event).
  # When the row keys is already found, nothing is done.
  #
  def create_reservation_if_missing( badge, event )
    # Check any previous existence:
    reservation = MeetingReservation.where(
      meeting_id:       @meeting.id,
      team_id:          @team_affiliation.team_id,
      swimmer_id:       badge.swimmer_id,
      badge_id:         badge.id,
      meeting_event_id: event.id
    ).first

    if reservation.nil?
      # Build the new row
      reservation = prepare_new_reservation( badge, event )
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


  # Creates a new MeetingReservation row if no pre-existing rows are found
  # associated to the same N-tuple (meeting, team, swimmer, badge, meeting_event).
  # When the row keys is already found, nothing is done.
  #
  def prepare_new_reservation( badge, event )
    # Retrieve last MIR (when possibile), to fill-in with suggested enrollment timing:
    swimmer = badge.swimmer
    last_mir = swimmer.meeting_individual_results
      .joins(:meeting_event).where(['event_type_id = ?', event.event_type_id])
      .last

    MeetingReservation.new(
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
end
