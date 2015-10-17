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

  # These can be edited later on:
  attr_accessor :older_season, :description, :new_id, :begin_date, :end_date, :header_year, :edition, :new_season, :categories, :meetings

  # Initialization
  #
  # == Params:
  # An instance of season used as base for the new one
  #
  def initialize( older_season, description )
    unless older_season && older_season.instance_of?( Season )
      raise ArgumentError.new("Needs the older season to use as model")
    end
    unless description && description.instance_of?( String )
      raise ArgumentError.new("Needs the new season description")
    end
    @older_season = older_season
    @description  = description
    @new_id       = older_season.id + 10
    @begin_date   = older_season.begin_date.next_year
    @end_date     = older_season.end_date.next_year
    @header_year  = next_header_year( older_season.header_year ) 
    @edition      = older_season.edition + 1 

    @new_season   = renew_season
    
    @categories   = renew_categories
    
    @meetings     = older_season.meetings

  end
  #-- --------------------------------------------------------------------------
  #++

  # Retreive older season categories and prepare them
  # for the new season
  # 
  def renew_season
    new_season = Season.new( id: @new_id, description: @description, begin_date: @begin_date, end_date: @end_date, header_year: @header_year, edition: @edition )
    new_season.season_type         = @older_season.season_type 
    new_season.edition_type        = @older_season.edition_type 
    new_season.timing_type         = @older_season.timing_type 
    new_season.has_individual_rank = @older_season.has_individual_rank 
    new_season
  end

  # Retreive older season categories and prepare them
  # for the new season
  # No particular change required to category types data 
  # just associate with new season
  # 
  def renew_categories
    # TODO There's a more elegant and nice method to do that? Maybe new( entity.attributes )
    newer_categories = []
    @older_season.category_types.each do |category_type|
      new_cat = CategoryType.new( season_id: @new_id )
      new_cat.code            = category_type.code
      new_cat.federation_code = category_type.federation_code
      new_cat.description     = category_type.description
      new_cat.short_name      = category_type.short_name
      new_cat.group_name      = category_type.group_name
      new_cat.age_begin       = category_type.age_begin
      new_cat.age_end         = category_type.age_end
      new_cat.is_a_relay      = category_type.is_a_relay
      new_cat.is_out_of_race  = category_type.is_out_of_race
      newer_categories << new_cat
    end
    newer_categories
  end

  # Retreive older season meetings and prepare them
  # for the new season
  # 
  def renew_meetings
    newer_meetings = []
    @older_season.meetings.each do |meeting|
      new_met = Meeting.new( season_id: @new_id )
      # TODO Update meeting data for new season
      newer_meetings << new_met
    end
    newer_meetings
  end
  #-- --------------------------------------------------------------------------
  #++

  # Saves/persists the new season categories
  # Returns true on no errors
  #
  def save_new_season_categories
    persisted_ok = 0
    @categories.each do |category_type|
      persisted_ok += 1 if category_type.save
    end
    persisted_ok == @categories.count
  end
  #-- --------------------------------------------------------------------------
  #++

  # Saves/persists the new season categories
  # Returns true on no errors
  #
  def save_new_season_meetings
    persisted_ok = 0
    @meetings.each do |meeting|
      persisted_ok += 1 if meeting.save
    end
    persisted_ok == @meeting.count
  end
  #-- --------------------------------------------------------------------------
  #++
  
  # Increments header year of the season
  # If header_year is in the format aaaa/aaaa increments both years
  # else increments the numerical corrisponding value
  #
  def next_header_year( header_year )
    if header_year.length == 9 
      separator = header_year[4]
      years = header_year.split( separator )
      years.each{ |year| year = ( year.to_i + 1 ).to_s }
      header_year = years.join( separator )
    else
      if header_year.to_i > 0
        header_year = ( header_year.to_i + 1 ).to_s
      end
    end
    header_year    
  end
end
