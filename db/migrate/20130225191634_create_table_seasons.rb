class CreateTableSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.integer :lock_version, :default => 0
      t.string :description, :limit => 100, :null => false
      t.date :begin_date, :null => false
      t.date :end_date
      t.boolean :must_use_time_standards, :null => false, :default => 0, :comment => 'Whether or not base-time score computation must be used for this season'
      t.integer :max_points, :null => false, :default => 0, :limit => 9

      t.references :season_type
      t.timestamps
    end

    add_index :seasons, :begin_date
  end
  # ---------------------------------------------------------------------------
end
