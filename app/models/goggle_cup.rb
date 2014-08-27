# encoding: utf-8


=begin

= GoggleCup model

  - version:  4.00.444
  - author:   Leega

=end
class GoggleCup < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :team
  validates_associated :team

  has_many :goggle_cup_standards
  has_many :goggle_cup_definitions
  has_many :seasons, through: :goggle_cup_definitions

  validates_presence_of     :description
  validates_length_of       :description, within: 1..60, allow_nil: false

  validates_presence_of     :season_year
  validates_length_of       :season_year, within: 2..4, allow_nil: false
  validates_numericality_of :season_year
  validates_presence_of     :max_points
  validates_length_of       :max_points, within: 1..9, allow_nil: false
  validates_numericality_of :max_points
  validates_presence_of     :max_performance
  validates_length_of       :max_performance, within: 1..2, allow_nil: false
  validates_numericality_of :max_performance


  scope :sort_goggle_cup_by_user,  ->(dir) { order("users.name #{dir.to_s}, teams.name #{dir.to_s}, goggle_cups.season_year #{dir.to_s}") }
  scope :sort_goggle_cup_by_team,  ->(dir) { order("teams.name #{dir.to_s}, goggle_cups.season_year #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    "#{description}"
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "#{description} (#{season_year}) - #{team.name}"
  end

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

  # Get the begin date for the Goggle cup
  # The Goggle begin date is the earliest begin date of the seasons that compose the Goggle cup
  #
  def get_begin_date
    goggle_cup_definitions.sort_by_begin_date( 'ASC ').first.season.begin_date 
  end

  # Get the end date for the Goggle cup
  # The Goggle end date is the latest end date of the seasons that compose the Goggle cup
  #
  def get_end_date
    goggle_cup_definitions.sort_by_end_date( 'DESC ').first.season.end_date 
  end

  # Check if a Goggle cup is closed (terminated) at a certain date
  # The Goggle cup is closed if the season that compose the Goggle cup are all closed
  # The latest end date should be past at least by one day 
  #
  # Params
  # evaluation_date: the date for the evaluation, default today
  #
  def is_closed_at?( evaluation_date = Date.today ) 
    get_end_date < evaluation_date
  end

  # Check if a Goggle cup is the current (active) at a certain date
  # The Goggle cup is the current if the season that compose the Goggle cup are opened
  # that means that begin date is earlier that given date and
  # end date is is not past 
  #
  # Params
  # evaluation_date: the date for the evaluation, default today
  #
  def is_current_at?( evaluation_date = Date.today ) 
    get_begin_date <= evaluation_date && get_end_date >= evaluation_date  
  end
  # ----------------------------------------------------------------------------

  # Check if a given team has a goggle cup for a certain season
  #
  def self.has_team_goggle_cup_for_season?( team_id, season_id )
    GoggleCup.includes(:goggle_cup_definitions).where(['team_id = ? AND goggle_cup_definitions.season_id = ?', team_id, season_id]).count > 0
  end
  # ----------------------------------------------------------------------------
end
