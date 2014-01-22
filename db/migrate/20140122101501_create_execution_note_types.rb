class CreateTableExecutionNoteTypes < ActiveRecord::Migration
  def change
    create_table :execution_note_types do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.string :code, :limit => 3, :null => false
    end

    add_index :execution_note_types, :code, :unique => true
    # -------------------------------------------------------------------------
  end
end
