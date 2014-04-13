class EventsByPoolType < ActiveRecord::Base

  belongs_to :pool_type
  validates_presence_of :pool_type                  # (must be not null)
  validates_associated :pool_type                   # (foreign key integrity)

  belongs_to :event_type
  validates_presence_of :event_type                 # (must be not null)
  validates_associated :event_type                  # (foreign key integrity)
  # ----------------------------------------------------------------------------

end
