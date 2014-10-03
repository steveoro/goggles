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

  # Get the array of teams involved in season ranking
  # 
  def get_involved_teams
    @involved_teams ||= retrieve_involved_teams
  end
  #-- --------------------------------------------------------------------------
  #++


  private

  # Retrieves the the array of teams involved in season ranking
  # The teams involved are those with affiliation for the given season
  # and at least one valid result
  #
  def retrieve_involved_teams
    @season.team_affiliations.joins(:meeting_individual_results).includes(:team).uniq.map{ |ta| [ta.team_id, ta.team_name] }
  end
  #-- --------------------------------------------------------------------------
  #++

  # Computes the teams points for a given meeting 
  #
  def compute_meeting_teams_points(meeting)
    @involved_teams.each do |team|
      individual_points = meeting.meeting_individual_results.for_team(Team.find(team[0])).select(:team_points).collect{ |r| r.team_points }.sum
    end
  end
  #-- --------------------------------------------------------------------------
  #++
end
