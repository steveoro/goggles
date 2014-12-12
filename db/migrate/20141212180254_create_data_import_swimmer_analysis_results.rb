class CreateDataImportSwimmerAnalysisResults < ActiveRecord::Migration
  def change
    create_table :data_import_swimmer_analysis_results do |t|
      t.primary_key :id
      t.integer     :lock_version,  default: 0
      t.timestamps

      t.references :data_import_session
      t.text :analysis_log_text, limit: 16777215
      t.text :sql_text, limit: 16777215

      t.string  :searched_swimmer_name, limit: 100, comment: 'refers to swimmers.complete_name'
      t.integer :desired_season_id
      t.integer :chosen_swimmer_id

      t.string  :match_name,  limit: 60, comment: 'refers to swimmers.complete_name'
      t.decimal :match_score, precision: 10, scale: 4, default: 0.0

      t.string  :best_match_name,  limit: 60, comment: 'refers to swimmers.complete_name'
      t.decimal :best_match_score, precision: 10, scale: 4, default: 0.0
    end

    add_index :data_import_swimmer_analysis_results, [:data_import_session_id, :searched_swimmer_name, :desired_season_id], name: :idx_di_session_name_and_season, unique: true
  end
end
