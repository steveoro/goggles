class AlterTableScoreComputationTypeRows < ActiveRecord::Migration
  def change
    change_table( :score_computation_type_rows ) do |t|
      t.integer :computation_order, :limit => 6, :default => 0, :null => false
      t.integer :position_limit, :limit => 4, :default => 0, :null => false
    end

    add_index :score_computation_type_rows, [:computation_order], name: :idx_score_computation_type_rows_computation_order
    # -------------------------------------------------------------------------
  end
end
