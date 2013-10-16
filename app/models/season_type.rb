class SeasonType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..10
  validates_uniqueness_of :code, :message => :already_exists

  validates_length_of     :description, :maximum => 100
  validates_length_of     :short_name, :maximum => 40

  belongs_to :federation_type
  validates_presence_of :federation_type            # (must be not null)
  validates_associated :federation_type             # (foreign key integrity)

  # ----------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :short_name
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
