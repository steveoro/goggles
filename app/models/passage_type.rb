class PassageType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..6
  validates_uniqueness_of :code, :message => :already_exists

  validates_length_of     :length_in_meters, :maximum => 6

  # ----------------------------------------------------------------------------
  #++

  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    "#{self.length_in_meters} " + I18n.t( :meters_short )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    "#{self.length_in_meters} " + I18n.t( :meters )
  end
  # ----------------------------------------------------------------------------
  #++
end
