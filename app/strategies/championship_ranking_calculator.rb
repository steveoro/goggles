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
    @championship_ranking = Hash.new
    @championship_ranking[:columns] = [:season_individual_points, :season_relay_points]
    @championship_ranking[:meetings] = get_involved_meetings 
    
    team_ranking = []
    get_involved_teams.each do |team|
      # Create team scores
      team_scores = {:team => team, :total_points => compute_season_team_points(team), :meetings => []}
      @championship_ranking[:meetings].each do |meeting|
        team_scores[:meetings] << retreive_meeting_team_points(team, meeting, @championship_ranking[:columns])
      end
      team_ranking << team_scores 
    end
    @championship_ranking[:teams] = team_ranking.sort{ |p,n| p[:total_points] <=> n[:total_points] }
    @championship_ranking
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

  # Computes the season total points for a given team 
  #
  # Params
  # team    => Team to collect scores
  #
  def compute_season_team_points(team)
    # Sum team points among season meetings
    @season.meeting_team_scores.has_season_points.for_team(team).select('(sum(season_team_points) + sum(season_individual_points) + sum(season_relay_points)) as total_pts').first.total_pts.to_i
  end

  # Retrievs the teams points for a given meeting 
  #
  # Params
  # team    => Team to collect scores
  # meeting => Meeting to collect scores for the team
  # columns => Array of columns to collect
  #
  def retreive_meeting_team_points(team, meeting, columns)
    meeting.meeting_team_scores.for_team(team).select(columns).first
  end

  # Retrievs the teams points for season meetings 
  #
  def retreive_season_points
    @season.meeting_team_scores.has_season_points.select('team_id, meeting_id, season_team_points, season_individual_points, season_relay_points')
  end
  #-- --------------------------------------------------------------------------
  #++
end
