# encoding: utf-8

=begin

= SupermasterTeamSwimmerDAO

  - Goggles framework vers.:  6.111
  - author: Leega

 DAO class containing the structure for managing the training pace calculator
 based on 2000 meter continuosly swimming

=end
class SupermasterTeamSwimmerDAO

  class SupermasterEventDetailDAO

    # These must be initialized on creation:
    attr_reader :meeting_id, :scheduled_date, :event_type_code, :time_swam, :standard_points

    # Creates a new instance
    # Sets swimmer id
    #
    def initialize( meeting_id, scheduled_date, event_type_code, time_swam, standard_points )
      @meeting_id      = meeting_id
      @scheduled_date  = scheduled_date
      @event_type_code = event_type_code
      @time_swam       = time_swam
      @standard_points = standard_points
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # These must be initialized on creation:
  attr_reader :swimmer_id

  # These can be edited later on:
  attr_accessor :complete_name, :category_type_code, :results
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance
  # Sets swimmer id
  #
  def initialize( swimmer_id )
    @swimmer_id = swimmer_id
    @complete_name = ""
    @category_type_code = ""
    @results = []
    @results_count = 0
    @total_score = 0.00
  end
  #-- -------------------------------------------------------------------------
  #++

  # Sets swimmer useful data
  #
  def set_swimmer_data( complete_name, category_type_code )
    @complete_name = complete_name
    @category_type_code = category_type_code
  end
  #-- -------------------------------------------------------------------------
  #++

  # Adds a result
  #
  def add_result_detail( meeting_id, scheduled_date, event_type_code, time_swam, standard_points )
    @results << SupermasterEventDetailDAO.new( meeting_id, scheduled_date, event_type_code, time_swam, standard_points )
    @total_score += standard_points
    @results_count += 1
  end
  #-- -------------------------------------------------------------------------
  #++

  # Gets result count
  #
  def get_results_count
    @results_count
  end
  #-- -------------------------------------------------------------------------
  #++

  # Gets total score
  #
  def get_total_score
    @total_score
  end
  #-- -------------------------------------------------------------------------
  #++

  # Gets everage score
  #
  def get_everage_score
    (@total_score / @results_count).round(2)
  end
  #-- -------------------------------------------------------------------------
  #++
end
