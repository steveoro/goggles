# encoding: utf-8

=begin

= PersonalBestCollection
  - Goggles framework vers.:  4.00.424.20140808
  - author: Leega

 Wrapper class to store and manage a collection of individual results from meetings.

 Leega TODO Review this assumption
 The internal list contains only instances of IndividualRecord.
 When a new element to be added is given, it is also converted to an IndividualRecord
 instance before being appended to the others.

=end
class PersonalBestCollection
  include Enumerable

  # Creates a new instance. Adds directly the first member, if given.
  #
  # The given parameter can either be a single instance or a list (responding to :each)
  # of MeetingIndividualResult or IndividualRecord rows.
  #
  def initialize( individual_result = nil, record_type = nil )
    @list = {}
    if individual_result.respond_to?(:each)
      individual_result.each { |row| add(row, record_type) }
    else
      add( individual_result, record_type )
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Implements the basic Enumerable interface.
  # It behaves like Hash#each( key, value )
  #
  def each( &block )
    @list.each{ | key, value | block.call( key, value ) }
  end

  # Clears the internal list of records.
  def clear()
    @list.clear
    self
  end

  # Removes from the internal list of records the specified (key: element) pair
  # using an already existing encoded key.
  def delete_with_key( encoded_key )
    row = @list[encoded_key]
    @list.delete( encoded_key ) ? true : false
  end

  # Removes from the internal list of records the specified element.
  def delete( individual_result, record_type )
    if individual_result
      record_candidate = get_record_candidate( individual_result, record_type )
      encoded_key = encode_key_from_record( record_candidate )
      delete_with_key( encoded_key )
    else
      false
    end
  end

  # Adds a new member returning its encoded key.
  def add( individual_result, record_type )
    if individual_result
      record_candidate = get_record_candidate( individual_result, record_type )
      encoded_key = encode_key_from_record( record_candidate )
      @list[ encoded_key ] = record_candidate
      encoded_key
    else
      nil
    end
  end

  alias :<< :add
  alias :size :count
  #-- -------------------------------------------------------------------------
  #++

  # Returns the IndividualRecord for the specified parameters or nil when not found.
  def get_record_for( pool_type_code, event_type_code, record_type )
    encoded_key = encode_key_from_codes( pool_type_code, event_type_code, record_type )
    @list[ encoded_key ]   
  end

  # Returns +true+ if there is an IndividualRecord for the specified parameters or +false+ when not found.
  #
  def has_record_for( pool_type_code, event_type_code, record_type )
    ! get_record_for( pool_type_code, event_type_code, record_type ).nil?   
  end

  # Returns +true+ if there is an IndividualRecord for the specified parameters or +false+ when not found.
  # Doesn't consider the record type
  #
  def has_any_record_for( pool_type_code, event_type_code )
    @list.any? { |key, row| key =~ /#{pool_type_code}\-#{event_type_code}/ }
  end

  # Getter for the IndividualRecord for the specified key. Returns nil when not found.
  #
  def get_record_with_key( encoded_key )
    @list[ encoded_key ]
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns the encoded string key used to store the specified IndividualRecord record.
  #
  def encode_key_from_codes( pool_type_code, event_type_code, record_type )
    "#{pool_type_code}-#{event_type_code}-#{record_type}"
  end


  # Returns the encoded string key used to store the specified IndividualRecord record.
  # Assumes individual_result is always an IndividualResult. So before this method
  # should be used private get_record_candidate to create IndividualRecord from
  # MeetingIndividualResult
  #
  def encode_key_from_record( individual_result )
    if individual_result
      #record_candidate = get_record_candidate( individual_result, record_type )
      encode_key_from_codes(
        individual_result.pool_type   ? individual_result.pool_type.code   : '?',
        individual_result.event_type  ? individual_result.event_type.code  : '?',
        individual_result.record_type ? individual_result.record_type.code : '?'
      )
    else
      nil
    end
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns a copy of the internal list of records.
  def to_hash()
    @list.dup
  end
  #-- -------------------------------------------------------------------------
  #++


  private


  # Returns a valid record candidate as an IndividualRecord instance, while updating
  # the internal cache key list.
  # It doesn't check for a nil parameter.
  #
  def get_record_candidate( individual_result, record_type )
    if individual_result.instance_of?( MeetingIndividualResult )
      IndividualRecord.new.from_individual_result( individual_result, record_type )
    else
      individual_result
    end
  end
  #-- -------------------------------------------------------------------------
  #++
end
