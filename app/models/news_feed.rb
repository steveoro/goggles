class NewsFeed < ActiveRecord::Base
  belongs_to :user                                  # [Steve, 20120212] Do not validate associated user!
  belongs_to :friend, :class_name  => "User", :foreign_key => "friend_id"

  validates_presence_of :title, length: { within: 1..150 }, allow_nil: false

  scope :unread,            -> { where(:is_read => false) }
  scope :friend_activities, -> { where(:is_friend_activity => true) }
  scope :only_achievements, -> { where(:is_achievement => true) }

  scope :sort_by_user,      ->(dir) { order("users.name #{dir.to_s}, news_feeds.created_at #{dir.to_s}") }

  attr_accessible :body, :is_achievement, :is_friend_activity, :is_read, :title


  # ----------------------------------------------------------------------------
  # Base methods:
  # ----------------------------------------------------------------------------
  #++

  # Computes a shorter description for the name associated with this data
  def get_full_name
    self.title
  end

  # Retrieves the user name associated with this article
  def user_name
    name = self.user.nil? ? '' : self.user.name
  end

  # Retrieves the user name associated with this article
  def friend_name
    name = self.friend.nil? ? '' : self.friend.name
  end
  # ----------------------------------------------------------------------------
end
