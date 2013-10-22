class CreateMovementScopeTypes < ActiveRecord::Migration
  def change
    create_table :movement_scope_types do |t|

      t.timestamps
    end
  end
end
