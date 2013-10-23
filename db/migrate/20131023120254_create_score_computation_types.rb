class CreateScoreComputationTypes < ActiveRecord::Migration
  def change
    create_table :score_computation_types do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :code, :limit => 6, :null => false
    end

    add_index :score_computation_types, :code, :unique => true
    # -------------------------------------------------------------------------
  end
end
