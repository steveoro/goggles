require 'wrappers/timing'

#
# == SwimmerBestFinder
#
# Strategy Pattern implementation for swimmer best result retreiving
#
# @author   Leega
# @version  4.00.837
#
class SwimmerBestFinder

  # These can be edited later on:
  attr_accessor :swimmer 

  # Initialization
  #
  # == Params:
  # An instance of swimmer
  #
  def initialize( swimmer )
    unless swimmer && swimmer.instance_of?( Swimmer )
      raise ArgumentError.new("Needs a valid swimmer")
    end
    
    @swimmer = swimmer
  end
  #-- --------------------------------------------------------------------------
  #++

  # Collect closed seasons in which the swimmer was involved
  # If season type given tha scan is limited to seasons
  # of given type
  # In no given season type it scans all seasons
  def get_closed_seasons_involved_into( season_type = nil )
    season_type ? 
     @swimmer.seasons.for_season_type(season_type).is_ended.sort_season_by_begin_date( 'DESC' ) : 
     @swimmer.seasons.is_ended.sort_season_by_begin_date( 'DESC' )
  end
  #-- --------------------------------------------------------------------------
  #++

  # Collect curent open seasons in which the swimmer was involved
  # If season type given tha scan is limited to seasons
  # of given type
  # In no given season type it scans all seasons
  def get_current_seasons_involved_into( season_type = nil )
    season_type ? @swimmer.seasons.for_season_type(season_type).is_not_ended : @swimmer.seasons.is_not_ended
  end
  #-- --------------------------------------------------------------------------
  #++

  # Collect contemporary seasons in which the swimmer was involved
  # starting from begin and end season dates of a given season
  # Contemporary seasons are those which has at least one day
  # in the range of given one
  def get_contemporary_seasons_involved_into( season )
    @swimmer.seasons.is_in_range( season.begin_date, season.end_date )
  end
  #-- --------------------------------------------------------------------------
  #++

  # Find personal last best for given involved seasons, event type and pool type
  # Last best is the best time swam in the more recent involved season
  # Scan the closed seasons startng from most recent backwards
  def get_involved_season_last_best_for_event( involved_seasons, event_type, pool_type )
    involved_seasons.each do |season|
      if @swimmer.meeting_individual_results.for_season( season ).for_pool_type( pool_type ).for_event_type( event_type ).is_not_disqualified.count > 0
        return @swimmer.meeting_individual_results.for_season( season ).for_pool_type( pool_type ).for_event_type( event_type ).is_not_disqualified.sort_by_timing('ASC').first.get_timing_instance
      end
    end
    return nil
  end

  # Find personal last best for given involved seasons, event type and pool type
  # useing events by pool type instead of independent pool type and event type
  def get_involved_season_last_best_for_key( involved_seasons, event_by_pool_type_key )
    event_by_pool_type = EventsByPoolType.find_by_key( event_by_pool_type_key )
    event_by_pool_type ? get_involved_season_last_best_for_event( involved_seasons, event_by_pool_type.event_type, event_by_pool_type.pool_type ) : nil
  end
  #-- --------------------------------------------------------------------------
  #++

  # Find personal best for given season type, event type and pool type
  def get_season_type_best_for_event( season_type, event_type, pool_type )
    @swimmer.meeting_individual_results.for_season_type( season_type ).for_pool_type( pool_type ).for_event_type( event_type ).is_not_disqualified.count > 0 ?
      @swimmer.meeting_individual_results.for_season_type( season_type ).for_pool_type( pool_type ).for_event_type( event_type ).is_not_disqualified.sort_by_timing('ASC').first.get_timing_instance :
      nil
  end
  #-- --------------------------------------------------------------------------
  #++

  # Find personal best for given involved seasons, event type and pool type
  def get_involved_season_best_for_event( involved_seasons, event_type, pool_type )
    best = nil
    involved_seasons.each do |season|
      if @swimmer.meeting_individual_results.for_season( season ).for_pool_type( pool_type ).for_event_type( event_type ).is_not_disqualified.count > 0
        tmp_best = @swimmer.meeting_individual_results.for_season( season ).for_pool_type( pool_type ).for_event_type( event_type ).is_not_disqualified.sort_by_timing('ASC').first.get_timing_instance
        best = tmp_best if best == nil || best.to_hundreds > tmp_best.to_hundreds   
      end
    end
    return best
  end

  # Find personal best for given event type and pool type
  def get_best_for_event( event_type, pool_type )
    @swimmer.meeting_individual_results.for_pool_type( pool_type ).for_event_type( event_type ).is_not_disqualified.count > 0 ?
      @swimmer.meeting_individual_results.for_pool_type( pool_type ).for_event_type( event_type ).is_not_disqualified.sort_by_timing('ASC').first.get_timing_instance :
      nil
  end
  #-- --------------------------------------------------------------------------
  #++
end
