class RemoveUserFromTrainingRows < ActiveRecord::Migration
  def change
    change_table :training_rows do |t|
      t.remove_references( :user )
    end
  end
end
