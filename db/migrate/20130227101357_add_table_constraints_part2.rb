class AddTableConstraintsPart2 < ActiveRecord::Migration
  def up
    # ----------------- MEETING PROGRAMS --------------------------------------
    execute <<-SQL
      ALTER TABLE meeting_programs
        ADD CONSTRAINT fk_meeting_programs_meeting_sessions
        FOREIGN KEY (meeting_session_id)
        REFERENCES meeting_sessions(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_programs
        ADD CONSTRAINT fk_meeting_programs_event_types
        FOREIGN KEY (event_type_id)
        REFERENCES event_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_programs
        ADD CONSTRAINT fk_meeting_programs_category_types
        FOREIGN KEY (category_type_id)
        REFERENCES category_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_programs
        ADD CONSTRAINT fk_meeting_programs_gender_types
        FOREIGN KEY (gender_type_id)
        REFERENCES gender_types(id)
    SQL

    # ----------------- SEASONS -----------------------------------------------
    execute <<-SQL
      ALTER TABLE seasons
        ADD CONSTRAINT fk_seasons_season_types
        FOREIGN KEY (season_type_id)
        REFERENCES season_types(id)
    SQL

    # ----------------- SWIMMING POOLS ----------------------------------------
    execute <<-SQL
      ALTER TABLE swimming_pools
        ADD CONSTRAINT fk_swimming_pools_cities
        FOREIGN KEY (city_id)
        REFERENCES cities(id)
    SQL
    execute <<-SQL
      ALTER TABLE swimming_pools
        ADD CONSTRAINT fk_swimming_pools_pool_types
        FOREIGN KEY (pool_type_id)
        REFERENCES pool_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE swimming_pools
        ADD CONSTRAINT fk_swimming_pools_shower_types
        FOREIGN KEY (shower_type_id)
        REFERENCES shower_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE swimming_pools
        ADD CONSTRAINT fk_swimming_pools_hair_dryer_types
        FOREIGN KEY (hair_dryer_type_id)
        REFERENCES hair_dryer_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE swimming_pools
        ADD CONSTRAINT fk_swimming_pools_locker_cabinet_types
        FOREIGN KEY (locker_cabinet_type_id)
        REFERENCES locker_cabinet_types(id)
    SQL

    # ----------------- TEAM AFFILIATIONS ------------------------------------------
    execute <<-SQL
      ALTER TABLE team_affiliations
        ADD CONSTRAINT fk_team_affiliations_teams
        FOREIGN KEY (team_id)
        REFERENCES teams(id)
    SQL
    execute <<-SQL
      ALTER TABLE team_affiliations
        ADD CONSTRAINT fk_team_affiliations_seasons
        FOREIGN KEY (season_id)
        REFERENCES seasons(id)
    SQL

    # ----------------- INDIVIDUAL ACCREDITATIONS -----------------------------
    execute <<-SQL
      ALTER TABLE individual_accreditations
        ADD CONSTRAINT fk_individual_accreditations_meeting_programs
        FOREIGN KEY (meeting_program_id)
        REFERENCES meeting_programs(id)
    SQL
    execute <<-SQL
      ALTER TABLE individual_accreditations
        ADD CONSTRAINT fk_individual_accreditations_badges
        FOREIGN KEY (badge_id)
        REFERENCES badges(id)
    SQL
    execute <<-SQL
      ALTER TABLE individual_accreditations
        ADD CONSTRAINT fk_individual_accreditations_accreditation_time_types
        FOREIGN KEY (accreditation_time_type_id)
        REFERENCES accreditation_time_types(id)
    SQL

    # ----------------- PASSAGES ----------------------------------------------
    execute <<-SQL
      ALTER TABLE passages
        ADD CONSTRAINT fk_passages_meeting_programs
        FOREIGN KEY (meeting_program_id)
        REFERENCES meeting_programs(id)
    SQL
    execute <<-SQL
      ALTER TABLE passages
        ADD CONSTRAINT fk_passages_badges
        FOREIGN KEY (badge_id)
        REFERENCES badges(id)
    SQL
    execute <<-SQL
      ALTER TABLE passages
        ADD CONSTRAINT fk_passages_passage_types
        FOREIGN KEY (passage_type_id)
        REFERENCES passage_types(id)
    SQL

    # ----------------- MEETING INDIVIDUAL RESULTS ----------------------------
    execute <<-SQL
      ALTER TABLE meeting_individual_results
        ADD CONSTRAINT fk_meeting_individual_results_meeting_programs
        FOREIGN KEY (meeting_program_id)
        REFERENCES meeting_programs(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_individual_results
        ADD CONSTRAINT fk_meeting_individual_results_result_types
        FOREIGN KEY (result_type_id)
        REFERENCES result_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_individual_results
        ADD CONSTRAINT fk_meeting_individual_results_swimmers
        FOREIGN KEY (swimmer_id)
        REFERENCES swimmers(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_individual_results
        ADD CONSTRAINT fk_meeting_individual_results_teams
        FOREIGN KEY (team_id)
        REFERENCES teams(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_individual_results
        ADD CONSTRAINT fk_meeting_individual_results_badges
        FOREIGN KEY (badge_id)
        REFERENCES badges(id)
    SQL

    # ----------------- TIME STANDARDS  ---------------------------------------
    execute <<-SQL
      ALTER TABLE time_standards
        ADD CONSTRAINT fk_time_standards_seasons
        FOREIGN KEY (season_id)
        REFERENCES seasons(id)
    SQL
    execute <<-SQL
      ALTER TABLE time_standards
        ADD CONSTRAINT fk_time_standards_gender_types
        FOREIGN KEY (gender_type_id)
        REFERENCES gender_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE time_standards
        ADD CONSTRAINT fk_time_standards_pool_types
        FOREIGN KEY (pool_type_id)
        REFERENCES pool_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE time_standards
        ADD CONSTRAINT fk_time_standards_event_types
        FOREIGN KEY (event_type_id)
        REFERENCES event_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE time_standards
        ADD CONSTRAINT fk_time_standards_category_types
        FOREIGN KEY (category_type_id)
        REFERENCES category_types(id)
    SQL

    # ----------------- MEETING TEAM SCORES  ----------------------------------
    execute <<-SQL
      ALTER TABLE meeting_team_scores
        ADD CONSTRAINT fk_meeting_team_scores_teams
        FOREIGN KEY (team_id)
        REFERENCES teams(id)
    SQL
    execute <<-SQL
      ALTER TABLE meeting_team_scores
        ADD CONSTRAINT fk_meeting_team_scores_meetings
        FOREIGN KEY (meeting_id)
        REFERENCES meetings(id)
    SQL

    # ----------------- OBER CUP  ---------------------------------------------
    execute <<-SQL
      ALTER TABLE ober_cups
        ADD CONSTRAINT fk_ober_cups_teams
        FOREIGN KEY (team_id)
        REFERENCES teams(id)
    SQL

    # ----------------- OBER CUP STANDARDS  -----------------------------------
    execute <<-SQL
      ALTER TABLE ober_cup_standards
        ADD CONSTRAINT fk_ober_cup_standards_ober_cups
        FOREIGN KEY (ober_cup_id)
        REFERENCES ober_cups(id)
    SQL
    execute <<-SQL
      ALTER TABLE ober_cup_standards
        ADD CONSTRAINT fk_ober_cup_standards_badges
        FOREIGN KEY (badge_id)
        REFERENCES badges(id)
    SQL
    execute <<-SQL
      ALTER TABLE ober_cup_standards
        ADD CONSTRAINT fk_ober_cup_standards_event_types
        FOREIGN KEY (event_type_id)
        REFERENCES event_types(id)
    SQL
    execute <<-SQL
      ALTER TABLE ober_cup_standards
        ADD CONSTRAINT fk_ober_cup_standards_pool_types
        FOREIGN KEY (pool_type_id)
        REFERENCES pool_types(id)
    SQL
  end
  # ---------------------------------------------------------------------------



  def down
    # ----------------- MEETING PROGRAMS --------------------------------------
    execute <<-SQL
      ALTER TABLE meeting_programs
        DROP FOREIGN KEY fk_meeting_programs_meeting_sessions
    SQL
    execute <<-SQL
      ALTER TABLE meeting_programs
        DROP FOREIGN KEY fk_meeting_programs_event_types
    SQL
    execute <<-SQL
      ALTER TABLE meeting_programs
        DROP FOREIGN KEY fk_meeting_programs_category_types
    SQL
    execute <<-SQL
      ALTER TABLE meeting_programs
        DROP FOREIGN KEY fk_meeting_programs_gender_types
    SQL

    # ----------------- SEASONS -----------------------------------------------
    execute <<-SQL
      ALTER TABLE seasons
        DROP FOREIGN KEY fk_seasons_season_types
    SQL

    # ----------------- SWIMMING POOLS ----------------------------------------

    execute <<-SQL
      ALTER TABLE swimming_pools
        DROP FOREIGN KEY fk_swimming_pools_locker_cabinet_types
    SQL
    execute <<-SQL
      ALTER TABLE swimming_pools
        DROP FOREIGN KEY fk_swimming_pools_hair_dryer_types
    SQL
    execute <<-SQL
      ALTER TABLE swimming_pools
        DROP FOREIGN KEY fk_swimming_pools_shower_types
    SQL
    execute <<-SQL
      ALTER TABLE swimming_pools
        DROP FOREIGN KEY fk_swimming_pools_pool_types
    SQL
    execute <<-SQL
      ALTER TABLE swimming_pools
        DROP FOREIGN KEY fk_swimming_pools_cities
    SQL

    # ----------------- AFFILIATIONS ------------------------------------------
    execute <<-SQL
      ALTER TABLE team_affiliations
        DROP FOREIGN KEY fk_team_affiliations_teams
    SQL
    execute <<-SQL
      ALTER TABLE team_affiliations
        DROP FOREIGN KEY fk_team_affiliations_seasons
    SQL

    # ----------------- INDIVIDUAL ACCREDITATIONS -----------------------------
    execute <<-SQL
      ALTER TABLE individual_accreditations
        DROP FOREIGN KEY fk_individual_accreditations_meeting_programs
    SQL
    execute <<-SQL
      ALTER TABLE individual_accreditations
        DROP FOREIGN KEY fk_individual_accreditations_badges
    SQL
    execute <<-SQL
      ALTER TABLE individual_accreditations
        DROP FOREIGN KEY fk_individual_accreditations_accreditation_time_types
    SQL

    # ----------------- PASSAGES ----------------------------------------------
    execute <<-SQL
      ALTER TABLE passages
        DROP FOREIGN KEY fk_passages_meeting_programs
    SQL
    execute <<-SQL
      ALTER TABLE passages
        DROP FOREIGN KEY fk_passages_badges
    SQL
    execute <<-SQL
      ALTER TABLE passages
        DROP FOREIGN KEY fk_passages_passage_types
    SQL

    # ----------------- MEETING INDIVIDUAL RESULTS ----------------------------
    execute <<-SQL
      ALTER TABLE meeting_individual_results
        DROP FOREIGN KEY fk_individual_accreditations_meeting_programs
    SQL
    execute <<-SQL
      ALTER TABLE meeting_individual_results
        DROP FOREIGN KEY fk_meeting_individual_results_result_types
    SQL
    execute <<-SQL
      ALTER TABLE meeting_individual_results
        DROP FOREIGN KEY fk_meeting_individual_results_swimmers
    SQL
    execute <<-SQL
      ALTER TABLE meeting_individual_results
        DROP FOREIGN KEY fk_meeting_individual_results_teams
    SQL
    execute <<-SQL
      ALTER TABLE meeting_individual_results
        DROP FOREIGN KEY fk_meeting_individual_results_badges
    SQL

    # ----------------- TIME STANDARDS  ---------------------------------------
    execute <<-SQL
      ALTER TABLE time_standards
        DROP FOREIGN KEY fk_time_standards_seasons
    SQL
    execute <<-SQL
      ALTER TABLE time_standards
        DROP FOREIGN KEY fk_time_standards_gender_types
    SQL
    execute <<-SQL
      ALTER TABLE time_standards
        DROP FOREIGN KEY fk_time_standards_pool_types
    SQL
    execute <<-SQL
      ALTER TABLE time_standards
        DROP FOREIGN KEY fk_time_standards_event_types
    SQL
    execute <<-SQL
      ALTER TABLE time_standards
        DROP FOREIGN KEY fk_time_standards_category_types
    SQL

    # ----------------- MEETING TEAM SCORES  ----------------------------------
    execute <<-SQL
      ALTER TABLE meeting_team_scores
        DROP FOREIGN KEY fk_meeting_team_scores_teams
    SQL
    execute <<-SQL
      ALTER TABLE meeting_team_scores
        DROP FOREIGN KEY fk_meeting_team_scores_meetings
    SQL

    # ----------------- OBER CUP  ---------------------------------------------
    execute <<-SQL
      ALTER TABLE ober_cups
        DROP FOREIGN KEY fk_ober_cups_teams
    SQL

    # ----------------- OBER CUP STANDARDS  -----------------------------------
    execute <<-SQL
      ALTER TABLE ober_cup_standards
        DROP FOREIGN KEY fk_ober_cup_standards_ober_cups
    SQL
    execute <<-SQL
      ALTER TABLE ober_cup_standards
        DROP FOREIGN KEY fk_ober_cup_standards_badges
    SQL
    execute <<-SQL
      ALTER TABLE ober_cup_standards
        DROP FOREIGN KEY fk_ober_cup_standards_event_types
    SQL
    execute <<-SQL
      ALTER TABLE ober_cup_standards
        DROP FOREIGN KEY fk_ober_cup_standards_pool_types
    SQL
  end
  # ---------------------------------------------------------------------------
end
