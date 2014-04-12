require 'drop_down_listable'
require 'ic_i18n'


class ExecutionNoteType < ActiveRecord::Base
  include DropDownListable
  include ICI18n

  validates_presence_of   :code, length: { within: 1..3 }, allow_nil: false
  validates_uniqueness_of :code, message: :already_exists
  # ----------------------------------------------------------------------------
end
