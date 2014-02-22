class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.integer :lock_version, :default => 0
      t.timestamps
      
      t.string :code, :limit => 10, :null => false
    end

    add_index :achievements, :code, :unique => true   
  end
end
