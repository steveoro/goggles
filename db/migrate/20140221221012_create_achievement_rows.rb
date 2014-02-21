class CreateAchievementRows < ActiveRecord::Migration
  def change
    create_table :achievement_rows do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.integer :part_order,        :limit => 3, :null => false, :default => 0, :comment => "Overall order for this achievement part"
      t.string  :achievement_value, :limit => 10
      t.boolean :is_bracket_open,   :null => false, :default => false
      t.boolean :is_or_operator,    :null => false, :default => false
      t.boolean :is_not_operator,   :null => false, :default => false
      t.boolean :is_bracket_closed, :null => false, :default => false

      t.references :achievement     
      t.references :achievement_type     
    end
  end
end
