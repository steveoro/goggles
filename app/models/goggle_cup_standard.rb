require 'wrappers/timing'
require 'timing_gettable'
require 'timing_validatable'


class GoggleCupStandard < ActiveRecord::Base
  include TimingGettable
  include TimingValidatable

  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!

  belongs_to :goggle_cup
  belongs_to :swimmer
  belongs_to :event_type
  belongs_to :pool_type
  validates_associated :goggle_cup
  validates_associated :swimmer
  validates_associated :event_type
  validates_associated :pool_type
  
  has_one :team,  through: :goggle_cup

  scope :sort_by_user,        ->(dir) { order("users.name #{dir.to_s}, goggle_cups.year #{dir.to_s}, pool_types.code #{dir.to_s}, event_types.code #{dir.to_s}, swimmers.complete_name #{dir.to_s}") }
  scope :sort_by_goggle_cup,  ->(dir) { order("goggle_cups.year #{dir.to_s}, pool_types.code #{dir.to_s}, event_types.code #{dir.to_s}, swimmers.complete_name #{dir.to_s}") }
  scope :sort_by_swimmer,     ->(dir) { order("swimmers.complete_name #{dir.to_s}, goggle_cups.year #{dir.to_s}, pool_types.code #{dir.to_s}, event_types.code #{dir.to_s}") }
  scope :sort_by_event_type,  ->(dir) { order("event_types.code #{dir.to_s}, goggle_cups.year #{dir.to_s}, pool_types.code #{dir.to_s}, swimmers.complete_name #{dir.to_s}") }
  scope :sort_by_pool_type,   ->(dir) { order("pool_types.code #{dir.to_s}, goggle_cups.year #{dir.to_s}, event_types.code #{dir.to_s}, swimmers.complete_name #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------


  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{goggle_cup.year}, #{get_event_type} #{swimmers.complete_name}: #{get_timing}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{goggle_cup.year} #{get_pool_type}, #{get_event_type}: #{swimmers.complete_name} => #{get_timing}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Retrieves the localized Event Type code
  def get_event_type
    self.event_type ? self.event_type.i18n_short : '?'
  end

  # Retrieves the localized Pool Type code
  def get_pool_type
    self.pool_type ? self.pool_type.i18n_short : '?'
  end
  # ----------------------------------------------------------------------------

end
