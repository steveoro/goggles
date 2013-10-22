class CreateBaseMovements < ActiveRecord::Migration
  def change
    create_table :base_movements do |t|

      t.timestamps
    end
  end
end
