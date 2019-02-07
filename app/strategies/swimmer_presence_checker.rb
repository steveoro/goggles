require 'wrappers/timing'

#
# == SwimmerPresenceChecker
#
# Pattern to calcolate swimmer presence to meetings
# A presence to a meeting is defined by a confirmed reservation, an entry, an individual result or a relay result
#
# @author   Leega
# @version  6.093
#
class SwimmerPresenceChecker

  # These must be initialized on creation:
  attr_reader :swimmer, :evaluation_date, :header_year

  # These can be edited later on:
  attr_accessor :swimmer_presence_dao

  # Initialization
  #
  # == Params:
  # The swimmer to check for
  # The evaluation date to chek for (default today)
  # The header_year of seasons to consider (default the header_year according to evaluation_date)
  #
  def initialize( swimmer, evaluation_date = Date.today(), header_year = get_date_header_year() )
    @swimmer         = swimmer
    @evaluation_date = evaluation_date
    @header_year     = header_year

    @swimmer_presence_dao = SwimmerPresenceDAO.new( @swimmer, @evaluation_date, @header_year )
  end
  #-- --------------------------------------------------------------------------
  #++

  # Get the current header year using given date
  # Use current date if no date given
  #
  def get_date_header_year( evaluation_date = Date.today() )
    year = evaluation_date.month < 10 ? evaluation_date.year - 1 : evaluation_date.year
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
    Season.where( header_year: @header_year ).where( ['exists (select 1 from badges where season_id = seasons.id and swimmer_id=?)', @swimmer.id] )  
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
    
  # Count swimmer events swam for the given meeting
  # The swimmer events swam are the number of individual results
  #
  def count_swimmer_mirs( meeting )
    # Count meeting individual results
    MeetingIndividualResult.joins( :meeting_session ).where( ['meeting_individual_results.swimmer_id = ? and meeting_sessions.meeting_id = ?', @swimmer.id, meeting.id] ).count
  end
  #-- -------------------------------------------------------------------------
  #++
  
  # Count swimmer entries for the given meeting
  # Note that entries aren't always managed
  #
  def count_swimmer_entries( meeting )
    # Count meeting entries
    MeetingEntry.joins( :meeting_session ).where( ['meeting_entries.swimmer_id = ? and meeting_sessions.meeting_id = ?', @swimmer.id, meeting.id] ).count
  end
  #-- -------------------------------------------------------------------------
  #++
  
  # Count swimmer reservations for the given meeting
  # Note that reservations aren't always managed
  #
  def count_swimmer_reservations( meeting )
    # Count meeting entries
    MeetingEventReservation.joins("INNER JOIN meeting_reservations ON meeting_reservations.swimmer_id = meeting_event_reservations.swimmer_id AND meeting_reservations.meeting_id = meeting_event_reservations.meeting_id").where( ['meeting_event_reservations.swimmer_id = ? and meeting_event_reservations.meeting_id = ? and meeting_event_reservations.is_doing_this and meeting_reservations.has_confirmed', @swimmer.id, meeting.id] ).count
  end
  #-- -------------------------------------------------------------------------
  #++
  
  # Count swimmer events for the given meeting
  # The swimmer events are the highest in entries, individual results and confirmed reservation events
  #
  def count_swimmer_events( meeting )
    [count_swimmer_mirs( meeting ), count_swimmer_entries( meeting ), count_swimmer_reservations( meeting )].max
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
  
  # Scan a season to find meeting with swimmer presence
  # Returns numeber of attended meeting found
  #
  def scan_season( season, compute_costs = false )
    season.meetings.has_results.each do |meeting|
      if has_swimmer_attended_meeting( meeting )
        mp = SwimmerPresenceDAO::MeetingPresenceDAO.new( meeting, season, compute_costs )
        mp.det_reservations_count = count_swimmer_reservations( meeting )
        mp.det_entries_count = count_swimmer_entries( meeting )
        mp.det_results_count = count_swimmer_mirs( meeting )
        mp.was_present = (mp.det_results_count > 0) 
        mp.events_count = [mp.det_reservations_count, mp.det_entries_count, mp.det_results_count].max  # Maybe better move logic to DAO
        mp.relays_count = count_swimmer_relays( meeting )
        
        @swimmer_presence_dao.add_meeting( mp )
      end
    end
    @swimmer_presence_dao.meetings.count
  end
  #-- -------------------------------------------------------------------------
  #++
end
