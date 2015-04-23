# encoding: utf-8

=begin

= SeasonalEventBestDAO

  - Goggles framework vers.:  4.00.777
  - author: Leega

 DAO class containing the structure for managing the event seasonal best

=end
class SeasonalEventBestDAO
  
  # Manage the single event best performance
  class SingleEventBestDAO
    # These must be initialized on creation:
    attr_reader :gender_type, :category_type, :event_type

    # These can be edited later on:
    attr_accessor :gender_type, :category_type, :event_type, :time_swam, :is_converted, :total_events, :events_swam
    #-- -------------------------------------------------------------------------
    #++

    # Creates a new instance from a ameeting_indivudla_result.
    #
    def initialize( gender_type, category_type, event_type, time_swam, is_converted, event_total, event_swam )
      @gender_type   = gender_type
      @category_type = category_type
      @event_type    = event_type 
      @time_swam     = time_swam  
      @is_converted  = is_converted
      @event_total   = event_total
      @event_swam    = event_swam
    end
    #-- -------------------------------------------------------------------------
    #++
  end

  # These must be initialized on creation:
  attr_reader :season

  # These can be edited later on:
  attr_accessor :season, :event_bests
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance from a ameeting_indivudla_result.
  #
  def initialize( season )
    unless season && season.instance_of?( Season )
      raise ArgumentError.new("Seasonal ranking per event needs a season")
    end
    @season           = season
    @event_bests      = []
    @conversion_table = {"M400SL"=>850, "F400SL"=>720, 
                         "M100DO"=>300, "F100DO"=>260,
                         "M50SL"=>80,   "F50SL"=>70,
                         "M100RA"=>260, "F100RA"=>220}
  end
  #-- -------------------------------------------------------------------------
  #++

  # Calculate the event best time for given gender and category
  # Find the best event time for 25 meters and 50 meters 
  # Compare the 50 meters converted in 25 meters anc choose the best 
  def calculate_event_best( gender_type, category_type, event_type, event_total, event_swam )
    is_converted = false
    best_mir = @season.meeting_individual_results.is_valid.for_gender_type(gender_type).for_category_type(category_type).for_event_type(event_type).sort_by_timing.first
    time_swam = best_mir.get_timing
    
    # If best_mir is in 50 metes pool should convert and stop
    if best_mir.pool_type.length_in_meters == 50
      is_converted = true
      #time_swam = time_swam - @conversion_table["#{gender_type.code}#{even_type_code}"]
      time_swam = Timing.new(time_swam.to_hundreds - @conversion_table["#{gender_type.code}#{even_type_code}"])
    else
      # Find best event swam in 50 meters
    end

           
    SingleEventBestDAO.new( gender_type, category_type, event_type, time_swam, is_converted, event_total, event_swam )
  end
  #-- -------------------------------------------------------------------------
  #++
  
  # Calculate the event best time for all genders and categories
  def scan_for_gender_category_and_event
    @season.event_types.are_not_relays.uniq.sort_by_style do |event_type|
      event_total = @season.event_types.where(['event_types.code = ?', event_type.code]).count
      event_swam  = @season.event_types.where(['event_types.code = ? and meetings.are_results_acquired', event_type.code]).count
      GenderType.individual_only.sort_by_courtesy.each do |gender_type|
        @season.category_types.are_not_relays.sort_by_age.each do |category_type|
          set_best_for_gender_category_and_event( gender_type, category_type, event_type, event_total, event_swam )
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++
  
  # Set the best event time given gender and category
  def set_best_for_gender_category_and_event( gender_type, category_type, event_type, event_total, event_swam )
    @event_bests << calculate_event_best( gender_type, category_type, event_type, event_total, event_swam )
  end
  #-- -------------------------------------------------------------------------
  #++
  
  # Get the best event time for gender and category
  def get_best_for_gender_category_and_event( gender_type, category_type, event_type )
    @event_bests.select{|element| element.gender_type == gender_type and element.category_type == category_type and element.event_type == event_type }.first
  end
  #-- -------------------------------------------------------------------------
  #++
end
