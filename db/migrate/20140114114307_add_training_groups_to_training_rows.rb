class AddTrainingGroupsToTrainingRows < ActiveRecord::Migration
  def change
    change_table :training_rows do |t|
      t.references :training_group
    end

# TODO Add a foreign key?
#    execute <<-SQL
#      ALTER TABLE training_rows
#        ADD CONSTRAINT fk_training_rows_training_groups
#        FOREIGN KEY (training_group_id)
#        REFERENCES training_groups(id)
#    SQL
  end
end
