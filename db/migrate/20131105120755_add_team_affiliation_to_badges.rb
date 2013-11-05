class AddTeamAffiliationToBadges < ActiveRecord::Migration
  def change
    change_table(:badges) do |t|
      t.references :team_affiliation
    end

    execute <<-SQL
      ALTER TABLE badges
        ADD CONSTRAINT fk_badges_team_affiliations
        FOREIGN KEY (team_affiliation_id)
        REFERENCES team_affiliations(id)
    SQL

    change_table(:data_import_badges) do |t|
      t.references :team_affiliation
    end
  end
end
