require 'wrappers/timing'

#
# == GoggleCupScoreCalculator
#
# Strategy Pattern implementation for Goggle Cup score calculations
#
# @author   Leega
# @version  4.00.444
#
class GoggleCupScoreCalculator

  # Initialization
  #
  # == Params:
  # An instance of goggle_cup
  # An instance of swimmer
  # An instance of pool_type
  # An instance of event_type
  #
  def initialize( goggle_cup, swimmer, pool_type, event_type )
    @goggle_cup = goggle_cup
    @swimmer = swimmer
    @pool_type = pool_type
    @event_type = event_type
  end
  #-- --------------------------------------------------------------------------
  #++

  def get_goggle_cup_standard
    @current_goggle_cup_standard ||= retrieve_goggle_cup_standard
  end

  def get_goggle_cup_score( time_swam )
    @goggle_cup_score ||= compute_goggle_cup_score( time_swam )
  end
  #-- --------------------------------------------------------------------------
  #++

  # Sets the goggle cup standard from a time swam
  def set_goggle_cup_standard( time_swam )
    if GoggleCupStandard.has_standard?( @goggle_cup.id, @swimmer.id, @pool_type.id, @event_type.id )
      # Updates the standard
      get_goggle_cup_standard
      update_goggle_cup_standard( time_swam )
    else
      # Create e new goggle cup standard
      @current_goggle_cup_standard = new_goggle_cup_standard( time_swam )
      @current_goggle_cup_standard? true : false
    end    
  end
  #-- --------------------------------------------------------------------------
  #++

  # Get the oldest swimmer result date
  # Assumes that swimmer has at least one result
  def oldest_swimmer_result( swimmer )
    swimmer.meeting_individual_results.sort_by_date('ASC').first.get_scheduled_date
  end

  # Determinates the year_by_year periods to scan for
  # the given swimmer starting from the one preceding
  # the gogglo cup backward to the one containing the
  # oldest swimmer result
  #
  # Returns an array of dates
  #
  def get_periods_to_scan( swimmer )
    goggle_years_to_scan = []
    oldest_result_date = oldest_swimmer_result( swimmer )
    period_end = @goggle_cup.end_date.prev_year
    goggle_years_to_scan << period_end 
    while period_end >= oldest_result_date do
      period_end = period_end.prev_year
      goggle_years_to_scan << period_end 
    end
    goggle_years_to_scan
  end

  # Scan swimmer meeting individual results to find out
  # goggle cup standard
  # Goggle cup standard is the best time swam during the past season
  # If Goggle cup will consider all result types
  # (is_limited_to_season_types_defined == false)
  # scans all results, otherwise only resluts for season types to be considered
  # according to Goggle cup definition
  # The scan has made "year per year" starting from the the
  # year preceding the Goggle cup according to the end date
  #
  # Returns an array of events => time
  #
  def find_swimmer_goggle_cup_standard( swimmer )
    swimmer_goggle_cup_standards = []

    # Check the period and exit if result found
    EventsByPoolType.not_relays.only_for_meetings.each do |event_by_pool_type|
      get_get_periods_to_scan( swimmer ).each do |date|
        mir = swimmer.meeting_individual_results.for_date_range( date.prev_year, date ).for_event_by_pool_type( event_by_pool_type ).sort_by_timing.first
        if mir
          swimmer_goggle_cup_standards << { event_by_pool_type.code => mir.get_timing }
          exit
        end
      end
    end    
  end
  #-- --------------------------------------------------------------------------
  #++

  # Scans for all team swimmers to define Goggle cup standards
  # Scans all swimmers with results for the team if  
  # is_limited_to_season_types_defined == false
  # Otherwise consider only those who have results for meetings
  # in the season types to be considered according to Goggle cup definition
  def create_goggle_cup_standards
    # TODO
    # Find out swimmers involved in goggle cup
    # For each swimmer find out time standards
    # Persist data
    
    
  end
  #-- --------------------------------------------------------------------------
  #++

  private

  # Retrieves the standard goggle cup time for a given swimmer, pool_type and event_type
  #
  def retrieve_goggle_cup_standard
    GoggleCupStandard.get_standard( @goggle_cup.id, @swimmer.id, @pool_type.id, @event_type.id )
  end

  # Compute the goggle cup score for a time swan in a given event and pool type 
  # Goggle cup points is calculated with:
  # GoggleCupStandard : TimeSwam = x : GoggleCupMaxPoints
  # If no goggle cup standard, score equals to GoggleCupMaxPoints
  #
  # == Params:
  # time_swam: the time swam for calculation
  #
  def compute_goggle_cup_score( time_swam )
    # Without a correct time_swam always return 0
    goggle_cup_score = 0.0
    if time_swam && time_swam.to_hundreds > 0
      # Retrieves the time standard
      get_goggle_cup_standard
      if @current_goggle_cup_standard && @current_goggle_cup_standard.get_timing_instance.to_hundreds > 0
        # Calculate the score with 2 decimals fixed
        goggle_cup_score = @current_goggle_cup_standard.get_timing_instance.to_hundreds.to_f * @goggle_cup.max_points / time_swam.to_hundreds.to_f
      else
        # Without time standard the score is always GoggleCupMaxPoints
        goggle_cup_score = @goggle_cup.max_points
        @current_goggle_cup_standard = new_goggle_cup_standard( time_swam )
      end
    end
    goggle_cup_score.round( 2 )
  end
  #-- --------------------------------------------------------------------------
  #++

  # Create the goggle cup standard from a time swam
  # Assumes the goggle cup standard doesn't exists
  #
  def new_goggle_cup_standard( time_swam )
    goggle_cup_standard = GoggleCupStandard.new()
    goggle_cup_standard.goggle_cup_id = @goggle_cup.id
    goggle_cup_standard.swimmer_id    = @swimmer.id
    goggle_cup_standard.pool_type_id  = @pool_type.id
    goggle_cup_standard.event_type_id = @event_type.id
    goggle_cup_standard.minutes       = time_swam.minutes
    goggle_cup_standard.seconds       = time_swam.seconds
    goggle_cup_standard.hundreds      = time_swam.hundreds
    goggle_cup_standard.save
    goggle_cup_standard
  end

  # Updte the goggle cup standard from a time swam
  # Assumes the goggle cup standard exists
  #
  def update_goggle_cup_standard( time_swam )
    @current_goggle_cup_standard.minutes  = time_swam.minutes
    @current_goggle_cup_standard.seconds  = time_swam.seconds
    @current_goggle_cup_standard.hundreds = time_swam.hundreds
    @current_goggle_cup_standard.save
  end
  #-- --------------------------------------------------------------------------
  #++
end
