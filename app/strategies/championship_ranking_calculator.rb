require 'wrappers/timing'

#
# == ChampionshipRankingCalculator
#
# Strategy Pattern implementation for Championship ranking calculations
#
# @author   Leega
# @version  4.00.534
#
class ChampionshipRankingCalculator

  # Initialization
  #
  # == Params:
  # An instance of season
  #
  def initialize( season )
    @season = season
    
  end
  #-- --------------------------------------------------------------------------
  #++

  # Get teams involved in season ranking
  # 
  def get_involved_teams
    @involved_teams ||= retrieve_involved_teams
  end

  # Get meetings involved in season ranking
  # 
  def get_involved_meetings
    @involved_meetings ||= retrieve_involved_meetings
  end
  #-- --------------------------------------------------------------------------
  #++
  
  def compute_season_ranking()
    # TODO determinate columns depending on season formulas and/or details
    columns = [:season_individual_points, :season_relay_points]
    involved_meetings = get_involved_meetings
    
    #@championship_ranking = Hash.new
    #@championship_ranking[:columns] = [:season_individual_points, :season_relay_points]
    #@championship_ranking[:meetings] = get_involved_meetings 
    
    team_ranking = []
    get_involved_teams.each do |team|
      # Create team scores
      total_team_points = 0
      #team_scores = {:team => team, :total_points => 0, :meetings => []}
      team_scores = ChampionshipDAO::TeamRankingDAO.new(team)
      #@championship_ranking[:meetings].each do |meeting|
      involved_meetings.each do |meeting|
        # TODO Should perform a unique read from DB and cycle on data red
        meeting_team_points = retreive_meeting_team_points(team, meeting, columns)
        #total_team_points += compute_meeting_team_points(meeting_team_points, @championship_ranking[:columns]) if meeting_team_points 
        #team_scores[:meetings] << meeting_team_points 
        #team_scores.meetings << meeting_team_points
        team_scores.add_meeting( meeting_team_points, columns )
      end
      #team_scores[:total_points] = total_team_points 
      #team_scores.total_points = total_team_points
      team_ranking << team_scores 
    end
    #@championship_ranking[:teams] = team_ranking.sort{ |p,n| n[:total_points] <=> p[:total_points] }
    @championship_ranking = ChampionshipDAO.new( columns, involved_meetings, team_ranking.sort{ |p,n| n.total_points <=> p.total_points } )
  end
  #-- --------------------------------------------------------------------------
  #++


  private

  # Retrieves teams involved in season ranking
  # The teams involved are those with affiliation for the given season
  # and at least one valid seasonal result
  #
  def retrieve_involved_teams
    @season.teams.joins(:meeting_team_scores).uniq
  end

  # Retrieves meetings involved in season ranking
  # The meetings involved are those with at least one valid seasonal result
  #
  def retrieve_involved_meetings
    @season.meetings.joins(:meeting_team_scores).uniq
  end
  #-- --------------------------------------------------------------------------
  #++


  # Retrieves the teams points for season meetings 
  #
  def retreive_season_points
    @season.meeting_team_scores.has_season_points.select('team_id, meeting_id, season_team_points, season_individual_points, season_relay_points')
  end

  # Computes the season total points for a given team 
  #
  # Params
  # team    => Team to collect scores
  #
  def compute_season_team_points(team)
    # Sum team points among season meetings
    @season.meeting_team_scores.has_season_points.for_team(team).select('(sum(season_team_points) + sum(season_individual_points) + sum(season_relay_points)) as total_pts').first.total_pts.to_i
  end
  #-- --------------------------------------------------------------------------
  #++


  # Retrieves the teams points for a given meeting 
  #
  # Params
  # team    => Team to collect scores
  # meeting => Meeting to collect scores for the team
  # columns => Array of columns to collect
  #
  def retreive_meeting_team_points(team, meeting, columns)
    meeting.meeting_team_scores.for_team(team).select(columns).first
  end

  # Computes the teams points for a certain meeting 
  #
  # Params
  # team    => Team to collect scores
  # meeting => Meeting to collect scores for the team
  # columns => Array of columns to collect
  #
  def compute_meeting_team_points(meeting_season_points, columns)
    total_meeting_points = 0
    columns.each do |column|
      total_meeting_points += meeting_season_points[column]
    end
    total_meeting_points
  end
  #-- --------------------------------------------------------------------------
  #++
end
