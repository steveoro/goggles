class StrokeType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, within: 1..2, allow_nil: false
  validates_uniqueness_of :code, message: :already_exists


  # Unique ID used inside the DB to address the Freestyle (Crawl) StrokeType instance 
  FREESTYLE_ID    = 1

  # Unique ID used inside the DB to address the Butterfly StrokeType instance 
  BUTTERFLY_ID    = 2

  # Unique ID used inside the DB to address the Backstroke StrokeType instance 
  BACKSTROKE_ID   = 3

  # Unique ID used inside the DB to address the Breaststroke StrokeType instance 
  BREASTSTROKE_ID = 4

  # Unique ID used inside the DB to address the Mixed StrokeType instance 
  MIXED_ID        = 5
  # ----------------------------------------------------------------------------


  # Commodity Hash used to enlist all defined IDs and their corresponding Codes
  #
  TYPES_HASH = {
    FREESTYLE_ID    => 'SL',
    BUTTERFLY_ID    => 'FA',
    BACKSTROKE_ID   => 'DO',
    BREASTSTROKE_ID => 'RA',
    MIXED_ID        => 'MI'
  }
  # ----------------------------------------------------------------------------


  # Computes a localized shorter description for the value/code associated with this data
  def i18n_short( is_a_relay = false )
    if ( is_a_relay && code == TYPES_HASH[MIXED_ID] ) # Handle special cases:
      I18n.t( :i18n_short_M, { scope: [:stroke_types] } )
    else
      I18n.t( "i18n_short_#{ self.code }".to_sym, { scope: [:stroke_types] } )
    end
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description( is_a_relay = false )
    if ( is_a_relay && code == TYPES_HASH[MIXED_ID] ) # Handle special cases:
      I18n.t( :i18n_description_M, { scope: [:stroke_types] } )
    else
      I18n.t( "i18n_description_#{ self.code }".to_sym, { scope: [:stroke_types] } )
    end
  end
  # ----------------------------------------------------------------------------
  #++


  # Given a localized text description from an imported text,
  # returns the corresponding StrokeType.id; 0 when unable to parse.
  #
  def self.parse_stroke_type_from_import_text( style_token )
    if style_token =~ /(stile).*/ui
      FREESTYLE_ID
    elsif style_token =~ /(farf).*/ui
      BUTTERFLY_ID
    elsif style_token =~ /(dorso).*/ui
      BACKSTROKE_ID
    elsif style_token =~ /(rana).*/ui
      BREASTSTROKE_ID
    elsif style_token =~ /(mist).*/ui
      MIXED_ID
    else
      0
    end
  end
  # ----------------------------------------------------------------------------
end
