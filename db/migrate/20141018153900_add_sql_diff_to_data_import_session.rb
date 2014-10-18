class AddSqlDiffToDataImportSession < ActiveRecord::Migration
  def self.up
    change_table(:data_import_sessions) do |t|
      t.text    :sql_diff
      t.integer :log_verbosity, :null => false, :default => 0
    end
  end


  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
