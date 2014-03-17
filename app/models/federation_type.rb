class FederationType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..4, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists

  validates_length_of     :description, :maximum => 100
  validates_length_of     :short_name, :maximum => 10

  # ----------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :short_name
  end
  # ----------------------------------------------------------------------------
end
