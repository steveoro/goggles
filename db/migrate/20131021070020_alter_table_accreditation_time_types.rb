class AlterTableAccreditationTimeTypes < ActiveRecord::Migration
  def change
    execute <<-SQL
      ALTER TABLE badges
        DROP FOREIGN KEY fk_badges_accreditation_time_types
    SQL
    remove_index :accreditation_time_types, :code

    rename_table :accreditation_time_types, :entry_time_types
    add_index :entry_time_types, [:code], :name => :idx_entry_time_types_code, :unique => true

    change_table(:badges) do |t|
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
