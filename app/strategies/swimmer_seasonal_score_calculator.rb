require 'wrappers/timing'

#
# == SwimmerBestFinder
#
# Strategy Pattern implementation for swimmer best result retreiving
#
# @author   Leega
# @version  4.00.837
#
class SwimmerSeasonalScoreCalculator

  # These can be edited later on:
  attr_accessor :swimmer, :season, :badge, :results

  # Initialization
  #
  # == Params:
  # An instance of swimmer
  # An instance of season
  #
  def initialize( swimmer, season )
    unless swimmer && swimmer.instance_of?( Swimmer )
      raise ArgumentError.new("Needs a valid swimmer")
    end
    unless season && season.instance_of?( Season )
      raise ArgumentError.new("Needs a valid season")
    end
    
    @swimmer = swimmer
    @season  = season
    @badge   = get_badge
    @results = nil
  end
  #-- --------------------------------------------------------------------------
  #++

  # Retrieves seasonal badge for swimmer
  #
  def get_badge
    swimmer.badges.for_season( @season ).first if swimmer.badges.for_season( @season ).count > 0
  end
  #-- --------------------------------------------------------------------------
  #++

  # Retrieves seasonal results for swimmer
  # sort by standard points
  #
  def get_results
    @results ||= @badge.meeting_individual_results.is_not_disqualified.sort_by_standard_points if @badge
  end
  #-- --------------------------------------------------------------------------
  #++

  # Calculates supermaster score
  # Supermaster score is calculated considering
  # the best 5 standard points
  #
  # Returns a BestLimitedRankingDAO for supermaster calculation
  #
  def calculate_supermaster_score( number_of_bests = 5 )
    supermaster_results = []
    events = []
    get_results.each do |meeting_individual_result|
      if !events.include?( meeting_individual_result.get_event_by_pool_type_code )
        supermaster_results << meeting_individual_result
        events << meeting_individual_result.get_event_by_pool_type_code
        break if supermaster_results.count == number_of_bests
      end      
    end
    BestLimitedRankingDAO.new( supermaster_results )
  end
  #-- --------------------------------------------------------------------------
  #++

  # Calculates ironmaster score
  # Ironmaster score is calculated considering
  # the best standard point results obtained 
  # in each event type not regarding pool type
  #
  # Returns a BestLimitedRankingDAO for ironmaster calculation
  #
  def calculate_ironmaster_score
    ironmaster_results = []
    events = []
    get_results.each do |meeting_individual_result|
      if !events.include?( meeting_individual_result.event_type.code )
        ironmaster_results << meeting_individual_result
        events << meeting_individual_result.event_type.code
      end
    end
    BestLimitedRankingDAO.new( ironmaster_results )
  end
  #-- --------------------------------------------------------------------------
  #++

  # Calculates team ranking score
  # Team ranking score is calculated considering
  # the best 3 standard point results obtained 
  # in at least 3 different meetings
  #
  # Returns a BestLimitedRankingDAO for team ranking calculation
  #
  def calculate_team_ranking_score
    blr = BestLimitedRankingDAO.new
    if @badge.meetings.uniq.count >= 3
      blr.set_results( get_results.limit( 3 ))
    end
  end
  #-- --------------------------------------------------------------------------
  #++
end
