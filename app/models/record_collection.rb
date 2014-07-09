# encoding: utf-8

=begin

= RecordCollection
  - Goggles framework vers.:  4.00.339.20140708
  - author: Steve A.

 Wrapper class to store and manage a collection of individual results from meetings
 or individual records.

=end
class RecordCollection
  include Enumerable

  # Creates a new instance. Adds directly the first member, if given.
  #
  def initialize( meeting_individual_result = nil )
    @list = {}
    add( meeting_individual_result )
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
  def add( meeting_individual_result )
    if meeting_individual_result
      encoded_key = encode_key_from_result( meeting_individual_result )
      existing_record = @list[ encoded_key ]
      if existing_record &&
         (existing_record.minutes == meeting_individual_result.minutes) && 
         (existing_record.seconds == meeting_individual_result.seconds) && 
         (existing_record.hundreds == meeting_individual_result.hundreds) &&
         (existing_record.swimmer_id != meeting_individual_result.swimmer_id) 
        @list[ encoded_key << 'b' ] = meeting_individual_result
      else
        @list[ encoded_key ] = meeting_individual_result
      end
      encoded_key
    else
      nil
    end
  end

  alias :<< :add
  #-- -------------------------------------------------------------------------
  #++

  # Returns the MeetingIndividualResult for the specified parameters or nil when not found.
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


  # Returns the encoded string key used to store the specified meeting_individual_result record.
  #
  def encode_key_from_codes( pool_type_code, event_type_code, category_type_code, gender_type_code )
    "#{pool_type_code}-#{event_type_code}-#{category_type_code}-#{gender_type_code}"
  end


  # Returns the encoded string key used to store the specified meeting_individual_result record.
  #
  def encode_key_from_result( meeting_individual_result )
    encode_key_from_codes(
      meeting_individual_result.pool_type     ? meeting_individual_result.pool_type.code : '?',
      meeting_individual_result.event_type    ? meeting_individual_result.event_type.code : '?',
      meeting_individual_result.category_type ? meeting_individual_result.category_type.code : '?',
      meeting_individual_result.gender_type   ? meeting_individual_result.gender_type.code : '?'
    )
  end
  #-- -------------------------------------------------------------------------
  #++
end
