class SwimmingPoolReview < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)

  belongs_to :swimming_pool
  validates_associated :swimming_pool

  validates_presence_of :title
  validates_length_of   :title, :within => 1..100, :allow_nil => false

  validates_presence_of :entry_text

  scope :sort_swimming_pool_by_user,          lambda { |dir| order("users.name #{dir.to_s}, swimming_pools.name #{dir.to_s}") }
  scope :sort_swimming_pool_by_swimming_pool, lambda { |dir| order("swimming_pools.name #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    title
  end

  # Computes a verbose or formal description for the name associated with this data
  def get_verbose_name
    "[#{user_name}] #{title}"
  end


  # Retrieves the user name associated with this instance
  def user_name
    self.user ? self.user.name : ''
  end
  # ----------------------------------------------------------------------------
  #++

end
