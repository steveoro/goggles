class CreateTrainingStepTypes < ActiveRecord::Migration
  def change
    create_table :training_step_types do |t|

      t.timestamps
    end
  end
end
