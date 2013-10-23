class StrokeType < ActiveRecord::Base

  validates_presence_of   :code
  validates_length_of     :code, :within => 1..2, :allow_nil => false
  validates_uniqueness_of :code, :message => :already_exists


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
  def i18n_short
    I18n.t( "i18n_short_#{ self.code }".to_sym, {:scope=>[:stroke_types]} )
  end

  # Computes a localized description for the value/code associated with this data
  def i18n_description
    I18n.t( "i18n_description_#{ self.code }".to_sym, {:scope=>[:stroke_types]} )
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


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :i18n_short
  end

  # Returns an Array of 2-items Arrays, in which each item is the ID of the record
  # and the other is assumed to be its label
  #
  # == Parameters:
  #
  # - where_condition: an ActiveRecord::Relation WHERE-clause; defaults to +nil+ (returns all records)
  # - key_sym: the key symbol/column name (defaults to :id)
  # - label_sym: the key symbol/column name (defaults to self.get_label_symbol())
  #
  # == Returns:
  # - an Array of arrays having the structure [ [label1, key_value1], [label2, key_value2], ... ]
  #
  def self.to_dropdown( where_condition = nil, key_sym = :id, label_sym = self.get_label_symbol() )
    self.where( where_condition ).map{ |row|
      [row.send(label_sym), row.send(key_sym)]
    }.sort_by{ |ar| ar[0] }
  end
  # ----------------------------------------------------------------------------
end
