require 'date'
require 'drop_down_listable'


class Season < ActiveRecord::Base
  include DropDownListable
  include ICUser

  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!
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
    #"#{begin_date ? begin_date.strftime('%Y') : '?'}/#{end_date ? end_date.strftime('%y') : '?'} #{get_season_type}"
    "#{description} #{header_year} - #{get_federation_type}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{edition} #{description} #{header_year} - #{get_federation_type} - (#{begin_date ? begin_date.strftime('%Y') : '?'}/#{end_date ? end_date.strftime('%y') : '?'}) "
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
  # @overload inherited from DropDownListable
  #
  def self.get_label_symbol
    :get_full_name
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
    ( self.begin_date <= evaluation_date ) ? true : false
  end
  # ----------------------------------------------------------------------------


  # Returns the last defined season for a specific SeasonType code
  #
  def self.get_last_season_by_type( season_type_code )
    Season.joins(:season_type).where(['season_types.code = ?', season_type_code]).last
  end

  # Returns the last defined season for a specific SeasonType code
  #
  def get_last_season_by_type( season_type_code )
    Season.get_last_season_by_type( season_type_code )
  end
  # ----------------------------------------------------------------------------
end
