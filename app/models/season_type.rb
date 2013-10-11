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
  #++
end
