class CreateTableDataImportSwimmers < ActiveRecord::Migration
  def change
    create_table :data_import_swimmers do |t|
      t.primary_key :id
      t.integer     :lock_version,  :default => 0
      t.timestamps
                                                    # Adds the current data-import session unique identifier:
      t.references :data_import_session
                                                    # This will have a value != 0 only if a conflicting row id was found during the parsing phase
      t.integer :conflicting_swimmer_id,    :limit => 8, :default => 0
      t.string  :import_text, :null => false

      t.string :last_name
      t.string :first_name
      t.integer :year_of_birth, :limit => 4, :null => false, :default => 1900

      t.references :gender_type
      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :data_import_swimmers, [:last_name, :first_name], :name => :full_name
  end
end
