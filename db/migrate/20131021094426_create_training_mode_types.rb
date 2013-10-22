class CreateTrainingModeTypes < ActiveRecord::Migration
  def change
    create_table :training_mode_types do |t|

      t.timestamps
    end
  end
end
