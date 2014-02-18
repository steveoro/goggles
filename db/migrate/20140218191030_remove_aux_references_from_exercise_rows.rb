class RemoveAuxReferencesFromExerciseRows < ActiveRecord::Migration
  def change
    change_table :exercise_rows do |t|
      t.remove_references( :arm_aux_type )
      t.remove_references( :kick_aux_type )
      t.remove_references( :body_aux_type )
      t.remove_references( :breath_aux_type )
    end
  end
end
