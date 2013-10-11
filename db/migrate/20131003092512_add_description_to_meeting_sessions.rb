class AddDescriptionToMeetingSessions < ActiveRecord::Migration
  def change
    change_table(:meeting_sessions) do |t|
      t.string :description, :limit => 100, :null => false
    end

    change_table(:data_import_meeting_sessions) do |t|
      t.string :description, :limit => 100, :null => false
    end
  end
end
