class Achievement < ActiveRecord::Base

  belongs_to :user

  has_many :achievement_rows

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..10, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists
  
  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    I18n.t( "i18n_short_#{ self.code }".to_sym, {:scope=>[:achievement_rows]} )
  end

  # Computes a localized description for the value/code associated with this data
  # Leega. Description not implemented. Retrive the short
  def i18n_description
    I18n.t( "i18n_short_#{ self.code }".to_sym, {:scope=>[:achievement_rows]} )
  end  

  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :i18n_short
  end
end
