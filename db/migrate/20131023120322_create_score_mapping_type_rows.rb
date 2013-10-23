class CreateScoreMappingTypeRows < ActiveRecord::Migration
  def change
    create_table :score_mapping_type_rows do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :code, :limit => 6, :null => false
      t.integer :position, :limit => 6, :default => 0, :null => false
      t.decimal :score, :precision => 10, :scale => 2, :default => 0.0, :null => false

      t.references :score_mapping_type
    end

    add_index :score_mapping_type_rows, :code, :unique => true

    execute <<-SQL
      ALTER TABLE score_mapping_type_rows
        ADD CONSTRAINT fk_score_mapping_type_rows_score_mapping_types
        FOREIGN KEY (score_mapping_type_id)
        REFERENCES score_mapping_types(id)
    SQL
    # -------------------------------------------------------------------------
  end
end
