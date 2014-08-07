# encoding: utf-8

=begin

= PersonalBestGridBuilder
  - Goggles framework vers.:  4.00.420.20140807
  - author: Leega (copiator...)

 Uses a RecordCollector to allow the build-up of several HTML grid representing
 the distribution of all the records & best results collected.

 Dedicated Enumerators allow to loop by EventType, given
 specific PoolType coordinates.

=end
class PersonalBestGridBuilder

  # Creates a new instance.
  #
  # === Params
  # - record_collector: an instance of RecordCollector (assumed to have an already full RecordCollection)
  #
  def initialize( record_collector )
    raise ArgumentError.new("the parameter must be a RecordCollector instance") unless record_collector.instance_of?( RecordCollector )
    @collector  = record_collector

    # Retrieves pool type suitable for meetings
    @pool_types = PoolType.is_suitable_for_meeting
    
    # This will create an Hash with all the tuples made by (pool_type.id => event_type lists),
    # with each event list built using the distribution of events found inside EventsByPoolType:
    @event_types_by_pool = {} 
    @pool_types.each do |pool_type|
      event_by_pool_type_ids = EventsByPoolType
        .where( pool_type_id: pool_type.id )
        .includes( :event_type )
        .where{ event_types.is_a_relay == false }
        .select( :event_type_id )
      @event_types_by_pool[ pool_type.id ] = EventType.where( id: event_by_pool_type_ids )
    end
  end
  #-- --------------------------------------------------------------------------
  #++

  # Getter for a unique text cache key associated with this instance and its internal collection.
  #
  # This will generate a different string from the one returned by #collection.cache_key
  # if the internal RecordCollector instance has been pre-filtered with a swimmer
  # instance.
  #
  # (This allows the grid builder to be initialized with a special collector created
  # from an already existing colletion of records, where the swimmer pre-filter is being
  # used just to highlight his/her results among the others, while having different
  # cache hits for pages regarding the essential same collection but highlighted in a
  # different way.)
  #
  def cache_key
    if @collector.swimmer
      "#{@collector.swimmer.id}:" << @collector.collection.cache_key
    else
      @collector.collection.cache_key
    end
  end

  # Getter for the internal list.
  def collection
    @collector.collection
  end

  # Getter for the internal list #count method.
  def count
    @collector.count
  end
  #-- -------------------------------------------------------------------------
  #++


  # Returns the Enumerator of the allowed PoolTypes.
  #
  # Note that these are substantially different from the similar methods found
  # inside RecordCollector: these return an actual Enumerator for all the allowed
  # model instances (not just unique string codes).
  def pool_types
    @pool_types.each
  end

  # Returns the Enumerator of the allowed EventTypes.
  #
  # Note that these are substantially different from the similar methods found
  # inside RecordCollector: these return an actual Enumerator for all the allowed
  # model instances (not just unique string codes).
  def event_types( pool_type_id )
    @event_types_by_pool.has_key?(pool_type_id) ? @event_types_by_pool[pool_type_id].each : [].each
  end
  #-- -------------------------------------------------------------------------
  #++
end
