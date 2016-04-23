require 'wrappers/timing'

#
# == TeamBestFinder
#
# Strategy Pattern implementation for team best result retrieving
# Best team results should considered for categories and gender
#
# @author   Leega
# @version  4.00.837
#
class TeamBestFinder
  include SqlConvertable

  # These can be edited later on:
  attr_accessor :team, :distinct_categories, :gender_types, :pool_types, :event_types

  # Initialization
  #
  # == Params:
  # An instance of team
  #
  def initialize( team )
    unless team && team.instance_of?( Team )
      raise ArgumentError.new("Needs a valid team: #{team.inspect}")
    end
    unless team.meeting_individual_results.count > 0
      raise ArgumentError.new("Team #{team.get_full_name} hasn't results")
    end
    
    @team                = team
    @gender_types        = GenderType.individual_only
    @pool_types          = PoolType.only_for_meetings
    @event_types         = EventType.are_not_relays.for_fin_calculation
    @distinct_categories = retrieve_distinct_categories
  end
  #-- --------------------------------------------------------------------------
  #++

  # Sets the gender types to search for
  # Default is male and female
  #
  def set_genders( gender_types = GenderType.individual_only )
    @gender_types = gender_types
  end

  # Sets the pool types to search for
  # Default is 25 and 50
  #
  def set_pools( pool_types = PoolType.only_for_meetings )
    @pool_types = pool_types
  end

  # Sets the event types to search for
  # Default is FIN individual events
  #
  def set_events( event_types = EventType.are_not_relays.for_fin_calculation )
    @event_types = event_types
  end

  # Find out the category in the distinct_category array
  # using the category code
  # Return nil if category code not present
  #
  def find_category_by_code( category_code )
    element = @distinct_categories.rindex{ |e| e.code == category_code }
    @distinct_categories[element] if element
  end

  # Find out the categories to retrieve best for
  # Only individual categories will be considered
  # Different season types have different categories
  # Merge them if different season type categories are mergable 
  #
  def retrieve_distinct_categories
    if @distinct_categories
      categories = @distinct_categories
    else
      categories = []
      @team.season_types.each do |season_type|
        season_type.seasons.sort_season_by_begin_date.last.category_types.are_not_relays.sort_by_age.each do |category_type|
          categories << category_type if ! categories.rindex{ |e| e.code == category_type.code }
        end 
      end
    end
    categories
  end 

  # Check if a category has to be splitted
  # Some categories are undivided and has to be splitted for definition
  # Some categories have different age definition in different season types and need to be compared
  #
  def category_needs_split?( category_type )
    needs_split = false
    if category_type.is_undivided
      needs_split = true
    elsif @distinct_categories.rindex{ |e| e.code != category_type.code && e.age_begin >= category_type.age_begin && e.age_end <= category_type.age_end }
      needs_split = true
    end
    needs_split
  end 

  # Find out the category to split in the actual one
  # The category to split in is the one, not splitted
  # with correct age range considering the swimmer age
  # at the moment of individual result
  #
  def get_category_to_split_into( meeting_individual_result )
    category_type = meeting_individual_result.category_type
    if category_needs_split?( category_type )
      # Find the swimmer age 
      swimmer_age = meeting_individual_result.get_swimmer_age
      element = @distinct_categories.rindex{ |e| e.code != category_type.code && e.age_begin <= swimmer_age && e.age_end >= swimmer_age && ! e.is_undivided }
      @distinct_categories[element]
    else
      # The category is the result one
      find_category_by_code( category_type.code )
    end
  end 

  # Verify if exists results for given gender, pool, event and category 
  # for the selected team.
  # Disqualified results not considered
  #
  def has_individual_result?( gender_type, pool_type, event_type, category_code )
    team.meeting_individual_results.is_not_disqualified.for_gender_type(gender_type).for_pool_type(pool_type).for_event_type(event_type).for_category_code(category_code).sort_by_timing.count > 0
  end

  # Find best for given gender, pool, event and category code
  # Note it uses category code instaed of id
  # Returns nil if no results for given parameters
  # Disqualified results not considered
  #
  def get_team_best_individual_result( gender_type, pool_type, event_type, category_code )
    has_individual_result?( gender_type, pool_type, event_type, category_code ) ?
      team.meeting_individual_results.is_not_disqualified.for_gender_type(gender_type).for_pool_type(pool_type).for_event_type(event_type).for_category_code(category_code).sort_by_timing.first :
      nil
  end
end
