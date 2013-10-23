class PresenceType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :maximum => 1, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists

  validates_length_of     :value, :maximum => 3


  # Unique IDs used inside the DB, the description will be retrieved using I18n.t() 
  PRESENT_ID    = 1
  LATE_ID       = 2
  EARLY_OUT_ID  = 3
  ABSENT_ID     = 4
  # ----------------------------------------------------------------------------

  # Commodity Array used to enlist all defined IDs
  #
  TYPES_HASH = {
    PRESENT_ID    => 'P',
    LATE_ID       => 'R',
    EARLY_OUT_ID  => 'U',
    ABSENT_ID     => 'A'
  }
  # ----------------------------------------------------------------------------
  #++

  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    I18n.t( "i18n_short_#{ self.code }".to_sym, {:scope=>[:presence_types]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    I18n.t( "i18n_description_#{ self.code }".to_sym, {:scope=>[:presence_types]} )
  end
  # ----------------------------------------------------------------------------


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
