require 'wrappers/timing'

#
# == PendingReservationFinder
#
# Pattern to find out (meeting's) pending reservation
# Pending reservations are those not confirmed for meetings not closed (without results)
# 
#
# @author   Leega
# @version  6.093
#
class PendingReservationFinder

  # These must be initialized on creation:
  attr_reader :user 

  # These can be edited later on:
  attr_accessor :meetings_ids, :team_affiliations_ids, :pending_reservations

  # Initialization
  #
  def initialize( user )
    @meetings_ids          = []
    @team_affiliations_ids = []
    @pending_reservations  = []

    @user = user
  end
  #-- --------------------------------------------------------------------------
  #++

  # Find the manageable team affiliation of the given user
  #
  def find_manageable_affiliations( check_date = Date.today() )
    @team_affiliations_ids = @user.
      team_managers.
      joins( team_affiliation: :season ).
      where( ['seasons.end_date >= ? and seasons.begin_date <= ?', check_date, check_date]).
      select( :team_affiliation_id ).
      map{ |ta| ta.team_affiliation_id }
  end
  #-- -------------------------------------------------------------------------
  #++

  # Find the meetings not closed
  # A meeting not closed is a meeting not in the past, withput results and with entry deadline not gone
  #
  def find_open_meetings( check_date = Date.today() )
    @meetings_ids = Meeting.
      where( are_results_acquired: false ).
      where(['meetings.header_date >= ? and (meetings.entry_deadline is null or meetings.entry_deadline > ?)', check_date, check_date] ).
      select( :id ).
      map{ |m| m.id }
  end
  #-- -------------------------------------------------------------------------
  #++
  
  # Get the pending reservations (usefull datas)
  # Pending reservations are those not confirmed for meetings inj meetings_ids array
  #
  def get_pending_reservations()
    # If no meetings_ids check out
    if @meetings_ids.size == 0
      find_open_meetings()
    end

    # If no team_affiliations_ids check out
    if @team_affiliations_ids.size == 0
      find_manageable_affiliations()
    end
    
    @pending_reservations = MeetingEventReservation.
      joins( :meeting, :swimmer, :badge, meeting_event: [:event_type, meeting_session: :swimming_pool] ).
      joins("INNER JOIN meeting_reservations on meeting_reservations.meeting_id = meeting_event_reservations.meeting_id and meeting_reservations.badge_id = meeting_event_reservations.badge_id").
      where( is_doing_this: true, meeting_reservations: {has_confirmed: false}, meeting_id: @meetings_ids, badges: {team_affiliation_id: @team_affiliations_ids} ).
      select( :meeting_id, :swimmer_id, :suggested_minutes, :suggested_seconds, :suggested_hundreds, "meetings.header_date", "meetings.entry_deadline", "meetings.description", "swimmers.complete_name", "meeting_events.event_type_id", "event_types.code", "'' as notes", "swimming_pools.pool_type_id", "badges.team_affiliation_id").
      order("meetings.header_date", "meetings.id", "swimmers.complete_name").to_a

    @pending_reservations.each do |reservation|
      if MeetingIndividualResult.joins( meeting_event: { meeting_session: { swimming_pool: [:city, :pool_type] }} ).
        where([ "meeting_events.event_type_id = ? and pool_types.id = ?", reservation.event_type_id, reservation.pool_type_id ]).
        where(
          swimmer_id: reservation.swimmer_id, 
          minutes: reservation.suggested_minutes, 
          seconds: reservation.suggested_seconds, 
          hundreds: reservation.suggested_hundreds ).exists?
        mir = MeetingIndividualResult.joins( meeting_event: { meeting_session: { swimming_pool: [:city, :pool_type] }} ).
          where([ "meeting_events.event_type_id = ? and pool_types.id = ?", reservation.event_type_id, reservation.pool_type_id ]).
          where(
            swimmer_id: reservation.swimmer_id, 
            minutes: reservation.suggested_minutes, 
            seconds: reservation.suggested_seconds, 
            hundreds: reservation.suggested_hundreds ).
            select("meeting_sessions.scheduled_date", "cities.name", "pool_types.code").
            order( :created_at ).last
        reservation[:notes] = Format.a_date( mir.scheduled_date ) + ' ' + mir.name + ' (' + mir.code + ')'
      else
        reservation[:notes] = I18n.t('team_management.manual')
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
  
end
