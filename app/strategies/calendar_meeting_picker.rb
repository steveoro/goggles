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
  attr_reader :parameters, :calendarDAO, :meetings_count

  # These can be edited later on:
  #attr_accessor :season

  # Initialization
  #
  # == Params:
  # An instance of season
  #
  def initialize( date_start = nil, date_end = nil, season = nil, id_list = nil, team = nil, swimmer = nil )
    @calendarDAO   = nil
    @meetings_count = 0
    
    @parameters         = Hash.new()
    @manageable_seasons = Hash.new()
    @swimmer_badges     = Hash.new()

    @parameters[:date_start] = date_start if date_start
    @parameters[:date_end] = date_start if date_start
    @parameters[:season_id] = season.id if season && season.instance_of?( Season )
    @parameters[:team_id] = team.id if team && team.instance_of?( Team )
    @parameters[:swimmer_id] = swimmer.id if team && swimmer.instance_of?( Swimmer )
    @parameters[:id_list] = id_list if id_list
  end
  #-- --------------------------------------------------------------------------
  #++

  # Pick meetings evaluating given parameters
  #
  def pick_meetings( order = 'ASC', current_user = nil )
    @calendarDAO = CalendarDAO.new()

    # Find out team affiliations manageable seasons and current swimmer's team affiliation
    @manageable_seasons = get_manageable_seasons(current_user)
    @swimmer_badges = get_swimmer_badges(current_user)
    
    if @parameters[:id_list]
      @meetings_count = pick_meetings_by_ids( order )
    elsif @parameters[:season_id]
      @meetings_count = pick_meetings_by_season( order )
    elsif @parameters[:team_id]
      @meetings_count = pick_meetings_by_team( order )
    elsif @parameters[:swimmer_id]
      @meetings_count = pick_meetings_by_swimmer( order )
    else
      @meetings_count = pick_meetings_by_dates( order )     
    end
    
    @meetings_count
  end
  #-- --------------------------------------------------------------------------
  #++

  # Pick meetings by id_list
  # Meetings are those listed in id_list
  #
  def pick_meetings_by_ids( order )
    id_list = @parameters[:id_list]
    meetings_count = 0
        
    if id_list && id_list.size > 0
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
          meetings_count += 1 
        end
    end
    meetings_count
  end    

  # Pick meetings by season
  # Meetings are those belngs to parameter season
  #
  def pick_meetings_by_season( order )
    meetings_count = 0
  end    

  # Pick meetings by team
  # Meetings are those attended by parameter team
  #
  def pick_meetings_by_team( order )
    meetings_count = 0
  end    

  # Pick meetings by swimmer
  # Meetings are those attended by parameter swimmer
  #
  def pick_meetings_by_swimmer( order )
    meetings_count = 0
  end    

  # Pick meetings by dates
  # Meetings are those attended by parameter dates
  #
  def pick_meetings_by_dates( order )
    meetings_count = 0
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
