class City < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)

  validates_presence_of   :name
  validates_length_of     :name, :within => 1..50
  validates_uniqueness_of :name, :scope => :zip, :message => :already_exists

  validates_length_of     :zip, :maximum => 6

  validates_presence_of   :area
  validates_length_of     :area, :within => 1..50

  validates_presence_of   :country
  validates_length_of     :country, :within => 1..50

  validates_presence_of   :country_code
  validates_length_of     :country_code, :within => 1..10
  # ----------------------------------------------------------------------------


  # Computes a shorter description for the name associated with this data
  def get_full_name
    [
      (name.empty? ? nil : name),
      (zip.empty? ? nil : zip),
      (area.empty? ? nil : area)
    ].compact.join(", ")
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    country_desc = (self.country_code.nil? || (self.country_code == "I")) ? "" :
                   " #{self.country} (#{self.country_code})"
    get_full_name + country_desc
  end
  # ----------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :get_full_name
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
