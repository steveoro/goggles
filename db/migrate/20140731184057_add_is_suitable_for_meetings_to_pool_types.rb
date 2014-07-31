class AddIsSuitableForMeetingsToPoolTypes < ActiveRecord::Migration
  def up
    change_table :pool_types do |t|
      t.boolean :is_suitable_for_meetings, :null => false, :default => true, :comment => 'TRUE when the pool is suitable for meetings'
    end
  end
  # --------------------------------------------------------------------------- 

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # --------------------------------------------------------------------------- 
end
