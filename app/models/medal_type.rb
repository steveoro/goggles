require 'drop_down_listable'
require 'localizable'


class MedalType < ActiveRecord::Base
  include DropDownListable
  include Localizable

  validates_presence_of   :code, length: { maximum: 1 }, allow_nil: false
  validates_uniqueness_of :code, message: :already_exists

  # Filtering by record type scopes
  scope :are_not_jokes,  where('weigth > 0')
  
  scope :sort_by_rank, order(:rank)
  # ----------------------------------------------------------------------------
  
end
