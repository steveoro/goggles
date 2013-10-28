class AddTeamAffiliationToMeetingTeamScores < ActiveRecord::Migration
  def change
    change_table(:meeting_team_scores) do |t|
      t.references :team_affiliation
    end

    execute <<-SQL
      ALTER TABLE meeting_team_scores
        ADD CONSTRAINT fk_meeting_team_scores_team_affiliations
        FOREIGN KEY (team_affiliation_id)
        REFERENCES team_affiliations(id)
    SQL

    change_table(:data_import_meeting_team_scores) do |t|
      t.references :team_affiliation
    end
  end
end
