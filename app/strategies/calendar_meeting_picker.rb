require 'wrappers/timing'

#
# == CalendarMeetingPicker
#
# Pattern to pick meetings to populate calendar DAO
# The meeting search may be perfromed by various parameters
# - tags (meeting tagged by team and/or swimmer)
# - dates (meeting between given dates)
# - season (meetings of a certain season)
# - team (meetings attended by a given team)
# - swimmer (meetings attended by a given swimmer)
#
# @author   Leega
# @version  6.093
#
class CalendarMeetingPicker

  # These must be initialized on creation:
  attr_reader :parameters, :meetings_count

  # These can be edited later on:
  #attr_accessor :season

  # Initialization
  #
  # == Params:
  # An instance of season
  #
  def initialize( date_start = nil, date_end = nil, season = nil, id_list = nil, team = nil, swimmer = nil )
    @parameters     = Hash.new()
    @meetings_count = 0

    @calendarDAO        = CalendarDAO.new()
    @manageable_seasons = Hash.new()
    @swimmer_badges     = Hash.new()

    @parameters[:date_start] = date_start if date_start
    @parameters[:date_end] = date_end if date_end
    @parameters[:season_id] = season.id if season && season.instance_of?( Season )
    @parameters[:team_id] = team.id if team && team.instance_of?( Team )
    @parameters[:swimmer_id] = swimmer.id if team && swimmer.instance_of?( Swimmer )
    @parameters[:id_list] = id_list if id_list
  end
  #-- --------------------------------------------------------------------------
  #++

  # Pick meetings evaluating given parameters
  #
  def pick_meetings( order = 'ASC', show_cancelled = true, current_user = nil )
    # Find out team affiliations manageable seasons and current swimmer's team affiliation
    @manageable_seasons = get_manageable_seasons(current_user)
    @swimmer_badges = get_swimmer_badges(current_user)
    
    if @parameters[:id_list]
      @meetings_count = pick_meetings_by_ids( order, show_cancelled, current_user )
    elsif @parameters[:season_id]
      @meetings_count = pick_meetings_by_season( order, show_cancelled, current_user )
    elsif @parameters[:team_id]
      @meetings_count = pick_meetings_by_team( order, show_cancelled, current_user )
    elsif @parameters[:swimmer_id]
      @meetings_count = pick_meetings_by_swimmer( order, show_cancelled, current_user )
    else
      @meetings_count = pick_meetings_by_dates( order, show_cancelled, current_user )     
    end
    
    @calendarDAO
  end
  #-- --------------------------------------------------------------------------
  #++

  # Pick meetings by id_list
  # Meetings are those listed in id_list
  #
  def pick_meetings_by_ids( order = 'ASC', show_cancelled = true, current_user = nil )
    id_list = @parameters[:id_list]
    meetings_count = 0

    if id_list && id_list.size > 0
      # Create filter
      filters = "id IN (#{id_list.join(',')})" 
      filters += ' AND (NOT is_cancelled)' if !show_cancelled
          
      Meeting
        .includes(meeting_sessions: [swimming_pool: [:city, :pool_type], meeting_events: [event_type: [:stroke_type]]], season: [:season_type])
        .where( "#{filters}" )
        .order( "meetings.header_date #{order}" )
        .each do |meeting|
          # Verify managements
          team_affiliation_id = nil
          team_affiliation_id = @manageable_seasons[meeting.season_id] if @manageable_seasons && @manageable_seasons.size > 0 
          can_manage = !team_affiliation_id.nil?
          team_affiliation_id = @swimmer_badges[meeting.season_id] if team_affiliation_id.nil? && @swimmer_badges && @swimmer_badges.size > 0 

          @calendarDAO.meetings << CalendarDAO::MeetingDAO.new( meeting, current_user, can_manage, team_affiliation_id )
          meetings_count += 1 
        end
    end
    meetings_count
  end    

  # Pick meetings by season
  # Meetings are those belngs to parameter season
  #
  def pick_meetings_by_season( order = 'ASC', show_cancelled = true, current_user = nil )
    season_id = @parameters[:season_id]
    meetings_count = 0
    
    if season_id && season_id > 0
      # Create filter
      filters = "(season_id = #{season_id})"
      filters += " AND (header_date >= '#{@parameters[:date_start]}')" if @parameters[:date_start]
      filters += " AND (header_date <= '#{@parameters[:date_end]}')" if @parameters[:date_end]
      filters += ' AND (NOT is_cancelled)' if !show_cancelled

      # Verify managements
      team_affiliation_id = @manageable_seasons[season_id] if @manageable_seasons && @manageable_seasons.size > 0
      can_manage = !team_affiliation_id.nil?
      team_affiliation_id = @swimmer_badges[season_id] if team_affiliation_id.nil? && @swimmer_badges && @swimmer_badges.size > 0 
         
      Meeting
        .includes(meeting_sessions: [swimming_pool: [:city, :pool_type], meeting_events: [event_type: [:stroke_type]]], season: [:season_type])
        .where( "#{filters}" )
        .order( "meetings.header_date #{order}" )
        .each do |meeting|
          @calendarDAO.meetings << CalendarDAO::MeetingDAO.new( meeting, current_user, can_manage, team_affiliation_id )
          meetings_count += 1 
        end
    end    
    meetings_count
  end    

  # Pick meetings by team
  # Meetings are those attended by parameter team
  #
  def pick_meetings_by_team( order = 'ASC', show_cancelled = true, current_user = nil )
    team_id = @parameters[:team_id]
    meetings_count = 0

    if team_id && team_id > 0
      # Create filter
      filters = "(meeting_individual_results.team_id = #{team_id})" 
      filters += ' AND (NOT is_cancelled)' if !show_cancelled
          
      Meeting
        .joins(:meeting_individual_results)
        .includes(meeting_sessions: [swimming_pool: [:city, :pool_type], meeting_events: [event_type: [:stroke_type]]], season: [:season_type])
        .where( "#{filters}" )
        .distinct
        .order( "meetings.header_date #{order}" )
        .each do |meeting|
          # Verify managements
          team_affiliation_id = nil
          team_affiliation_id = @manageable_seasons[meeting.season_id] if @manageable_seasons && @manageable_seasons.size > 0 
          can_manage = !team_affiliation_id.nil?
          team_affiliation_id = @swimmer_badges[meeting.season_id] if team_affiliation_id.nil? && @swimmer_badges && @swimmer_badges.size > 0 

          @calendarDAO.meetings << CalendarDAO::MeetingDAO.new( meeting, current_user, can_manage, team_affiliation_id )
          meetings_count += 1 
        end
    end
    meetings_count
  end    

  # Pick meetings by swimmer
  # Meetings are those attended by parameter swimmer
  #
  def pick_meetings_by_swimmer( order = 'ASC', show_cancelled = true, current_user = nil )
    meetings_count = 0
    meetings_count
  end    

  # Pick meetings by dates
  # Meetings are those attended by parameter dates
  #
  def pick_meetings_by_dates( order = 'ASC', show_cancelled = true, current_user = nil )
    date_start = @parameters[:date_start]
    date_end   = @parameters[:date_end]
    meetings_count = 0
    
    if date_start || date_end 
      # Create filter
      filters = 'true'
      filters += " AND (header_date >= '#{date_start}')" if date_start
      filters += " AND (header_date <= '#{date_end}')" if date_end
      filters += ' AND (NOT is_cancelled)' if !show_cancelled
         
      Meeting
        .includes(meeting_sessions: [swimming_pool: [:city, :pool_type], meeting_events: [event_type: [:stroke_type]]], season: [:season_type])
        .where( "#{filters}" )
        .order( "meetings.header_date #{order}" )
        .each do |meeting|
          # Verify managements
          team_affiliation_id = nil
          team_affiliation_id = @manageable_seasons[meeting.season_id] if @manageable_seasons && @manageable_seasons.size > 0 
          can_manage = !team_affiliation_id.nil?
          team_affiliation_id = @badges[meeting.season_id] if team_affiliation_id.nil? && @swimmer_badges && @swimmer_badges.size > 0 
          
          @calendarDAO.meetings  << CalendarDAO::MeetingDAO.new( meeting, current_user, can_manage, team_affiliation_id )
          meetings_count += 1 
        end
    end    
    meetings_count
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
    swimmer_badges = {}
    if current_user != nil && current_user.has_associated_swimmer?
      current_user.swimmer.badges.select(:season_id, :team_affiliation_id).each do |badge|
        swimmer_badges[badge.season_id] = badge.team_affiliation_id
      end
    end
    swimmer_badges
  end
  
end
