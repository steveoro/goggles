class CreateUserTrainingRows < ActiveRecord::Migration
  def change
    create_table :user_training_rows do |t|

      t.integer :lock_version, :default => 0
      t.timestamps

      t.integer :part_order,      :limit => 3, :null => false, :default => 0, :comment => "Overall order for this exercise part"
      t.integer :times,           :limit => 3, :null => false, :default => 0, :comment => "Repetition number"
      t.integer :distance,        :limit => 4, :null => false, :default => 0, :comment => "Distance of a single repetition"
      t.integer :start_and_rest,  :limit => 4, :null => false, :default => 0, :comment => "Start-rest time interval in seconds; auto-computed when left empty"
      t.integer :pause,           :limit => 4, :null => false, :default => 0, :comment => "Rest pause interval in seconds in between repetitions"
      t.integer :group_id,              :limit => 3, :null => false, :default => 0, :comment => "Distinct group identifier for a group of training rows"
      t.integer :group_times,           :limit => 3, :null => false, :default => 0, :comment => "Group Repetition number"
      t.integer :group_start_and_rest,  :limit => 4, :null => false, :default => 0, :comment => "Group Start-rest time interval in seconds; auto-computed when left empty"
      t.integer :group_pause,           :limit => 4, :null => false, :default => 0, :comment => "Group Rest pause interval in seconds in between repetitions"

      t.references :user_training
      t.references :exercise
      t.references :training_step_type
    end

    add_index :user_training_rows, [:user_training_id, :part_order], :name => :idx_user_training_rows_part_order
    add_index :user_training_rows, [:group_id, :part_order]
        
  end
end
