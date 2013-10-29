class CreateScoreComputationTypeRows < ActiveRecord::Migration
  def change
    create_table :score_computation_type_rows do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :code, :limit => 20, :null => false
      t.string :class_name,  :limit => 100, :null => false
      t.string :method_name, :limit => 100, :null => false
      t.decimal :default_score, :precision => 10, :scale => 2, :default => 0.0, :null => false

      t.references :score_computation_type
      t.references :score_mapping_type                # This can be null
    end

    add_index :score_computation_type_rows, :code, :unique => true

    execute <<-SQL
      ALTER TABLE score_computation_type_rows
        ADD CONSTRAINT fk_score_computation_type_rows_score_computation_types
        FOREIGN KEY (score_computation_type_id)
        REFERENCES score_computation_types(id)
    SQL
    # -------------------------------------------------------------------------
  end
end
