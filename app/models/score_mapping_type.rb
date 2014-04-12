require 'drop_down_listable'
require 'ic_i18n'


class ScoreMappingType < ActiveRecord::Base
  include DropDownListable
  include ICI18n

  has_many :score_mapping_type_rows

  validates_presence_of   :code, length: { within: 1..6 }, allow_nil: false
  validates_uniqueness_of :code, message: :already_exists
  # ----------------------------------------------------------------------------
end
