class AddLevelReferencesToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.references :swimmer_level_type
      t.references :coach_level_type
    end
  end
end
