
class GoggleCupDefinition < ActiveRecord::Base

  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!

  belongs_to :goggle_cup
  belongs_to :season
  validates_associated :goggle_cup
  validates_associated :season
  
  has_one :team,  through: :goggle_cup

  scope :sort_by_goggle_cup,  ->(dir) { order("goggle_cups.season_year #{dir.to_s}, team.name #{dir.to_s}, seasons.description #{dir.to_s}") }
  scope :sort_by_season,      ->(dir) { order("seasons.description #{dir.to_s}, goggle_cups.season_year #{dir.to_s}, team.name #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------

  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------

end
