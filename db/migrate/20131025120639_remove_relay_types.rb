class RemoveRelayTypes < ActiveRecord::Migration
  def up
    remove_index :relay_types, name: :index_relay_types_on_code

    execute <<-SQL
      ALTER TABLE relay_types
        DROP FOREIGN KEY fk_relay_types_stroke_types
    SQL

    drop_table :relay_types
  end


  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
