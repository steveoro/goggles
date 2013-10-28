class CreateTableDayTypes < ActiveRecord::Migration
  def change
    create_table :day_types do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :code, :limit => 6, :null => false
      t.integer :week_order, :limit => 3, :default => 0, :null => false
    end

    add_index :day_types, :code, :unique => true
    # -------------------------------------------------------------------------
  end
end
