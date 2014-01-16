class AddTrainingGroupsToTrainingRows < ActiveRecord::Migration
  def change
    change_table :training_rows do |t|
      t.references :training_group
    end
  end
end
