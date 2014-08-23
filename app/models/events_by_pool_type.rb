class EventsByPoolType < ActiveRecord::Base

  belongs_to :pool_type
  validates_presence_of :pool_type                  # (must be not null)
  validates_associated :pool_type                   # (foreign key integrity)

  belongs_to :event_type
  validates_presence_of :event_type                 # (must be not null)
  validates_associated :event_type                  # (foreign key integrity)

  # Leega TODO Verify differences between .includes and .joins
  scope :not_relays,    joins(:event_type).where('event_types.is_a_relay = false')
  # ----------------------------------------------------------------------------

  # Find a sopecific event for a pool type using codes
  #
  def self.find_by_pool_and_event_codes( pool_type_code, event_type_code )
    result = EventsByPoolType.joins(:event_type, :pool_type).where( ['(pool_types.code = ?) AND (event_types.code = ?)', pool_type_code, event_type_code] )
    result ? result.first : nil  
  end
  # ----------------------------------------------------------------------------

  # Return the event types for a given pool type code
  #
  def self.get_event_types_for_pool_type_by_code(pool_type_code)
    PoolType.find_by_code(pool_type_code).event_types
  end 
    
  # Return the pool types for a given event type code
  #
  def self.get_pool_types_for_event_type_by_code(event_type_code)
    EventType.find_by_code(event_type_code).pool_types
  end 
    
  # Leega TODO Implements that method correctly
  # Return an hash with pool type id and all event types related
  #
  def self.get_events_by_pool_type_hash
    events_by_pool_type_hash = {}
    PoolType.only_for_meetings.each do |pool_type|
      event_by_pool_type_ids = EventsByPoolType.not_relays
        .where( pool_type_id: pool_type.id )
        .select( :event_type_id )
      events_by_pool_type_hash[ pool_type.id ] = EventType.where( id: event_by_pool_type_ids )
    end
  end 
end
