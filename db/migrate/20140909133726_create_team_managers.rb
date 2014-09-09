class CreateTeamManagers < ActiveRecord::Migration
  def change
    create_table :team_managers do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.references :team_affiliation
      t.references :user
    end

    add_index :team_managers, [:team_affiliation_id, :user_id], name: 'team_manager_with_affiliation', :unique => true
    add_index :team_managers, :team_affiliation_id
    add_index :team_managers, :user_id

    # Add the foreing keys to enforce the associations:
    execute <<-SQL
      ALTER TABLE team_managers
        ADD CONSTRAINT fk_team_managers_users
        FOREIGN KEY (user_id)
        REFERENCES users(id)
    SQL
    execute <<-SQL
      ALTER TABLE team_managers
        ADD CONSTRAINT fk_team_managers_team_affiliations
        FOREIGN KEY (team_affiliation_id)
        REFERENCES team_affiliations(id)
    SQL
  end
end
