class GenderType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :maximum => 1
  validates_uniqueness_of :code, :message => :already_exists


  # Unique ID used inside the DB to address the Male GenderType instance 
  MALE_ID   = 1

  # Unique ID used inside the DB to address the Female GenderType instance 
  FEMALE_ID = 2

  # Unique ID used inside the DB to address the Mixed/"Don't care" GenderType instance 
  MIXED_OR_ANY_ID = 3
  # ----------------------------------------------------------------------------


  # Commodity Hash used to enlist all defined IDs and their corresponding Codes
  #
  TYPES_HASH = {
    MALE_ID   => 'M',
    FEMALE_ID => 'F',
    MIXED_OR_ANY_ID => 'X'
  }
  # ----------------------------------------------------------------------------


  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short
    I18n.t( "i18n_short_#{ self.code.downcase }".to_sym, {:scope=>[:gender_types]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    I18n.t( "i18n_description_#{ self.code.downcase }".to_sym, {:scope=>[:gender_types]} )
  end

  # Computes a displayable "code" for the value/code associated with this data
  def i18n_gender_type
    I18n.t( "i18n_gender_type_#{ self.code.downcase }".to_sym, {:scope=>[:gender_types]} )
  end
  # ----------------------------------------------------------------------------
  #++


  # Given a localized text description from an imported text.
  # == Returns:
  # the corresponding GenderType.id or GenderType::MIXED_OR_ANY_ID
  # when unable to parse.
  #
  def self.parse_gender_type_from_import_text( gender_token )
    if gender_token =~ /maschi/ui
      MALE_ID
    elsif gender_token =~ /femmi/ui
      FEMALE_ID
    else
      MIXED_OR_ANY_ID
    end
  end
  # ----------------------------------------------------------------------------
end
