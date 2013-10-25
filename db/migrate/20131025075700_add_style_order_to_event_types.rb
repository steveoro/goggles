class AddStyleOrderToEventTypes < ActiveRecord::Migration
  def change
    change_table(:event_types) do |t|
      t.integer :style_order, :limit => 2, :default => 0, :null => false
    end

    add_index :event_types, :style_order
  end
end
