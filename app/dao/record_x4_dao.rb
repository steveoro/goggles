# encoding: utf-8

=begin

= RecordX4DAO

  - Goggles framework vers.:  4.00.867
  - author: Leega

 DAO class containing the structure for records rendering
 of records with pool, gender, event and category attributes


=end
class RecordX4DAO

  class RecordElementDAO
    # These must be initialized on creation:
    attr_reader :pool_type, :gender_type, :event_type, :category_type, :record, :swimmer, :meeting
    #-- -------------------------------------------------------------------------
    #++

    # Creates a new instance.
    #
    def initialize( pool_type, gender_type, event_type, category_type, meeting_individual_result, swimmer )
      unless meeting_individual_result && meeting_individual_result.instance_of?( MeetingIndividualResult )
        raise ArgumentError.new("Record element needs a valid meeting individual result")
      end

      @pool_type          = pool_type
      @gender_type        = gender_type
      @event_type         = event_type
      @category_type      = category_type
      @record             = meeting_individual_result
      @meeting            = meeting_individual_result.meeting_program.meeting_event.meeting_session.meeting
      @date               = meeting_individual_result.meeting_program.meeting_event.meeting_session.scheduled_date
      @swimmer            = swimmer
    end

    # Pool type safe getter
    #
    def get_pool_type
      @pool_type.code
    end
    def pool_type_code
      @pool_type.code
    end

    # Gender type safe getter
    #
    def get_gender_type
      @gender_type.code
    end
    def gender_type_code
      @gender_type.code
    end

    # Event type safe getter
    #
    def get_event_type
      @event_type.code
    end
    def event_type_code
      @event_type.code
    end

    # Category type safe getter
    #
    def get_category_type
      @category_type.code
    end
    def category_type_code
      @category_type.code
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
    # Returns the record date
    # Uses the meeting function
    #
    def get_record_date
      @date
    end

    # Creates the record code
    #
    def get_record_code
      gender_type_code + '-' + pool_type_code + '-' + category_type_code + '-' + event_type_code
    end
    #-- -------------------------------------------------------------------------
    #++
  end

  # These must be initialized on creation:
  attr_reader :owner, :record_type, :gender_types, :pool_types, :category_types, :event_types

  # These can be edited later on:
  attr_accessor :records

  # Creates a new instance.
  #
  def initialize( owner, record_type )
    unless record_type && record_type.instance_of?( RecordType )
      raise ArgumentError.new("Record 4D needs a valid record type")
    end

    @owner          = owner
    @record_type    = record_type
    @records        = {}
    
    @gender_types   = []
    @pool_types     = []
    
    @category_types = {}
    @event_types    = {}
  end
  #-- -------------------------------------------------------------------------
  #++

  # Adds a record to the record collection
  #
  def add_record( meeting_individual_result, category_type = nil, pool_type = nil, gender_type = nil, event_type = nil, swimmer = nil )
    added = false
    if meeting_individual_result && meeting_individual_result.instance_of?( MeetingIndividualResult )
      category_type = meeting_individual_result.category_type if !category_type
      pool_type = meeting_individual_result.pool_type if !pool_type
      gender_type = meeting_individual_result.gender_type if !gender_type
      event_type = meeting_individual_result.event_type if !event_type
      
      # TODO Eventually manage scenarios with records already present
      # - Should be an error (consider only the best)
      # - Should be a pair (same time swam in different results). In this case should review get methods too
      new_record = RecordElementDAO.new( pool_type, gender_type, event_type, category_type, meeting_individual_result, swimmer )
      record_code = new_record.get_record_code
      if new_record
        # Add record to the record ash
        @records[record_code] = new_record 
        added = true
     
        # Populates member arrays
        @gender_types << gender_type if !@gender_types.include?( gender_type ) 
        @pool_types << pool_type if !@pool_types.include?( pool_type )
        
        table_code = gender_type.code + '-' + pool_type.code
        @category_types[table_code] = [] if @category_types[table_code].nil?
        @event_types[table_code] = [] if @event_types[table_code].nil?
        
        @category_types[table_code] << category_type if @category_types[table_code].rindex{ |e| e.code == category_type.code }.nil? 
        @event_types[table_code] << event_type if @event_types[table_code].rindex{ |e| e.code == event_type.code }.nil?
      end
    end
    added
  end

  # Returns the total number of record collected
  #
  def record_count
    @records.size
  end

  # Returns the element index number of the record stored inside the timing-records
  # collection.
  #
  # When no category or event code is specified, these are simply ignored.
  # Returns +nil+ when no previous record was found/collected.
  #
  def has_record_for?( pool_code, gender_code, event_code, category_code )
    record_code = create_record_code( pool_code, gender_code, event_code, category_code )
    !@records[record_code].nil?
  end

  # Gets the record for the given parameters
  # Return nil if no record set
  #
  def get_record_instance( pool_code, gender_code, event_code, category_code )
    if has_record_for?( pool_code, gender_code, event_code, category_code )
      record_code = create_record_code( pool_code, gender_code, event_code, category_code )
      @records[record_code].get_record_instance
    end
  end

  # Gets the record attribute for the given parameters
  # Return nil if no record set
  #
  def get_record_attribute( pool_code, gender_code, event_code, category_code, attribute = :get_record_instance )
    if has_record_for?( pool_code, gender_code, event_code, category_code )
      record_code = create_record_code( pool_code, gender_code, event_code, category_code )
      @records[record_code].send( attribute.to_sym )
    end
  end

  # Gets the record attribute for the given parameters
  # Return nil if no record set
  #
  def get_record( pool_code, gender_code, event_code, category_code )
    if has_record_for?( pool_code, gender_code, event_code, category_code )
      record_code = create_record_code( pool_code, gender_code, event_code, category_code )
      @records[record_code]
    end
  end

  # Creates the record code
  #
  def create_record_code( pool_code, gender_code, event_code, category_code )
    gender_code + '-' + pool_code + '-' + category_code + '-' + event_code
  end
end
