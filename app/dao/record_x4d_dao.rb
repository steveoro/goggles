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
    
    # Record type safe getter
    #
    def get_record
      @record
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
end
