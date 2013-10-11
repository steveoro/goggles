class HairDryerType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :maximum => 3
  validates_uniqueness_of :code, :message => :already_exists

  # Unique IDs used inside the DB, the description will be retrieved using I18n.t() 
  NONE_ID         = 0
  FREE_ID         = 1
  PAY_CURRENCY_ID = 2
  PAY_TOKENS_ID   = 3
  # ----------------------------------------------------------------------------


  # Commodity Array used to enlist all defined IDs
  #
  TYPES_HASH = {
    NONE_ID         => 'no',
    FREE_ID         => 'ok',
    PAY_CURRENCY_ID => 'pc',
    PAY_TOKENS_ID   => 'pt'
  }
  # ----------------------------------------------------------------------------


  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    I18n.t( "i18n_short_#{ self.code.downcase }".to_sym, {:scope=>[:hair_dryer_types]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    I18n.t( "i18n_description_#{ self.code.downcase }".to_sym, {:scope=>[:hair_dryer_types]} )
  end
  # ----------------------------------------------------------------------------
  #++
end
