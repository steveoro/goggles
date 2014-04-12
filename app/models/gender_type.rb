require 'drop_down_listable'
require 'localizable'


class GenderType < ActiveRecord::Base
  include DropDownListable
  include Localizable

  validates_presence_of   :code, length: { maximum: 1 }, allow_nil: false
  validates_uniqueness_of :code, message: :already_exists

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

  # Returns true if the current row's ID is equal to MALE_ID 
  def is_male
    ( self.id == MALE_ID )
  end

  # Returns true if the current row's ID is equal to FEMALE_ID 
  def is_female
    ( self.id == FEMALE_ID )
  end
  # ----------------------------------------------------------------------------

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
