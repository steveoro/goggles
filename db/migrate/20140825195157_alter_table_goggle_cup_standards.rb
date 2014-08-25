class AlterTableGoggleCupStandards < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE goggle_cup_standards
        DROP FOREIGN KEY fk_goggle_cup_standards_badges
    SQL

    change_table :goggle_cup_standards do |t|
      t.remove_references( :badge )

      t.references :swimmer
    end
  end
  # --------------------------------------------------------------------------- 

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # --------------------------------------------------------------------------- 
end
