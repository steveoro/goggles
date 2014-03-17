require 'ic_i18n'

class LockerCabinetType < ActiveRecord::Base
  include ICI18n

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..3, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists

  # Unique IDs used inside the DB, the description will be retrieved using I18n.t() 
  NONE_ID                       = 0
  FREE_ATTENDED_WARDROBE_ID     = 1
  FREE_COMBINATION_ID           = 2
  FREE_OWN_LOCK_ID              = 3
  FREE_ASK_KEY_ID               = 4
  PAY_ATTENDED_WARDROBE_ID      = 5
  PAY_COMBINATION_ID            = 6
  PAY_USE_LOCK_ID               = 7
  PAY_ASK_KEY_ID                = 8
  # ----------------------------------------------------------------------------


  # Commodity Array used to enlist all defined IDs
  #
  TYPES_HASH = {
    NONE_ID                       => 'no',
    FREE_ATTENDED_WARDROBE_ID     => 'fw',
    FREE_COMBINATION_ID           => 'fc',
    FREE_OWN_LOCK_ID              => 'fl',
    FREE_ASK_KEY_ID               => 'fk',
    PAY_ATTENDED_WARDROBE_ID      => 'pw',
    PAY_COMBINATION_ID            => 'pc',
    PAY_USE_LOCK_ID               => 'pl',
    PAY_ASK_KEY_ID                => 'pk'
  }
  # ----------------------------------------------------------------------------
end
