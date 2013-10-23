class AddTableContraintsPart5 < ActiveRecord::Migration
  def up
    # ----------------- TRAININGS ---------------------------------------------
    execute <<-SQL
      ALTER TABLE trainings
        ADD CONSTRAINT fk_trainings_swimmer_level_types
        FOREIGN KEY (swimmer_level_type_id)
        REFERENCES swimmer_level_types(id)
    SQL

    # ----------------- TRAINING ROWS -----------------------------------------
    execute <<-SQL
      ALTER TABLE training_rows
        ADD CONSTRAINT fk_training_rows_trainings
        FOREIGN KEY (training_id)
        REFERENCES trainings(id)
    SQL
    execute <<-SQL
      ALTER TABLE training_rows
        ADD CONSTRAINT fk_training_exercises
        FOREIGN KEY (exercise_id)
        REFERENCES exercises(id)
    SQL
    execute <<-SQL
      ALTER TABLE training_rows
        ADD CONSTRAINT fk_training_rows_training_step_types
        FOREIGN KEY (training_step_type_id)
        REFERENCES training_step_types(id)
    SQL

    # ----------------- EXERCISES ---------------------------------------------
    execute <<-SQL
      ALTER TABLE exercises
        ADD CONSTRAINT fk_exercises_training_step_types
        FOREIGN KEY (training_step_type_id)
        REFERENCES training_step_types(id)
    SQL

    # ----------------- EXERCISE ROWS -----------------------------------------
    execute <<-SQL
      ALTER TABLE exercise_rows
        ADD CONSTRAINT fk_exercise_rows_exercises
        FOREIGN KEY (exercise_id)
        REFERENCES exercises(id)
    SQL
    execute <<-SQL
      ALTER TABLE exercise_rows
        ADD CONSTRAINT fk_exercise_rows_base_movements
        FOREIGN KEY (base_movement_id)
        REFERENCES base_movements(id)
    SQL
    execute <<-SQL
      ALTER TABLE exercise_rows
        ADD CONSTRAINT fk_exercise_rows_training_mode_types
        FOREIGN KEY (training_mode_type_id)
        REFERENCES training_mode_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE exercise_rows
        ADD CONSTRAINT fk_exercise_rows_arm_aux_types
        FOREIGN KEY (arm_aux_type_id)
        REFERENCES arm_aux_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE exercise_rows
        ADD CONSTRAINT fk_exercise_rows_kick_aux_types
        FOREIGN KEY (kick_aux_type_id)
        REFERENCES kick_aux_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE exercise_rows
        ADD CONSTRAINT fk_exercise_rows_body_aux_types
        FOREIGN KEY (body_aux_type_id)
        REFERENCES body_aux_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE exercise_rows
        ADD CONSTRAINT fk_exercise_rows_breath_aux_types
        FOREIGN KEY (breath_aux_type_id)
        REFERENCES breath_aux_types(id)
    SQL

    # ----------------- BASE MOVEMENTS ----------------------------------------
    execute <<-SQL
      ALTER TABLE base_movements
        ADD CONSTRAINT fk_base_movements_movement_types
        FOREIGN KEY (movement_type_id)
        REFERENCES movement_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE base_movements
        ADD CONSTRAINT fk_base_movements_stroke_types
        FOREIGN KEY (stroke_type_id)
        REFERENCES stroke_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE base_movements
        ADD CONSTRAINT fk_base_movements_movement_scope_types
        FOREIGN KEY (movement_scope_type_id)
        REFERENCES movement_scope_types(id)
    SQL
  end
  # ---------------------------------------------------------------------------


  def down
    # ----------------- TRAININGS ---------------------------------------------
    execute <<-SQL
      ALTER TABLE trainings
        DROP FOREIGN KEY fk_trainings_swimmer_level_types
    SQL

    # ----------------- TRAINING ROWS -----------------------------------------
    execute <<-SQL
      ALTER TABLE training_rows
        DROP FOREIGN KEY fk_training_rows_trainings
    SQL
    execute <<-SQL
      ALTER TABLE training_rows
        DROP FOREIGN KEY fk_training_exercises
    SQL
    execute <<-SQL
      ALTER TABLE training_rows
        DROP FOREIGN KEY fk_training_rows_training_step_types
    SQL

    # ----------------- EXERCISES ---------------------------------------------
    execute <<-SQL
      ALTER TABLE exercises
        DROP FOREIGN KEY fk_exercises_training_step_types
    SQL

    # ----------------- EXERCISE ROWS -----------------------------------------
    execute <<-SQL
      ALTER TABLE exercise_rows
        DROP FOREIGN KEY fk_exercise_rows_exercises
    SQL
    execute <<-SQL
      ALTER TABLE exercise_rows
        DROP FOREIGN KEY fk_exercise_rows_base_movements
    SQL
    execute <<-SQL
      ALTER TABLE exercise_rows
        DROP FOREIGN KEY fk_exercise_rows_training_mode_types
    SQL
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

    # ----------------- BASE MOVEMENTS ----------------------------------------
    execute <<-SQL
      ALTER TABLE base_movements
        DROP FOREIGN KEY fk_base_movements_movement_types
    SQL
    execute <<-SQL
      ALTER TABLE base_movements
        DROP FOREIGN KEY fk_base_movements_stroke_types
    SQL
    execute <<-SQL
      ALTER TABLE base_movements
        DROP FOREIGN KEY fk_base_movements_movement_scope_types
    SQL
  end
  # ---------------------------------------------------------------------------
end
