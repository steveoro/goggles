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
  attr_reader :user, :meetings_ids, :seasons_ids, :pending_reservations, :seasons_found, :meetings_found

  # These can be edited later on:
  #attr_accessor

  # Initialization
  #
  def initialize( user )
    @meetings_ids         = []
    @seasons_ids          = []
    @pending_reservations = []

    @seasons_found  = false
    @meetings_found = false

    @user = user
  end
  #-- --------------------------------------------------------------------------
  #++

  # Find the manageable seasons of the given user
  #
  def find_manageable_seasons( check_date = Date.today() )
    @seasons_found = true
    @seasons_ids = @user.
      team_managers.
      joins( team_affiliation: :season ).
      where( ['seasons.end_date >= ? and seasons.begin_date <= ?', check_date, check_date]).
      select( "team_affiliations.season_id" ).
      map{ |tm| tm.season_id }
  end
  #-- -------------------------------------------------------------------------
  #++

  # Find the meetings not closed
  # A meeting not closed is a meeting not in the past, withput results and with entry deadline not gone
  #
  def find_open_meetings( check_date = Date.today() )
    @meetings_found = true

    # If no seasons_ids check out
    if !@seasons_found
      find_manageable_seasons()
    end

    @meetings_ids = Meeting.
      where( are_results_acquired: false ).
      where( season_id: @seasons_ids ).
      where(['meetings.header_date >= ? and (meetings.entry_deadline is null or meetings.entry_deadline >= ?)', check_date, check_date] ).
      select( :id ).
      map{ |m| m.id }
  end
  #-- -------------------------------------------------------------------------
  #++

  # Sets the given meeting id as the only searched for
  #
  def set_searched_meeting( meeting_id )
    @meetings_ids = []
    @meetings_found = true
    @meetings_ids << meeting_id
  end

  # Get the pending reservations (usefull datas)
  # Pending reservations are those not confirmed for meetings inj meetings_ids array
  #
  def get_pending_reservations()
    # If not closed meetings scanned, check them out
    if !@meetings_found
      find_open_meetings()
    end

    @pending_reservations = MeetingEventReservation.
      joins( :swimmer, :badge, meeting_event: [:event_type, meeting_session: :swimming_pool], meeting: [season: [season_type: :federation_type]] ).
      joins("INNER JOIN meeting_reservations on meeting_reservations.meeting_id = meeting_event_reservations.meeting_id and meeting_reservations.badge_id = meeting_event_reservations.badge_id").
      where( is_doing_this: true, meeting_reservations: {has_confirmed: false}, meeting_id: @meetings_ids ).
      select( :id,
              "meeting_reservations.id as meeting_reservation_id",
              :meeting_id,
              :swimmer_id,
              :suggested_minutes,
              :suggested_seconds,
              :suggested_hundreds,
              "meetings.header_date",
              "meetings.entry_deadline",
              "meetings.description",
              "swimmers.complete_name",
              "event_types.code as event",
              "badges.number as badge_number",
              "(case when federation_types.code = 'CSI' THEN meeting_events.event_order ELSE event_types.style_order END) as event_order",
              "meetings.season_id",
              "federation_types.code as federation_code",
              #"'' as notes").  # Do it with a single query
              "(SELECT concat_ws(' ', date_format(t_ms.scheduled_date, '%d/%m/%Y'), t_c.name, t_pt.code) as notes
                FROM meeting_individual_results t_mir
                  INNER JOIN meeting_programs t_mp ON t_mp.id = t_mir.meeting_program_id
                  INNER JOIN meeting_events t_me ON t_me.id = t_mp.meeting_event_id
                  INNER JOIN meeting_sessions t_ms ON t_ms.id = t_me.meeting_session_id
                  INNER JOIN swimming_pools t_sp ON t_sp.id = t_ms.swimming_pool_id
                  INNER JOIN cities t_c ON t_c.id = t_sp.city_id
                  INNER JOIN pool_types t_pt ON t_pt.id = t_sp.pool_type_id
                WHERE t_mir.swimmer_id = swimmers.id
                  AND t_me.event_type_id = event_types.id
                  AND t_pt.id = swimming_pools.pool_type_id
                  AND t_mir.minutes = meeting_event_reservations.suggested_minutes
                  AND t_mir.seconds = meeting_event_reservations.suggested_seconds
                  AND t_mir.hundreds = meeting_event_reservations.suggested_hundreds
                ORDER BY t_ms.scheduled_date DESC LIMIT 1) as notes").
      #order("meetings.header_date", "meetings.id", "swimmers.complete_name", "meeting_events.event_order").to_a
      order("8, 3, 11, 14").to_a
  end
  #-- -------------------------------------------------------------------------
  #++
end
