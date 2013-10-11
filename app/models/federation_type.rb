class FederationType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..4
  validates_uniqueness_of :code, :message => :already_exists

  validates_length_of     :description, :maximum => 100
  validates_length_of     :short_name, :maximum => 10

  # ----------------------------------------------------------------------------
  #++
end
