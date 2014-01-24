class AlterTableTrainings < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE trainings
        DROP FOREIGN KEY fk_trainings_swimmer_level_types
    SQL

    change_table :trainings do |t|
      t.integer :min_swimmer_level, :limit => 3, :default => 0, :null => false
      t.integer :max_swimmer_level, :limit => 3, :default => 0, :null => false

      t.remove_references( :swimmer_level_type )
    end
  end 
  # --------------------------------------------------------------------------- 

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # --------------------------------------------------------------------------- 
end
