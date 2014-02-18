class AddConstraintsToTrainingRows < ActiveRecord::Migration
  def up 
    execute <<-SQL
      ALTER TABLE training_rows
        ADD CONSTRAINT fk_training_rows_arm_aux_types
        FOREIGN KEY (arm_aux_type_id)
        REFERENCES arm_aux_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE training_rows
        ADD CONSTRAINT fk_training_rows_kick_aux_types
        FOREIGN KEY (kick_aux_type_id)
        REFERENCES kick_aux_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE training_rows
        ADD CONSTRAINT fk_training_rows_body_aux_types
        FOREIGN KEY (body_aux_type_id)
        REFERENCES body_aux_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE training_rows
        ADD CONSTRAINT fk_training_rows_breath_aux_types
        FOREIGN KEY (breath_aux_type_id)
        REFERENCES breath_aux_types(id)
    SQL
  end

  def down  
    execute <<-SQL
      ALTER TABLE training_rows
        DROP FOREIGN KEY fk_training_rows_arm_aux_types
    SQL
    execute <<-SQL
      ALTER TABLE training_rows
        DROP FOREIGN KEY fk_training_rows_kick_aux_types
    SQL
    execute <<-SQL
      ALTER TABLE training_rows
        DROP FOREIGN KEY fk_training_rows_body_aux_types
    SQL
    execute <<-SQL
      ALTER TABLE training_rows
        DROP FOREIGN KEY fk_training_rows_breath_aux_types
    SQL
  end    
  
end
