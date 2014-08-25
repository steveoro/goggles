class CreateGoggleCupDefinitions < ActiveRecord::Migration
  def change
    create_table :goggle_cup_definitions do |t|
      t.integer :lock_version, :default => 0

      t.references :goggle_cup     
      t.references :season     

      t.timestamps
    end
    # -------------------------------------------------------------------------
  end
end
