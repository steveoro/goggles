class AddLevelToSwimmerLevelTypes < ActiveRecord::Migration
  def change
    change_table(:swimmer_level_types) do |t|
      t.integer :level, :limit => 3, :default => 0, :null => false
    end
  end
end
