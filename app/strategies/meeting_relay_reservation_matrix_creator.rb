# encoding: utf-8
require 'common/validation_error_tools'


=begin

= MeetingRelayReservationMatrixCreator

 - Goggles framework vers.:  6.026
 - author: Steve A.

 Strategy class used to build-up a matrix of MeetingRelayReservation rows on the DB,
 one for each available relay event times each registered athlete.

 Check out also the companion class for this one, MeetingEventReservationMatrixCreator,
 which is a little bit more convoluted, since individual events are more subtle for
 the registration process.


 Our goal is achieved given a specific:

 - Meeting instance
 - TeamAffiliation instance, somehow linked to the current_user instance
 - the current_user (User) instance

 Meeting is used to build-up the list of possibile (relay) events
 TeamAffiliation is used to collect the full list of associated Swimmers for the
 specific season/academic year.

 Each added database row is logged through the SqlConvertable's exposed method
 #sql_diff_text_log in a single output "diff" text, created after #call.

 In case of failure, the strategy fails silently, logging the actual errors inside
 the same generated SQL diff text.

 Keep in mind that serialization of this diff SQL text is delegated to external
 objects.

=end
class MeetingRelayReservationMatrixCreator
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
    create_sql_diff_header( "MeetingRelayReservationMatrixCreator: recorded from actions by #{ @current_user }" )
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


  # Returns the expected row count for the execution of the creator class.
  #
  # The result is the expected total data area. The actual created_rows_count
  # will be lesser than this only when some rows are skipped during creation
  # (either due to errors or because already existing).
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


  # Returns a list of (Relay-only) MeetingEvents for the selected @meeting.
  # Returns an empty array in case of invalid parameter.
  #
  def get_events_list
    # Use memoization to avoid requering:
    @memoized_event_list ||= if @meeting.instance_of?( Meeting )
      @meeting.meeting_events.only_relays.all
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


  # Creates a new MeetingRelayReservation row if no pre-existing rows are found
  # associated to the same N-tuple (meeting, team, swimmer, badge, meeting_event).
  # When the row keys are already found, nothing is done.
  #
  def create_relay_reservation_if_missing( badge, event )
    # Check any previous existence:
    reservation_count = MeetingRelayReservation.where(
      meeting_id:       @meeting.id,
      team_id:          @team_affiliation.team_id,
      swimmer_id:       badge.swimmer_id,
      badge_id:         badge.id,
      meeting_event_id: event.id
    ).count

    if reservation_count == 0
      # Build the new row
      reservation = prepare_new_relay_reservation( badge, event )
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


  # Prepares the members for a new MeetingRelayReservation row.
  #
  def prepare_new_relay_reservation( badge, event )
    swimmer = badge.swimmer

    MeetingRelayReservation.new(
      meeting_id:       @meeting.id,
      team_id:          @team_affiliation.team_id,
      swimmer_id:       badge.swimmer_id,
      badge_id:         badge.id,
      meeting_event_id: event.id,
      user_id:          @current_user.id,
      is_doing_this:    false
    )
  end
  #-- --------------------------------------------------------------------------
  #++
end