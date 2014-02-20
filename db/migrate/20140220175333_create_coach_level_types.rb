class CreateCoachLevelTypes < ActiveRecord::Migration
  def change
    create_table :coach_level_types do |t|
      t.integer :lock_version, :default => 0
      t.timestamps
      
      t.string :code, :limit => 5, :null => false
      t.integer :level, :limit => 3, :default => 0, :null => false     
    end

    add_index :coach_level_types, :code, :unique => true
  end
end
