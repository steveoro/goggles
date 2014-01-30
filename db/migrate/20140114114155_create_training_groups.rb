class CreateTrainingGroups < ActiveRecord::Migration
  def change
    create_table :training_groups do |t|
      t.integer :lock_version,  :default => 0
      t.integer :part_order,      :limit => 3, :null => false, :default => 0, :comment => "Overall order for this exercise part"
      t.integer :times,           :limit => 3, :null => false, :default => 0, :comment => "Repetition number"
      t.integer :start_and_rest,  :limit => 4, :null => false, :default => 0, :comment => "Start-rest time interval in seconds; auto-computed when left empty"
      t.integer :pause,           :limit => 4, :null => false, :default => 0, :comment => "Rest pause interval in seconds in between repetitions"

      t.timestamps
    end
  end
end
