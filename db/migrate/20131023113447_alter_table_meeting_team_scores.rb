class AlterTableMeetingTeamScores < ActiveRecord::Migration
  def change
    # ----------------- MEETING TEAM SCORES -----------------------------------
    change_table(:meeting_team_scores) do |t|
      t.rename :total_individual_points,  :sum_individual_points
      t.rename :total_relay_points,       :sum_relay_points

      t.decimal :sum_team_points,            :precision => 10, :scale => 2, :default => 0.0, :null => false

      t.decimal :meeting_individual_points,  :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Computed according to specific meeting rules"
      t.decimal :meeting_relay_points,       :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Computed according to specific meeting rules"
      t.decimal :meeting_team_points,        :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Computed according to specific meeting rules"

      t.decimal :season_individual_points,   :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Computed according to season-specific rules"
      t.decimal :season_relay_points,        :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Computed according to season-specific rules"
      t.decimal :season_team_points,         :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Computed according to season-specific rules"

      t.references :season
    end

    execute <<-SQL
      ALTER TABLE meeting_team_scores
        ADD CONSTRAINT fk_meeting_team_scores_seasons
        FOREIGN KEY (season_id)
        REFERENCES seasons(id)
    SQL

    # ----------------- DATA IMPORT MEETING TEAM SCORES -----------------------
    change_table(:data_import_meeting_team_scores) do |t|
      t.rename :total_individual_points,  :sum_individual_points
      t.rename :total_relay_points,       :sum_relay_points
      t.rename :conflicting_challenge_score_id, :conflicting_id

      t.decimal :sum_team_points,            :precision => 10, :scale => 2, :default => 0.0, :null => false

      t.decimal :meeting_individual_points,  :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Computed according to specific meeting rules"
      t.decimal :meeting_relay_points,       :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Computed according to specific meeting rules"
      t.decimal :meeting_team_points,        :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Computed according to specific meeting rules"

      t.decimal :season_individual_points,   :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Computed according to season-specific rules"
      t.decimal :season_relay_points,        :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Computed according to season-specific rules"
      t.decimal :season_team_points,         :precision => 10, :scale => 2, :default => 0.0, :null => false, :comment => "Computed according to season-specific rules"

      t.references :season
    end
  end
end
