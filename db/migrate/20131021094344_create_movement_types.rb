class CreateMovementTypes < ActiveRecord::Migration
  def change
    create_table :movement_types do |t|

      t.timestamps
    end
  end
end
