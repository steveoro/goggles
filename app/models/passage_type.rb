require 'ic_i18n'

class PassageType < ActiveRecord::Base
  include ICI18n

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..6, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists

  validates_length_of     :length_in_meters, :maximum => 6
  # ----------------------------------------------------------------------------
end
