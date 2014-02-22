class CreateAchievementTypes < ActiveRecord::Migration
  def change
    create_table :achievement_types do |t|
      t.integer :lock_version, :default => 0
      t.timestamps
      
      t.string :code, :limit => 5, :null => false
    end

    add_index :achievement_types, :code, :unique => true
  end
end
