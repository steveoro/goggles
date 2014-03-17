require 'ic_i18n'

class SwimmerLevelType < ActiveRecord::Base
  include ICI18n

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..5, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists

  validates_presence_of     :level
  validates_length_of       :level, :within => 1..3, :allow_nil => false
  validates_numericality_of :level
  # ----------------------------------------------------------------------------

  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :i18n_description
  end
  # ----------------------------------------------------------------------------
end
