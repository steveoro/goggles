class AddConstraintToTeamAffiliations < ActiveRecord::Migration
  def up
    execute <<-SQL
      ALTER TABLE team_affiliations
        ADD CONSTRAINT uk_team_affiliations_seasons_teams
        UNIQUE (season_id, team_id)
    SQL

    AppParameter.update(
      AppParameter::PARAM_VERSIONING_CODE,
      AppParameter::PARAM_APP_NAME_FIELD.to_sym => Version::FULL,
      AppParameter::PARAM_DB_VERSION_FIELD.to_sym => '1.09.01'
    )
  end
  # ---------------------------------------------------------------------------

  
  def down
    execute <<-SQL
      ALTER TABLE team_affiliations
        DROP CONSTRAINT uk_team_affiliations_seasons_teams
    SQL

    AppParameter.update(
      AppParameter::PARAM_VERSIONING_CODE,
      AppParameter::PARAM_APP_NAME_FIELD.to_sym => Version::FULL,
      AppParameter::PARAM_DB_VERSION_FIELD.to_sym => '1.09.00'
    )
  end
end
