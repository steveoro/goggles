class RenameSwimmerLevelInUserTrainingStories < ActiveRecord::Migration
  def change
    change_table :user_training_stories do |t|
      t.remove_references( :swimmer_level )
      
      t.references :swimmer_level_type
    end
  end
end
