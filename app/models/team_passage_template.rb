class TeamPassageTemplate < ActiveRecord::Base
  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
  # validates_associated :user                       # (Do not enable this for User)

  belongs_to :team
  belongs_to :event_type
  belongs_to :pool_type
  belongs_to :passage_type
  
  validates_associated :team
  validates_associated :event_type
  validates_associated :pool_type
  validates_associated :passage_type

  has_one  :stroke_type,    through: :event_type
end
