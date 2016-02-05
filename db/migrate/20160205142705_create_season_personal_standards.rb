class CreateSeasonPersonalStandards < ActiveRecord::Migration
  def change
    create_table :season_personal_standards do |t|
      t.integer :lock_version, :default => 0
      t.integer :minutes, :limit => 3, :null => false, :default => 0
      t.integer :seconds, :limit => 2, :null => false, :default => 0
      t.integer :hundreds, :limit => 2, :null => false, :default => 0

      t.references :season
      t.references :swimmer
      t.references :event_type
      t.references :pool_type
      t.timestamps
    end
  end
end
