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

  # Leega TODO Implements that method correctly and do the same for poll list by event
  # Return an hash with the list of events for every pool types
  #
  def self.get_event_list_for_pool_type
    event_types_by_pool = {}
    PoolType.only_for_meetings.each do |pool_type|
      event_by_pool_type_ids = EventsByPoolType.not_relays
        .where( pool_type_id: pool_type.id )
        .select( :event_type_id )
    end
    event_types_by_pool[ pool_type.id ] = EventType.where( id: event_by_pool_type_ids )
  end 
end
