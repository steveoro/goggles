class AddGroupFieldsToTrainingRows < ActiveRecord::Migration
  def change
    change_table :training_rows do |t|
      t.integer :group_id,              :limit => 3, :null => false, :default => 0, :comment => "Distinct group identifier for a group of training rows"
      t.integer :group_times,           :limit => 3, :null => false, :default => 0, :comment => "Group Repetition number"
      t.integer :group_start_and_rest,  :limit => 4, :null => false, :default => 0, :comment => "Group Start-rest time interval in seconds; auto-computed when left empty"
      t.integer :group_pause,           :limit => 4, :null => false, :default => 0, :comment => "Group Rest pause interval in seconds in between repetitions"

      t.remove_references( :training_group )
    end

    add_index :training_rows, [:group_id, :part_order]
  end
end
