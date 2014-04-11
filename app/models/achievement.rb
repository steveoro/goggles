require 'ic_i18n'


class Achievement < ActiveRecord::Base
  include ICI18n

  belongs_to :user

  has_many :achievement_rows

  validates_presence_of   :code, length: { within: 1..10 }, allow_nil: false
  validates_uniqueness_of :code, message: :already_exists
  # ----------------------------------------------------------------------------
end
