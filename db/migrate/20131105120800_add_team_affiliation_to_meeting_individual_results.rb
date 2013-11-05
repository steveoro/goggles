class AddTeamAffiliationToMeetingIndividualResults < ActiveRecord::Migration
  def change
    change_table(:meeting_individual_results) do |t|
      t.references :team_affiliation
    end

    execute <<-SQL
      ALTER TABLE meeting_individual_results
        ADD CONSTRAINT fk_meeting_individual_results_team_affiliations
        FOREIGN KEY (team_affiliation_id)
        REFERENCES team_affiliations(id)
    SQL

    change_table(:data_import_meeting_individual_results) do |t|
      t.references :team_affiliation
    end
  end
end
