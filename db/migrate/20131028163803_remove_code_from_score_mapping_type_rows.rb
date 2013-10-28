class RemoveCodeFromScoreMappingTypeRows < ActiveRecord::Migration
  def change
    execute <<-SQL
      ALTER TABLE score_mapping_type_rows
        DROP FOREIGN KEY fk_score_mapping_type_rows_score_mapping_types
    SQL

    remove_index :score_mapping_type_rows, :code
    remove_column :score_mapping_type_rows, :code
    add_index :score_mapping_type_rows, [:position], :name => :idx_score_mapping_type_rows_position
  end
end
