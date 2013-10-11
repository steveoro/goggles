class CreateTableTimeStandards < ActiveRecord::Migration
  def change
    create_table :time_standards do |t|
      t.integer :lock_version, :default => 0
      t.integer :minutes, :limit => 3, :null => false, :default => 0
      t.integer :seconds, :limit => 2, :null => false, :default => 0
      t.integer :hundreds, :limit => 2, :null => false, :default => 0

      t.references :season
      t.references :gender_type
      t.references :pool_type
      t.references :event_type
      t.references :category_type
      t.timestamps
    end
  end
end
