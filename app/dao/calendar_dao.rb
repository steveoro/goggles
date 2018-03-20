# encoding: utf-8

require 'common/validation_error_tools'

=begin

= CalendarDAO

  - Goggles framework vers.:  4.00.570
  - author: Leega

 DAO class containing the structure for calendar rendering.

=end
class CalendarDAO
 
  class MeetingSessionDAO
    # These must be initialized on creation:
    attr_reader :id, :session_order, :scheduled_date, :warm_up_time, :begin_time, 
                :events_list, :linked_pool #, :swimming_pool, 

    # These can be edited later on:
    attr_accessor :date_span, :pool_span

    #-- -------------------------------------------------------------------------
    #++
  
    # Creates a new instance.
    #
    def initialize( meeting_session, date_span = 1, pool_span = 1 )
      unless meeting_session && meeting_session.instance_of?( MeetingSession )
        raise ArgumentError.new("CalendarDAO sessions needs a valid meeting session")
      end
      
      @id             = meeting_session.id
      @session_order  = meeting_session.session_order
      @scheduled_date = meeting_session.get_scheduled_date
      @warm_up_time   = meeting_session.get_warm_up_time
      @begin_time     = meeting_session.get_begin_time
      #@events_list    = meeting_session.get_short_events
      @events_list    = meeting_session.meeting_events.map{ |event| event.event_type.i18n_compact }.join( ", " )
      #@swimming_pool  = meeting_session.swimming_pool
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
                :can_manage, :team_affiliation_id, :is_user_starred, :is_team_starred, :is_current,
                :meeting_sessions
    #-- -------------------------------------------------------------------------
    #++
    
    # Creates a new instance.
    #
    def initialize( meeting, current_user = nil, can_manage = false, team_affiliation_id = nil )
      unless meeting && meeting.instance_of?( Meeting )
        raise ArgumentError.new("CalendarDAO meetings needs a valid meeting")
      end
      
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

      @is_current = (@header_date >= Date.today() - 6 || @header_date <= Date.today() + 6)   

      @meeting_sessions = []
      
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
  attr_reader :meeting_count, :months, :first_current
  #-- -------------------------------------------------------------------------
  #++

  # These can be edited later on:
  #attr_accessor
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance.
  #
  def initialize( current_user = nil )
    @meetings      = []
    @meeting_count = 0
    @paginated     = false
    @months        = Hash.new()
    @first_current = 0
  end
  
  def meetings
    @paginated = false
    @meetings
  end

  def get_meetings
    @paginated = false
    @meetings
  end

  def get_paginated_meetings( page = 1 )
    @paginated = true
    Kaminari.paginate_array(@meetings).page( page )
  end
  
  def paginated?
    @paginated
  end

  # Adds a meetingDAO to the meeting colelction of calendar DAO
  def add_meeting( meeting, current_user = nil, can_manage = false, team_affiliation_id = nil )
    if meeting && meeting.instance_of?( Meeting )
      meetingDAO = MeetingDAO.new( meeting, current_user, can_manage, team_affiliation_id )
      @meetings << meetingDAO 
      @meeting_count += 1
      month = meetingDAO.header_date.month
      @months[month] = meetingDAO.id if !@months.include?( month )
      @first_current = @meeting_count if meetingDAO.is_current && @first_current == 0   
    end
    @meeting_count
  end
  #-- -------------------------------------------------------------------------
  #++
end
