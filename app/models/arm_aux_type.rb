require 'drop_down_listable'
require 'ic_i18n'


class ArmAuxType < ActiveRecord::Base
  include DropDownListable
  include ICI18n

  validates_presence_of   :code, length: { within: 1..5 }, allow_nil: false
  validates_uniqueness_of :code, message: :already_exists
  # ----------------------------------------------------------------------------
end
