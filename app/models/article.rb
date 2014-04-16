class Article < ActiveRecord::Base
  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!

  validates_presence_of :title, length: { within: 1..80 }, allow_nil: false
  validates_presence_of :entry_text

  scope :permalinks,    -> { where(:is_sticky => true) }
  scope :sort_by_user,  ->(dir) { order("users.name #{dir.to_s}, articles.created_at #{dir.to_s}") }


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------


  # Computes a shorter description for the name associated with this data
  def get_full_name
    self.title
  end

  # Retrieves the user name associated with this article
  def user_name
    name = self.user.nil? ? '' : self.user.name
  end
  # ----------------------------------------------------------------------------
end
