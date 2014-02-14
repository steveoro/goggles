class CreateUserTrainingStories < ActiveRecord::Migration
  def change
    create_table :user_training_stories do |t|

      t.integer :lock_version, :default => 0
      t.timestamps

      t.date :swam_date,                :comment => "Day when the training has been swam"
      t.integer :total_training_time,   :limit => 3, :null => false, :default => 0, :comment => "Total time spent to complete the training"
      t.text :notes
      
      t.references :user_training
      t.references :swimming_pool
      t.references :swimmer_level
    end

    add_index :user_training_stories, [:user_training_id, :swam_date]
        
  end
end
