class AlterDataImportMeetingRelaySwimmers < ActiveRecord::Migration
  def change
    change_table :data_import_meeting_relay_swimmers do |t|
      t.references :data_import_meeting_relay_result
      t.references :team
    end
  end
end
