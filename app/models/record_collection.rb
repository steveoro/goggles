# encoding: utf-8

=begin

= RecordCollection
  - Goggles framework vers.:  4.00.347.20140711
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
  def initialize( individual_result_or_record = nil )
    @list = {}
    add( individual_result_or_record )
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

  # Adds a new member returning its encoded key.
  #
  # Allows also a second tie-in record to be added with a special key, if the
  # result has the same timing (with same pool, event, category & gender) but
  # is from a different swimmer.
  #
  def add( individual_result_or_record )
    if individual_result_or_record
      record_candidate = (
        individual_result_or_record.instance_of?( MeetingIndividualResult ) ?
        IndividualRecord.new.from_individual_result( individual_result_or_record ) : 
        individual_result_or_record
      )
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

  # Returns +true+ if there is a record match for the specified parameters or +false+ when not found.
  #
  def has_record_for( pool_type_code, event_type_code, category_type_code, gender_type_code )
    ! get_record_for( pool_type_code, event_type_code, category_type_code, gender_type_code ).nil?   
  end

  # Returns +true+ if there is a same-ranking (tie-in) record match for the specified parameters or +false+ when not found.
  #
  def has_tie_in_for( pool_type_code, event_type_code, category_type_code, gender_type_code )
    ! get_record_for( pool_type_code, event_type_code, category_type_code, gender_type_code, true ).nil?   
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


  # Returns the encoded string key used to store the specified IndividualRecord record.
  #
  def encode_key_from_codes( pool_type_code, event_type_code, category_type_code, gender_type_code )
    "#{pool_type_code}-#{event_type_code}-#{category_type_code}-#{gender_type_code}"
  end


  # Returns the encoded string key used to store the specified IndividualRecord record.
  #
  def encode_key_from_record( individual_record )
    encode_key_from_codes(
      individual_record.pool_type     ? individual_record.pool_type.code : '?',
      individual_record.event_type    ? individual_record.event_type.code : '?',
      individual_record.category_type ? individual_record.category_type.code : '?',
      individual_record.gender_type   ? individual_record.gender_type.code : '?'
    )
  end
  #-- -------------------------------------------------------------------------
  #++
end
