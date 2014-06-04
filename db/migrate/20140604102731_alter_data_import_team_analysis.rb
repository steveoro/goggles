class AlterDataImportTeamAnalysis < ActiveRecord::Migration
  def change
    # MEDIUMTEXT / MEDIUMBLOB handles up to 16MB of data
    change_column :data_import_team_analysis_results, :analysis_log_text, :text, limit: 16777215
  end
end
