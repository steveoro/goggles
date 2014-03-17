require 'ic_i18n'

class ScoreMappingType < ActiveRecord::Base
  include ICI18n

  has_many :score_mapping_type_rows

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..6, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists
  # ----------------------------------------------------------------------------
end
