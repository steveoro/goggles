require 'ic_i18n'

class ShowerType < ActiveRecord::Base
  include ICI18n

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..3, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists

  # Unique IDs used inside the DB, the description will be retrieved using I18n.t() 
  NONE_ID                     = 0
  FREE_GROUP_ID               = 1
  FREE_INDIVIDUAL_ID          = 2
  PAY_CURRENCY_GROUP_ID       = 3
  PAY_CURRENCY_INDIVIDUAL_ID  = 4
  PAY_TOKENS_GROUP_ID         = 5
  PAY_TOKENS_INDIVIDUAL_ID    = 6
  # ----------------------------------------------------------------------------


  # Commodity Array used to enlist all defined IDs
  #
  TYPES_HASH = {
    NONE_ID                     => 'no',
    FREE_GROUP_ID               => 'fg',
    FREE_INDIVIDUAL_ID          => 'fi',
    PAY_CURRENCY_GROUP_ID       => 'pmg',
    PAY_CURRENCY_INDIVIDUAL_ID  => 'pmi',
    PAY_TOKENS_GROUP_ID         => 'ptg',
    PAY_TOKENS_INDIVIDUAL_ID    => 'pti'
  }
  # ----------------------------------------------------------------------------
end
