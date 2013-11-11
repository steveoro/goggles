class CreateDataImportTeamAnalysisResults < ActiveRecord::Migration
  def change
    create_table :data_import_team_analysis_results do |t|
      t.primary_key :id
      t.integer     :lock_version,  :default => 0
      t.timestamps

      t.references :data_import_session
      t.text :analysis_log_text
      t.text :sql_text

      t.string  :searched_team_name, :limit => 60
      t.integer :desired_season_id
      t.integer :chosen_team_id

      t.string  :team_match_name,  :limit => 60
      t.decimal :team_match_score, :precision => 10, :scale => 4, :default => 0.0

      t.string  :best_match_name,  :limit => 60
      t.decimal :best_match_score, :precision => 10, :scale => 4, :default => 0.0
    end
  end
end
