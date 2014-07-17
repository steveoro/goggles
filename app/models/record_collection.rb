# encoding: utf-8

=begin

= RecordCollection
  - Goggles framework vers.:  4.00.357.20140717
  - author: Steve A.

 Wrapper class to store and manage a collection of individual results from meetings
 or individual records.

 The internal list contains only instances of IndividualRecord.
 When a new element to be added is given, it is also converted to an IndividualRecord
 instance before being appended to the others.

=end
class RecordCollection
  include Enumerable

  # Creates a new instance. Adds directly the first member, if given.
  #
  # The given parameter can either be a single instance or a list (responding to :each)
  # of MeetingIndividualResult or IndividualRecord rows.
  #
  def initialize( individual_result_or_record = nil )
    @list = {}
    if individual_result_or_record.respond_to?(:each)
      individual_result_or_record.each { |row| add(row) }
    else
      add( individual_result_or_record )
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
    @list.delete( encoded_key ) ? true : false
  end

  # Removes from the internal list of records the specified element.
  def delete( individual_result_or_record )
    if individual_result_or_record
      record_candidate = get_record_candidate( individual_result_or_record )
      encoded_key = encode_key_from_record( record_candidate )
      delete_with_key( encoded_key )
    else
      false
    end
  end

  # Adds a new member returning its encoded key.
  #
  # Allows also a second tie-in record to be added with a special key, if the
  # result has the same timing (with same pool, event, category & gender) but
  # is from a different swimmer.
  #
  def add( individual_result_or_record )
    if individual_result_or_record
      record_candidate = get_record_candidate( individual_result_or_record )
      encoded_key = encode_key_from_record( record_candidate )
      existing_record = @list[ encoded_key ]
      if ( existing_record &&                       # Same record w/ different swimmer?
           (existing_record.swimmer_id != record_candidate.swimmer_id) && 
           (existing_record.minutes  == record_candidate.minutes) && 
           (existing_record.seconds  == record_candidate.seconds) && 
           (existing_record.hundreds == record_candidate.hundreds)
         )                                          # Add a tie-in w/ special key ending in 'b'
        @list[ encoded_key << 'b' ] = record_candidate
      else                                          # Add a normal record:
        @list[ encoded_key ] = record_candidate
      end
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
  #
  # When specified as +true+, the <tt>is_tie_in</tt> parameter allows to retrieve not
  # the first record, but its tie-in (if any). 
  #
  def get_record_for( pool_type_code, event_type_code, category_type_code, gender_type_code, is_tie_in = false )
    encoded_key = encode_key_from_codes( pool_type_code, event_type_code, category_type_code, gender_type_code )
    @list[ is_tie_in ? encoded_key << 'b' : encoded_key ]   
  end

  # Returns the IndividualRecord for the specified parameters or nil when not found.
  #
  def has_record_for( pool_type_code, event_type_code, category_type_code, gender_type_code )
    ! get_record_for( pool_type_code, event_type_code, category_type_code, gender_type_code ).nil?   
  end

  # Getter for the IndividualRecord for the specified key. Returns nil when not found.
  #
  def get_record_with_key( encoded_key )
    @list[ encoded_key ]
  end

  # Returns +true+ if there is a same-ranking (tie-in) record match for the specified parameters or +false+ when not found.
  #
  def has_tie_in_for( pool_type_code, event_type_code, category_type_code, gender_type_code )
    ! get_record_for( pool_type_code, event_type_code, category_type_code, gender_type_code, true ).nil?   
  end
  #-- -------------------------------------------------------------------------
  #++

  # Returns the encoded string key used to store the specified IndividualRecord record.
  #
  def encode_key_from_codes( pool_type_code, event_type_code, category_type_code, gender_type_code )
    "#{pool_type_code}-#{event_type_code}-#{category_type_code}-#{gender_type_code}"
  end


  # Returns the encoded string key used to store the specified IndividualRecord record.
  #
  def encode_key_from_record( individual_result_or_record )
    if individual_result_or_record
      record_candidate = get_record_candidate( individual_result_or_record )
      encode_key_from_codes(
        record_candidate.pool_type     ? record_candidate.pool_type.code : '?',
        record_candidate.event_type    ? record_candidate.event_type.code : '?',
        record_candidate.category_type ? record_candidate.category_type.code : '?',
        record_candidate.gender_type   ? record_candidate.gender_type.code : '?'
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


  # Returns a valid record candidate as an IndividualRecord instance.
  # It doesn't check for a nil parameter.
  #
  def get_record_candidate( individual_result_or_record )
    (
      individual_result_or_record.instance_of?( MeetingIndividualResult ) ?
      IndividualRecord.new.from_individual_result( individual_result_or_record ) : 
      individual_result_or_record
    )
  end
  #-- -------------------------------------------------------------------------
  #++
end