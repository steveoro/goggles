class AlterTablePassages < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE passages
        DROP FOREIGN KEY fk_passages_badges
    SQL

    change_table :passages do |t|
      t.remove_references( :badge )

      t.decimal :reaction_time, :precision => 5, :scale => 2, :null => true, :comment => 'Reaction time, used only for the first passage'

      t.integer :stroke_cycles, :limit => 3, :null => true, :comment => 'Stroke cycles swam for the passage'
      t.integer :not_swam_part_seconds, :limit => 2, :null => true, :comment => 'Under water time swam from turn/start: seconds'
      t.integer :not_swam_part_hundreds, :limit => 2, :null => true, :comment => 'Under water time swam from turn/start: hundreds'
      t.integer :not_swam_kick_number, :limit => 2, :null => true, :comment => 'Under water kick numebr from turn/start'
      t.integer :breath_number, :limit => 3, :null => true, :comment => 'Breath done for the passage'
      t.integer :position, :limit => 3, :null => true, :comment => 'Position held at the end of the passage'

      t.integer :minutes_from_start, :limit => 3, :null => true, :comment => 'Minutes from the start'
      t.integer :seconds_from_start, :limit => 2, :null => true, :comment => 'Seconds from the start'
      t.integer :hundreds_from_start, :limit => 2, :null => true, :comment => 'Hundreds from the start'
      t.boolean :is_native_from_start, :null => false, :default => false, :comment => 'TRUE when the passage was kept from the start, FALSE whene the passage has kept from the last turn'

      t.references :meeting_indivudual_result
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
