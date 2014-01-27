class TrainingStepType < ActiveRecord::Base

  validates_presence_of     :step_order
  validates_length_of       :step_order, :within => 1..3, :allow_nil => false
  validates_numericality_of :step_order

  validates_presence_of   :code
  validates_length_of     :code, :maximum => 1, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists

  scope :sort_by_step_order, order('step_order')
  # ----------------------------------------------------------------------------


  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    I18n.t( "i18n_short_#{ self.code }".to_sym, {:scope=>[:training_step_types]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    I18n.t( "i18n_description_#{ self.code }".to_sym, {:scope=>[:training_step_types]} )
  end
  # ---------------------------------------------------------------------------


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
    self.where( where_condition ).sort_by_step_order.map{ |row|
      [row.send(label_sym), row.send(key_sym)]
    }
    # [Steve, 20140127] Update: since we want to force ordering according to the step order,
    # we'll use the dedicated scope method sort_by_step_order instead of the more standardized
    # array sorting by label method: [].sort_by{ |ar| ar[0] }
  end
  # ----------------------------------------------------------------------------
end
