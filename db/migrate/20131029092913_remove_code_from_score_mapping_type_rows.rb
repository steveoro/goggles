class RemoveCodeFromScoreMappingTypeRows < ActiveRecord::Migration
  def change
    remove_index :score_mapping_type_rows, :code
    remove_column :score_mapping_type_rows, :code
  end
end
