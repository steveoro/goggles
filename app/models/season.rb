require 'date'

class Season < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :season_type
  belongs_to :edition_type
  belongs_to :timing_type
  validates_associated :season_type
  validates_associated :edition_type
  validates_associated :timing_type

  has_one  :federation_type, :through => :season_type

  has_many :meetings

  validates_presence_of :header_year
  validates_length_of   :header_year, :within => 1..9, :allow_nil => false

  validates_presence_of :edition
  validates_length_of   :edition, :within => 1..3, :allow_nil => false

  validates_presence_of :description
  validates_length_of   :description, :within => 1..100, :allow_nil => false

  validates_presence_of :begin_date
#  validates_presence_of :end_date


  scope :sort_season_by_begin_date,  lambda { |dir| order("seasons.begin_date #{dir.to_s}") }
  scope :sort_season_by_season_type, lambda { |dir| order("season_types.code #{dir.to_s}, seasons.begin_date #{dir.to_s}") }
  scope :sort_season_by_user,        lambda { |dir| order("users.name #{dir.to_s}, seasons.begin_date #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{begin_date ? begin_date.strftime('%Y') : '?'}/#{end_date ? end_date.strftime('%y') : '?'} #{get_season_type}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "(#{begin_date ? begin_date.strftime('%Y') : '?'}/#{end_date ? end_date.strftime('%y') : '?'}) #{description}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the Season Type short name
  def get_season_type
    self.season_type ? self.season_type.short_name :  '?'
  end
  # ----------------------------------------------------------------------------

  # Retrieves the Federation Type short name
  def get_federation_type
    self.federation_type ? self.federation_type.short_name :  '?'
  end
  # ----------------------------------------------------------------------------
  # ----------------------------------------------------------------------------


  # Label symbol corresponding to either a column name or a model method to be used
  # mainly in generating DropDown option lists.
  #
  def self.get_label_symbol
    :get_full_name
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


  # Returns if the season is ended at a certain date
  #
  # == Parameters:
  #
  # - evauation_date: the date in which should verify if the seasons is terminated
  #
  # == Returns:
  # - TRUE if season is ended at the specified date
  # - FALSE if season is not ended at the date or there is no season end defined
  #
  def is_season_ended_at( evaluation_date = Date.today )
    if self.end_date
      ( self.end_date <= evaluation_date ) ? true : false
    else
      false
    end
  end
  # ----------------------------------------------------------------------------


  # Returns if the season is started at a certain date
  #
  # == Parameters:
  #
  # - evauation_date: the date in which should verify if the seasons is started
  #
  # == Returns:
  # - TRUE if season is started at the specified date
  # - FALSE if season is not started at the specified date
  #
  def is_season_started_at( evaluation_date = Date.today )
    ( self.begin_date >= evaluation_date ) ? true : false
  end
  # ----------------------------------------------------------------------------


  # Returns the last defined season for a specific SeasonType code
  #
  def self.get_last_season_by_type( season_type_code )
    Season.joins(:season_type).where(['season_types.code = ?', season_type_code]).last
  end
  # ----------------------------------------------------------------------------
end
