class CreateTableDataImportSessions < ActiveRecord::Migration
  def change
    create_table :data_import_sessions do |t|
      t.primary_key :id
      t.timestamps
      t.string :file_name
      t.text :source_data
      t.integer :phase
      t.integer :total_data_rows
      t.string :file_format
      t.text :phase_1_log
      t.text :phase_1_log
      t.text :phase_3_log

      t.references :data_import_season
      t.references :season
      # Used by the "updated_by" getter, but this one points to Admin's table:
      t.integer :user_id
    end

    add_index :data_import_sessions, ["user_id"], name: "user_id"
  end
end
