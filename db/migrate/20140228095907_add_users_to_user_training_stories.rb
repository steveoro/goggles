class AddUsersToUserTrainingStories < ActiveRecord::Migration
  def change
    change_table :user_training_stories do |t|
      t.references :user
    end
  end
end
