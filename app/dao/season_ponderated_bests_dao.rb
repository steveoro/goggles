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
    attr_reader :season_type, :gender_type, :category_type, :event_type, :pool_type, :max_results, :bests_to_be_ignored

    # These can be edited later on:
    attr_accessor :season_type, :gender_type, :category_type, :event_type, :pool_type, :best_results, :total_results
    #-- -------------------------------------------------------------------------
    #++

    # Creates a new instance.
    #
    def initialize( season_type, gender_type, category_type, event_type, pool_type, max_results, bests_to_be_ignored )
      @season_type         = season_type
      @gender_type         = gender_type
      @category_type       = category_type
      @event_type          = event_type
      @pool_type           = pool_type
      @max_results         = max_results
      @bests_to_be_ignored = bests_to_be_ignored
      
      @total_results       = MeetingIndividualResult
                              .for_season_type( season_type )
                              .for_gender_type( gender_type )
                              .for_category_code( category_type.code )
                              .for_pool_type( pool_type )
                              .for_event_type( event_type )
                              .count
      
      @best_results        = self.collect_event_bests
      @ponderated_time     = self.set_ponderated_best
    end
    #-- -------------------------------------------------------------------------
    #++
    
    # Find the desidered number of best results for the overall meeting individual resuts
    # of the seasons with the same type of the given one
    # It colelcts exactly max_results + bests_to_be_ignored results it more are presents
    # otherwise the maximum number of results
    #
    def collect_event_bests
      # TODO
      # Limit the results to the season older than the target one
      
      MeetingIndividualResult
        .for_season_type( @season_type )
        .for_gender_type( @gender_type )
        .for_category_code( @category_type.code )
        .for_pool_type( @pool_type )
        .for_event_type( @event_type )
        .sort_by_timing
        .limit( @bests_to_be_ignored + @max_results )
      
      # TODO
      # Verify where for_category_type scope is used!!!
    end
    
    # Calculate and set the ponderated best time swam
    # The ponderated best is the everage time calculated on the bests @max_results
    # excluding the first bests_to_be_ignored.
    # If the total amount of meeting individual results is less than
    # bests_to_be_ignored + max_results, all the reuslts will be considered
    #
    def set_ponderated_best
      total_time        = 0
      result_considered = 0
      result_collected  = @best_results.count
      everage_time      = 0

      # If no results, no action performed
      if result_collected > 0
        # If total best results collected >= (bests_to_be_ignored + max_results) 
        # excludes first @bests_to_be_ignored results
        if result_collected >= ( @bests_to_be_ignored + @max_results )
          @best_results.each_with_index do |mir, index|
            if index >= @bests_to_be_ignored
              total_time += mir.get_timing_instance.to_hundreds
            end
          end
          result_considered = @max_results
        else
          @best_results.each do |mir|
            total_time += mir.get_timing_instance.to_hundreds
          end           
          result_considered = result_collected
        end
        everage_time = (total_time / result_considered).round(0)
      end
      @ponderated_time = Timing.new(everage_time)
    end
    
    # Gets the ponderated best time
    #
    def get_ponderated_best
      # Maybe better trace if no results collected
      #@best_results.count > 0 ? Timing.new() : @ponderated_time
      @ponderated_time
    end

    # Gets the max results number to be considered
    #
    def get_max_results
      @max_results
    end

    # Gets the number of top best results to be ignored
    #
    def get_bests_to_be_ignored
      @bests_to_be_ignored
    end
  end

  # These must be initialized on creation:
  attr_reader :season, :max_results, :bests_to_be_ignored

  # These can be edited later on:
  attr_accessor :season, :max_results, :bests_to_be_ignored, :event_types, :categories, :single_events
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
    @event_types         = self.find_season_type_events
    @categories          = self.find_season_type_category_codes
    @single_events       = [] 
    
    scan_for_gender_category_and_event
  end
  #-- -------------------------------------------------------------------------
  #++

  # Scan for different gender, category and event (pool) to be considered
  # For the season type of the target season
  # For each item found i creates an element in single_events
  #
  def scan_for_gender_category_and_event
    # Scan genders, than Category, than events, than pool types
    # An element occurs if at least one meeting individual result is present
    GenderType.individual_only.each do |gender_type|
      PoolType.only_for_meetings.each do |pool_type|
        @event_types.each do |event_type|
          @categories.each do |category_code|
            # If at least on meeting individual result add an element
            if MeetingIndividualResult
              .for_season_type( @season.season_type )
              .for_gender_type( gender_type )
              .for_category_code( category_code )
              .for_pool_type( pool_type )
              .for_event_type( event_type )
              .count > 0
              @single_events << SeasonPonderatedBestsDAO::EventPonderatedBestDAO.new( 
                @season.season_type, 
                gender_type, 
                CategoryType.for_season( @season ).find_by_code(category_code), 
                event_type, 
                pool_type, 
                @max_results, 
                @bests_to_be_ignored )
            end
          end
        end
      end
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Find different catgeories of the season type
  # The categories are those that have at least one meeting result
  # in a meeting of the season type and are still present in the target season
  #
  def find_season_type_category_codes()
    CategoryType.are_not_relays.for_season_type(@season.season_type).for_season(@season).sort_by_age.pluck(:code).uniq
  end
  #-- -------------------------------------------------------------------------
  #++

  # Find different events of the season type
  # The events are those that have at least one meeting result
  # in a meeting of the season type
  #
  def find_season_type_events()
    EventType.are_not_relays.for_season_type(@season.season_type).sort_by_style.uniq
  end
  #-- -------------------------------------------------------------------------
  #++

  # Create a CSV file (; delimited) with season ponderated calculation data 
  #
  def to_csv( csv_file_name = 'ponderated_season_' + @season.id.to_s )
    rows = []

    File.open( csv_file_name + '.csv', 'w' ) do |f|
      titles = ['gender',  'category', 'event', 'pool', 'total_results', 'ponderated best', 'best results'] 
      rows << titles.join(';') 
      
      @single_events.each do |event|
        event_row = '' 
        event_row += event.gender_type.code + ';'
        event_row += event.category_type.code + ';'
        event_row += event.event_type.code + ';'
        event_row += event.pool_type.code + ';'
        event_row += event.total_results.to_s + ';'
        event_row += event.get_ponderated_best.to_s + ';'
        event_row += event.best_results.map{ |mir| mir.get_timing.to_s }.join(';')
        rows << event_row 
      end
      f.puts rows.map{ |row| row }
    end
  end

  # Store collected data to the db structure of standard time 
  #
  def to_db()
    # TODO Store collected data into time_standard structure
    @single_events.each do |event|
      # Check if time standard already exists and create or update
      #TimeStandard.new()
    end
  end
end
