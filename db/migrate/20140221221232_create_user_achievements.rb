class CreateUserAchievements < ActiveRecord::Migration
  def change
    create_table :user_achievements do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.references :user
      t.references :achievement
    end

    add_index :user_achievements, [:user_id, :achievement_id], :unique => true   
  end
end
