class OberCupStandard < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :ober_cup
  belongs_to :badge
  belongs_to :event_type
  belongs_to :pool_type
  validates_associated :ober_cup
  validates_associated :badge
  validates_associated :event_type
  validates_associated :pool_type

  validates_presence_of     :minutes
  validates_length_of       :minutes, :within => 1..3, :allow_nil => false
  validates_numericality_of :minutes
  validates_presence_of     :seconds
  validates_length_of       :seconds, :within => 1..2, :allow_nil => false
  validates_numericality_of :seconds
  validates_presence_of     :hundreds
  validates_length_of       :hundreds, :within => 1..2, :allow_nil => false
  validates_numericality_of :hundreds


  scope :sort_ober_cup_standard_by_user,        lambda { |dir| order("users.name #{dir.to_s}, ober_cups.year #{dir.to_s}, pool_types.code #{dir.to_s}, event_types.code #{dir.to_s}, badges.number #{dir.to_s}") }
  scope :sort_ober_cup_standard_by_ober_cup,    lambda { |dir| order("ober_cups.year #{dir.to_s}, pool_types.code #{dir.to_s}, event_types.code #{dir.to_s}, badges.number #{dir.to_s}") }
  scope :sort_ober_cup_standard_by_badge,       lambda { |dir| order("badges.number #{dir.to_s}, ober_cups.year #{dir.to_s}, pool_types.code #{dir.to_s}, event_types.code #{dir.to_s}") }
  scope :sort_ober_cup_standard_by_event_type,  lambda { |dir| order("event_types.code #{dir.to_s}, ober_cups.year #{dir.to_s}, pool_types.code #{dir.to_s}, badges.number #{dir.to_s}") }
  scope :sort_ober_cup_standard_by_pool_type,   lambda { |dir| order("pool_types.code #{dir.to_s}, ober_cups.year #{dir.to_s}, event_types.code #{dir.to_s}, badges.number #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Returns just the formatted timing information
  def get_timing
    "#{minutes}'#{seconds}""#{hundreds}"
  end

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{ober_cup.year}, #{get_event_type} #{badges.number}: #{get_timing}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{ober_cup.year} #{get_pool_type}, #{get_event_type}: #{badges.number} => #{get_timing}"
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
