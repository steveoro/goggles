class AchievementRow < ActiveRecord::Base

  belongs_to :achievement
  belongs_to :achievement_type

  validates_associated :achievement
  validates_associated :achievement_type

  validates_presence_of     :part_order
  validates_length_of       :part_order, :within => 1..3, :allow_nil => false
  validates_numericality_of :part_order

  scope :sort_by_part_order, order('part_order')
  
  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :i18n_short
  end
end
