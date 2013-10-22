class CreateTrainingRows < ActiveRecord::Migration
  def change
    create_table :training_rows do |t|

      t.timestamps
    end
  end
end
