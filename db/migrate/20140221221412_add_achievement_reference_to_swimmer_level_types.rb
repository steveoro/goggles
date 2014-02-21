class AddAchievementReferenceToSwimmerLevelTypes < ActiveRecord::Migration
  def change
    change_table :swimmer_level_types do |t|
      t.references :achievement
    end
  end
  
  def up 
    execute <<-SQL
      ALTER TABLE swimmer_level_types
        ADD CONSTRAINT fk_swimmer_level_types_achievements
        FOREIGN KEY (arm_aux_type_id)
        REFERENCES arm_aux_types(id)
    SQL
  end

  def down  
    execute <<-SQL
      ALTER TABLE swimmer_level_types
        DROP FOREIGN KEY fk_swimmer_level_types_achievements
    SQL
  end      
end
