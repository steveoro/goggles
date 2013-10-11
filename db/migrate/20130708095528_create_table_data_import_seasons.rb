class CreateTableDataImportSeasons < ActiveRecord::Migration
  def change
    create_table :data_import_seasons do |t|
      t.primary_key :id
      t.integer     :lock_version,  :default => 0
      t.timestamps
                                                    # Adds the current data-import session unique identifier:
      t.references :data_import_session
                                                    # This will have a value != 0 only if a conflicting row id was found during the parsing phase
      t.integer :conflicting_season_id, :limit => 8, :default => 0
      t.string  :import_text, :null => false

      t.string :description, :limit => 100, :null => false
      t.date :begin_date, :null => false
      t.date :end_date
      t.boolean :must_use_time_standards, :null => false, :default => 0
      t.integer :max_points, :null => false, :default => 0, :limit => 9

      t.references :season_type
      t.timestamps
    end

    add_index :data_import_seasons, :begin_date
  end
  # ---------------------------------------------------------------------------
end
