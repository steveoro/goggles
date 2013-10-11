class CreateTablesOberCupsAndStandards < ActiveRecord::Migration
  def change
    create_table :ober_cups do |t|
      t.integer :lock_version, :default => 0
      t.string :description, :limit => 60, :null => false
      t.integer :year, :limit => 4, :null => false, :default => 2010
      t.integer :max_points, :null => false, :default => 1000, :limit => 9

      t.references :team
      t.timestamps
    end

    add_index :ober_cups, :year


    create_table :ober_cup_standards do |t|
      t.integer :lock_version, :default => 0
      t.integer :minutes, :limit => 3, :null => false, :default => 0
      t.integer :seconds, :limit => 2, :null => false, :default => 0
      t.integer :hundreds, :limit => 2, :null => false, :default => 0

      t.references :ober_cup
      t.references :badge
      t.references :event_type
      t.references :pool_type
      t.timestamps
    end
  end
end
