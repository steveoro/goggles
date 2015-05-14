require 'wrappers/timing'

#
# == BalancedMeetingScoreCalculator
#
# Strategy Pattern implementation for csi 23014-2015 "balanced"
# meetuing score calculation
# The "balanced" method is the sum of:
# - all individual meeting points
# - best team relays (for category and gender)
# - bonus points for "missing" athlets 
# - bonus points for "missing" relays
# The bonus points are calculated:
# - for athlets on the numeber of team athelts 
#   to the number of athlets of the most numerous team
# - for relays on the number of team relays considederd
#   to the maximum number of relays considered for a team   
#
# @author   Leega
# @version  4.00.787
#
class BalancedMeetingScoreCalculator

  # Initialization
  #
  # == Params:
  # An instance of season
  #
  def initialize( meeting )
    @meeting = meeting    
  end
  #-- --------------------------------------------------------------------------
  #++

  # Get teams involved in season ranking
  # 
  def get_teams
    @teams ||= retrieve_teams
  end

  #-- --------------------------------------------------------------------------
  #++

  # Saves/persists the season ranking first postions
  # Returns true on no errors
  #
  # Parameters
  # rank_position => Number of rank positions to save (default first 3)
  #
  def save_computed_score
    persisted_ok = 0

    # If scroes not computed, compute
    get_season_ranking if not @championship_ranking
    
    @championship_ranking.team_scores.each_with_index do |team_score,index|
      rank = index + 1

      # Search existing data row for update
      computed_season_ranking = ComputedSeasonRanking.where(
        season_id: @season.id,
        rank: rank
      ).first
      
      # Verify if data already exist
      if not computed_season_ranking
        # Create new data row
        computed_season_ranking = ComputedSeasonRanking.new(
          season_id: @season.id,
          team_id: team_score.team.id
        )
      end
      
      # Save calculated attributes
      computed_season_ranking.rank         = rank
      computed_season_ranking.total_points = team_score.total_points
      persisted_ok += 1 if computed_season_ranking.save
      break if rank == rank_position
    end
    
    (rank_position == persisted_ok)
  end
  #-- --------------------------------------------------------------------------
  #++


  private

  # Retrieves teams which has partecipated to a meeting
  #
  def retrieve_teams
    @meeting.teams
  end
  #-- --------------------------------------------------------------------------
  #++

  # Retrieves maximum different swimmer resukts for team in the meeting
  #
  def retrieve_max_ranked_swimmers
    0
  end
  #-- --------------------------------------------------------------------------
  #++

  # Retrieves maximum considered relays for team in the meeting
  #
  def retrieve_max_considered_relays
    0
  end
  #-- --------------------------------------------------------------------------
  #++

  # Calculate team score for the meeting
  #
  def compute_team_score
    total_individual_points = 0
    total_relay_points      = 0
    individual_bonus        = 0
    relay_bonus             = 0
  end
  #-- --------------------------------------------------------------------------
  #++
end
