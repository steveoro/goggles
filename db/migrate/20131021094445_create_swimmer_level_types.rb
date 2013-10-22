class CreateSwimmerLevelTypes < ActiveRecord::Migration
  def change
    create_table :swimmer_level_types do |t|

      t.timestamps
    end
  end
end
