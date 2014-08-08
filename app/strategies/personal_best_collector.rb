# encoding: utf-8

=begin

= RecordCollector
  - Goggles framework vers.:  4.00.424
  - author: Leega

 Collector strategy class for individual all time personal bests stored into
 a newly created PersonalBestCollection instance.

 Records are collected according to the filtering parameters set using the
 constructor.

=end
class PersonalBestCollector

  # Creates a new instance while setting the filtering parameters for the records
  # selection.
  #
  # === Initialization options:
  # - list: an object responding to :each, containing a list of row instances to
  #         be added to the internal collection during initialization.
  #         (These will be converted to IndividualRecord(s) and indexed by their values)
  #
  # === Supported filtering options:
  # When provided, any of these options are combined together and will be used
  # to filter out the results during the collection loops.
  #
  # - swimmer: a Swimmer instance
  # - team: a filtering Team instance (mutually exclusive with season_type)
  # - season_type: a filtering SeasonType instance (mutually exclusive with team, takes precedence over team)
  # - season: a filtering Season instance (this filter is ignored when looping on IndividualRecords)
  # - meeting: a Meeting instance (this filter is ignored when looping on IndividualRecords)
  #
  def initialize( swimmer, options = {} )
    @swimmer      = swimmer
    
    list_of_rows  = options[:list].respond_to?(:each) ? options[:list] : nil
    @collection   = PersonalBestCollection.new( list_of_rows )

    # Options safety check:
    #@swimmer      = options[:swimmer] if options[:swimmer].instance_of?( Swimmer )
    @season_type  = options[:season_type] if options[:season_type].instance_of?( SeasonType )
    @season       = options[:season] if options[:season].instance_of?( Season )
    @start_date   = options[:start_date] if options[:start_date].instance_of?( Date )
    @end_date     = options[:end_date] if options[:end_date].instance_of?( Date )

    # Cache the unique codes lists:
    #@events_by_pool_types = EventsByPoolType.not_relays
  end
  #-- --------------------------------------------------------------------------
  #++

  # Getter for the internal SeasonType parameter. +nil+ when not defined.
  def season_type
    @season_type
  end

  # Getter for the internal Season parameter. +nil+ when not defined.
  def season
    @season
  end

  # Getter for the internal Meeting parameter. +nil+ when not defined.
  def start_date
    @start_date
  end

  # Getter for the internal Meeting parameter. +nil+ when not defined.
  def end_date
    @end_date
  end

  # Getter for the internal list.
  def collection
    @collection
  end

  # Getter for the internal list #count method.
  def count
    @collection.count
  end

  # Clears the internal list of records.
  def clear
    @collection.clear
  end
  #-- --------------------------------------------------------------------------
  #++


  # Returns the internal RecordCollection instance updated with the records collected using
  # the specified parameters.
  #
  # This method works by scanning existing MeetingIndividualResult(s) on DB.
  #
  def collect_from_all_category_results_having( events_by_pool_type )
    mir = @swimmer.meeting_individual_results.is_valid.has_time.for_event_by_pool_type( events_by_pool_type )
    mir = mir.joins( :season ).where( ['seasons.id = ?', @season.id]) if @season
    mir = mir.joins( :season_type ).where( ['season_types.id = ?', @season_type.id]) if @season_type
    mir = mir.joins( :meeting ).where( ['(meetings.header_date >= ?) AND (meetings.header_date <= ?)', @start_date, @end_date]) if @start_date
    update_and_return_collection_with_first_results( mir )
  end
  #-- -------------------------------------------------------------------------
  #++

  # Getter for the list of all unique SeasonType instances found referenced by the
  # current collection.
  #
  # Returns an Hash with the tuples { season_types.id => SeasonType instance } as
  # individual elements.
  #
  def get_collected_season_types
    result = {}
    @collection.each do |collection_key, individual_record|
      season_type = individual_record.season_type
      result[ season_type.id ] = season_type unless result.has_key?( season_type.id )
    end
    result
  end
  #-- --------------------------------------------------------------------------
  #++


  # Returns the list of allowed PoolType codes
  def pool_type_codes_list
    EventsByPoolType.not_relays.joins(:pool_type).select('pool_types.code').uniq.map{ |row| row.code }
  end

  # Returns the list of allowed EventType codes
  def event_type_codes_list( pool_type_code )
    PoolType.find_by_code( pool_type_code ).events_by_pool_types.not_relays.joins(:event_type).select('event_types.code').uniq.map{ |row| row.code }
  end


  # Executes the block while passing iteratively self plus all the codes combinations
  # of PoolType(s) & EventType(s) as parameters
  # for the block -- which must have the same signature as #collect_from_records_having()
  # or #collect_from_results_having().
  #
  # This allows to loop on either one of the above methods while filling the internal
  # record collection for each possible combinatory tuple.
  #
  # This will yield a RecordCollection instance filled with all the best results
  # available for each particular combination of filtering parameters specified
  # in the constructor. As in:
  #
  #     collector.full_scan() do |this, pool_code, event_code|
  #       this.collect_from_records_having( pool_code, event_code )
  #     end
  #
  # ...Or:...
  #
  #     collector.full_scan() do |this, pool_code, event_code|
  #       this.collect_from_results_having( pool_code, event_code )
  #     end
  #
  # Please, be aware that an unfiltered full scan using #collect_from_results_having
  # may take several minutes to complete (depending on Server speed & power).
  #
  # While the latter method is painstakingly slow, it can be used to fill the entries into
  # the individual_records table. These can be later retrieved and stored on another
  # RecordCollection with the former method.
  #
  def full_scan( &block )
    self.pool_type_codes_list.each do |pool_type_code|
      self.event_type_codes_list(pool_type_code).each do |event_type_code|
        yield( self, pool_type_code, event_type_code ) if block_given?
      end
    end
    @collection
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Returns the internal collection after having added the first +limit+ results
  # among the ones specified.
  #
  # <tt>prefiltered_results</tt> is a Relation of either IndividualRecord or
  # MeetingIndividualResult instances.
  #
  def update_and_return_collection_with_first_results( prefiltered_results, limit = 3 )
    # Store these max first ranking results:
    first_recs = prefiltered_results.order( :minutes, :seconds, :hundreds ).limit(limit)

    if first_recs.size > 0                          # Compute the first timing result value
      first_timing_value = first_recs.first.minutes*6000 + first_recs.first.seconds*100 + first_recs.first.hundreds
                                                    # Remove from the result all other rows that have a greater timing result (keep same ranking results)
      first_recs.reject!{ |row| first_timing_value < (row.minutes*6000 + row.seconds*100 + row.hundreds) }
    end
    first_recs.each { |rec| @collection << rec }    # Add the first records to the collection
    @collection
  end
  #-- -------------------------------------------------------------------------
  #++
end
