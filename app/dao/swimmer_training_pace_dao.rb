# encoding: utf-8

=begin

= SwimmerTrainingPaceDAO

  - Goggles framework vers.:  6.111
  - author: Leega

 DAO class containing the structure for managing the training pace calculator 
 based on 2000 meter continuosly swimming

=end
class SwimmerTrainingPaceDAO
  include SqlConvertable
  
  # These must be initialized on creation:
  attr_reader :test_type, :pool_length, :date_swam

  # These can be edited later on:
  attr_accessor :pace_types, :distances
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance
  # If no additional parameters set 25 meters pool and today
  #
  def initialize( test_type = '2000', pool_length = 25, date_swam = Date.today() )    
    @test_type   = test_type
    @pool_length = pool_length
    @date_swam   = date_swam
    
    @pace_types  = ['A2', 'B1', 'B2']
    @distances   = ['100', '200', '400']
    
    @paces = {}
  end
  #-- -------------------------------------------------------------------------
  #++

  # Create pace code based on pace type and distance
  #
  def get_pace_code( pace_type = @pace_types[0], distance = @distances[0] )
    pace_type + '-' + distance   
  end
  #-- -------------------------------------------------------------------------
  #++

  # Sets a given pace
  #
  def set_pace( pace_type, distance, time_swam )
    time_in_hundreds = time_swam.to_hundreds
    @paces[ get_pace_code( pace_type, distance ) ] = time_in_hundreds  
    time_in_hundreds
  end
  #-- -------------------------------------------------------------------------
  #++

  # Gets a given pace (in hundreds)
  # If given pace not set returns 0
  # If in_second is true the pace is returned in second (rounded) 
  #
  def get_pace( pace_type = @pace_types[0], distance = @distances[0], in_second = false )
    pace_in_hundreds = @paces[ get_pace_code( pace_type, distance ) ]

    if in_second && pace_in_hundreds && pace_in_hundreds > 0
      timing = Timing.new( pace_in_hundreds )
      pace_in_seconds = timing.minutes * 60 + timing.seconds
      pace_in_seconds = pace_in_seconds + 1 if timing.hundreds > 0
      pace_in_seconds 
    else
      pace_in_hundreds ? pace_in_hundreds : 0
    end       
  end
  #-- -------------------------------------------------------------------------
  #++

  # Counts paces calclated
  #
  def count_paces
    @paces.count
  end
  #-- -------------------------------------------------------------------------
  #++

  # Describe test type using parameter
  # TODO This function shoud be refactored using test_types entity
  #
  def get_test_type_desc()
    case @test_type
    when '2000'
      '2000 meters continuously swimming'
    when '200-100'
      '200 meters vs 100 meters bests diff'  
    when '400-200'
      '400 meters vs 200 meters bests diff'
    else
      'generic test'
    end  
  end
  #-- -------------------------------------------------------------------------
  #++
    
  # Create a CSV file (; delimited) with season ponderated calculation data
  #
  def to_csv( csv_file_name = 'TrainingPace_' + @test_type + '_' + @pool_length.to_s + '_' + @date_swam.to_s )
    rows = []

    File.open( csv_file_name + '.csv', 'w' ) do |f|
      pace_titles = ['gender',  'category', 'event', 'pool', 'total_results', 'ponderated best', 'best results']
      rows << pace_titles.join(';')

      pace_row = ''
      rows << pace_row.join(';')

      f.puts rows.map{ |row| row }
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Store collected data to the db structure of standard time
  #
  def to_db!()
    create_sql_diff_header( "Training pace calculator based on #{@test_type} in #{@pool_length.to_s} pool on #{@date_swam.to_s}" )


    create_sql_diff_footer( "Training pace calculator based on #{@test_type} in #{@pool_length.to_s} pool on #{@date_swam.to_s}" )
  end
  #-- -------------------------------------------------------------------------
  #++
end
