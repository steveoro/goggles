class UserTrainingStory < ActiveRecord::Base
  belongs_to :user #?? Leega. The entity hasn't user_id attribute. Should add it to entity? Should remove this line from the class?
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
  #  validates_associated :user                       # (Do not enable this for User)

  belongs_to :user_training
  belongs_to :swimmer_level_type
  belongs_to :swimming_pool
  validates_associated :user_training
  validates_associated :swimmer_level_type
  validates_associated :swimming_pool

  validates_presence_of :swam_date

  validates_presence_of     :total_training_time
  validates_length_of       :total_training_time, :within => 1..6, :allow_nil => false
  validates_numericality_of :total_training_time

  attr_accessible :swam_date, :total_training_time,
                  :user_training_id, :swimming_pool_id, :swimmer_level_id 
  
  scope :sort_by_date,        order('swam_date')
  scope :sort_by_duration,    order('total_training_time')  
end
