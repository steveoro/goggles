class AddOutOfRaceToCategoryTypes < ActiveRecord::Migration
  def up
    change_table :category_types do |t|
      t.boolean :is_out_of_race, :null => false, :default => false, :comment => 'TRUE when the catehory is always out of race for the season'
    end
  end
  # --------------------------------------------------------------------------- 

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # --------------------------------------------------------------------------- 
end
