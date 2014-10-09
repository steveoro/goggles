class CreateComputedSeasonRanking < ActiveRecord::Migration
  def change
    # == ComputedSeasonRanking
    #
    # This entity stores the *team* final ranking in a (closed) season
    # Should provide data for season history (hall of fame), palmares and so on
    # without runtime ranking computation
    # 
    # N.B. Maybe in a future should be updatated runtime for current seasons too
    #
    create_table :computed_season_ranking do |t|
      t.integer :lock_version, :default => 0
      t.timestamps

      t.integer :ranking, :limit => 4, :null => false, :default => 0
      t.decimal :total_points, :precision => 10, :scale => 2, :default => 0.0, :null => false

      # Always validated at insertion:
      t.references :team
      t.references :season
    end

    add_index :computed_season_ranking, [:season_id, :ranking], name: 'rankings_x_season'
    add_index :computed_season_ranking, [:season_id, :team_id], name: 'teams_x_season'

    # Add the foreing keys to enforce the associations:
    execute <<-SQL
      ALTER TABLE computed_season_ranking
        ADD CONSTRAINT fk_computed_season_rankings_seasons
        FOREIGN KEY (season_id)
        REFERENCES seasons(id)
    SQL
    execute <<-SQL
      ALTER TABLE computed_season_ranking
        ADD CONSTRAINT fk_computed_season_rankings_teams
        FOREIGN KEY (team_id)
        REFERENCES teams(id)
    SQL
  end
end
