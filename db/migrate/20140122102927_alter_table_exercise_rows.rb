class AlterTableExerciseRows < ActiveRecord::Migration 
  def up
    change_table :exercise_rows do |t|
      t.references :execution_note_type
    end

    execute <<-SQL
      ALTER TABLE exercise_rows
        ADD CONSTRAINT fk_exercise_rows_execution_note_types
        FOREIGN KEY (execution_note_type_id)
        REFERENCES execution_note_types(id)
    SQL
  end  
  # --------------------------------------------------------------------------- 

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # --------------------------------------------------------------------------- 
end
