class PresenceType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :maximum => 1
  validates_uniqueness_of :code, :message => :already_exists

  validates_length_of     :value, :maximum => 3


  # Unique IDs used inside the DB, the description will be retrieved using I18n.t() 
  PRESENT_ID    = 1
  LATE_ID       = 2
  EARLY_OUT_ID  = 3
  ABSENT_ID     = 4
  # ----------------------------------------------------------------------------

  # Commodity Array used to enlist all defined IDs
  #
  TYPES_HASH = {
    PRESENT_ID    => 'P',
    LATE_ID       => 'R',
    EARLY_OUT_ID  => 'U',
    ABSENT_ID     => 'A'
  }
  # ----------------------------------------------------------------------------
  #++

  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    I18n.t( "i18n_short_#{ self.code.downcase }".to_sym, {:scope=>[:presence_types]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    I18n.t( "i18n_description_#{ self.code.downcase }".to_sym, {:scope=>[:presence_types]} )
  end
  # ----------------------------------------------------------------------------
  #++
end
