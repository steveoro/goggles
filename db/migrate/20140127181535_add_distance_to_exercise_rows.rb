class AddDistanceToExerciseRows < ActiveRecord::Migration
  def up
    change_table :exercise_rows do |t|
      t.integer :distance, :limit => 4, :null => false, :default => 0, :comment => "Distance of a single repetition (can be 0 when not used)"
    end
  end  
  # --------------------------------------------------------------------------- 

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # --------------------------------------------------------------------------- 
end
