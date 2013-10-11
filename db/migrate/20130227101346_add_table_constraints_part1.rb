class AddTableConstraintsPart1 < ActiveRecord::Migration
  def up
    # ----------------- SWIMMERS -----------------------------
    execute <<-SQL
      ALTER TABLE swimmers
        ADD CONSTRAINT fk_swimmers_gender_types
        FOREIGN KEY (gender_type_id)
        REFERENCES gender_types(id)
    SQL

    # ----------------- BADGES ------------------------------------------------
    execute <<-SQL
      ALTER TABLE badges
        ADD CONSTRAINT fk_badges_seasons
        FOREIGN KEY (season_id)
        REFERENCES seasons(id)
    SQL
    execute <<-SQL
      ALTER TABLE badges
        ADD CONSTRAINT fk_badges_swimmers
        FOREIGN KEY (swimmer_id)
        REFERENCES swimmers(id)
    SQL
    execute <<-SQL
      ALTER TABLE badges
        ADD CONSTRAINT fk_badges_teams
        FOREIGN KEY (team_id)
        REFERENCES teams(id)
    SQL
    execute <<-SQL
      ALTER TABLE badges
        ADD CONSTRAINT fk_badges_category_types
        FOREIGN KEY (category_type_id)
        REFERENCES category_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE badges
        ADD CONSTRAINT fk_badges_accreditation_time_types
        FOREIGN KEY (accreditation_time_type_id)
        REFERENCES accreditation_time_types(id)
    SQL

    # ----------------- MEETINGS ----------------------------------------------
    execute <<-SQL
      ALTER TABLE meetings
        ADD CONSTRAINT fk_meetings_seasons
        FOREIGN KEY (season_id)
        REFERENCES seasons(id)
    SQL

    # ----------------- MEETING SESSIONS --------------------------------------
    execute <<-SQL
      ALTER TABLE meeting_sessions
        ADD CONSTRAINT fk_meeting_sessions_meetings
        FOREIGN KEY (meeting_id)
        REFERENCES meetings(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_sessions
        ADD CONSTRAINT fk_meeting_sessions_swimming_pools
        FOREIGN KEY (swimming_pool_id)
        REFERENCES swimming_pools(id)
    SQL

    # ----------------- SWIMMER RESULTS ----------------------------------------
    execute <<-SQL
      ALTER TABLE swimmer_results
        ADD CONSTRAINT fk_swimmer_results_swimmers
        FOREIGN KEY (swimmer_id)
        REFERENCES swimmers(id)
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        ADD CONSTRAINT fk_swimmer_results_badges
        FOREIGN KEY (badge_id)
        REFERENCES badges(id)
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        ADD CONSTRAINT fk_swimmer_results_meeting_programs
        FOREIGN KEY (meeting_program_id)
        REFERENCES meeting_programs(id)
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        ADD CONSTRAINT fk_swimmer_results_season_types
        FOREIGN KEY (season_type_id)
        REFERENCES season_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        ADD CONSTRAINT fk_swimmer_results_category_types
        FOREIGN KEY (category_type_id)
        REFERENCES category_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        ADD CONSTRAINT fk_swimmer_results_result_types
        FOREIGN KEY (result_type_id)
        REFERENCES result_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        ADD CONSTRAINT fk_swimmer_results_pool_types
        FOREIGN KEY (pool_type_id)
        REFERENCES pool_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        ADD CONSTRAINT fk_swimmer_results_meeting_individual_results
        FOREIGN KEY (meeting_individual_result_id)
        REFERENCES meeting_individual_results(id)
    SQL

    # ----------------- TEAMS -------------------------------------------------
    execute <<-SQL
      ALTER TABLE teams
        ADD CONSTRAINT fk_teams_cities
        FOREIGN KEY (city_id)
        REFERENCES cities(id)
    SQL
  end
  # ---------------------------------------------------------------------------



  def down
    # ----------------- SWIMMERS -----------------------------
    execute <<-SQL
      ALTER TABLE swimmers
        DROP FOREIGN KEY fk_swimmers_gender_types
    SQL

    # ----------------- BADGES ------------------------------------------------
    execute <<-SQL
      ALTER TABLE badges
        DROP FOREIGN KEY fk_badges_accreditation_time_types
    SQL
    execute <<-SQL
      ALTER TABLE badges
        DROP FOREIGN KEY fk_badges_category_types
    SQL
    execute <<-SQL
      ALTER TABLE badges
        DROP FOREIGN KEY fk_badges_teams
    SQL
    execute <<-SQL
      ALTER TABLE badges
        DROP FOREIGN KEY fk_badges_swimmers
    SQL
    execute <<-SQL
      ALTER TABLE badges
        DROP FOREIGN KEY fk_badges_seasons
    SQL

    # ----------------- MEETINGS ----------------------------------------------
    execute <<-SQL
      ALTER TABLE meetings
        DROP FOREIGN KEY fk_meetings_seasons
    SQL

    # ----------------- MEETING SESSIONS --------------------------------------
    execute <<-SQL
      ALTER TABLE meeting_sessions
        DROP FOREIGN KEY fk_meeting_sessions_swimming_pools
    SQL
    execute <<-SQL
      ALTER TABLE meeting_sessions
        DROP FOREIGN KEY fk_meeting_sessions_meetings
    SQL

    # ----------------- SWIMMER RESULTS ----------------------------------------
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_meeting_individual_results
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_pool_types
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_result_types
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_category_types
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_season_types
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_meeting_programs
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_badges
    SQL
    execute <<-SQL
      ALTER TABLE swimmer_results
        DROP FOREIGN KEY fk_swimmer_results_swimmers
    SQL

    # ----------------- TEAMS -------------------------------------------------
    execute <<-SQL
      ALTER TABLE teams
        DROP FOREIGN KEY fk_teams_cities
    SQL
  end
  # ---------------------------------------------------------------------------
end
