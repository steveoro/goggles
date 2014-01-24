class AlterTableExercises < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE exercises
        DROP FOREIGN KEY fk_exercises_training_step_types
    SQL

    change_table :exercises do |t|
      t.string :training_step_type_codes, :limit => 50

      t.remove_references( :training_step_type )
    end
  end 
  # --------------------------------------------------------------------------- 

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # --------------------------------------------------------------------------- 
end
