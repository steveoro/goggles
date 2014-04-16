class GoggleCup < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :team
  validates_associated :team

  has_many :goggle_cup_standards

  validates_presence_of     :description
  validates_length_of       :description, :within => 1..60, :allow_nil => false

  validates_presence_of     :year
  validates_length_of       :year, :within => 2..4, :allow_nil => false
  validates_numericality_of :year
  validates_presence_of     :max_points
  validates_length_of       :max_points, :within => 1..9, :allow_nil => false
  validates_numericality_of :max_points


  scope :sort_goggle_cup_by_user,  ->(dir) { order("users.name #{dir.to_s}, teams.name #{dir.to_s}, goggle_cups.year #{dir.to_s}") }
  scope :sort_goggle_cup_by_team,  ->(dir) { order("teams.name #{dir.to_s}, goggle_cups.year #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{description} (#{year})"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{description} (#{year}): #{team.name}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

end
