class ShowerType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :maximum => 3
  validates_uniqueness_of :code, :message => :already_exists

  # Unique IDs used inside the DB, the description will be retrieved using I18n.t() 
  NONE_ID                     = 0
  FREE_GROUP_ID               = 1
  FREE_INDIVIDUAL_ID          = 2
  PAY_CURRENCY_GROUP_ID       = 3
  PAY_CURRENCY_INDIVIDUAL_ID  = 4
  PAY_TOKENS_GROUP_ID         = 5
  PAY_TOKENS_INDIVIDUAL_ID    = 6
  # ----------------------------------------------------------------------------


  # Commodity Array used to enlist all defined IDs
  #
  TYPES_HASH = {
    NONE_ID                     => 'no',
    FREE_GROUP_ID               => 'fg',
    FREE_INDIVIDUAL_ID          => 'fi',
    PAY_CURRENCY_GROUP_ID       => 'pmg',
    PAY_CURRENCY_INDIVIDUAL_ID  => 'pmi',
    PAY_TOKENS_GROUP_ID         => 'ptg',
    PAY_TOKENS_INDIVIDUAL_ID    => 'pti'
  }
  # ----------------------------------------------------------------------------


  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    I18n.t( "i18n_short_#{ self.code.downcase }".to_sym, {:scope=>[:shower_types]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    I18n.t( "i18n_description_#{ self.code.downcase }".to_sym, {:scope=>[:shower_types]} )
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
