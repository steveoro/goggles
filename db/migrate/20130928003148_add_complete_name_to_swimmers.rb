class AddCompleteNameToSwimmers < ActiveRecord::Migration
  def up
    change_table(:swimmers) do |t|
      t.string :complete_name,  :limit => 100, :null => false
    end
    add_index :swimmers, :complete_name

    change_table(:data_import_swimmers) do |t|
      t.string :complete_name,  :limit => 100, :null => false
    end
    add_index :data_import_swimmers, :complete_name
  end
  # ---------------------------------------------------------------------------


  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
  # ---------------------------------------------------------------------------
end
