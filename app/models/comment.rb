class Comment < ActiveRecord::Base

  belongs_to :user
  # [Steve, 20120212] Validating on User fails always because of validation requirements inside User (password & salt)
#  validates_associated :user                       # (Do not enable this for User)
  belongs_to :swimming_pool_review
  belongs_to :comment

  validates_presence_of :entry_text

  scope :sort_comment_by_user, lambda { |dir| order("users.name #{dir.to_s}, articles.title #{dir.to_s}") }


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
