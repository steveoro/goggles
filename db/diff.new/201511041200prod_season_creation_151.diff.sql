--
-- Duplicating season 141-Circuito regionale Emilia master CSI 2014/2015 into 151-Circuito regionale Emilia master CSI 2015/2016
--
-- Season
INSERT INTO `seasons` (`id`, `description`, `begin_date`, `end_date`, `season_type_id`, `created_at`, `updated_at`, `header_year`, `edition`, `edition_type_id`, `timing_type_id`, `rules`, `has_individual_rank`)
  VALUES (151, 'Circuito regionale Emilia master CSI 2015/2016', '2015-10-01', '2016-09-30', 2, '2015-11-04 11:00:45', '2015-11-04 11:00:45', '2015/2016', 16, 5, 2, NULL, 1);


-- Categories
INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (896, 'M20', '2', 'MASTER 20', 'M20', 'MASTER', 20, 24, 0, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 151, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (897, 'M25', '3', 'MASTER 25', 'M25', 'MASTER', 25, 29, 0, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 151, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (898, 'M30', '4', 'MASTER 30', 'M30', 'MASTER', 30, 34, 0, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 151, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (899, 'M35', '5', 'MASTER 35', 'M35', 'MASTER', 35, 39, 0, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 151, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (900, 'M40', '6', 'MASTER 40', 'M40', 'MASTER', 40, 44, 0, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 151, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (901, 'M45', '7', 'MASTER 45', 'M45', 'MASTER', 45, 49, 0, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 151, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (902, 'M50', '8', 'MASTER 50', 'M50', 'MASTER', 50, 54, 0, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 151, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (903, 'OVER', '9', 'OVER 55', 'M55', 'MASTER', 55, 999, 0, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 151, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (904, 'SEN', '1', 'SENIORES', 'SEN', 'MASTER', 1, 19, 0, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 151, 1);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (905, '001-119', 'x1', 'STAFF. M FINO A 119', '<120', 'MASTER', 1, 119, 1, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 151, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (906, '120-159', 'x2', 'STAFF. M 120-159', '120-159', 'MASTER', 120, 159, 1, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 151, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (907, '160-999', 'x3', 'STAFF. M oltre 160', '>159', 'MASTER', 160, 999, 1, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 151, 0);


-- Meetings
-- 14101-csiprova1 1A PROVA REGIONALE CSI 2014-11-30
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15101, '1A PROVA REGIONALE CSI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '0', 0, 151, 2, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 1, '2015-11-29', 'csiprova1', '2015/2016', 0, 0, 5, 2, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (949, 1, '2015-11-29', '2000-01-01 14:15:00', '2000-01-01 15:00:00', '0', 15101, 3, 2, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3862, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 1, '2000-01-01 15:00:00', 0, 1, NULL, 949, 5, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3863, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 2, '2000-01-01 00:00:00', 0, 1, NULL, 949, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3864, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 3, '2000-01-01 00:00:00', 0, 1, NULL, 949, 22, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3865, '2015-11-04 11:00:45', '2015-11-04 11:00:45', 4, '2000-01-01 00:00:00', 0, 1, NULL, 949, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3866, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 5, '2000-01-01 00:00:00', 0, 1, NULL, 949, 26, 3, 2, 1, 0);


-- 14102-csiprova2 2A PROVA REGIONALE CSI 2015-02-01
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15102, '2A PROVA REGIONALE CSI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '0', 0, 151, 2, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 1, '2016-01-31', 'csiprova2', '2015/2016', 0, 0, 5, 2, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (950, 1, '2016-01-31', '2000-01-01 14:00:00', '2000-01-01 14:50:00', '0', 15102, 20, 2, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3867, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 2, '2000-01-01 00:00:00', 0, 1, NULL, 950, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3868, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 3, '2000-01-01 00:00:00', 0, 1, NULL, 950, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3869, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 4, '2000-01-01 00:00:00', 0, 1, NULL, 950, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3870, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 1, '2000-01-01 00:00:00', 0, 1, NULL, 950, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3871, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 5, '2000-01-01 00:00:00', 0, 1, NULL, 950, 30, 3, 2, 1, 0);


-- 14103-csiprova3 3A PROVA REGIONALE CSI 2015-02-22
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15103, '3A PROVA REGIONALE CSI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '0', 0, 151, 2, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 1, '2016-02-21', 'csiprova3', '2015/2016', 0, 0, 5, 2, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (951, 1, '2016-02-21', '2000-01-01 14:15:00', '2000-01-01 15:00:00', '0', 15103, 8, 2, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3872, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 1, '2000-01-01 00:00:00', 0, 1, NULL, 951, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3873, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 2, '2000-01-01 00:00:00', 0, 1, NULL, 951, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3874, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 3, '2000-01-01 00:00:00', 0, 1, NULL, 951, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3875, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 4, '2000-01-01 00:00:00', 0, 1, NULL, 951, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3876, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 5, '2000-01-01 00:00:00', 0, 1, NULL, 951, 33, 3, 2, 1, 0);


-- 14104-csiprova4 4A PROVA REGIONALE CSI 2015-03-29
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15104, '4A PROVA REGIONALE CSI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '0', 0, 151, 2, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 1, '2016-03-27', 'csiprova4', '2015/2016', 0, 0, 5, 2, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (952, 1, '2016-03-27', '2000-01-01 14:15:00', '2000-01-01 14:50:00', '0', 15104, 6, 2, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3877, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 1, '2000-01-01 00:00:00', 0, 1, NULL, 952, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3878, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 2, '2000-01-01 00:00:00', 0, 1, NULL, 952, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3879, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 3, '2000-01-01 00:00:00', 0, 1, NULL, 952, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3880, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 4, '2000-01-01 00:00:00', 0, 1, NULL, 952, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3881, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 5, '2000-01-01 00:00:00', 0, 1, NULL, 952, 32, 3, 2, 1, 0);


-- 14105-csiprova5 5A PROVA REGIONALE CSI 2015-04-19
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15105, '5A PROVA REGIONALE CSI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '0', 0, 151, 2, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 1, '2016-04-17', 'csiprova5', '2015/2016', 0, 0, 5, 2, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (953, 1, '2016-04-17', '2000-01-01 14:00:00', '2000-01-01 14:40:00', '0', 15105, 2, 2, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3882, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 1, '2000-01-01 00:00:00', 0, 1, NULL, 953, 5, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3883, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 2, '2000-01-01 00:00:00', 0, 1, NULL, 953, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3884, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 3, '2000-01-01 00:00:00', 0, 1, NULL, 953, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3885, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 4, '2000-01-01 00:00:00', 0, 1, NULL, 953, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3886, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 5, '2000-01-01 00:00:00', 0, 1, NULL, 953, 25, 3, 2, 1, 0);


-- 14106-csiprova6 6A PROVA REGIONALE CSI 2015-05-24
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15106, '6A PROVA REGIONALE CSI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '0', 0, 151, 2, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 1, '2016-05-22', 'csiprova6', '2015/2016', 0, 0, 5, 2, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (954, 1, '2016-05-22', '2000-01-01 10:00:00', '2000-01-01 10:30:00', '0', 15106, 32, 2, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3887, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 1, '2000-01-01 00:00:00', 0, 1, NULL, 954, 6, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (955, 2, '2016-05-22', '2000-01-01 14:30:00', '2000-01-01 15:00:00', '', 15106, 32, 2, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3888, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 2, '2000-01-01 00:00:00', 0, 1, NULL, 955, 22, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3889, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 3, '2000-01-01 00:00:00', 0, 1, NULL, 955, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3890, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 4, '2000-01-01 00:00:00', 0, 1, NULL, 955, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3891, '2015-11-04 11:00:46', '2015-11-04 11:00:46', 5, '2000-01-01 00:00:00', 1, 1, NULL, 955, 2, 3, 2, 1, 0);



-- 151-Circuito regionale Emilia master CSI 2015/2016 duplication script ended
