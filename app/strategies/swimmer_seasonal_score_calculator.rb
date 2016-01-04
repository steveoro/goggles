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
  # Returns an hash with datas for supermaster calculation
  #
  def calculate_supermaster_score( number_of_bests = 5 )
    supermaster_datas = BestLimitedRankingDAO.new( get_results.limit( number_of_bests ) )
    supermaster_datas
  end
  #-- --------------------------------------------------------------------------
  #++

end
