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
  def retrieve_max_ranked_swimmers_for_team( team )
    @meeting.meeting_individual_results.is_valid.for_team( team ).select('meeting_individual_results.swimmer_id').uniq.count
  end
  #-- --------------------------------------------------------------------------
  #++

  # Retrieves maximum different swimmer resukts for team in the meeting
  #
  def compute_individual_points_for_team( team )
    @meeting.meeting_individual_results.is_valid.for_team( team ).sum('meeting_individual_results.team_points')
  end
  #-- --------------------------------------------------------------------------
  #++

  # Retrieves maximum considered relays for team in the meeting
  #
  def retrieve_max_considered_relays_for_team( team )
    @meeting.meeting_relay_results.is_valid.for_team( team ).has_points('meeting_points').count
  end
  #-- --------------------------------------------------------------------------
  #++

  # Retrieves maximum considered relays for team in the meeting
  #
  def compute_relays_points_for_team( team )
    @meeting.meeting_relay_results.is_valid.for_team( team ).sum('meeting_relay_results.meeting_points')
  end
  #-- --------------------------------------------------------------------------
  #++

  # Calculate team score for the meeting
  # Cycle teams and retrieve individuals and relays points
  # while finding out maximum swimmer and relays
  # Cycle again teams to set bonus points
  #
  def compute_team_scores
    team_scores    = {}
    swimmers_count = 0
    relays_count   = 0
    
    # Computes individuals and relays scores and swimmers and relays total per team
    @teams.each do |team|
      team_score = []
      team_score[:team] = team
      team_score[:sum_individual_points] = compute_individual_points_for_team( team )
      team_score[:sum_relay_points] = compute_relay_points_for_team( team )
      team_score[:swimmers_count] = retrieve_max_ranked_swimmers_for_team( team )
      team_score[:relays_count] = retrieve_max_considered_relays_for_team( team )
      team_score[:swimmers_bonus] = 0
      team_score[:relays_bonus] = 0
      team_scores << team_score

      # Find out maximum swimmers and relays count
      swimmers_count = team_score[:swimmers_count] if team_score[:swimmers_count] > swimmers_count  
      relays_count = team_score[:relays_count] if team_score[:relays_count] > relays_count 
    end
    
    # Computes bonuses and create team scores
    team_scores.each do |team_score|
      team_score[:swimmers_bonus] = swimmers_count - team_score[:swimmers_count]
      team_score[:relays_bonus] = relays_count - team_score[:relays_count]
      
      
    end
  end
  #-- --------------------------------------------------------------------------
  #++
end
