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
  attr_accessor :team, :categories 

  # Initialization
  #
  # == Params:
  # An instance of team
  #
  def initialize( team )
    unless team && team.instance_of?( Team )
      raise ArgumentError.new("Needs a valid team")
    end
    unless team.meeting_individual_results.count > 0
      raise ArgumentError.new("Team #{team.get_full_name} hasn't results")
    end
    
    @team       = team
    @categories = retrieve_categories
  end
  #-- --------------------------------------------------------------------------
  #++

  # Find out the categories to retrieve best for
  # Only individual categories will be considered
  # Different season types have different categories
  # Merge them if different season type categories are mergable 
  #
  def retrieve_categories
    categories = []
    @team.season_types.each do |season_type|
      season_type.seasons.sort_season_by_begin_date.last.category_types.are_not_relays.sort_by_age.each do |category_type|
        categories << category_type if ! categories.rindex{ |e| e.code == category_type.code }
      end 
    end
    categories
  end 

  # Find best for given gender, pool, event and category code
  # Note it uses category code instaed of id
  #
  def get_team_best_individual_result( gender_type, pool_type, event_type, category_code )
    team.meeting_individual_results.is_not_disqualified.for_gender_type(gender_type).for_pool_type(pool_type).for_event_type(event_type).for_category_code(category_code).sort_by_timing.first
  end
end
