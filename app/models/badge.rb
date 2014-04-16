class Badge < ActiveRecord::Base
  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!
  belongs_to :season
  belongs_to :swimmer
  belongs_to :team
  belongs_to :team_affiliation
  belongs_to :category_type
  # [Steve, 20130924] entry_time_type is used as a (default) user-preference
  # for time accreditation during meeting registration. Since it can change
  # on a user/season basis, the reference is on the  badge.
  belongs_to :entry_time_type

  validates_associated :season
  validates_associated :swimmer
  validates_associated :team
  validates_associated :team_affiliation
  validates_associated :category_type
  validates_associated :entry_time_type

  has_many :meeting_individual_results
  has_many :swimmer_results
  has_many :passages
  has_many :goggle_cup_standards

  validates_presence_of   :number, length: { within: 1..40 }, allow_nil: false

  scope :sort_by_user,          ->(dir)  { order("users.name #{dir.to_s}, badges.number #{dir.to_s}") }
  scope :sort_by_season,        ->(dir)  { order("seasons.begin_date #{dir.to_s}, badges.number #{dir.to_s}") }
  scope :sort_by_team,          ->(dir)  { order("teams.name #{dir.to_s}, badges.number #{dir.to_s}") }
  scope :sort_by_swimmer,       ->(dir)  { order("swimmers.last_name #{dir.to_s}, swimmers.first_name #{dir.to_s}") }
  scope :sort_by_category_type, ->(dir)  { order("category_types.code #{dir.to_s}, badges.number #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------


  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{number} (#{swimmer ? swimmer.get_full_name : '?'})"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{number} (#{team ? team.name : '?'})"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

end
