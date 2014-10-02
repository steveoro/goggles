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
    @season.team_affiliations.joins(:meeting_individual_results).uniq.map{ |ta| ta.team_name }
  end
  #-- --------------------------------------------------------------------------
  #++
end
