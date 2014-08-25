#
# == ScoreCalculator
#
# Strategy Pattern implementation for score calculations
#
# @author   Leega
# @version  4.00.393
#
class ScoreCalculator

  # Initialization within a swimmer
  #
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
    @swimmer_gender ||= retrieve_swimmer_gender
  end

  def get_swimmer_category
    @swimmer_category ||= retrieve_swimmer_category
  end

  def get_time_standard
    @current_time_standard ||= retrieve_time_standard
  end

  def get_fin_score( time_swam )
    @fin_score ||= compute_fin_score( time_swam )
  end
  #-- --------------------------------------------------------------------------
  #++


  private

  # Retrieves the swimmer gender
  #
  def retrieve_swimmer_gender
    @swimmer_gender = @swimmer.gender_type
  end

  # Retrieves the swimmer category for a given season
  #
  # == Params:
  # season_id: id of the interested season
  #
  def retrieve_swimmer_category
    @swimmer.get_category_type_for_season( @season.id )
  end

  # Retrieves the swimmer category for a given season
  #
  # == Params:
  # season_id: id of the interested season
  #
  def retrieve_time_standard
    # Retrieves category and gender through the swimmer
    # @swimmer_category = get_swimmer_category
    # @swimmer_gender = get_swimmer_gender
    TimeStandard.where(
        season_id:        @season ? @season.id : 0,
        gender_type_id:   get_swimmer_gender ? get_swimmer_gender.id : 0,
        category_type_id: get_swimmer_category ? get_swimmer_category.id : 0,
        pool_type_id:     @pool_type ? @pool_type.id : 0,
        event_type_id:    @event_type ? @event_type.id : 0
      ).first
  end

  # Compute the FIN standard score for a given event, pool type, gender, category, season
  # FIN standard points is calculated with:
  # TimeStandard : TimeSwam = x : 1000
  # If no time standard, FIN score equals to 1000
  #
  # == Params:
  # time_swam: the time swam for calculation
  #
  def compute_fin_score( time_swam )
    # Without a correct time_swam always return 0
    fin_score = 0
    if time_swam && time_swam.to_hundreds > 0
      # Retrieves the time standard
      @current_time_standard = get_time_standard
      if @current_time_standard && @current_time_standard.get_timing_instance.to_hundreds > 0
        # Calculate the score with 2 decimals fixed
        fin_score = @current_time_standard.get_timing_instance.to_hundreds * 1000 / time_swam.to_hundreds
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
