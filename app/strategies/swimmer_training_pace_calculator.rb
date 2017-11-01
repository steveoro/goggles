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

  # These must be initialized on creation:
  attr_reader :parameters, :calculated_swimmer_paces

  # These can be edited later on:
  attr_accessor :base_pace, :time_swam, :time_compared

  # Initialization
  #
  # == Params:
  # An instance of season
  #
  def initialize( test_type, time_swam, time_compared = Timing.new( 0 ) )
    unless test_type && time_swam
      raise ArgumentError.new("Training pace calculator needs test type and time swam")
    end

    @test_type     = test_type
    @time_swam     = time_swam
    @time_compared = time_compared
    @parameters    = []
    @base_pace     = Timing.new( 0 )

    # Define computation parameters
    # TODO use DB structure instead    
    case @test_type
    when '2000'
      @parameters = [
        {:pace_type => 'A2', :distance => 100, :percentage => 1.000},
        {:pace_type => 'B1', :distance => 100, :percentage => 1.050},
        {:pace_type => 'B2', :distance => 100, :percentage => 1.090},
        {:pace_type => 'A2', :distance => 200, :percentage => 0.985},
        {:pace_type => 'B1', :distance => 200, :percentage => 1.025},
        {:pace_type => 'B2', :distance => 200, :percentage => 1.065},
        {:pace_type => 'A2', :distance => 400, :percentage => 0.975},
        {:pace_type => 'B1', :distance => 400, :percentage => 1.015},
        {:pace_type => 'B2', :distance => 400, :percentage => 1.055}       
      ]
    end
    
    @calculated_swimmer_paces = SwimmerTrainingPaceDAO.new( @test_type )
  end
  #-- --------------------------------------------------------------------------
  #++

  # Calculate training paces for various test types
  # TODO Should use entity for test types and parameters 
  #
  def calculate_paces
    case @test_type
    when '2000'
      @calculated_swimmer_paces = calculate_paces_2000
    end
   
    @base_pace        
  end
  #-- --------------------------------------------------------------------------
  #++
  
  # Calculate paces for 2000 meters continuous swimming
  # The total amount should be devided by 20. The result is the A2 paces for 100 meters
  #
  def calculate_base_pace_2000
    @base_pace = Timing.new( (@time_swam.to_hundreds / 20 + 0.49).to_i )
  end
  #-- --------------------------------------------------------------------------
  #++
  
  # Calculate paces for 2000 meters continuous swimming
  # The total amount should be devided by 20. The result is the A2 paces for 100 meters
  #
  def calculate_paces_2000
    @base_pace = calculate_base_pace_2000
    @parameters.each do |parameter|
      calculated_pace = compute_pace_timing(parameter[:percentage], parameter[:distance] / 100)
      @calculated_swimmer_paces.set_pace(parameter[:pace_type], parameter[:distance].to_s, calculated_pace)
    end
    
    @calculated_swimmer_paces
  end
  #-- --------------------------------------------------------------------------
  #++
  
  # Calculate pace from base pace dividing for the given rate
  # Returns calculated timing for requested pace
  #
  def compute_pace_timing( rate = 1, moltiplicator = 1 )
    pace = (@base_pace.to_hundreds / rate).to_i
    calculated_timing = Timing.new( pace * moltiplicator )
    calculated_timing
  end
  
end
