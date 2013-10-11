class AccreditationTimeType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :maximum => 1
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
  #++

  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    I18n.t( "i18n_short_#{ self.code.downcase }".to_sym, {:scope=>[:accreditation_time_types]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    I18n.t( "i18n_description_#{ self.code.downcase }".to_sym, {:scope=>[:accreditation_time_types]} )
  end
  # ----------------------------------------------------------------------------
  #++
end
