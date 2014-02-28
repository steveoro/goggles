class AlterTablePassages < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE passages
        DROP FOREIGN KEY fk_passages_meeting_programs
    SQL

    execute <<-SQL
      ALTER TABLE passages
        DROP FOREIGN KEY fk_passages_badges
    SQL
  end 

  def change    
    change_table :passages do |t|
      t.remove_references( :meeting_program )
      t.remove_references( :badge )

      t.decimal :reaction_time, :precision => 5, :scale => 2, :null => true

      t.integer :stroke_cycles, :limit => 3, :null => true
      t.integer :not_swam_part_seconds, :limit => 2, :null => true
      t.integer :not_swam_part_hundreds, :limit => 2, :null => true
      t.integer :not_swam_kick_number, :limit => 2, :null => true
      t.integer :breath_number, :limit => 3, :null => true
      t.integer :position, :limit => 3, :null => true

      t.references :meeting_entry
      t.references :swimmer
      t.references :team
    end
  end
  # --------------------------------------------------------------------------- 

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # --------------------------------------------------------------------------- 
end
