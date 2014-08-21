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
  def initialize( personal_best_collector )
    raise ArgumentError.new("the parameter must be a PersonalBestCollector instance") unless personal_best_collector.instance_of?( PersonalBestCollector )
    @collector  = personal_best_collector
    
    # Defines record types handled by personal best grid
    @record_types = RecordType.for_swimmers

    # Retrieves pool type suitable for meetings
    @pool_types = PoolType.only_for_meetings
    
    # Leega. TODO: Refactor this to a class method of EventsByPoolType
    # This will create an Hash with all the tuples made by (pool_type.id => event_type lists),
    # with each event list built using the distribution of events found inside EventsByPoolType:
    @event_types_by_pool = {} 
    @pool_types.each do |pool_type|
        #.includes( :event_type )
        #.where{ event_types.is_a_relay == false }


      event_by_pool_type_ids = EventsByPoolType.not_relays
        .where( pool_type_id: pool_type.id )
        .select( :event_type_id )
      @event_types_by_pool[ pool_type.id ] = EventType.where( id: event_by_pool_type_ids )
    end
  end
  #-- --------------------------------------------------------------------------
  #++

  
  # Getter for the internal list.
  def collection
    @collector.collection
  end

  # Getter for the internal list #count method.
  def count
    @collector.count
  end

  # Getter for the internal list #clear method.
  def clear
    @collector.clear
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns the Enumerator of the handled record types.
  def record_types
    @record_types.each
  end

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
