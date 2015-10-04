# encoding: utf-8

=begin

= SeasonPonderatedBestsDAO

  - Goggles framework vers.:  4.00.827
  - author: Leega

 DAO class containing the structure for managing the overall event bests

=end
class SeasonPonderatedBestsDAO

  # Manage the single event best performance
  class EventPonderatedBestDAO
    # These must be initialized on creation:
    attr_reader :gender_type, :category_type, :event_type, :pool_type

    # These can be edited later on:
    attr_accessor :gender_type, :category_type, :event_type, :pool_type, :best_results
    #-- -------------------------------------------------------------------------
    #++

    # Creates a new instance.
    #
    def initialize( gender_type, category_type, event_type, pool_type )
      @gender_type         = gender_type
      @category_type       = category_type
      @event_type          = event_type
      @pool_type           = pool_type
      @best_results        = []
      @ponderated_time       = Timing.new()
    end
    #-- -------------------------------------------------------------------------
    #++
    
    # Clear the best result collection and the pondered time
    #
    def clear
      @best_results  = []
      @ponderated_time = Timing.new()
    end
    
    # Find the desidered number of best results for the overall meeting individual resuts
    # of the seasons with the same type of the given one
    # It colelcts exactly max_results + bests_to_be_ignored results it more are presents
    # otherwise the maximum number of results
    #
    def collect_event_bests
      @best_results = MeetingIndividualResult
        .for_season_type( @season.season_type )
        .for_gender_type( @gender_type )
        .for_category_code( @category_type.code )
        .for_pool_type( @pool_type )
        .for_even_type( @event_type )
        .sort_by_timing
        .limit( @bests_to_be_ignored + @max_results )
      @best_results.count         
      
      # TODO This will consider only one season because the category is unique in the season
      # Should use the category code instead of category object
      # Should verifiy where this scope is used too!!!
    end
    
    # Calculate and set the pondered best time swam
    # The pondered best is the everage time calculated on the bests @max_results
    # excluding the first bests_to_be_ignored.
    # If the total amount of meeting individual results is less than
    # bests_to_be_ignored + max_results, all the reuslts will be considered
    #
    def set_ponderated_best
      total_time        = 0
      result_considered = 0
      result_collected  = @best_results.count

      # If no results, no action performed
      if result_collected > 0
        # If total best results collected >= (bests_to_be_ignored + max_results) 
        # excludes first @bests_to_be_ignored results
        if result_collected >= ( @bests_to_be_ignored + @max_results )
          @best_results.each_with_index do |mir, index|
            if index >= @bests_to_be_ignored
              total_time += mir.get_timing.to_hundreds
            end
          end
          result_considered = @max_results
        else
          @best_results.each do |mir|
            total_time += mir.get_timing.to_hundreds
          end           
          result_considered = result_collected
        end
        everage_time = (total_time / result_considered).round(0)
        @ponderated_time = Timing.new(everage_time) 
      end
    end
    
    # Gets the pondered best time
    #
    def get_pondered_best
      @best_results? null : @ponderated_time
    end
  end

  # These must be initialized on creation:
  attr_reader :season, :max_results, :bests_to_be_ignored

  # These can be edited later on:
  attr_accessor :season, :max_results, :bests_to_be_ignored, :single_events
  #-- -------------------------------------------------------------------------
  #++

  # Creates a new instance for a given season
  # If no additional parameters set assumes 5 best results and 1 best to be ignored
  #
  def initialize( season, max_results = 5, bests_to_be_ignored = 1)
    unless season && season.instance_of?( Season )
      raise ArgumentError.new("Seasonal ponderated best calculation per event needs a season")
    end
    @season              = season
    @max_results         = max_results
    @bests_to_be_ignored = bests_to_be_ignored
    @single_events       = []

    scan_for_gender_category_and_event
  end
  #-- -------------------------------------------------------------------------
  #++

  # Scan for different gender, categoryand event (pool) to be considered
  # For the season type of the target season
  # For each item found i creates an element in single_events
  #
  def scan_for_gender_category_and_event
    # Scan genders, than Category, than events, than pool types
    # An element occurs if at least one meeting individual result is present
    
  end
  #-- -------------------------------------------------------------------------
  #++

end
