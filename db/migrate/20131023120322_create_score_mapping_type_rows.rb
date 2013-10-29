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
    # -------------------------------------------------------------------------
  end
end
