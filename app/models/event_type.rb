class EventType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..10, :allow_nil => false
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


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :i18n_short
  end

  # Returns an Array of 2-items Arrays, in which each item is the ID of the record
  # and the other is assumed to be its label
  #
  # == Parameters:
  #
  # - where_condition: an ActiveRecord::Relation WHERE-clause; defaults to +nil+ (returns all records)
  # - key_sym: the key symbol/column name (defaults to :id)
  # - label_sym: the key symbol/column name (defaults to self.get_label_symbol())
  #
  # == Returns:
  # - an Array of arrays having the structure [ [label1, key_value1], [label2, key_value2], ... ]
  #
  def self.to_dropdown( where_condition = nil, key_sym = :id, label_sym = self.get_label_symbol() )
    self.where( where_condition ).map{ |row|
      [row.send(label_sym), row.send(key_sym)]
    }.sort_by{ |ar| ar[0] }
  end
  # ----------------------------------------------------------------------------
end
