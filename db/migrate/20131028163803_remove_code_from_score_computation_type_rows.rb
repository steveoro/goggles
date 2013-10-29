class RemoveCodeFromScoreComputationTypeRows < ActiveRecord::Migration
  def change
    remove_index :score_computation_type_rows, :code
    remove_column :score_computation_type_rows, :code
  end
end
