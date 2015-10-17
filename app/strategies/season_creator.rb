require 'wrappers/timing'

#
# == SeasonCreator
#
# Collection of functions used for ceating a new season based on an older one
# When creating new season should consider:
# - season
# - category_types
# - meetings (with sessions and events)
#
# @author   Leega
# @version  4.00.829
#
class SeasonCreator

  # Initialization
  #
  # == Params:
  # An instance of season used as base for the new one
  #
  def initialize( older_season, description )
    @older_season = older_season
    @description  = description
    @new_id       = older_season.id + 10
    @begin_date   = older_season.begin_date.next_year
    @end_date     = older_season.end_date.next_year

    @new_season   = Season.new( id: new_id, description: description, begin_date: begin_date, end_date: end_date )
    
    @categories   = renew_categories
    @meetings     = older_season.meetings

  end
  #-- --------------------------------------------------------------------------
  #++

  # Retreive older season categories and prepare them
  # for the new season
  # 
  def renew_categories
    newer_categories = []
    older_season.category_types.each do |category_type|
      new_cat = CategoryType.new()
      new_cat.season_id = @new_id
    end
  end
  #-- --------------------------------------------------------------------------
  #++

  # Saves/persists the season created
  # Returns true on no errors
  #
  def save_new_season
    persisted_ok = 0
    @meeting_team_scores = get_meeting_team_scores if not @meeting_team_scores 
    @meeting_team_scores.each do |meeting_team_score|
      # Save calculated scores
      persisted_ok += 1 if meeting_team_score.save
    end
    persisted_ok
  end
  #-- --------------------------------------------------------------------------
  #++


  private

  # Retrieves teams which has partecipated to a meeting
  #
  def retrieve_teams
    @meeting.teams.uniq
  end
  #-- --------------------------------------------------------------------------
  #++
end
