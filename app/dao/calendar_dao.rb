# encoding: utf-8

=begin

= CalendarDAO

  - Goggles framework vers.:  4.00.570
  - author: Leega

 DAO class containing the structure for calendar rendering.

=end
class CalendarDAO
 
  class MeetingSessionDAO
    # These must be initialized on creation:
    attr_reader :id, :session_order, :scheduled_date, :warm_up_time, :begin_time, :events_list, :swimming_pool, :linked_pool

    # These can be edited later on:
    attr_accessor :date_span, :pool_span

    #-- -------------------------------------------------------------------------
    #++
  
    # Creates a new instance.
    #
    def initialize( meeting_session, date_span = 1, pool_span = 1 )
      @id             = meeting_session.id
      @session_order  = meeting_session.session_order
      @scheduled_date = meeting_session.get_scheduled_date
      @warm_up_time   = meeting_session.get_warm_up_time
      @begin_time     = meeting_session.get_begin_time
      #@events_list    = meeting_session.get_short_events
      @events_list    = meeting_session.meeting_events.map{ |event| event.event_type.i18n_compact }.join( ", " )
      @swimming_pool  = meeting_session.swimming_pool
      @linked_pool    = meeting_session.swimming_pool.decorate.get_linked_name( :get_city_and_attributes )
      @date_span      = date_span
      @pool_span      = pool_span
    end

    # Compatibility methods
    #
    def get_scheduled_date
      @scheduled_date
    end
    
    def get_warm_up_time
      @warm_up_time
    end
    
    def get_begin_time
      @begin_time
    end
    
    def get_short_events
      @events_list
    end
  end


  class MeetingDAO
    # These must be initialized on creation:
    attr_reader :id, :description, :header_date, :is_confirmed, :are_results_acquired, :has_start_list, :has_invitation, :season_id,
                :linked_name, :logo_for_season_type, :reservation_button,
                :can_manage, :team_affiliation_id, :is_user_starred, :is_team_starred,
                :meeting_sessions
    #-- -------------------------------------------------------------------------
    #++
    
    # Creates a new instance.
    #
    def initialize( meeting, current_user = nil, can_manage = false, team_affiliation_id = nil )
      @id                   = meeting.id
      @description          = meeting.get_full_name
      @header_date          = meeting.header_date
      @is_confirmed         = meeting.is_confirmed
      @are_results_acquired = meeting.are_results_acquired
      @has_start_list       = meeting.has_start_list
      @season_id            = meeting.season_id
      @can_manage           = can_manage 

      @has_invitation       = (meeting.invitation != nil)
      
      decorated_meeting     = meeting.decorate
      @linked_name          = decorated_meeting.get_linked_name( :get_full_name )
      @logo_for_season_type = meeting.decorate.get_logo_for_season_type
      #@reservation_button   = current_user != nil ? decorated_meeting.manage_reservation_button_tm( current_user, can_manage ) : ''
      @reservation_button   = current_user != nil ? decorated_meeting.manage_reservation_button( current_user ) : ''

      @team_affiliation_id   = team_affiliation_id

      @is_user_starred = current_user != nil ? meeting.tags_by_user_list.include?( "u#{ current_user.id }" ) : false
      @is_team_starred = @team_affiliation_id != nil ? meeting.tags_by_team_list.include?( "ta#{ @team_affiliation_id }" ) : false

      @meeting_sessions     = []
      
      previous_date = nil
      previous_pool = nil
      date_span     = 0
      pool_span     = 0

      # Collect meeting sessions (sessions already ordered by default)
      meeting.meeting_sessions.each do |meeting_session|
        # Manage col span for session scheduled date
        if meeting_session.get_scheduled_date != previous_date
          previous_date = meeting_session.get_scheduled_date
          date_span     = 1
        else
          date_span = 0
        end

        # Manage col span for swimming pool
        if meeting_session.swimming_pool != previous_pool
          previous_pool = meeting_session.swimming_pool
          pool_span     = 1
        else
          pool_span = 0
        end     

        @meeting_sessions << MeetingSessionDAO.new( meeting_session, date_span, pool_span )
      end
      
      # Calculates column spans
      calculate_span
      
      # TODO
      # Add attributes to manage notes
      # Automate is_confirmed and other flags
    end
    
    # Determinates the col span forose fields that could be present many times
    # and should not be shown in calendar views
    #
    def calculate_span
      date_span_count = 0
      pool_span_count = 0
      @meeting_sessions.reverse.each do |meeting_session_dao|
        date_span_count += 1
        pool_span_count += 1
        if meeting_session_dao.date_span > 0
          meeting_session_dao.date_span = date_span_count
          date_span_count = 0    
        end
        if meeting_session_dao.pool_span > 0
          meeting_session_dao.pool_span = pool_span_count
          pool_span_count = 0    
        end
      end
    end
  end


  # These must be initialized on creation:
  attr_reader :meetings, :meeting_count
  #-- -------------------------------------------------------------------------
  #++

  # These can be edited later on:
  attr_accessor :season_id, :date_start, :date_end, :id_list
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  #
  def initialize( season_id = nil, date_start = nil, date_end = nil, id_list = nil )
    @meetings      = []
    @meeting_count = 0
    
    # Filters
    @season_id  = season_id
    @date_start = date_start
    @date_end   = date_end
    @id_list    = id_list
    
  end
  #-- -------------------------------------------------------------------------
  #++
  
  # Find out meetings for given filter parameters
  #
  def get_meetings( order = 'ASC', current_user = nil )
    # Find out team affiliations manageable seasons andcurrent swimmer's team affiliation
    manageable_seasons = get_manageable_seasons(current_user)
    badges = get_swimmer_badges(current_user)
    
    @meeting_count = 0
    if @id_list && id_list.size > 0
      Meeting
        .includes(meeting_sessions: [swimming_pool: [:city, :pool_type], meeting_events: [event_type: [:stroke_type]]], season: [:season_type])
         .where( "id IN (?)", @id_list )
        .order( "meetings.header_date #{order}" )
        .each do |meeting|
          team_affiliation_id = nil
          team_affiliation_id = manageable_seasons[meeting.season_id] if manageable_seasons.size > 0 
          can_manage = !team_affiliation_id.nil?
          team_affiliation_id = badges[meeting.season_id] if team_affiliation_id.nil? && badges.size > 0 
          @meetings << MeetingDAO.new( meeting, current_user, can_manage, team_affiliation_id )
          @meeting_count += 1 
        end
    else
      filters = '(NOT is_cancelled)'
      filters += " AND (season_id = #{@season_id})" if @season_id
      filters += " AND (header_date >= '#{@date_start}')" if @date_start
      filters += " AND (header_date <= '#{@date_end}')" if @date_end
         
      Meeting
        .includes(meeting_sessions: [swimming_pool: [:city, :pool_type], meeting_events: [event_type: [:stroke_type]]], season: [:season_type])
        .where( "#{filters}" )
        .order( "meetings.header_date #{order}" )
        .each do |meeting|
          team_affiliation_id = nil
          team_affiliation_id = manageable_seasons[meeting.season_id] if manageable_seasons.size > 0 
          can_manage = !team_affiliation_id.nil?
          team_affiliation_id = badges[meeting.season_id] if team_affiliation_id.nil? && badges.size > 0 
          @meetings << MeetingDAO.new( meeting, current_user, can_manage, team_affiliation_id )
          @meeting_count += 1 
        end
    end    
    @meeting_count
  end 


  # Retrieve manageable seasons for current user if current user is a team manger
  # Return an hash with season_id => team_affiliation_id
  # Empty hash if current_user not set or currentuser not a team manager
  #
  def get_manageable_seasons( current_user = nil )
    manageable_seasons = {}    
    if current_user != nil
      managed_teams = current_user.team_managers.includes(:team_affiliation).to_a
      managed_teams.each do |tm|
        manageable_seasons[tm.team_affiliation.season_id] = tm.team_affiliation_id
      end
    end
    manageable_seasons
  end

  # Retrieve user associated swimmer's affiliations if any
  # Return an hash with season_id => team_affiliation_id
  # Empty hash if current_user has not associated swimmer
  #
  def get_swimmer_badges( current_user = nil )
    badges = {}
    if current_user != nil && current_user.has_associated_swimmer?
      @team_affiliation_id = current_user.swimmer.badges.select(:season_id, :team_affiliation_id).each do |badge|
        badges[badge.season_id] = badge.team_affiliation_id
      end
    end
    badges
  end
end
