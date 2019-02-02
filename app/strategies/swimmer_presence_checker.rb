require 'wrappers/timing'

#
# == SwimmerPresenceChecker
#
# Pattern to calcolate swimmer presence to meetings
# A presence to a meeting is defined by an entry, an individuale result or a relay result
#
# @author   Leega
# @version  6.093
#
class SwimmerPresenceChecker

  # These must be initialized on creation:
  attr_reader :swimmer, :evaluation_date

  # These can be edited later on:
  attr_accessor :header_year, :swimmer_presence_dao

  # Initialization
  #
  # == Params:
  # The swimmer to check for
  # The evaluation date to chek for (default today)
  # The evaluation date determines the seasons to consider
  #
  def initialize( swimmer, evaluation_date = Date.today() )
    @swimmer         = swimmer
    @evaluation_date = evaluation_date
    @header_year     = get_current_header_year()


    @swimmer_presence_dao = SwimmerPresenceDAO.new( @swimmer, @header_year )
  end
  #-- --------------------------------------------------------------------------
  #++

  # Get the current header year using given date
  # Use current date if no date given
  #
  def get_current_header_year()
    year = @evaluation_date.month < 10 ? @evaluation_date.year - 1 : @evaluation_date.year
    "#{year}/#{year+1}"   
  end
  #-- -------------------------------------------------------------------------
  #++

  # Get the swimmer badges for the given header year seasons 
  #
  def get_swimmer_current_badges()
    @swimmer.badges.joins( :season ).where( ['header_year = ?', @header_year] )  
  end
  #-- -------------------------------------------------------------------------
  #++

  # Get the seasons for the given header year where swimmer has badge
  #
  def get_swimmer_current_seasons()
    Season.where( header_year: get_current_header_year() ).where( ['exists (select 1 from badges where season_id = seasons.id and swimmer_id=?)', @swimmer.id] )  
  end
  #-- -------------------------------------------------------------------------
  #++
    
  # Check if the swimmer has attended the given meeting
  # The swimmer has attended when there is an entry or an individual result or a confirmed reservation
  #
  def has_swimmer_attended_meeting( meeting )
    is_present = false
    # Check for meeting individual results
    if MeetingIndividualResult.joins( :meeting_session ).where( ['meeting_individual_results.swimmer_id = ? and meeting_sessions.meeting_id = ?', @swimmer.id, meeting.id] ).exists?
      is_present = true
    # Check for meeting entries
    elsif MeetingEntry.joins( :meeting_session ).where( ['meeting_entries.swimmer_id = ? and meeting_sessions.meeting_id = ?', @swimmer.id, meeting.id] ).exists?
      is_present = true
    # Check for confirmed reservation
    elsif MeetingReservation.is_coming.where( ['has_confirmed and swimmer_id = ? and meeting_id = ?', @swimmer.id, meeting.id] ).exists?
      is_present = true
    end  
    is_present
  end
  #-- -------------------------------------------------------------------------
  #++
  
  # Check if the swimmer swam in a relay for a given meeting
  #
  def has_swimmer_swam_relay( meeting )
    MeetingRelayResult.joins( :meeting_session, :meeting_relay_swimmers ).where( ['meeting_relay_swimmers.swimmer_id = ? and meeting_sessions.meeting_id = ?', @swimmer.id, meeting.id] ).exists?
  end
  #-- -------------------------------------------------------------------------
  #++
    
  # Count swimmer events for the given meeting
  # The swimmer events are the highest in entries, individual results and confirmed reservation events
  #
  def count_swimmer_events( meeting )
    events = 0

    # Count meeting individual results
    mir_events = MeetingIndividualResult.joins( :meeting_session ).where( ['meeting_individual_results.swimmer_id = ? and meeting_sessions.meeting_id = ?', @swimmer.id, meeting.id] ).count
    # Count meeting entries
    entry_events = MeetingEntry.joins( :meeting_session ).where( ['meeting_entries.swimmer_id = ? and meeting_sessions.meeting_id = ?', @swimmer.id, meeting.id] ).count
    # Count confirmed reservation
    res_events = MeetingEventReservation.where( ['meeting_event_reservations.swimmer_id = ? and meeting_event_reservations.meeting_id = ? and meeting_event_reservations.is_doing_this', @swimmer.id, meeting.id] ).exists?

    events
  end
  #-- -------------------------------------------------------------------------
  #++
  
  # Count swimmer's relays swam for a given meeting
  #
  def count_swimmer_relays( meeting )
    MeetingRelayResult.joins( :meeting_session, :meeting_relay_swimmers ).where( ['meeting_relay_swimmers.swimmer_id = ? and meeting_sessions.meeting_id = ?', @swimmer.id, meeting.id] ).count
  end
  #-- -------------------------------------------------------------------------
  #++
end
