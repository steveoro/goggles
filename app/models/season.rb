class Season < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :season_type
  validates_associated :season_type

  has_many :meetings

  validates_length_of :description, :within => 1..100, :allow_nil => false

  validates_presence_of :begin_date
#  validates_presence_of :end_date

  validates_length_of :max_points, :maximum => 9, :allow_nil => false
  validates_numericality_of :max_points


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

end
