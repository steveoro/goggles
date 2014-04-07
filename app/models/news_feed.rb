class NewsFeed < ActiveRecord::Base
  attr_accessible :body, :is_achievement, :is_friend_activity, :is_read, :title
end
