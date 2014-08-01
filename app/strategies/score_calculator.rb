#
# == ScoreCalculator
#
# Strategy Pattern implementation for score calculations
#
# @author   Leega
# @version  4.00.393
#
class ScoreCalculator

  # == Params:
  # An instance of swimmer
  # An instance of season
  # An instance of pool_type
  # An instance of event_type
  #
  def initialize( swimmer, season, pool_type, event_type )
    @swimmer = swimmer
    @season = season
    @pool_type = pool_type
    @event_type = event_type
  end
  #-- --------------------------------------------------------------------------
  #++

  def get_swimmer_gender
    @swimmer_gender ||= retreive_swimmer_gender
  end

  def get_swimmer_category
    @swimmer_category ||= retreive_swimmer_category
  end

  def get_fin_score( time_swam )
    @fin_score ||= compute_fin_score( time_swam )
  end
  #-- --------------------------------------------------------------------------
  #++
  
  
  private

  # Retreives the swimmer gender
  #
  def retreive_swimmer_gender
    @swimmer_gender = @swimmer.gender_type
  end
  
  # Retreives the swimmer category for a given season
  #
  # == Params:
  # season_id: id of the interested season
  #
  def retreive_swimmer_category
    @swimmer.get_category_type_for_season( @season.id )
  end
  
  # Compuite the FIN standard score for a given event, pool type, gender, category, season
  # FIN standard points is calculated with:
  # TimeStandard : TimeSwam = 1000 : x
  # If no time standard, FIN score equalals to 1000
  #
  # == Params:
  # time_swam: the time swam for calculation
  #
  def compute_fin_score( time_swam )
    # Without a correct time_swam always return 0
    fin_score = 0
    if time_swam && time_swam.to_hundreds > 0
      # Retreives category and gender through the swimmer
      @swimmer_category = get_swimmer_category
      @swimmer_gender = get_swimmer_gender
  
      # Retreive the time standard
      @current_time_standard = TimeStandard.where(
        season_id:        @season.id,
        gender_type_id:   @swimmer_gender.id, 
        category_type_id: @swimmer_category.id,
        pool_type_id:     @pool_type.id,
        event_type_id:    @event_type.id
      ).first
      if @current_time_standard && @current_time_standard.get_timing_instance.to_hundreds > 0
        # Calculate the score with 2 decimals fixed
        fin_score = time_swam.to_hundreds * 1000 / @current_time_standard.get_timing_instance.to_hundreds
      else
        # Without time standard the score is always 1000
        fin_score = 1000
      end
    end
    fin_score.round(2)        
  end
  #-- --------------------------------------------------------------------------
  #++
end
