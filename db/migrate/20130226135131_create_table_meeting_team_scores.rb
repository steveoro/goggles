class CreateTableMeetingTeamScores < ActiveRecord::Migration
  def change
    # == MeetingTeamScore
    #
    # This entity stores the *team* scoring per meeting and is used
    # to prepare the final meeting result chart of all the registered teams
    # for a specific meeting.
    #
    create_table :meeting_team_scores do |t|
      t.integer :lock_version, :default => 0

      t.decimal :total_individual_points, :precision => 10, :scale => 2, :default => 0.0, :null => false
      t.decimal :total_relay_points, :precision => 10, :scale => 2, :default => 0.0, :null => false

      t.references :team                            # Since meetings are already "filtered" by season, here we link directly to teams, instead of team_affiliations
      t.references :meeting
      t.timestamps
    end

    add_index :meeting_team_scores, [:meeting_id, :team_id], :name => 'teams_x_meeting'
  end
end
