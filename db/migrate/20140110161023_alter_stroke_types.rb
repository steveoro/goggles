class AlterStrokeTypes < ActiveRecord::Migration
  def change
    change_table( :stroke_types ) do |t|
      t.boolean :is_eventable,    :null => false, :default => false
    end

    add_index :stroke_types, [:is_eventable], :name => :idx_is_eventable
    # -------------------------------------------------------------------------
  end
end
