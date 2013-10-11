class Tag4Entity < ActiveRecord::Base
  belongs_to :tag
  validates_associated :tag

  validates_presence_of :entity_name
  validates_presence_of :entity_id

  belongs_to :user
  validates_presence_of :user_id
  # ---------------------------------------------------------------------------


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++


  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------
  #++

end
