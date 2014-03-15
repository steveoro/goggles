class ArmAuxType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..5, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists
  # ----------------------------------------------------------------------------


  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    I18n.t( "i18n_short_#{ self.code }".to_sym, {:scope=>[:arm_aux_types]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    I18n.t( "i18n_description_#{ self.code }".to_sym, {:scope=>[:arm_aux_types]} )
  end
  # ----------------------------------------------------------------------------
end
