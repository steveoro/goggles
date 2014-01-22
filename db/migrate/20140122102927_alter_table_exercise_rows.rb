class AlterTableExerciseRows < ActiveRecord::Migration 
  def change
    change_table :exercise_rows do |t|
      t.references :execution_note_type
    end
  end  
end
