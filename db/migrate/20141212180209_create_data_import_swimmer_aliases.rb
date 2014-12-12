class CreateDataImportSwimmerAliases < ActiveRecord::Migration
  def change
    create_table :data_import_swimmer_aliases do |t|
      t.primary_key :id
      t.integer     :lock_version,  default: 0
      t.timestamps

      t.string :complete_name, limit: 100, null: false

      t.references :swimmer
    end

    add_index :data_import_swimmer_aliases, [:swimmer_id, :complete_name], name: :idx_swimmer_id_complete_name, unique: true
  end
end
