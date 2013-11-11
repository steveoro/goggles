class CreateDataImportTeamAliases < ActiveRecord::Migration
  def change
    create_table :data_import_team_aliases do |t|
      t.primary_key :id
      t.integer     :lock_version,  :default => 0
      t.timestamps

      t.string :name, :limit => 60, :null => false

      t.references :team
    end

    add_index :data_import_team_aliases, [:team_id, :name], :name => :idx_team_id_name, :unique => true
  end
end
