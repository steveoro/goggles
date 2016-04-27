# encoding: utf-8

=begin

= RecordX4dDAO

  - Goggles framework vers.:  4.00.867
  - author: Leega

 DAO class containing the structure for records rendering
 of records with pool, gender, event and category attributes
 

=end
class RecordX4dDAO
 
  class RecordElementDAO
    # These must be initialized on creation:
    attr_reader :pool_type_code, :gender_type_code, :event_type_code, :category_type_code, :record
    #-- -------------------------------------------------------------------------
    #++
  
    # Creates a new instance.
    #
    def initialize( pool_type_code, gender_type_code, event_type_code, category_type_code, record )
      unless record && record.instance_of?( MeetingIndividualResult )
        raise ArgumentError.new("Record element needs a valid meeting individual result")
      end

      @pool_type_code     = pool_type_code
      @gender_type_code   = gender_type_code
      @event_type_code    = event_type_code
      @category_type_code = category_type_code
      @record             = record
    end
    
    # Pool type safe getter
    #
    def get_pool_type
      @pool_type_code
    end
    
    # Gender type safe getter
    #
    def get_gender_type
      @gender_type_code
    end
    
    # Event type safe getter
    #
    def get_event_type
      @event_type_code
    end
    
    # Category type safe getter
    #
    def get_category_type
      @category_type_code
    end
    
    # Record (meeting individual result) safe getter
    #
    def get_record_instance
      @record
    end
    
    # Record timing getter
    # Returns a formatted string containing the record time
    # Uses the meeting_idividual_results base function
    #
    def get_record_timing
      @record.get_timing
    end
    
    # Record linked date getter
    # Returns a formatted string containing the record date
    # Uses the meeting function
    #
    def get_record_date
      @record.meeting.get_scheduled_date
    end
    
    # Record linked swimmer getter
    # Returns the swimmer name with link to swimemr radio
    # Uses the swimmer decorator function
    #
    def get_record_swimmer
      @record.swimmer.decorate.get_linked_swimmer_name
    end
    
    # Record linked meeting getter
    # Returns the meeting description
    # with link to the meeting results
    # Uses the meeting decorator function
    #
    def get_record_meeting
      @record.meeting.decorate.get_linked_name
    end
    #-- -------------------------------------------------------------------------
    #++
  end

  # These must be initialized on creation:
  attr_reader :owner, :record_type

  # These can be edited later on:
  attr_accessor :records

  # Creates a new instance.
  #
  def initialize( owner, record_type )
    unless record_type && record_type.instance_of?( RecordType )
      raise ArgumentError.new("Record 4D needs a valid record type")
    end

    @owner       = owner
    @record_type = record_type
    @records     = []
  end
  #-- -------------------------------------------------------------------------
  #++
  
  # Adds a record to the record collection
  #
  def add_record( meeting_individual_result, category_code = nil, pool_code = nil, gender_code = nil, event_code = nil )
    is_ok = false 
    if meeting_individual_result && meeting_individual_result.instance_of?( MeetingIndividualResult )
      category_code = meeting_individual_result.category_type.code if !category_code 
      pool_code = meeting_individual_result.pool_type.code if !pool_code 
      gender_code = meeting_individual_result.gender_type.code if !gender_code 
      event_code = meeting_individual_result.event_type.code if !event_code
      
      # TODO Manage scenarios with records already present
      # - Should be an error (consider only the best) 
      # - Should be a pair (same time swam in different results)
      new_record = RecordElementDAO.new( pool_code, gender_code, event_code, category_code, meeting_individual_result )
      if new_record
        @records << new_record
        is_ok = true
      end
    end
    is_ok
  end
end
