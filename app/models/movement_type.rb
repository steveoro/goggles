require 'ic_i18n'

class MovementType < ActiveRecord::Base
  include ICI18n

  # Commodity reference to a specific code stored in the DB; make sure this value is always correct
  CODE_FULL = 'C'                                   # If it's full or generic we may want to discriminate. (This code allows to avoid printing generic-type movements in some methods.)

  validates_presence_of   :code
  validates_length_of     :code, :maximum => 1, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists
  # ----------------------------------------------------------------------------
end
