class CreateNewsFeeds < ActiveRecord::Migration
  def change
    create_table :news_feeds do |t|
      t.string :title, limit: 150, null: false
      t.text :body
      t.boolean :is_read, default: false, null: false
      t.boolean :is_friend_activity, default: false, null: false
      t.boolean :is_achievement, default: false, null: false

      t.references :user, comment: 'Owner of this news feed', null: false
      t.references :friend, class_name: "User", foreign_key: "friend_id"

      t.timestamps
    end
  end
end
