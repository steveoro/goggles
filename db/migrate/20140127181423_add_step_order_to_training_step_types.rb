class AddStepOrderToTrainingStepTypes < ActiveRecord::Migration
  def up
    change_table :training_step_types do |t|
      t.integer :step_order, :limit => 3, :null => false, :default => 0, :comment => "Overall order for this training step type"
    end

    add_index :training_step_types, :step_order
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
  # --------------------------------------------------------------------------- 
end
