class EventType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..10
  validates_uniqueness_of :code, :message => :already_exists

  validates_length_of     :length_in_meters, :maximum => 5

  belongs_to :stroke_type
  validates_presence_of :stroke_type                # (must be not null)
  validates_associated :stroke_type                 # (foreign key integrity)


  scope :only_relays,     where(:is_a_relay => true)
  scope :are_not_relays,  where(:is_a_relay => false)

  # ----------------------------------------------------------------------------
  #++

  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    if self.is_a_relay
      relaytype = RelayType.find_by_code( self.code )
      relaytype ? relaytype.i18n_short() : self.code 
    else
      "#{self.length_in_meters} " + self.stroke_type.i18n_short()
    end
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    if self.is_a_relay
      relaytype = RelayType.find_by_code( self.code )
      relaytype ? relaytype.i18n_description() : self.code 
    else
      "#{self.length_in_meters} " + self.stroke_type.i18n_description()
    end
  end
  # ----------------------------------------------------------------------------
  #++
end
