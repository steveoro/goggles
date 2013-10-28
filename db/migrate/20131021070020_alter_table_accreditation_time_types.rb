class AlterTableAccreditationTimeTypes < ActiveRecord::Migration
  def change
    # ----------------- BADGES ------------------------------------------------
    execute <<-SQL
      ALTER TABLE badges
        DROP FOREIGN KEY fk_badges_accreditation_time_types
    SQL
    remove_index :accreditation_time_types, :code

    change_table(:badges) do |t|
      t.remove_references( :accreditation_time_type )
    end

    change_table(:data_import_badges) do |t|
      t.remove_references( :accreditation_time_type )
    end

    rename_table :accreditation_time_types, :entry_time_types
    add_index :entry_time_types, [:code], :name => :idx_entry_time_types_code, :unique => true

    change_table(:badges) do |t|
      t.references :entry_time_type
    end

    change_table(:data_import_badges) do |t|
      t.references :entry_time_type
    end

    execute <<-SQL
      ALTER TABLE badges
        ADD CONSTRAINT fk_badges_entry_time_types
        FOREIGN KEY (entry_time_type_id)
        REFERENCES entry_time_types(id)
    SQL
  end
end
