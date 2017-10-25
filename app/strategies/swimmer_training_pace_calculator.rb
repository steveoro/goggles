require 'wrappers/timing'

#
# == SwimmerTrainingPaceCalculator
#
# Pattern to calcolate training paces based on various test types
#
# @author   Leega
# @version  6.093
#
class SwimmerTrainingPaceCalculator

  # Initialization
  #
  # == Params:
  # An instance of season
  #
  def initialize( test_type, minutes_swam, seconds_swam, minutes_compared = 0, seconds_compared = 0 )
    unless test_type && minutes_swam && seconds_swam
      raise ArgumentError.new("Training pace calculator needs test type and swam time")
    end

    @test_type        = test_type
    @minutes_swam     = minutes_swam
    @seconds_swam     = seconds_swam
    @minutes_compared = minutes_compared
    @seconds_compared = seconds_compared
    
    @parameters       = {}
    
    @stp = SwimmerTrainingPaceDAO.new( @test_type )
  end
  #-- --------------------------------------------------------------------------
  #++

  # Calculate training paces for various test types
  # TODO Should use entity for test types and parameters 
  #
  def calculate_paces
    case @test_type
    when '2000'
      @parameters = {
        'A2-100' => ['A2', 100, 1.000],
        'B1-100' => ['B1', 100, 1.050],
        'B2-100' => ['B2', 100, 1.090],
        'A2-200' => ['A2', 200, 0.985],
        'B1-200' => ['B1', 200, 1.025],
        'B2-200' => ['B2', 200, 1.065],
        'A2-400' => ['A2', 400, 0.975],
        'B1-400' => ['B1', 400, 1.015],
        'B2-400' => ['B2', 400, 1.055]       
      }
      calculate_paces_2000
    end        
  end
  #-- --------------------------------------------------------------------------
  #++
  
  # Calculate paces for 2000 meters continuous swimming
  # The total amount should be devided by 20. The result is the A2 paces for 100 meters
  #
  def calculate_paces_2000
    time_in_seconds = (@minutes_swam * 60) + @seconds_swam
    base_pace = (time_in_seconds / 20 + 0.49).to_i
    
    @parameters.each do |parameter|
      calculated_pace = compute_time(base_pace, parameter[2], parameter[2] / 100)
      @stp.set_pace(parameter[0], parameter[1].to_s, calculated_pace.minutes, calculated_pace.seconds)
    end
    
    base_pace
  end
  #-- --------------------------------------------------------------------------
  #++
  
  # Calculate paces for 200 meters continuous swimming
  # The total amount should be devided by 20. The result is the A2 paces for 100 meters
  #
  def compute_time( base_time, percentage, moltiplicator )
    calculated_timing = Timing.new( (base_time / percentage).to_i * moltiplicator )
    calculated_timing
  end
  
end
