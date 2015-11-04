class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :achievement_rows, [:achievement_id],      name: :idx_achievement_rows_achievement
    add_index :achievement_rows, [:achievement_type_id], name: :idx_achievement_rows_achievement_type

    add_index :articles, [:user_id], name: :idx_articles_user
    add_index :badges, [:user_id], name: :idx_badges_user
    add_index :base_movements, [:user_id], name: :idx_base_movements_user
    add_index :cities, [:user_id], name: :idx_cities_user
    add_index :comments, [:user_id], name: :idx_comments_user

    add_index :data_import_badges, [:data_import_session_id], name: :idx_di_badges_di_session
    add_index :data_import_badges, [:data_import_swimmer_id], name: :idx_di_badges_di_swimmer
    add_index :data_import_badges, [:data_import_team_id], name: :idx_di_badges_di_team
    add_index :data_import_badges, [:data_import_season_id], name: :idx_di_badges_di_season
    add_index :data_import_badges, [:swimmer_id], name: :idx_di_badges_swimmer
    add_index :data_import_badges, [:team_id], name: :idx_di_badges_team
    add_index :data_import_badges, [:season_id], name: :idx_di_badges_season
    add_index :data_import_badges, [:category_type_id], name: :idx_di_badges_category_type
    add_index :data_import_badges, [:user_id], name: :idx_di_badges_user
    add_index :data_import_badges, [:entry_time_type_id], name: :idx_di_badges_entry_time_type
    add_index :data_import_badges, [:team_affiliation_id], name: :idx_di_badges_team_affiliation

    add_index :data_import_cities, [:data_import_session_id], name: :idx_di_cities_di_session
    add_index :data_import_cities, [:user_id], name: :idx_di_cities_user

    add_index :data_import_meeting_entries, [:data_import_session_id], name: :idx_di_meeting_entries_di_session
    add_index :data_import_meeting_entries, [:data_import_meeting_program_id], name: :idx_di_meeting_entries_di_meeting_program
    add_index :data_import_meeting_entries, [:data_import_swimmer_id], name: :idx_di_meeting_entries_di_swimmer
    add_index :data_import_meeting_entries, [:data_import_team_id], name: :idx_di_meeting_entries_di_team
    add_index :data_import_meeting_entries, [:data_import_badge_id], name: :idx_di_meeting_entries_di_badge
    add_index :data_import_meeting_entries, [:meeting_program_id], name: :idx_di_meeting_entries_meeting_program
    add_index :data_import_meeting_entries, [:swimmer_id], name: :idx_di_meeting_entries_swimmer
    add_index :data_import_meeting_entries, [:team_id], name: :idx_di_meeting_entries_team
    add_index :data_import_meeting_entries, [:team_affiliation_id], name: :idx_di_meeting_entries_team_affiliation
    add_index :data_import_meeting_entries, [:badge_id], name: :idx_di_meeting_entries_badge
    add_index :data_import_meeting_entries, [:entry_time_type_id], name: :idx_di_meeting_entries_entry_time_type
    add_index :data_import_meeting_entries, [:user_id], name: :idx_di_meeting_entries_user

    add_index :data_import_meeting_individual_results, [:data_import_session_id], name: :idx_di_mir_di_session
    add_index :data_import_meeting_individual_results, [:data_import_meeting_program_id], name: :idx_di_mir_di_meeting_program
    add_index :data_import_meeting_individual_results, [:meeting_program_id], name: :idx_di_mir_meeting_program
    add_index :data_import_meeting_individual_results, [:data_import_swimmer_id], name: :idx_di_mir_di_swimmer
    add_index :data_import_meeting_individual_results, [:data_import_team_id], name: :idx_di_mir_di_team
    add_index :data_import_meeting_individual_results, [:data_import_badge_id], name: :idx_di_mir_di_badge
    add_index :data_import_meeting_individual_results, [:swimmer_id], name: :idx_di_mir_swimmer
    add_index :data_import_meeting_individual_results, [:team_id], name: :idx_di_mir_team
    add_index :data_import_meeting_individual_results, [:badge_id], name: :idx_di_mir_badge
    add_index :data_import_meeting_individual_results, [:user_id], name: :idx_di_mir_user
    add_index :data_import_meeting_individual_results, [:disqualification_code_type_id], name: :idx_di_mir_disqualification_code_type
    add_index :data_import_meeting_individual_results, [:team_affiliation_id], name: :idx_di_mir_team_affiliation

    add_index :data_import_meeting_programs, [:data_import_session_id], name: :idx_di_meeting_programs_di_session
    add_index :data_import_meeting_programs, [:data_import_meeting_session_id], name: :idx_di_meeting_programs_di_meeting_session
    add_index :data_import_meeting_programs, [:user_id], name: :idx_di_meeting_programs_user
    add_index :data_import_meeting_programs, [:heat_type_id], name: :idx_di_meeting_programs_heat_type
    add_index :data_import_meeting_programs, [:time_standard_id], name: :idx_di_meeting_programs_time_standard

    add_index :data_import_meeting_relay_results, [:data_import_session_id], name: :idx_di_mrr_di_session
    add_index :data_import_meeting_relay_results, [:data_import_team_id], name: :idx_di_mrr_di_team
    add_index :data_import_meeting_relay_results, [:team_id], name: :idx_di_mrr_team
    add_index :data_import_meeting_relay_results, [:user_id], name: :idx_di_mrr_user
    add_index :data_import_meeting_relay_results, [:data_import_meeting_program_id], name: :idx_di_mrr_di_meeting_program
    add_index :data_import_meeting_relay_results, [:meeting_program_id], name: :idx_di_mrr_meeting_program
    add_index :data_import_meeting_relay_results, [:disqualification_code_type_id], name: :idx_di_mrr_disqualification_code_type
    add_index :data_import_meeting_relay_results, [:team_affiliation_id], name: :idx_di_mrr_team_affiliation
    add_index :data_import_meeting_relay_results, [:entry_time_type_id], name: :idx_di_mrr_entry_time_type

    add_index :data_import_meeting_relay_swimmers, [:data_import_session_id], name: :idx_di_meeting_relay_swimmers_di_session
    add_index :data_import_meeting_relay_swimmers, [:data_import_swimmer_id], name: :idx_di_meeting_relay_swimmers_di_swimmer
    add_index :data_import_meeting_relay_swimmers, [:data_import_team_id], name: :idx_di_meeting_relay_swimmers_di_team
    add_index :data_import_meeting_relay_swimmers, [:data_import_badge_id], name: :idx_di_meeting_relay_swimmers_di_badge
    add_index :data_import_meeting_relay_swimmers, [:swimmer_id], name: :idx_di_meeting_relay_swimmers_swimmer
    add_index :data_import_meeting_relay_swimmers, [:badge_id], name: :idx_di_meeting_relay_swimmers_badge
    add_index :data_import_meeting_relay_swimmers, [:stroke_type_id], name: :idx_di_meeting_relay_swimmers_stroke_type
    add_index :data_import_meeting_relay_swimmers, [:meeting_relay_result_id], name: :idx_di_meeting_relay_swimmers_meeting_relay_result
    add_index :data_import_meeting_relay_swimmers, [:user_id], name: :idx_di_meeting_relay_swimmers_user
    add_index :data_import_meeting_relay_swimmers, [:data_import_meeting_relay_result_id], name: :idx_di_meeting_relay_swimmers_di_meeting_relay_result
    add_index :data_import_meeting_relay_swimmers, [:team_id], name: :idx_di_meeting_relay_swimmers_team

    add_index :data_import_meeting_sessions, [:data_import_session_id], name: :idx_di_meeting_sessions_di_session
    add_index :data_import_meeting_sessions, [:data_import_meeting_id], name: :idx_di_meeting_sessions_di_meeting
    add_index :data_import_meeting_sessions, [:meeting_id], name: :idx_di_meeting_sessions_meeting
    add_index :data_import_meeting_sessions, [:swimming_pool_id], name: :idx_di_meeting_sessions_swimming_pool
    add_index :data_import_meeting_sessions, [:user_id], name: :idx_di_meeting_sessions_user
    add_index :data_import_meeting_sessions, [:day_part_type_id], name: :idx_di_meeting_sessions_day_part_type

    add_index :data_import_meeting_team_scores, [:data_import_session_id], name: :idx_di_meeting_team_scores_di_session
    add_index :data_import_meeting_team_scores, [:data_import_team_id], name: :idx_di_meeting_team_scores_di_team
    add_index :data_import_meeting_team_scores, [:data_import_meeting_id], name: :idx_di_meeting_team_scores_di_meeting
    add_index :data_import_meeting_team_scores, [:team_id], name: :idx_di_meeting_team_scores_team
    add_index :data_import_meeting_team_scores, [:meeting_id], name: :idx_di_meeting_team_scores_meeting
    add_index :data_import_meeting_team_scores, [:user_id], name: :idx_di_meeting_team_scores_user
    add_index :data_import_meeting_team_scores, [:season_id], name: :idx_di_meeting_team_scores_season
    add_index :data_import_meeting_team_scores, [:team_affiliation_id], name: :idx_di_meeting_team_scores_team_affiliation

    add_index :data_import_meetings, [:data_import_session_id], name: :idx_di_meetings_di_session
    add_index :data_import_meetings, [:data_import_season_id], name: :idx_di_meetings_di_season
    add_index :data_import_meetings, [:season_id], name: :idx_di_meetings_season
    add_index :data_import_meetings, [:user_id], name: :idx_di_meetings_user
    add_index :data_import_meetings, [:edition_type_id], name: :idx_di_meetings_edition_type
    add_index :data_import_meetings, [:timing_type_id], name: :idx_di_meetings_timing_type

    add_index :data_import_passages, [:data_import_session_id], name: :idx_di_passages_di_session
    add_index :data_import_passages, [:data_import_meeting_program_id], name: :idx_di_passages_di_meeting_program
    add_index :data_import_passages, [:meeting_program_id], name: :idx_di_passages_meeting_program
    add_index :data_import_passages, [:passage_type_id], name: :idx_di_passages_passage_type
    add_index :data_import_passages, [:data_import_meeting_individual_result_id], name: :idx_di_passages_di_meeting_individual_result
    add_index :data_import_passages, [:data_import_meeting_entry_id], name: :idx_di_passages_di_meeting_entry
    add_index :data_import_passages, [:data_import_swimmer_id], name: :idx_di_passages_di_swimmer
    add_index :data_import_passages, [:data_import_team_id], name: :idx_di_passages_di_team
    add_index :data_import_passages, [:meeting_individual_result_id], name: :idx_di_passages_meeting_individual_result
    add_index :data_import_passages, [:meeting_entry_id], name: :idx_di_passages_meeting_entry
    add_index :data_import_passages, [:swimmer_id], name: :idx_di_passages_swimmer
    add_index :data_import_passages, [:team_id], name: :idx_di_passages_team
    add_index :data_import_passages, [:user_id], name: :idx_di_passages_user

    add_index :data_import_seasons, [:data_import_session_id], name: :idx_di_seasons_di_session
    add_index :data_import_seasons, [:season_type_id], name: :idx_di_seasons_season_type
    add_index :data_import_seasons, [:edition_type_id], name: :idx_di_seasons_edition_type
    add_index :data_import_seasons, [:timing_type_id], name: :idx_di_seasons_timing_type

    add_index :data_import_sessions, [:data_import_season_id], name: :idx_di_sessions_di_season
    add_index :data_import_sessions, [:season_id], name: :idx_di_sessions_season

    add_index :data_import_swimmer_analysis_results, [:category_type_id], name: :idx_di_swimmer_analysis_results_category_type
    add_index :data_import_swimmers, [:data_import_session_id], name: :idx_di_swimmers_di_session
    add_index :data_import_swimmers, [:gender_type_id], name: :idx_di_swimmers_gender_type
    add_index :data_import_swimmers, [:user_id], name: :idx_di_swimmers_user

    add_index :data_import_teams, [:data_import_session_id], name: :idx_di_teams_di_session
    add_index :data_import_teams, [:user_id], name: :idx_di_teams_user

    add_index :disqualification_code_types, [:stroke_type_id], name: :idx_disqualification_code_types_stroke_type
    add_index :exercises, [:user_id], name: :idx_exercises_user
    add_index :goggle_cups, [:user_id], name: :idx_goggle_cups_user

    add_index :individual_records, [:pool_type_id], name: :idx_individual_records_pool_type
    add_index :individual_records, [:event_type_id], name: :idx_individual_records_event_type
    add_index :individual_records, [:category_type_id], name: :idx_individual_records_category_type
    add_index :individual_records, [:gender_type_id], name: :idx_individual_records_gender_type
    add_index :individual_records, [:swimmer_id], name: :idx_individual_records_swimmer
    add_index :individual_records, [:team_id], name: :idx_individual_records_team
    add_index :individual_records, [:season_id], name: :idx_individual_records_season
    add_index :individual_records, [:federation_type_id], name: :idx_individual_records_federation_type
    add_index :individual_records, [:meeting_individual_result_id], name: :idx_individual_records_meeting_individual_result

    add_index :meeting_entries, [:meeting_program_id], name: :idx_meeting_entries_meeting_program
    add_index :meeting_entries, [:swimmer_id], name: :idx_meeting_entries_swimmer
    add_index :meeting_entries, [:team_id], name: :idx_meeting_entries_team
    add_index :meeting_entries, [:team_affiliation_id], name: :idx_meeting_entries_team_affiliation
    add_index :meeting_entries, [:badge_id], name: :idx_meeting_entries_badge
    add_index :meeting_entries, [:entry_time_type_id], name: :idx_meeting_entries_entry_time_type
    add_index :meeting_entries, [:user_id], name: :idx_meeting_entries_user

    add_index :meeting_events, [:user_id], name: :idx_meeting_events_user
    add_index :meeting_individual_results, [:user_id], name: :idx_mir_user
    add_index :meeting_individual_results, [:disqualification_code_type_id], name: :idx_mir_disqualification_code_type
    add_index :meeting_programs, [:user_id], name: :idx_meeting_programs_user

    add_index :meeting_relay_results, [:user_id], name: :idx_mrr_user
    add_index :meeting_relay_results, [:disqualification_code_type_id], name: :idx_mrr_disqualification_code_type
    add_index :meeting_relay_swimmers, [:user_id], name: :idx_meeting_relay_swimmers_user

    add_index :meeting_sessions, [:user_id], name: :idx_meeting_sessions_user
    add_index :meeting_team_scores, [:user_id], name: :idx_meeting_team_scores_user
    add_index :meetings, [:user_id], name: :idx_meetings_user
    add_index :news_feeds, [:user_id], name: :idx_news_feeds_user

    add_index :passages, [:user_id], name: :idx_passages_user
    add_index :passages, [:meeting_individual_result_id], name: :idx_passages_meeting_individual_result
    add_index :passages, [:meeting_entry_id], name: :idx_passages_meeting_entry
    add_index :passages, [:swimmer_id], name: :idx_passages_swimmer
    add_index :passages, [:team_id], name: :idx_passages_team

    add_index :score_computation_type_rows, [:score_mapping_type_id], name: :idx_score_computation_type_rows_score_mapping_type
    add_index :score_mapping_type_rows, [:score_mapping_type_id], name: :idx_score_mapping_type_rows_score_mapping_type
    add_index :swimmer_level_types, [:achievement_id], name: :idx_swimmer_level_types_achievement
    add_index :swimmers, [:user_id], name: :idx_swimmers_user
    add_index :swimming_pool_reviews, [:user_id], name: :idx_swimming_pool_reviews_user
    add_index :swimming_pools, [:user_id], name: :idx_swimming_pools_user

    add_index :team_affiliations, [:user_id], name: :idx_team_affiliations_user

    add_index :team_passage_templates, [:team_id], name: :idx_team_passage_templates_team
    add_index :team_passage_templates, [:event_type_id], name: :idx_team_passage_templates_event_type
    add_index :team_passage_templates, [:pool_type_id], name: :idx_team_passage_templates_pool_type
    add_index :team_passage_templates, [:passage_type_id], name: :idx_team_passage_templates_passage_type
    add_index :team_passage_templates, [:user_id], name: :idx_team_passage_templates_user

    add_index :teams, [:user_id], name: :idx_teams_user
    add_index :trainings, [:user_id], name: :idx_trainings_user
    add_index :user_results, [:user_id], name: :idx_user_results_user
    add_index :user_results, [:disqualification_code_type_id], name: :idx_user_results_disqualification_code_type

    add_index :user_training_rows, [:exercise_id], name: :idx_user_training_rows_exercise
    add_index :user_training_rows, [:training_step_type_id], name: :idx_user_training_rows_training_step_type
    add_index :user_training_rows, [:arm_aux_type_id], name: :idx_user_training_rows_arm_aux_type
    add_index :user_training_rows, [:kick_aux_type_id], name: :idx_user_training_rows_kick_aux_type
    add_index :user_training_rows, [:body_aux_type_id], name: :idx_user_training_rows_body_aux_type
    add_index :user_training_rows, [:breath_aux_type_id], name: :idx_user_training_rows_breath_aux_type

    add_index :user_training_stories, [:swimming_pool_id], name: :idx_user_training_stories_swimming_pool
    add_index :user_training_stories, [:swimmer_level_type_id], name: :idx_user_training_stories_swimmer_level_type
    add_index :user_training_stories, [:user_id], name: :idx_user_training_stories_user

    add_index :users, [:swimmer_id], name: :idx_users_swimmer
    add_index :users, [:swimmer_level_type_id], name: :idx_users_swimmer_level_type
    add_index :users, [:coach_level_type_id], name: :idx_users_coach_level_type
  end
end
