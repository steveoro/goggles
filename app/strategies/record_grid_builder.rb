# encoding: utf-8

=begin

= RecordGridBuilder
  - Goggles framework vers.:  4.00.359.20140718
  - author: Steve A.

 Uses a RecordCollector to allow the build-up of several HTML grid representing
 the distribution of all the records & best results collected.

 Dedicated Enumerators allow to loop by CategoryType or by EventType, given
 specific PoolType & GenderType coordinates.

=end
class RecordGridBuilder

  # Creates a new instance.
  #
  # === Params
  # - record_collector: an instance of RecordCollector (assumed to have an already full RecordCollection)
  #
  def initialize( record_collector )
    raise ArgumentError.new("the parameter must be a RecordCollector instance") unless record_collection.instance_of?( RecordCollector )
    @collector   = record_collector
    # Cache the unique codes lists:
    @pool_type_codes     = @collector.pool_type_code_list
    @event_type_codes    = @collector.event_type_codes_list
    @category_type_codes = @collector.category_type_codes_list
    @gender_type_codes   = @collector.gender_type_codes_list
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
  #-- -------------------------------------------------------------------------
  #++


  # Returns the list of allowed PoolType codes
  def pool_type_code_list
    @pool_type_codes.each
  end

  # Returns the list of allowed EventType codes
  def event_type_codes_list
    @event_type_codes.each
  end

  # Returns the list of allowed CategoryType codes
  def category_type_codes_list
    @category_type_codes.each
  end

  # Returns the list of allowed GenderType codes
  def gender_type_codes_list
    @gender_type_codes.each
  end
  #-- -------------------------------------------------------------------------
  #++
end
