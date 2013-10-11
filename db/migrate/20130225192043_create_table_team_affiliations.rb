class CreateTableTeamAffiliations < ActiveRecord::Migration
  def change
    # == TeamAffiliation
    #
    # This entity stores the *team* affiliation to a specific sporting season.
    #
    create_table :team_affiliations do |t|
      t.integer :lock_version, :default => 0
      t.string :number, :limit => 20, :null => false
      t.string :name, :limit => 100, :null => false
      t.boolean :must_compute_ober_cup, :null => false, :default => false

      t.references :team
      t.references :season

      # Used by the "updated_by" getter:
      t.references :user
      t.timestamps
    end

    add_index :team_affiliations, :number, :unique => true
    add_index :team_affiliations, :name
  end
end
