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

  # Computes the teams points for a given meeting 
  #
  def retreive_season_team_points
    @season.meeting_team_scores.has_season_points
  end
  #-- --------------------------------------------------------------------------
  #++
end
