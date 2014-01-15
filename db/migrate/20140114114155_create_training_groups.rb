class CreateTrainingGroups < ActiveRecord::Migration
  def change
    create_table :training_groups do |t|

      t.timestamps
    end
  end
end
