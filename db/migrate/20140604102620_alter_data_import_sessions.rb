class AlterDataImportSessions < ActiveRecord::Migration
  def change
    # MEDIUMTEXT / MEDIUMBLOB handles up to 16MB of data
    change_column :data_import_sessions, :source_data, :text, limit: 16777215
    change_column :data_import_sessions, :phase_1_log, :text, limit: 16777215
    change_column :data_import_sessions, :phase_1_log, :text, limit: 16777215
    change_column :data_import_sessions, :phase_3_log, :text, limit: 16777215
  end
end
