class AddUserIdToMeetingTeamScoresAndCities < ActiveRecord::Migration
  def change
    change_table(:meeting_team_scores) do |t|
      t.references :user
    end

    change_table(:data_import_meeting_team_scores) do |t|
      t.references :user
    end

    change_table(:cities) do |t|
      t.references :user
    end
  end
end
