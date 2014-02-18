class RemoveConstraintsFromExerciseRows < ActiveRecord::Migration
  def up 
    execute <<-SQL
      ALTER TABLE exercise_rows
        DROP FOREIGN KEY fk_exercise_rows_arm_aux_types
    SQL
    execute <<-SQL
      ALTER TABLE exercise_rows
        DROP FOREIGN KEY fk_exercise_rows_kick_aux_types
    SQL
    execute <<-SQL
      ALTER TABLE exercise_rows
        DROP FOREIGN KEY fk_exercise_rows_body_aux_types
    SQL
    execute <<-SQL
      ALTER TABLE exercise_rows
        DROP FOREIGN KEY fk_exercise_rows_breath_aux_types
    SQL
  end

  def down  
    raise ActiveRecord::IrreversibleMigration
  end      
end
