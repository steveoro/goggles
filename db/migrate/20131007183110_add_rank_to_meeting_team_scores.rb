class AddRankToMeetingTeamScores < ActiveRecord::Migration
  def change
    change_table(:meeting_team_scores) do |t|
      t.integer :rank, :limit => 4, :null => false, :default => 0
    end

    change_table(:data_import_meeting_team_scores) do |t|
      t.integer :rank, :limit => 4, :null => false, :default => 0
    end
  end
end
