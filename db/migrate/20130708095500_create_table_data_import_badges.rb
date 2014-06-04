class CreateTableDataImportBadges < ActiveRecord::Migration
  def change
    create_table :data_import_badges do |t|
      t.primary_key :id
      t.integer     :lock_version,  :default => 0
      t.timestamps
                                                    # Adds the current data-import session unique identifier:
      t.references :data_import_session
                                                    # This will have a value != 0 only if a conflicting row id was found during the parsing phase
      t.integer :conflicting_id, :limit => 8, :default => 0
      t.string  :import_text, :null => false

      t.string :number, :limit => 40
                                                    # We need both temp data_import & final destination references because we can't know in advance which one will be filled yet
      t.references :data_import_swimmer
      t.references :data_import_team
      t.references :data_import_season
      t.references :swimmer
      t.references :team
      t.references :season
                                                    # These are pre-filled look-up entities that won't be changed by the data_import process (but just referenced)
      t.references :category_type
      t.references :accreditation_time_type
      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :data_import_badges, :number
  end
end
