class DisqualificationCodeType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..4
  validates_uniqueness_of :code, :message => :already_exists

  belongs_to :stroke_type                           # it can be null (no foreign key thus)
  validates_associated :stroke_type                 # check index/key integrity


  # Shortcut-unique ID/CODE for commonly used disqualification codes 
  DSQ_FALSE_START_ID    = 1                         # NOTE: check migration AddDisqualificationCodeTypes for confirmation of this ID
  DSQ_FALSE_START_CODE  = 'GA'

  # Shortcut-unique ID for commonly used disqualification codes 
  DSQ_RETIRED_ID        = 11                        # NOTE: check migration AddDisqualificationCodeTypes for confirmation of this ID
  DSQ_RETIRED_CODE      = 'GK'
  # ----------------------------------------------------------------------------


  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    I18n.t( "i18n_short_#{ self.code }".to_sym, {:scope=>[:disqualification_code_types]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    I18n.t( "i18n_description_#{ self.code }".to_sym, {:scope=>[:disqualification_code_types]} )
  end
  # ----------------------------------------------------------------------------
end
