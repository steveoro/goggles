class CreateNewsFeeds < ActiveRecord::Migration
  def change
    create_table :news_feeds do |t|
      t.string :title
      t.text :body
      t.boolean :is_read
      t.boolean :is_friend_activity
      t.boolean :is_achievement

      t.references :user, :comment => 'Owner of this news feed'
      t.references :friend, :class_name => "User", :foreign_key => "friend_id"

      t.timestamps
    end
  end
end
