class ResultType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..10 
  validates_uniqueness_of :code, :message => :already_exists

  validates_length_of     :default_value, :maximum => 1


  # Unique IDs used inside the DB, the description will be retrieved using I18n.t() 
  HEAT_ID   = 1
  SEMI_ID   = 2
  FINALS_ID = 3
  # ----------------------------------------------------------------------------

  # Commodity Array used to enlist all defined IDs
  #
  TYPES_HASH = {
    HEAT_ID   => 'B',
    SEMI_ID   => 'S',
    FINALS_ID => 'F'
  }
  # ----------------------------------------------------------------------------
  #++

  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    I18n.t( "i18n_short_#{ self.code.downcase }".to_sym, {:scope=>[:result_types]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    I18n.t( "i18n_description_#{ self.code.downcase }".to_sym, {:scope=>[:result_types]} )
  end
  # ----------------------------------------------------------------------------
  #++
end
