class DeleteTableTrainingGroups < ActiveRecord::Migration
  def up
    drop_table :training_groups
  end
  # --------------------------------------------------------------------------- 

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # --------------------------------------------------------------------------- 
end
