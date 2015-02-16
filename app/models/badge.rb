=begin

= Badge model

  - version:  4.00.409
  - author:   Steve A.

=end
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

  has_one  :season_type, through: :season
  has_one  :gender_type, through: :swimmer

  has_many :meeting_individual_results
  has_many :swimmer_results
  has_many :passages
  has_many :goggle_cup_standards

  validates_presence_of   :number, length: { within: 1..40 }, allow_nil: false

  attr_accessible :number, :season_id, :swimmer_id, :team_id, :category_type_id, :user_id,
                  :entry_time_type_id, :team_affiliation_id


  delegate :name, to: :user, prefix: true

  scope :sort_by_user,          ->(dir)  { joins(:user).order("users.name #{dir.to_s}") }
  scope :sort_by_season,        ->(dir)  { joins(:season).order("seasons.begin_date #{dir.to_s}") }
  scope :sort_by_team,          ->(dir)  { joins(:team).order("teams.name #{dir.to_s}") }
  scope :sort_by_swimmer,       ->(dir)  { joins(:swimmer).order("swimmers.complete_name #{dir.to_s}") }
  scope :sort_by_category_type, ->(dir)  { joins(:category_type).order("category_types.code #{dir.to_s}") }

  scope :for_category_type,     ->(category_type) { joins(:category_type).where(['category_types.id = ?', category_type.id]) }
  scope :for_gender_type,       ->(gender_type)   { joins(:gender_type).where(['gender_types.id = ?', gender_type.id]) }
  #-- -------------------------------------------------------------------------
  #++


  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{number} (#{swimmer ? swimmer.get_full_name : '?'})"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{number} (#{team ? team.name : '?'})"
  end
  #-- -------------------------------------------------------------------------
  #++
end
