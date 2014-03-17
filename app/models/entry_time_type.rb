require 'ic_i18n'

class EntryTimeType < ActiveRecord::Base
  include ICI18n

  validates_presence_of   :code
  validates_length_of     :code, :maximum => 1, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists


  # Unique IDs used inside the DB, the description will be retrieved using I18n.t() 
  MANUAL_ID     = 1
  PERSONAL_ID   = 2
  OBERCUP_ID    = 3
  PREC_YEAR_ID  = 4
  LAST_RACE_ID  = 5
  # ----------------------------------------------------------------------------

  # Commodity Array used to enlist all defined IDs
  #
  TYPES_HASH = {
    MANUAL_ID     => 'M',
    PERSONAL_ID   => 'P',
    OBERCUP_ID    => 'O',
    PREC_YEAR_ID  => 'A',
    LAST_RACE_ID  => 'U'
  }
  # ----------------------------------------------------------------------------
end
