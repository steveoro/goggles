--
-- Duplicating season 142-Circuito italiano supermaster FIN 2014/2015 into 152-Circuito italiano supermaster FIN 2015/2016
--
-- Season
INSERT INTO `seasons` (`id`, `description`, `begin_date`, `end_date`, `season_type_id`, `created_at`, `updated_at`, `header_year`, `edition`, `edition_type_id`, `timing_type_id`, `rules`, `has_individual_rank`)
  VALUES (152, 'Circuito italiano supermaster FIN 2015/2016', '2015-10-01', '2016-09-30', 1, '2015-11-04 11:05:44', '2015-11-04 11:05:44', '2015/2016', 15, 5, 3, NULL, 1);


-- Categories
INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (908, 'M25', 'B', 'MASTER 25', 'M25', 'MASTER', 25, 29, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (909, 'M30', 'C', 'MASTER 30', 'M30', 'MASTER', 30, 34, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (910, 'M35', 'D', 'MASTER 35', 'M35', 'MASTER', 35, 39, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (911, 'M40', 'E', 'MASTER 40', 'M40', 'MASTER', 40, 44, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (912, 'M45', 'F', 'MASTER 45', 'M45', 'MASTER', 45, 49, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (913, 'M50', 'G', 'MASTER 50', 'M50', 'MASTER', 50, 54, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (914, 'M55', 'H', 'MASTER 55', 'M55', 'MASTER', 55, 59, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (915, 'M60', 'I', 'MASTER 60', 'M60', 'MASTER', 60, 64, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (916, 'M65', 'J', 'MASTER 65', 'M65', 'MASTER', 65, 69, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (917, 'M70', 'K', 'MASTER 70', 'M70', 'MASTER', 70, 74, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (918, 'M75', 'L', 'MASTER 75', 'M75', 'MASTER', 75, 79, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (919, 'M80', 'M', 'MASTER 80', 'M80', 'MASTER', 80, 84, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (920, 'M85', 'N', 'MASTER 85', 'M85', 'MASTER', 85, 89, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (921, 'M90', 'O', 'MASTER 90', 'M90', 'MASTER', 90, 94, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (922, 'M95', 'P', 'MASTER 95', 'M95', 'MASTER', 95, 99, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (923, 'MA0', 'Q', 'MASTER 100', 'MA0', 'MASTER', 100, 999, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (924, 'U25', 'A', 'UNDER 25', 'U25', 'MASTER', 20, 24, 0, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (925, '000-999', 'xX', 'STAFF. ASSOLUTI', 'ASSOLUTI', 'MASTER', 1, 999, 1, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (926, '100-119', 'xA', 'STAFF. M FINO A 119', '100-119', 'MASTER', 100, 119, 1, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (927, '120-159', 'xB', 'STAFF. M 120-159', '120-159', 'MASTER', 120, 159, 1, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (928, '160-199', 'xC', 'STAFF. M 160-199', '160-199', 'MASTER', 160, 199, 1, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (929, '200-239', 'xD', 'STAFF. M 200-239', '200-239', 'MASTER', 200, 239, 1, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (930, '240-279', 'xE', 'STAFF. M 240-279', '240-279', 'MASTER', 240, 279, 1, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (931, '280-319', 'xF', 'STAFF. M 280-319', '280-319', 'MASTER', 280, 319, 1, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (932, '320-359', 'xG', 'STAFF. M 320-359', '320-359', 'MASTER', 320, 359, 1, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);

INSERT INTO `category_types` (`id`, `code`, `federation_code`, `description`, `short_name`, `group_name`, `age_begin`, `age_end`, `is_a_relay`, `created_at`, `updated_at`, `season_id`, `is_out_of_race`)
  VALUES (933, '360-399', 'xH', 'STAFF. M 360-399', '360-399', 'MASTER', 360, 399, 1, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 152, 0);


-- Meetings
-- 14201-bologna TROFEO DEAKKER ASI 2014-11-09
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15201, 'TROFEO DEAKKER ASI', '2015-11-01', 0, 1, '347 7878360', 'nuotodeakkergmail.com', 'Marina Mastrigli', 'De Akker Team Bologna', 0, 0, 0, 2, 'FIN04', 12, 152, 2, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 1, '2015-11-08', 'bologna', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (956, 1, '2015-11-08', '2000-01-01 08:15:00', '2000-01-01 09:00:00', '', 15201, 4, 2, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3892, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 1, '2000-01-01 00:00:00', 0, 1, NULL, 956, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3893, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 2, '2000-01-01 00:00:00', 0, 1, NULL, 956, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3894, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 3, '2000-01-01 00:00:00', 0, 1, NULL, 956, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3895, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 4, '2000-01-01 04:00:30', 0, 1, NULL, 956, 33, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (957, 2, '2015-11-08', '2000-01-01 14:00:00', '2000-01-01 14:30:00', '', 15201, 4, 2, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3896, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 1, '2000-01-01 00:00:00', 0, 1, NULL, 957, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3897, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 2, '2000-01-01 00:00:00', 0, 1, NULL, 957, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3898, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 3, '2000-01-01 00:00:00', 0, 1, NULL, 957, 22, 3, 2, 1, 0);


-- 14202-riccione TROFEO CITTA' DI RICCIONE 2014-12-07
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15202, 'TROFEO CITTA\' DI RICCIONE', '2015-11-30', 1, 1, '347 9804255', 'riccionemaster+iscrizioni@gmail.com', 'Marco Squadrani', 'Polisp. Comunale Riccione', 0, 0, 0, 2, 'FIN04', 11, 152, 2, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 1, '2015-12-06', 'riccione', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (958, 1, '2015-12-06', '2000-01-01 07:10:00', '2000-01-01 07:45:00', '', 15202, 22, 2, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3899, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 1, '2000-01-01 00:00:00', 0, 1, NULL, 958, 7, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3900, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 2, '2000-01-01 00:00:00', 0, 1, NULL, 958, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3901, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 3, '2000-01-01 00:00:00', 0, 1, NULL, 958, 21, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3902, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 4, '2000-01-01 00:00:00', 0, 1, NULL, 958, 25, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (959, 2, '2015-12-06', '2000-01-01 13:25:00', '2000-01-01 14:00:00', '', 15202, 22, 2, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3903, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 1, '2000-01-01 00:00:00', 0, 1, NULL, 959, 24, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3904, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 2, '2000-01-01 00:00:00', 0, 1, NULL, 959, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3905, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 3, '2000-01-01 00:00:00', 0, 1, NULL, 959, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3906, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 4, '2000-01-01 00:00:00', 0, 1, NULL, 959, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3907, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 5, '2000-01-01 00:00:00', 0, 1, NULL, 959, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3908, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 6, '2000-01-01 00:00:00', 0, 1, NULL, 959, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3909, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 7, '2000-01-01 00:00:00', 0, 1, NULL, 959, 33, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (960, 3, '2015-12-07', '2000-01-01 07:10:00', '2000-01-01 07:45:00', '', 15202, 22, 2, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3910, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 1, '2000-01-01 00:00:00', 0, 1, NULL, 960, 6, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3911, '2015-11-04 11:05:45', '2015-11-04 11:05:45', 2, '2000-01-01 00:00:00', 0, 1, NULL, 960, 13, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3912, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 3, '2000-01-01 00:00:00', 0, 1, NULL, 960, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3913, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 4, '2000-01-01 00:00:00', 0, 1, NULL, 960, 26, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (961, 4, '2015-12-07', '2000-01-01 13:25:00', '2000-01-01 14:00:00', '', 15202, 22, 2, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3914, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 1, '2000-01-01 00:00:00', 0, 1, NULL, 961, 5, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3915, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 2, '2000-01-01 00:00:00', 0, 1, NULL, 961, 17, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3916, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 3, '2000-01-01 00:00:00', 0, 1, NULL, 961, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3917, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 4, '2000-01-01 00:00:00', 0, 1, NULL, 961, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3918, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 5, '2000-01-01 00:00:00', 0, 1, NULL, 961, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3919, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 6, '2000-01-01 00:00:00', 0, 1, NULL, 961, 32, 3, 2, 1, 0);


-- 14203-livorno MEETING DEGLI AUGURI 2014-12-14
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15203, 'MEETING DEGLI AUGURI', NULL, 1, 1, '', '', '', '', 0, 0, 0, 2, 'FIN02', 16, 152, 2, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 1, '2015-12-13', 'livorno', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (962, 1, '2015-12-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15203, 23, 2, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3920, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 1, '2000-01-01 00:00:00', 0, 1, NULL, 962, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3921, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 2, '2000-01-01 00:00:00', 0, 1, NULL, 962, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3922, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 3, '2000-01-01 00:00:00', 0, 1, NULL, 962, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3923, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 4, '2000-01-01 00:00:00', 0, 1, NULL, 962, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3924, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 5, '2000-01-01 00:00:00', 0, 1, NULL, 962, 3, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (963, 2, '2015-12-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15203, 23, 2, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3925, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 6, '2000-01-01 00:00:00', 0, 1, NULL, 963, 24, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3926, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 7, '2000-01-01 00:00:00', 0, 1, NULL, 963, 21, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3927, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 8, '2000-01-01 00:00:00', 0, 1, NULL, 963, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3928, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 9, '2000-01-01 00:00:00', 0, 1, NULL, 963, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3929, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 10, '2000-01-01 00:00:00', 0, 1, NULL, 963, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3930, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 11, '2000-01-01 00:00:00', 0, 1, NULL, 963, 19, 3, 2, 1, 0);


-- 14204-viareggio TROFEO MUSSI-LOMBARDI-FEMIANO 2014-12-21
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15204, 'TROFEO MUSSI-LOMBARDI-FEMIANO', NULL, 0, 1, '', '', '', '', 0, 0, 0, 2, 'FIN04', 9, 152, 2, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 1, '2015-12-20', 'viareggio', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (964, 1, '2015-12-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15204, 24, 2, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3931, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 1, '2000-01-01 00:00:00', 0, 1, NULL, 964, 13, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3932, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 2, '2000-01-01 00:00:00', 0, 1, NULL, 964, 22, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3933, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 3, '2000-01-01 00:00:00', 0, 1, NULL, 964, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3934, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 4, '2000-01-01 00:00:00', 0, 1, NULL, 964, 17, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (965, 2, '2015-12-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15204, 24, 2, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3935, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 5, '2000-01-01 00:00:00', 0, 1, NULL, 965, 21, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3936, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 6, '2000-01-01 00:00:00', 0, 1, NULL, 965, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3937, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 7, '2000-01-01 00:00:00', 0, 1, NULL, 965, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3938, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 8, '2000-01-01 00:00:00', 0, 1, NULL, 965, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3939, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 9, '2000-01-01 00:00:00', 0, 1, NULL, 965, 19, 3, 2, 1, 0);


-- 14205-gussago TROFEO CITTA' DI GUSSAGO 2015-01-24
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15205, 'TROFEO CITTA\' DI GUSSAGO', NULL, 1, 1, '349 5750276', 'trofeomasteraicsgmail.com', 'Mauro Zanetti', 'AICS Master - BS', 0, 0, 0, 2, 'FIN04', 19, 152, 2, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 1, '2016-01-23', 'gussago', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (966, 1, '2016-01-23', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15205, 35, 2, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3940, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 1, '2000-01-01 00:00:00', 0, 1, NULL, 966, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3941, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 2, '2000-01-01 00:00:00', 0, 1, NULL, 966, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3942, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 3, '2000-01-01 00:00:00', 0, 1, NULL, 966, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3943, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 16, '2000-01-01 16:56:30', 0, 1, NULL, 966, 33, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3944, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 17, '2000-01-01 16:55:30', 0, 1, NULL, 966, 32, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3945, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 18, '2000-01-01 16:51:00', 0, 1, NULL, 966, 26, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3946, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 19, '2000-01-01 16:46:30', 0, 1, NULL, 966, 25, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (967, 2, '2016-01-23', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15205, 35, 2, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3947, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 4, '2000-01-01 00:00:00', 0, 1, NULL, 967, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3948, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 5, '2000-01-01 00:00:00', 0, 1, NULL, 967, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3949, '2015-11-04 11:05:46', '2015-11-04 11:05:46', 6, '2000-01-01 00:00:00', 0, 1, NULL, 967, 13, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3950, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 7, '2000-01-01 00:00:00', 0, 1, NULL, 967, 22, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (968, 3, '2016-01-24', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15205, 35, 2, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3951, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 9, '2000-01-01 00:00:00', 0, 1, NULL, 968, 21, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3952, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 10, '2000-01-01 00:00:00', 0, 1, NULL, 968, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3953, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 11, '2000-01-01 00:00:00', 0, 1, NULL, 968, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3954, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 12, '2000-01-01 00:00:00', 0, 1, NULL, 968, 3, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (969, 4, '2016-01-24', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15205, 35, 2, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3955, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 13, '2000-01-01 00:00:00', 0, 1, NULL, 969, 17, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3956, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 14, '2000-01-01 00:00:00', 0, 1, NULL, 969, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3957, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 15, '2000-01-01 00:00:00', 0, 1, NULL, 969, 12, 3, 2, 1, 0);


-- 14206-ravenna TROFEO CITTA' DI RAVENNA 2015-01-17
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15206, 'TROFEO CITTA\' DI RAVENNA', NULL, 1, 1, '', 'vale.m@tin.it', 'Valeria Mazzotti', 'Rinascita Team Romagna', 0, 0, 0, 2, 'FIN04', 13, 152, 2, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 1, '2016-01-16', 'ravenna', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (970, 1, '2016-01-16', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15206, 18, 2, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3958, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 1, '2000-01-01 00:00:00', 0, 1, NULL, 970, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3959, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 2, '2000-01-01 00:00:00', 0, 1, NULL, 970, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3960, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 3, '2000-01-01 00:00:00', 0, 1, NULL, 970, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3961, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 4, '2000-01-01 00:00:00', 0, 1, NULL, 970, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3962, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 5, '2000-01-01 00:00:00', 0, 1, NULL, 970, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3963, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 11, '2000-01-01 11:26:00', 0, 1, NULL, 970, 5, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (971, 2, '2016-01-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15206, 18, 2, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3964, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 6, '2000-01-01 00:00:00', 0, 1, NULL, 971, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3965, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 7, '2000-01-01 00:00:00', 0, 1, NULL, 971, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3966, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 8, '2000-01-01 00:00:00', 0, 1, NULL, 971, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3967, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 9, '2000-01-01 00:00:00', 0, 1, NULL, 971, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3968, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 10, '2000-01-01 00:00:00', 0, 1, NULL, 971, 15, 3, 2, 1, 0);


-- 14207-regemilia REGIONALI FIN EMILIA 2015-02-15
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15207, 'REGIONALI FIN EMILIA', NULL, 1, 1, '', 'vincenzo_lodi@glfinishing.com', 'Vincenzo Lodi', 'CR Emilia', 0, 0, 0, 2, 'FIN04', 0, 152, 2, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 1, '2016-02-14', 'regemilia', '2015/2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (972, 1, '2016-02-14', '2000-01-01 00:00:08', '2000-01-01 00:00:08', '', 15207, 49, 2, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3969, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 1, '2000-01-01 00:00:00', 0, 1, NULL, 972, 6, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3970, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 2, '2000-01-01 00:00:00', 0, 1, NULL, 972, 24, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3971, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 3, '2000-01-01 00:00:00', 0, 1, NULL, 972, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3972, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 4, '2000-01-01 00:00:00', 0, 1, NULL, 972, 16, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (973, 2, '2016-02-14', '2000-01-01 00:00:14', '2000-01-01 00:00:14', '', 15207, 49, 2, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3973, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 5, '2000-01-01 00:00:00', 0, 1, NULL, 973, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3974, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 6, '2000-01-01 00:00:00', 0, 1, NULL, 973, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3975, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 7, '2000-01-01 00:00:00', 0, 1, NULL, 973, 22, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3976, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 8, '2000-01-01 00:00:00', 0, 1, NULL, 973, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3977, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 9, '2000-01-01 00:00:00', 0, 1, NULL, 973, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3978, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 10, '2000-01-01 00:00:00', 0, 1, NULL, 973, 21, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (974, 3, '2016-02-21', '2000-01-01 00:00:08', '2000-01-01 00:00:08', '', 15207, 49, 2, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3979, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 11, '2000-01-01 00:00:00', 0, 1, NULL, 974, 5, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3980, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 12, '2000-01-01 00:00:00', 0, 1, NULL, 974, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3981, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 13, '2000-01-01 00:00:00', 0, 1, NULL, 974, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3982, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 14, '2000-01-01 00:00:00', 0, 1, NULL, 974, 3, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (975, 4, '2016-02-21', '2000-01-01 00:00:14', '2000-01-01 00:00:14', '', 15207, 49, 2, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3983, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 15, '2000-01-01 00:00:00', 0, 1, NULL, 975, 7, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3984, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 16, '2000-01-01 00:00:00', 0, 1, NULL, 975, 17, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3985, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 17, '2000-01-01 00:00:00', 0, 1, NULL, 975, 13, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3986, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 18, '2000-01-01 00:00:00', 0, 1, NULL, 975, 23, 3, 2, 1, 0);


-- 14208-bologna TROFEO NUOVO NUOTO 2015-03-29
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15208, 'TROFEO NUOVO NUOTO', NULL, 1, 1, '347 4321509', 'info@nuovonuoto.it', 'Fabio Bettazzoni', '29 Marzo 2015\r\nNuovo Nuoto', 0, 0, 0, 2, 'FIN04', 15, 152, 2, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 1, '2016-03-27', 'bologna', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (976, 1, '2016-03-27', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15208, 16, 2, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3987, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 1, '2000-01-01 00:00:00', 0, 1, NULL, 976, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3988, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 2, '2000-01-01 00:00:00', 0, 1, NULL, 976, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3989, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 3, '2000-01-01 00:00:00', 0, 1, NULL, 976, 17, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3990, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 4, '2000-01-01 00:00:00', 0, 1, NULL, 976, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3991, '2015-11-04 11:05:47', '2015-11-04 11:05:47', 5, '2000-01-01 00:00:00', 0, 1, NULL, 976, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3992, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 6, '2000-01-01 00:00:00', 0, 1, NULL, 976, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3993, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 7, '2000-01-01 11:42:30', 0, 1, NULL, 976, 33, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3994, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 8, '2000-01-01 11:41:30', 0, 1, NULL, 976, 32, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3995, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 9, '2000-01-01 11:37:00', 0, 1, NULL, 976, 26, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3996, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 10, '2000-01-01 11:27:30', 0, 1, NULL, 976, 25, 3, 1, 1, 0);


-- 14209-forli TROFEO FANATIK TEAM 2014-11-23
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15209, 'TROFEO FANATIK TEAM', '2015-11-15', 0, 1, '392 8139570', 'fanatik.forli@gmail.com', 'Mattia Bacciocchi', 'Fanatik Team', 0, 0, 0, 2, 'FIN04', 2, 152, 2, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 1, '2015-11-22', 'forli', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (977, 1, '2015-11-22', '2000-01-01 08:00:00', '2000-01-01 08:45:00', '', 15209, 11, 2, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3997, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 1, '2000-01-01 00:00:00', 0, 1, NULL, 977, 5, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3998, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 2, '2000-01-01 00:00:00', 0, 1, NULL, 977, 22, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (3999, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 3, '2000-01-01 00:00:00', 0, 1, NULL, 977, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4000, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 4, '2000-01-01 00:00:00', 0, 1, NULL, 977, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4001, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 5, '2000-01-01 00:00:00', 0, 1, NULL, 977, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4002, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 6, '2000-01-01 00:00:30', 0, 1, NULL, 977, 32, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (978, 2, '2015-11-22', '2000-01-01 12:00:00', '2000-01-01 13:00:00', '', 15209, 11, 2, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4003, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 1, '2000-01-01 00:00:00', 0, 1, NULL, 978, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4004, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 2, '2000-01-01 00:00:00', 0, 1, NULL, 978, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4005, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 3, '2000-01-01 00:00:00', 0, 1, NULL, 978, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4006, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 4, '2000-01-01 00:00:00', 0, 1, NULL, 978, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4007, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 5, '2000-01-01 00:00:00', 0, 1, NULL, 978, 2, 3, 2, 1, 0);


-- 14210-piacenza TROFEO MASTER VITTORINO DA FELTRE 2015-05-31
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15210, 'TROFEO MASTER VITTORINO DA FELTRE', NULL, 1, 1, '348 2560152', 'sandrorizzoli@gmail.com', 'Sandro Rizzoli', 'CAN Vittorino da Feltre', 0, 0, 0, 2, 'FIN04', 1, 152, 2, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 1, '2016-05-29', 'piacenza', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (979, 1, '2016-05-29', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15210, 28, 2, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4008, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 1, '2000-01-01 00:00:00', 0, 1, NULL, 979, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4009, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 2, '2000-01-01 00:00:00', 0, 1, NULL, 979, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4010, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 3, '2000-01-01 00:00:00', 0, 1, NULL, 979, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4011, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 4, '2000-01-01 00:00:00', 0, 1, NULL, 979, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4012, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 5, '2000-01-01 00:00:00', 0, 1, NULL, 979, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4013, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 6, '2000-01-01 10:12:00', 0, 1, NULL, 979, 17, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4014, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 7, '2000-01-01 10:28:00', 0, 1, NULL, 979, 21, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4015, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 8, '2000-01-01 10:58:00', 0, 1, NULL, 979, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4016, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 9, '2000-01-01 11:36:00', 0, 1, NULL, 979, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4017, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 10, '2000-01-01 12:14:00', 0, 1, NULL, 979, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4018, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 11, '2000-01-01 12:52:00', 0, 1, NULL, 979, 2, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4019, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 12, '2000-01-01 14:14:38', 0, 1, NULL, 979, 28, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (980, 2, '2016-05-29', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15210, 28, 2, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4020, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 1, '2000-01-01 00:00:00', 0, 1, NULL, 980, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4021, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 2, '2000-01-01 00:00:00', 0, 1, NULL, 980, 24, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4022, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 3, '2000-01-01 00:00:00', 0, 1, NULL, 980, 6, 3, 2, 1, 0);


-- 14211-italiani CAMPIONATI ITALIANI FIN 2015-06-24
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15211, 'CAMPIONATI ITALIANI FIN', NULL, 1, 0, '', '', '', '', 0, 0, 0, 3, '', 0, 152, 2, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 1, '2016-06-22', 'italiani', '2016', 1, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (981, 1, '2016-06-22', '2000-01-01 08:00:00', '2000-01-01 09:00:00', '', 15211, 22, 2, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4023, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 1, '2000-01-01 00:00:00', 0, 1, NULL, 981, 6, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (982, 2, '2016-06-22', '2000-01-01 15:00:00', '2000-01-01 16:00:00', '', 15211, 22, 2, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4024, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 1, '2000-01-01 00:00:00', 0, 1, NULL, 982, 24, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4025, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 2, '2000-01-01 00:00:00', 0, 1, NULL, 982, 13, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4026, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 3, '2000-01-01 00:00:00', 0, 1, NULL, 982, 17, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (983, 3, '2016-06-23', '2000-01-01 08:30:00', '2000-01-01 09:30:00', '', 15211, 22, 2, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4027, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 1, '2000-01-01 00:00:00', 0, 1, NULL, 983, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4028, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 2, '2000-01-01 00:00:00', 0, 1, NULL, 983, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4029, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 3, '2000-01-01 00:00:00', 0, 1, NULL, 983, 32, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (984, 4, '2016-06-23', '2000-01-01 14:00:00', '2000-01-01 15:00:00', '', 15211, 22, 2, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4030, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 1, '2000-01-01 00:00:00', 0, 1, NULL, 984, 5, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4031, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 2, '2000-01-01 00:00:00', 0, 1, NULL, 984, 23, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (985, 5, '2016-06-24', '2000-01-01 08:30:00', '2000-01-01 09:30:00', '', 15211, 22, 2, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4032, '2015-11-04 11:05:48', '2015-11-04 11:05:48', 1, '2000-01-01 00:00:00', 0, 1, NULL, 985, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4033, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 2, '2000-01-01 00:00:00', 0, 1, NULL, 985, 15, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (986, 6, '2016-06-24', '2000-01-01 14:00:00', '2000-01-01 15:00:00', '', 15211, 22, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4034, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 1, '2000-01-01 00:00:00', 0, 1, NULL, 986, 21, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4035, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 2, '2000-01-01 00:00:00', 0, 1, NULL, 986, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4036, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 3, '2000-01-01 00:00:00', 0, 1, NULL, 986, 33, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (987, 7, '2016-06-25', '2000-01-01 08:30:00', '2000-01-01 09:30:00', '', 15211, 22, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4037, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 1, '2000-01-01 00:00:00', 0, 1, NULL, 987, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4038, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 2, '2000-01-01 00:00:00', 0, 1, NULL, 987, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4039, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 3, '2000-01-01 00:00:00', 0, 1, NULL, 987, 26, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (988, 8, '2016-06-25', '2000-01-01 14:00:00', '2000-01-01 15:00:00', '', 15211, 22, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4040, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 1, '2000-01-01 00:00:00', 0, 1, NULL, 988, 3, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (989, 9, '2016-06-26', '2000-01-01 08:30:00', '2000-01-01 09:30:00', '', 15211, 22, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4041, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 1, '2000-01-01 00:00:00', 0, 1, NULL, 989, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4042, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 2, '2000-01-01 00:00:00', 0, 1, NULL, 989, 25, 3, 2, 1, 0);


-- 14212-travagliato TROFEO CITTA' DI TRAVAGLIATO 2015-04-19
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15212, 'TROFEO CITTA\' DI TRAVAGLIATO', NULL, 0, 0, '', 'info@gamteam.it', 'Patrizia Cocchi', '', 0, 0, 0, 2, 'FIN04', 11, 152, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 1, '2016-04-17', 'travagliato', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (990, 1, '2016-04-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15212, 58, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4043, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 1, '2000-01-01 00:00:00', 0, 1, NULL, 990, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4044, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 2, '2000-01-01 00:00:00', 0, 1, NULL, 990, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4045, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 3, '2000-01-01 00:00:00', 0, 1, NULL, 990, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4046, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 4, '2000-01-01 00:00:00', 0, 1, NULL, 990, 21, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4047, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 5, '2000-01-01 00:00:00', 0, 1, NULL, 990, 4, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (991, 2, '1900-12-29', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15212, 58, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4048, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 1, '2000-01-01 00:00:00', 0, 1, NULL, 991, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4049, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 2, '2000-01-01 00:00:00', 0, 1, NULL, 991, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4050, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 3, '2000-01-01 00:00:00', 0, 1, NULL, 991, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4051, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 4, '2000-01-01 00:00:00', 0, 1, NULL, 991, 13, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4052, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 5, '2000-01-01 00:00:00', 0, 1, NULL, 991, 17, 3, 2, 1, 0);


-- 14213-molinella TROFEO CITTA' DI MOLINELLA 2015-04-11
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15213, 'TROFEO CITTA\' DI MOLINELLA', NULL, 0, 1, '', '', '', 'Molinellanuoto', 0, 0, 0, 2, 'FIN04', 14, 152, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 1, '2016-04-09', 'molinella', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (992, 1, '2016-04-09', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15213, 26, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4053, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 1, '2000-01-01 00:00:00', 0, 1, NULL, 992, 7, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (993, 2, '2016-04-09', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15213, 26, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4054, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 2, '2000-01-01 00:00:00', 0, 1, NULL, 993, 17, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4055, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 3, '2000-01-01 00:00:00', 0, 1, NULL, 993, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4056, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 4, '2000-01-01 00:00:00', 0, 1, NULL, 993, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4057, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 5, '2000-01-01 00:00:00', 0, 1, NULL, 993, 4, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (994, 3, '2016-04-09', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15213, 26, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4058, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 6, '2000-01-01 00:00:00', 0, 1, NULL, 994, 6, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (995, 4, '2016-04-10', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15213, 26, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4059, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 8, '2000-01-01 00:00:00', 0, 1, NULL, 995, 13, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4060, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 9, '2000-01-01 00:00:00', 0, 1, NULL, 995, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4061, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 10, '2000-01-01 00:00:00', 0, 1, NULL, 995, 21, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4062, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 11, '2000-01-01 00:00:00', 0, 1, NULL, 995, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4063, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 7, '2000-01-01 00:00:00', 0, 1, NULL, 995, 3, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (996, 5, '2016-04-10', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15213, 26, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4064, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 12, '2000-01-01 00:00:00', 0, 1, NULL, 996, 5, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4065, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 13, '2000-01-01 00:00:00', 0, 1, NULL, 996, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4066, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 14, '2000-01-01 00:00:00', 0, 1, NULL, 996, 22, 3, 2, 1, 0);


-- 14214-sanmarino TROFEO SAN MARINO 2015-05-09
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15214, 'TROFEO SAN MARINO', NULL, 0, 1, '339 2365403', 'mastersanmarino@hotmail.com', 'Marco Parasole', 'AS San Marino Nuoto', 0, 0, 0, 2, 'FIN04', 10, 152, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 1, '2016-05-07', 'sanmarino', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (997, 1, '2016-05-07', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15214, 19, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4067, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 1, '2000-01-01 00:00:00', 0, 1, NULL, 997, 6, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4068, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 6, '2000-01-01 14:14:30', 0, 1, NULL, 997, 26, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4069, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 7, '2000-01-01 14:11:30', 0, 1, NULL, 997, 25, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (998, 2, '2016-05-07', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15214, 19, 2, '2015-11-04 11:05:49', '2015-11-04 11:05:49', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4070, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 1, '2000-01-01 00:00:00', 0, 1, NULL, 998, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4071, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 2, '2000-01-01 00:00:00', 0, 1, NULL, 998, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4072, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 3, '2000-01-01 00:00:00', 0, 1, NULL, 998, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4073, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 4, '2000-01-01 00:00:00', 0, 1, NULL, 998, 4, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (999, 3, '2016-05-08', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15214, 19, 2, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4074, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 1, '2000-01-01 00:00:00', 0, 1, NULL, 999, 5, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4075, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 2, '2000-01-01 00:00:00', 0, 1, NULL, 999, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4076, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 3, '2000-01-01 00:00:00', 0, 1, NULL, 999, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4077, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 4, '2000-01-01 00:00:00', 0, 1, NULL, 999, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4078, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 5, '2000-01-01 00:00:00', 0, 1, NULL, 999, 3, 3, 2, 1, 0);


-- 14215-verolanuova TROFEO CITTA' DI VEROLANUOVA 2014-10-25
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15215, 'TROFEO CITTA\' DI VEROLANUOVA', '2015-10-20', 0, 1, '329 6382236', '', '', 'Verolanuoto', 0, 0, 0, 2, 'FIN04', 14, 152, 2, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 1, '2015-10-24', 'verolanuova', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1000, 1, '2015-10-24', '2000-01-01 14:00:00', '2000-01-01 15:00:00', '', 15215, 29, 2, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4079, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 1, '2000-01-01 00:00:00', 0, 1, NULL, 1000, 5, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4080, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 2, '2000-01-01 00:00:00', 0, 1, NULL, 1000, 22, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1001, 2, '2015-10-25', '2000-01-01 08:00:00', '2000-01-01 09:00:00', '', 15215, 29, 2, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4081, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 1, '2000-01-01 00:00:00', 0, 1, NULL, 1001, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4082, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 2, '2000-01-01 00:00:00', 0, 1, NULL, 1001, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4083, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 3, '2000-01-01 00:00:00', 0, 1, NULL, 1001, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4084, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 4, '2000-01-01 00:00:00', 0, 1, NULL, 1001, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4085, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 5, '2000-01-01 00:00:00', 0, 1, NULL, 1001, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4086, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 6, '2000-01-01 00:00:00', 0, 1, NULL, 1001, 2, 3, 2, 1, 0);


-- 14216-parma TROFEO COOPERNUOTO 2014-12-14
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15216, 'TROFEO COOPERNUOTO', NULL, 0, 1, '335 6939924', 'parma@coopernuoto.it', 'Davide Bonomini, Vincenzo Savelli', 'Coopernuoto Scsd', 0, 0, 0, 2, 'FIN04', 3, 152, 2, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 1, '2015-12-13', 'parma', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1002, 1, '2015-12-13', '2000-01-01 08:00:00', '2000-01-01 08:45:00', '', 15216, 3, 2, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4087, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 1, '2000-01-01 08:45:00', 0, 1, NULL, 1002, 5, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4088, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 2, '2000-01-01 00:00:00', 0, 1, NULL, 1002, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4089, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 3, '2000-01-01 00:00:00', 0, 1, NULL, 1002, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4090, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 4, '2000-01-01 00:00:00', 0, 1, NULL, 1002, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4091, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 5, '2000-01-01 00:00:00', 0, 1, NULL, 1002, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4092, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 6, '2000-01-01 00:00:00', 0, 1, NULL, 1002, 21, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4093, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 7, '2000-01-01 01:00:30', 0, 1, NULL, 1002, 25, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1003, 2, '2015-12-13', '2000-01-01 13:30:00', '2000-01-01 14:15:00', '', 15216, 3, 2, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4094, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 1, '2000-01-01 14:15:00', 0, 1, NULL, 1003, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4095, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 2, '2000-01-01 00:00:00', 0, 1, NULL, 1003, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4096, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 3, '2000-01-01 00:00:00', 0, 1, NULL, 1003, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4097, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 4, '2000-01-01 00:00:00', 0, 1, NULL, 1003, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4098, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 5, '2000-01-01 00:00:00', 0, 1, NULL, 1003, 22, 3, 2, 1, 0);


-- 14217-brescia BRIXIA FIDELIS 2015-03-07
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15217, 'BRIXIA FIDELIS', NULL, 1, 1, '333 2061181', 'brixia.fidelis@fastwebnet.it', 'Fabio Compagnoni', 'ASD Brescia Organizza', 0, 0, 0, 2, 'FIN04', 30, 152, 2, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 1, '2016-03-05', 'brescia', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1004, 1, '2016-03-05', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15217, 36, 2, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4099, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 1, '2000-01-01 00:00:00', 0, 1, NULL, 1004, 6, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1005, 2, '2016-03-05', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15217, 36, 2, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4100, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 2, '2000-01-01 00:00:00', 0, 1, NULL, 1005, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4101, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 3, '2000-01-01 00:00:00', 0, 1, NULL, 1005, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4102, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 4, '2000-01-01 00:00:00', 0, 1, NULL, 1005, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4103, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 5, '2000-01-01 00:00:00', 0, 1, NULL, 1005, 11, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1006, 3, '2016-03-06', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15217, 36, 2, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4104, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 6, '2000-01-01 00:00:00', 0, 1, NULL, 1006, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4105, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 7, '2000-01-01 00:00:00', 0, 1, NULL, 1006, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4106, '2015-11-04 11:05:50', '2015-11-04 11:05:50', 8, '2000-01-01 00:00:00', 0, 1, NULL, 1006, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4107, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 9, '2000-01-01 00:00:00', 0, 1, NULL, 1006, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4108, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 10, '2000-01-01 00:00:00', 0, 1, NULL, 1006, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4109, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 11, '2000-01-01 00:00:00', 0, 1, NULL, 1006, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4110, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 12, '2000-01-01 00:00:00', 0, 1, NULL, 1006, 5, 3, 2, 1, 0);


-- 14218-varedo TROFEO NORD PADANIA 2015-05-10
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15218, 'TROFEO NORD PADANIA', NULL, 0, 1, '335 1341194', 'info@npnnuotomaster.it', 'Guido Maggi', 'Nord Padania Nuoto', 0, 0, 0, 2, '', 24, 152, 2, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 1, '2016-05-08', 'varedo', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1007, 1, '2016-05-08', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15218, 37, 2, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4111, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 1, '2000-01-01 00:00:00', 0, 1, NULL, 1007, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4112, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 2, '2000-01-01 00:00:00', 0, 1, NULL, 1007, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4113, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 3, '2000-01-01 00:00:00', 0, 1, NULL, 1007, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4114, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 4, '2000-01-01 00:00:00', 0, 1, NULL, 1007, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4115, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 5, '2000-01-01 00:00:00', 0, 1, NULL, 1007, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4116, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 10, '2000-01-01 10:52:00', 0, 1, NULL, 1007, 21, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4117, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 11, '2000-01-01 12:12:00', 0, 1, NULL, 1007, 5, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1008, 2, '1900-12-29', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15218, 37, 2, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4118, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 6, '2000-01-01 00:00:00', 0, 1, NULL, 1008, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4119, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 7, '2000-01-01 00:00:00', 0, 1, NULL, 1008, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4120, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 8, '2000-01-01 00:00:00', 0, 1, NULL, 1008, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4121, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 9, '2000-01-01 00:00:00', 0, 1, NULL, 1008, 2, 3, 2, 1, 0);


-- 14219-prato TROFEO SERGIO FAGGI 2015-05-23
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15219, 'TROFEO SERGIO FAGGI', NULL, 0, 1, '320 4314586', 'fambet@infinito.it', 'Fabio Bettinelli', '', 0, 0, 0, 2, '', 11, 152, 2, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 1, '2016-05-21', 'prato', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1009, 1, '2016-05-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15219, 38, 2, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4122, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 1, '2000-01-01 00:00:00', 0, 1, NULL, 1009, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4123, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 2, '2000-01-01 00:00:00', 0, 1, NULL, 1009, 5, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4124, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 3, '2000-01-01 00:00:00', 0, 1, NULL, 1009, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4125, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 4, '2000-01-01 00:00:00', 0, 1, NULL, 1009, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4126, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 5, '2000-01-01 00:00:00', 0, 1, NULL, 1009, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4127, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 6, '2000-01-01 00:00:00', 0, 1, NULL, 1009, 11, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1010, 2, '1900-12-29', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15219, 38, 2, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4128, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 1, '2000-01-01 00:00:00', 0, 1, NULL, 1010, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4129, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 2, '2000-01-01 00:00:00', 0, 1, NULL, 1010, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4130, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 3, '2000-01-01 00:00:00', 0, 1, NULL, 1010, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4131, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 4, '2000-01-01 00:00:00', 0, 1, NULL, 1010, 17, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4132, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 5, '2000-01-01 00:00:00', 0, 1, NULL, 1010, 21, 3, 2, 1, 0);


-- 14220-pontedera MEETING DELLA VALDERA 2015-05-16
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15220, 'MEETING DELLA VALDERA', NULL, 0, 0, '320 4314586', 'fambet@infinito.it', 'Fabio Bettinelli', '', 0, 0, 0, 2, '', 14, 152, 2, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 1, '2016-05-14', 'pontedera', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1011, 1, '2016-05-14', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15220, 39, 2, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4133, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 1, '2000-01-01 00:00:00', 0, 1, NULL, 1011, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4134, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 2, '2000-01-01 00:00:00', 0, 1, NULL, 1011, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4135, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 3, '2000-01-01 00:00:00', 0, 1, NULL, 1011, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4136, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 4, '2000-01-01 00:00:00', 0, 1, NULL, 1011, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4137, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 5, '2000-01-01 00:00:00', 0, 1, NULL, 1011, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4138, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 6, '2000-01-01 00:00:00', 0, 1, NULL, 1011, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4139, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 7, '2000-01-01 00:00:00', 0, 1, NULL, 1011, 17, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1012, 2, '1900-12-29', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15220, 39, 2, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 'FINALI', 1, NULL);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4140, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 8, '2000-01-01 00:00:00', 0, 1, NULL, 1012, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4141, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 9, '2000-01-01 00:00:00', 0, 1, NULL, 1012, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4142, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 10, '2000-01-01 00:00:00', 0, 1, NULL, 1012, 5, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4143, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 11, '2000-01-01 00:00:00', 0, 1, NULL, 1012, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4144, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 12, '2000-01-01 00:00:00', 0, 1, NULL, 1012, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4145, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 13, '2000-01-01 00:00:00', 0, 1, NULL, 1012, 21, 3, 2, 1, 0);


-- 14221-verona MEMORIAL E. BRUNELLI 2014-12-07
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15221, 'MEMORIAL E. BRUNELLI', '2015-11-30', 1, 1, '348 7691887', 'masterisola@outlook.it', 'Alessio Bellero', 'Sport Team Isola', 0, 0, 0, 2, '', 1, 152, 2, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 1, '2015-12-06', 'verona', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1013, 1, '2015-12-06', '2000-01-01 08:00:00', '2000-01-01 09:00:00', '', 15221, 146, 2, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4146, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 1, '2000-01-01 09:00:00', 0, 1, NULL, 1013, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4147, '2015-11-04 11:05:51', '2015-11-04 11:05:51', 2, '2000-01-01 00:00:00', 0, 1, NULL, 1013, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4148, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 3, '2000-01-01 00:00:00', 0, 1, NULL, 1013, 17, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4149, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 4, '2000-01-01 00:00:00', 0, 1, NULL, 1013, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4150, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 5, '2000-01-01 00:00:00', 0, 1, NULL, 1013, 25, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4151, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 6, '2000-01-01 00:00:00', 1, 1, NULL, 1013, 29, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4152, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 7, '2000-01-01 08:02:00', 0, 1, NULL, 1013, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4153, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 8, '2000-01-01 16:40:00', 0, 1, NULL, 1013, 13, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4154, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 9, '2000-01-01 07:00:00', 0, 1, NULL, 1013, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4155, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 10, '2000-01-01 10:00:00', 0, 1, NULL, 1013, 2, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1014, 2, '2015-12-06', '2000-01-01 13:00:00', '2000-01-01 14:00:00', '', 15221, 146, 2, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4156, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 1, '2000-01-01 14:00:00', 0, 1, NULL, 1014, 5, 3, 2, 1, 0);


-- 14222-firenze FIRENZE INTERNATIONAL MEETING 2015-05-30
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15222, 'FIRENZE INTERNATIONAL MEETING', '2016-05-24', 0, 1, '347 5087019', 'andreaprayer@tiscalinet.it', 'Andrea Prayer', 'Firenze Nuota Master', 0, 0, 0, 2, 'FIN02', 0, 152, 2, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 1, '2016-05-28', 'firenze', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1015, 1, '2016-05-28', '2000-01-01 13:30:00', '2000-01-01 14:30:00', '', 15222, 153, 2, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4157, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 1, '2000-01-01 00:00:00', 0, 1, NULL, 1015, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4158, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 2, '2000-01-01 00:00:00', 0, 1, NULL, 1015, 17, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4159, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 3, '2000-01-01 00:00:00', 0, 1, NULL, 1015, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4160, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 4, '2000-01-01 00:00:00', 0, 1, NULL, 1015, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4161, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 12, '2000-01-01 00:00:00', 0, 1, NULL, 1015, 33, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4162, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 13, '2000-01-01 13:50:00', 0, 1, NULL, 1015, 2, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1016, 2, '2016-05-29', '2000-01-01 08:30:00', '2000-01-01 09:30:00', '', 15222, 153, 2, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4163, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 6, '2000-01-01 00:00:00', 0, 1, NULL, 1016, 21, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4164, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 7, '2000-01-01 00:00:00', 0, 1, NULL, 1016, 13, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4165, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 8, '2000-01-01 00:00:00', 0, 1, NULL, 1016, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4166, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 9, '2000-01-01 00:00:00', 0, 1, NULL, 1016, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4167, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 10, '2000-01-01 00:00:00', 0, 1, NULL, 1016, 11, 3, 2, 1, 0);


-- 14223-europa TROFEO EUROPA SC 2015-05-16
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15223, 'TROFEO EUROPA SC', '2016-05-09', 1, 1, '347 5779700', 'team@europasportingclub.com', 'Diego Marini', 'Europa SC', 0, 0, 0, 2, 'FIN04', 2, 152, 2, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 1, '2016-05-14', 'europa', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1017, 1, '2016-05-14', '2000-01-01 14:00:00', '2000-01-01 15:00:00', '', 15223, 36, 2, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4168, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 1, '2000-01-01 00:00:00', 0, 1, NULL, 1017, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4169, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 2, '2000-01-01 00:00:00', 0, 1, NULL, 1017, 5, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4170, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 3, '2000-01-01 00:00:00', 0, 1, NULL, 1017, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4171, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 4, '2000-01-01 00:00:00', 0, 1, NULL, 1017, 27, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1018, 2, '2016-05-15', '2000-01-01 08:30:00', '2000-01-01 09:30:00', '', 15223, 36, 2, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4172, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 5, '2000-01-01 00:00:00', 0, 1, NULL, 1018, 4, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4173, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 6, '2000-01-01 00:00:00', 0, 1, NULL, 1018, 23, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4174, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 7, '2000-01-01 00:00:00', 0, 1, NULL, 1018, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4175, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 8, '2000-01-01 00:00:00', 0, 1, NULL, 1018, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4176, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 9, '2000-01-01 00:00:00', 0, 1, NULL, 1018, 17, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1019, 3, '2016-05-15', '2000-01-01 14:00:00', '2000-01-01 15:00:00', '', 15223, 36, 2, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4177, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 10, '2000-01-01 00:00:00', 0, 1, NULL, 1019, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4178, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 11, '2000-01-01 00:00:00', 0, 1, NULL, 1019, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4179, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 12, '2000-01-01 00:00:00', 0, 1, NULL, 1019, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4180, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 13, '2000-01-01 00:00:00', 0, 1, NULL, 1019, 2, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4181, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 14, '2000-01-01 00:00:00', 0, 1, NULL, 1019, 26, 3, 2, 1, 0);


-- 14224-mysport TROFEO MY SPORT 2015-05-02
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15224, 'TROFEO MY SPORT', '2016-04-18', 1, 1, '346 0313242', '', 'Luca Carlassare', 'My Sport', 0, 0, 0, 2, 'FIN04', 3, 152, 2, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 1, '2016-04-30', 'mysport', '2015/2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1020, 1, '2016-04-30', '2000-01-01 14:00:00', '2000-01-01 14:30:00', '', 15224, 54, 2, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4182, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 1, '2000-01-01 00:00:00', 0, 1, NULL, 1020, 7, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4183, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 2, '2000-01-01 00:00:00', 0, 1, NULL, 1020, 6, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1021, 2, '2016-05-01', '2000-01-01 08:30:00', '2000-01-01 09:30:00', '', 15224, 54, 2, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4184, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 3, '2000-01-01 00:00:00', 0, 1, NULL, 1021, 17, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4185, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 4, '2000-01-01 00:00:00', 0, 1, NULL, 1021, 13, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4186, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 6, '2000-01-01 00:00:00', 0, 1, NULL, 1021, 21, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4187, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 7, '2000-01-01 00:00:00', 0, 1, NULL, 1021, 24, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4188, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 8, '2000-01-01 00:00:00', 0, 1, NULL, 1021, 4, 3, 2, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1022, 3, '2016-05-01', '2000-01-01 08:30:00', '2000-01-01 09:30:00', '', 15224, 54, 2, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4189, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 9, '2000-01-01 00:00:00', 0, 1, NULL, 1022, 20, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4190, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 10, '2000-01-01 00:00:00', 0, 1, NULL, 1022, 12, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4191, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 11, '2000-01-01 00:00:00', 0, 1, NULL, 1022, 16, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4192, '2015-11-04 11:05:52', '2015-11-04 11:05:52', 12, '2000-01-01 00:00:00', 0, 1, NULL, 1022, 3, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4193, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 13, '2000-01-01 00:00:00', 0, 1, NULL, 1022, 11, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4194, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 14, '2000-01-01 00:00:00', 0, 1, NULL, 1022, 15, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4195, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 15, '2000-01-01 00:00:00', 0, 1, NULL, 1022, 19, 3, 2, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4196, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 16, '2000-01-01 00:00:00', 0, 1, NULL, 1022, 2, 3, 2, 1, 0);


-- 14230-firenzeamicidelnuoto TROFEO AMICI DEL NUOTO 2014-10-26
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15230, 'TROFEO AMICI DEL NUOTO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-10-25', 'firenzeamicidelnuoto', '2015', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1023, 1, '2015-10-25', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15230, 144, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1024, 2, '2015-10-25', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15230, 144, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);


-- 14231-rovigo TROFEO CITTÀ DI ROVIGO 2014-10-26
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15231, 'TROFEO CITTÀ DI ROVIGO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 18, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-10-25', 'rovigo', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1025, 1, '2015-10-25', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15231, 42, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1026, 2, '2015-10-25', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15231, 42, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);


-- 14232-speclombardia DISTANZE SPECIALI LOMBARDIA 2014-11-02
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15232, 'DISTANZE SPECIALI LOMBARDIA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-01', 'speclombardia', '2015', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1027, 1, '2015-11-01', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15232, 64, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);


-- 14233-speclazio DISTANZE SPECIALI LAZIO 2014-11-08
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15233, 'DISTANZE SPECIALI LAZIO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-07', 'speclazio', '2015', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1028, 1, '2015-11-07', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15233, 68, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1029, 2, '2015-11-08', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15233, 68, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);


-- 14234-speccampania DISTANZE SPECIALI CAMPANIA 2014-11-08
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15234, 'DISTANZE SPECIALI CAMPANIA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-07', 'speccampania', '2015', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1030, 1, '2015-11-07', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15234, 101, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1031, 2, '2015-11-08', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15234, 101, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);


-- 14235-specliguria DISTANZE SPECIALI LIGURIA 2014-11-09
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15235, 'DISTANZE SPECIALI LIGURIA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-08', 'specliguria', '2015', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1032, 1, '2015-11-08', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15235, NULL, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);


-- 14236-saronno TROFEO CITTÀ DI SARONNO 2014-11-09
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15236, 'TROFEO CITTÀ DI SARONNO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 6, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-08', 'saronno', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1033, 1, '2015-11-08', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15236, 69, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1034, 2, '2015-11-08', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15236, 69, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);


-- 14237-laquiladisolidarieta MEETING DI SOLIDARIETA' 2014-11-09
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15237, 'MEETING DI SOLIDARIETA\'', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 11, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-08', 'laquiladisolidarieta', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1035, 1, '2015-11-08', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15237, 66, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1036, 2, '2015-11-08', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15237, 66, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);


-- 14238-palermoironswim TROFEO IRONSWIM 2014-11-15
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15238, 'TROFEO IRONSWIM', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 1, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-14', 'palermoironswim', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1037, 1, '2015-11-14', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15238, 80, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1038, 2, '2015-11-14', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15238, 80, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1039, 3, '2015-11-15', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15238, 80, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);


-- 14239-vicenzamastervicenza TROFEO MASTER VICENZA 2014-11-15
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15239, 'TROFEO MASTER VICENZA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 7, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-14', 'vicenzamastervicenza', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1040, 1, '2015-11-14', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15239, 71, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1041, 2, '2015-11-14', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15239, 71, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1042, 3, '2015-11-15', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15239, 71, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1043, 4, '2015-11-15', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15239, 71, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);


-- 14240-novara TROFEO CITTÀ DI NOVARA 2014-11-16
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15240, 'TROFEO CITTÀ DI NOVARA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-15', 'novara', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1044, 1, '2015-11-15', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15240, 154, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1045, 2, '2015-11-15', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15240, 154, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);


-- 14241-andria TROFEO CITTÀ DI ANDRIA 2014-11-16
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15241, 'TROFEO CITTÀ DI ANDRIA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 6, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-15', 'andria', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1046, 1, '2015-11-15', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15241, 145, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1047, 2, '2015-11-15', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15241, 145, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);


-- 14242-osimosenzatesta MEETING SENZA TESTA 2014-11-16
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15242, 'MEETING SENZA TESTA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-15', 'osimosenzatesta', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1048, 1, '2015-11-15', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15242, 63, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1049, 2, '2015-11-15', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15242, 63, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);


-- 14243-gorgonzola TROFEO CITTÀ DI VIMERCATE 2014-11-22
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15243, 'TROFEO CITTÀ DI VIMERCATE', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 32, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-21', 'gorgonzola', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1050, 1, '2015-11-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15243, 155, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1051, 2, '2015-11-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15243, 155, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1052, 3, '2015-11-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15243, 155, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);


-- 14244-romapaolocostoli TROFEO PAOLO COSTOLI 2014-11-23
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15244, 'TROFEO PAOLO COSTOLI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 4, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-22', 'romapaolocostoli', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1053, 1, '2015-11-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15244, 75, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1054, 2, '2015-11-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15244, 75, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);


-- 14245-poggibonsipoggibonsi TROFEO POGGIBONSI 2014-11-23
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15245, 'TROFEO POGGIBONSI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 3, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-22', 'poggibonsipoggibonsi', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1055, 1, '2015-11-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15245, 72, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);


-- 14246-mugnanoblueteam TROFEO BLUE TEAM 2014-11-23
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15246, 'TROFEO BLUE TEAM', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 6, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-22', 'mugnanoblueteam', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1056, 1, '2015-11-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15246, 156, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1057, 2, '2015-11-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15246, 156, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 2);


-- 14247-albenga TROFEO CITTÀ DI ALBENGA 2014-11-23
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15247, 'TROFEO CITTÀ DI ALBENGA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 5, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-22', 'albenga', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1058, 1, '2015-11-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15247, 70, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);


-- 14248-rapallo TROFEO CITTÀ DI RAPALLO 2014-11-30
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15248, 'TROFEO CITTÀ DI RAPALLO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 20, 152, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 1, '2015-11-29', 'rapallo', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1059, 1, '2015-11-29', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15248, 50, 2, '2015-11-04 11:05:53', '2015-11-04 11:05:53', 'FINALI', 1, 1);


-- 14249-casalemonferrato TROFEO CITTÀ DI CASALE MONFERRATO 2014-11-30
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15249, 'TROFEO CITTÀ DI CASALE MONFERRATO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 3, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2015-11-29', 'casalemonferrato', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1060, 1, '2015-11-29', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15249, 79, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1061, 2, '2015-11-29', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15249, 79, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);


-- 14250-bergamognecchi MEMORIAL GNECCHI 2014-12-06
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15250, 'MEMORIAL GNECCHI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 24, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2015-12-05', 'bergamognecchi', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1062, 1, '2015-12-05', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15250, 82, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1063, 2, '2015-12-06', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15250, 82, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1064, 3, '2015-12-06', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15250, 82, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);


-- 14251-massarosa TROFEO CITTÀ DI MASSAROSA 2014-12-07
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15251, 'TROFEO CITTÀ DI MASSAROSA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 10, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2015-12-06', 'massarosa', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1065, 1, '2015-12-06', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15251, 81, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1066, 2, '2015-12-06', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15251, 81, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);


-- 14252-bolzanomercatinodibolzano TROFEO MERCATINO DI BOLZANO 2014-12-07
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15252, 'TROFEO MERCATINO DI BOLZANO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2015-12-06', 'bolzanomercatinodibolzano', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1067, 1, '2015-12-06', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15252, 87, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1068, 2, '2015-12-06', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15252, 87, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);


-- 14253-modugnosantaclaus TROFEO SANTA CLAUS 2014-12-13
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15253, 'TROFEO SANTA CLAUS', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 8, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2015-12-12', 'modugnosantaclaus', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1069, 1, '2015-12-12', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15253, 147, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1070, 2, '2015-12-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15253, 147, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);


-- 14254-ostiaceliobrunelleschi MEMORIAL CELIO BRUNELLESCHI 2014-12-13
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15254, 'MEMORIAL CELIO BRUNELLESCHI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 6, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2015-12-12', 'ostiaceliobrunelleschi', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1071, 1, '2015-12-12', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15254, 148, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1072, 2, '2015-12-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15254, 148, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);


-- 14255-sondriolibsnef MEETING LIB SNEF 2014-12-13
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15255, 'MEETING LIB SNEF', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 8, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2015-12-12', 'sondriolibsnef', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1073, 1, '2015-12-12', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15255, 57, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1074, 2, '2015-12-12', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15255, 57, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);


-- 14256-tortona TROFEO CITTÀ DI TORTONA 2014-12-14
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15256, 'TROFEO CITTÀ DI TORTONA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 11, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2015-12-13', 'tortona', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1075, 1, '2015-12-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15256, 85, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1076, 2, '2015-12-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15256, 85, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);


-- 14257-cagliaribuonnatalemaster BUON NATALE MASTER 2014-12-20
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15257, 'BUON NATALE MASTER', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2015-12-19', 'cagliaribuonnatalemaster', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1077, 1, '2015-12-19', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15257, 157, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);


-- 14258-brescialeonessaditalia TROFEO LEONESSA D'ITALIA 2014-12-21
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15258, 'TROFEO LEONESSA D\'ITALIA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2015-12-20', 'brescialeonessaditalia', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1078, 1, '2015-12-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15258, 89, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1079, 2, '2015-12-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15258, 89, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);


-- 14259-paganisprintdinatale SPRINT DI NATALE 2014-12-21
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15259, 'SPRINT DI NATALE', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 1, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2015-12-20', 'paganisprintdinatale', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1080, 1, '2015-12-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15259, 158, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1081, 2, '2015-12-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15259, 158, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);


-- 14260-palermoduegiornidicloro DUE GIORNI DI CLORO 2014-12-21
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15260, 'DUE GIORNI DI CLORO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2015-12-20', 'palermoduegiornidicloro', '2015', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1082, 1, '2015-12-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15260, 80, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1083, 2, '2015-12-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15260, 80, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);


-- 14261-arezzodelsaracinomaster MEETING DEL SARACINO MASTER 2015-01-06
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15261, 'MEETING DEL SARACINO MASTER', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2016-01-05', 'arezzodelsaracinomaster', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1084, 1, '2016-01-05', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15261, 159, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1085, 2, '2016-01-05', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15261, 159, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);


-- 14262-milanomasterdds TROFEO MASTER DDS 2015-01-10
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15262, 'TROFEO MASTER DDS', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 17, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2016-01-09', 'milanomasterdds', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1086, 1, '2016-01-09', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15262, 90, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1087, 2, '2016-01-09', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15262, 90, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);


-- 14263-conversanoaironclub TROFEO AIRON CLUB 2015-01-11
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15263, 'TROFEO AIRON CLUB', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 1, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2016-01-10', 'conversanoaironclub', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1088, 1, '2016-01-10', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15263, 160, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1089, 2, '2016-01-10', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15263, 160, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);


-- 14264-buonconvento TROFEO CITTÀ DI BUONCONVENTO 2015-01-17
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15264, 'TROFEO CITTÀ DI BUONCONVENTO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 5, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2016-01-16', 'buonconvento', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1090, 1, '2016-01-16', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15264, 93, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1091, 2, '2016-01-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15264, 93, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);


-- 14265-sorirnsori TROFEO RN SORI 2015-01-18
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15265, 'TROFEO RN SORI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 4, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2016-01-17', 'sorirnsori', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1092, 1, '2016-01-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15265, 91, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);


-- 14266-bolzanodelledolomiti TROFEO DELLE DOLOMITI 2015-01-18
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15266, 'TROFEO DELLE DOLOMITI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 17, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2016-01-17', 'bolzanodelledolomiti', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1093, 1, '2016-01-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15266, 87, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1094, 2, '2016-01-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15266, 87, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);


-- 14267-romaforumsprint TROFEO FORUM SPRINT. 2015-01-18
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15267, 'TROFEO FORUM SPRINT.', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 19, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2016-01-17', 'romaforumsprint', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1095, 1, '2016-01-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15267, 95, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1096, 2, '2016-01-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15267, 95, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 2);


-- 14268-taorminamaydayitaliamaster TROFEO MAYDAY ITALIA MASTER 2015-01-18
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15268, 'TROFEO MAYDAY ITALIA MASTER', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 3, 152, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 1, '2016-01-17', 'taorminamaydayitaliamaster', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1097, 1, '2016-01-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15268, 92, 2, '2015-11-04 11:05:54', '2015-11-04 11:05:54', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1098, 2, '2016-01-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15268, 92, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14269-portici TROFEO DELLA CITTÀ 2015-01-24
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15269, 'TROFEO DELLA CITTÀ', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 6, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-01-23', 'portici', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1099, 1, '2016-01-23', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15269, 96, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1100, 2, '2016-01-23', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15269, 96, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1101, 3, '2016-01-24', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15269, 96, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);


-- 14270-viterbolarusmaster TROFEO LARUS MASTER 2015-01-24
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15270, 'TROFEO LARUS MASTER', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 13, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-01-23', 'viterbolarusmaster', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1102, 1, '2016-01-23', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15270, 109, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1103, 2, '2016-01-24', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15270, 109, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);


-- 14271-certaldodelboccaccio MEETING DEL BOCCACCIO 2015-01-25
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15271, 'MEETING DEL BOCCACCIO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 1, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-01-24', 'certaldodelboccaccio', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1104, 1, '2016-01-24', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15271, 149, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1105, 2, '2016-01-24', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15271, 149, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14272-reglazio REGIONALI LAZIO 2015-01-31
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15272, 'REGIONALI LAZIO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-01-30', 'reglazio', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1106, 1, '2016-01-30', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15272, 148, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);


-- 14273-cataniasagata TROFEO S. AGATA 2015-02-01
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15273, 'TROFEO S. AGATA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 11, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-01-31', 'cataniasagata', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1107, 1, '2016-01-31', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15273, 97, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1108, 2, '2016-01-31', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15273, 97, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14274-regpuglia REGIONALI PUGLIA 2015-02-01
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15274, 'REGIONALI PUGLIA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-01-31', 'regpuglia', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1109, 1, '2016-02-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15274, 135, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);


-- 14275-reglombardia REGIONALI LOMBARDIA 2015-02-07
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15275, 'REGIONALI LOMBARDIA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-06', 'reglombardia', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1110, 1, '2016-02-06', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15275, 161, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);


-- 14276-regvenetoefriuli REGIONALI VENETO E FRIULI 2015-02-08
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15276, 'REGIONALI VENETO E FRIULI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-07', 'regvenetoefriuli', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1111, 1, '2016-02-08', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15276, 162, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);


-- 14277-regsicilia REGIONALI SICILIA 2015-02-13
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15277, 'REGIONALI SICILIA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-12', 'regsicilia', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1112, 1, '2016-02-12', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15277, 163, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);


-- 14278-regcampania REGIONALI CAMPANIA 2015-02-14
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15278, 'REGIONALI CAMPANIA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-13', 'regcampania', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1113, 1, '2016-02-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15278, 101, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);


-- 14279-regliguria REGIONALI LIGURIA 2015-02-15
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15279, 'REGIONALI LIGURIA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-14', 'regliguria', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1114, 1, '2016-02-14', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15279, NULL, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1115, 2, '2016-02-14', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15279, NULL, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14280-regabruzzo REGIONALI ABRUZZO 2015-02-21
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15280, 'REGIONALI ABRUZZO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-20', 'regabruzzo', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1116, 1, '2016-02-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15280, 164, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);


-- 14281-regdelpiemonte REGIONALI DEL PIEMONTE 2015-02-21
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15281, 'REGIONALI DEL PIEMONTE', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-20', 'regdelpiemonte', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1117, 1, '2016-02-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15281, 165, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1118, 2, '2016-02-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15281, 165, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1119, 3, '2016-02-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15281, 165, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1120, 4, '2016-02-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15281, 165, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14282-regtoscana REGIONALI TOSCANA 2015-02-21
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15282, 'REGIONALI TOSCANA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-20', 'regtoscana', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1121, 1, '2016-02-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15282, 100, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1122, 2, '2016-02-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15282, 100, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1123, 3, '2016-02-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15282, 100, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1124, 4, '2016-02-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15282, 100, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14283-regtrentinoaltoadige REGIONALI TRENTINO-ALTO ADIGE 2015-02-22
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15283, 'REGIONALI TRENTINO-ALTO ADIGE', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-21', 'regtrentinoaltoadige', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1125, 1, '2016-02-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15283, 166, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);


-- 14284-regumbria REGIONALI UMBRIA 2015-02-22
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15284, 'REGIONALI UMBRIA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-21', 'regumbria', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1126, 1, '2016-02-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15284, 167, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1127, 2, '2016-02-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15284, 167, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14285-regmarche REGIONALI MARCHE 2015-02-22
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15285, 'REGIONALI MARCHE', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-21', 'regmarche', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1128, 1, '2016-02-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15285, 168, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1129, 2, '2016-02-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15285, 168, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14286-regsardegna REGIONALI SARDEGNA 2015-02-28
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15286, 'REGIONALI SARDEGNA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-27', 'regsardegna', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1130, 1, '2016-02-27', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15286, 157, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1131, 2, '2016-02-27', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15286, 157, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14287-regmolise REGIONALI MOLISE 2015-03-01
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15287, 'REGIONALI MOLISE', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-28', 'regmolise', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1132, 1, '2016-02-28', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15287, 169, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1133, 2, '2016-02-28', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15287, 169, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14288-seregnomaster TROFEO MASTER 2015-03-01
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15288, 'TROFEO MASTER', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 10, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-28', 'seregnomaster', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1134, 1, '2016-02-28', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15288, 105, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1135, 2, '2016-02-28', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15288, 105, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14289-lignanosabbiadoromarco MEMORIAL MARCO 2015-03-01
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15289, 'MEMORIAL MARCO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 10, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-02-28', 'lignanosabbiadoromarco', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1136, 1, '2016-02-28', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15289, 13, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1137, 2, '2016-02-28', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15289, 13, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14290-livornonuotopiuswimfestival NUOTOPIÙ SWIM FESTIVAL 2015-03-08
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15290, 'NUOTOPIÙ SWIM FESTIVAL', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 1, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-03-06', 'livornonuotopiuswimfestival', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1138, 1, '2016-03-06', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15290, 170, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1139, 2, '2016-03-06', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15290, 170, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14291-laquilaimmotamanet TROFEO IMMOTA MANET 2015-03-08
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15291, 'TROFEO IMMOTA MANET', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 14, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-03-06', 'laquilaimmotamanet', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1140, 1, '2016-03-06', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15291, 66, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);


-- 14292-molfettaframaros MEETING FRAMAROS 2015-03-08
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15292, 'MEETING FRAMAROS', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 4, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-03-06', 'molfettaframaros', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1141, 1, '2016-03-06', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15292, 171, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1142, 2, '2016-03-06', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15292, 171, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14293-nibionnolarioebrianza TROFEO LARIO E BRIANZA 2015-03-15
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15293, 'TROFEO LARIO E BRIANZA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 18, 152, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 1, '2016-03-13', 'nibionnolarioebrianza', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1143, 1, '2016-03-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15293, 116, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1144, 2, '2016-03-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15293, 116, 2, '2015-11-04 11:05:55', '2015-11-04 11:05:55', 'FINALI', 1, 2);


-- 14294-trentobuonconsiglionuoto TROFEO BUONCONSIGLIO NUOTO 2015-03-15
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15294, 'TROFEO BUONCONSIGLIO NUOTO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 5, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-13', 'trentobuonconsiglionuoto', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1145, 1, '2016-03-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15294, 172, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1146, 2, '2016-03-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15294, 172, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14295-battipagliatorneomasterbalnaea TORNEO MASTER BALNAEA 2015-03-15
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15295, 'TORNEO MASTER BALNAEA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 9, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-13', 'battipagliatorneomasterbalnaea', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1147, 1, '2016-03-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15295, 114, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1148, 2, '2016-03-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15295, 114, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14296-pomezialatinaacquateam TROFEO LATINA ACQUATEAM 2015-03-15
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15296, 'TROFEO LATINA ACQUATEAM', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 4, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-13', 'pomezialatinaacquateam', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1149, 1, '2016-03-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15296, 115, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1150, 2, '2016-03-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15296, 115, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14297-regcalabri REGIONALI CALABRI 2015-03-15
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15297, 'REGIONALI CALABRI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-13', 'regcalabri', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1151, 1, '2016-03-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15297, 173, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1152, 2, '2016-03-13', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15297, 173, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14298-padovamaxzuin MEMORIAL MAX ZUIN 2015-03-22
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15298, 'MEMORIAL MAX ZUIN', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-20', 'padovamaxzuin', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1153, 1, '2016-03-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15298, 117, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1154, 2, '2016-03-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15298, 117, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14299-rapallomasterdiprimavera TROFEO MASTER DI PRIMAVERA 2015-03-22
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15299, 'TROFEO MASTER DI PRIMAVERA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-20', 'rapallomasterdiprimavera', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1155, 1, '2016-03-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15299, 50, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1156, 2, '2016-03-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15299, 50, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14300-lumezzanesprintalbatros TROFEO SPRINT ALBATROS 2015-03-22
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15300, 'TROFEO SPRINT ALBATROS', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 1, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-20', 'lumezzanesprintalbatros', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1157, 1, '2016-03-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15300, 174, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1158, 2, '2016-03-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15300, 174, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14301-baridiprimavera TROFEO DI PRIMAVERA 2015-03-22
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15301, 'TROFEO DI PRIMAVERA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 3, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-20', 'baridiprimavera', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1159, 1, '2016-03-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15301, 120, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1160, 2, '2016-03-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15301, 120, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14302-cataniaetnanuoto TROFEO ETNA NUOTO 2015-03-22
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15302, 'TROFEO ETNA NUOTO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-20', 'cataniaetnanuoto', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1161, 1, '2016-03-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15302, 97, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1162, 2, '2016-03-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15302, 97, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14303-cagliarisardegnanuota SARDEGNA NUOTA 2015-03-22
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15303, 'SARDEGNA NUOTA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-20', 'cagliarisardegnanuota', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1163, 1, '2016-03-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15303, 157, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1164, 2, '2016-03-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15303, 157, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14304-romanantesostiensis TROFEO NANTES OSTIENSIS 2015-03-28
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15304, 'TROFEO NANTES OSTIENSIS', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 8, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-26', 'romanantesostiensis', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1165, 1, '2016-03-26', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15304, 83, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1166, 2, '2016-03-27', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15304, 83, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1167, 3, '2016-03-27', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15304, 83, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14305-pavia TROFEO CITTÀ DI PAVIA 2015-03-29
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15305, 'TROFEO CITTÀ DI PAVIA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 5, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-27', 'pavia', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1168, 1, '2016-03-27', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15305, 122, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1169, 2, '2016-03-27', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15305, 122, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14306-luccailariadelcarretto TROFEO ILARIA DEL CARRETTO 2015-03-29
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15306, 'TROFEO ILARIA DEL CARRETTO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 8, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-27', 'luccailariadelcarretto', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1170, 1, '2016-03-27', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15306, 123, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1171, 2, '2016-03-27', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15306, 123, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14307-calimeraaquapool TROFEO AQUAPOOL 2015-03-29
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15307, 'TROFEO AQUAPOOL', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-27', 'calimeraaquapool', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1172, 1, '2016-03-27', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15307, 175, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1173, 2, '2016-03-27', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15307, 175, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14308-legnano TROFEO CITTÀ DI LEGNANO 2015-04-12
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15308, 'TROFEO CITTÀ DI LEGNANO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 9, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-04-10', 'legnano', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1174, 1, '2016-04-10', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15308, 128, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1175, 2, '2016-04-10', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15308, 128, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14309-follonica COPPA CITTÀ DI FOLLONICA 2015-04-12
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15309, 'COPPA CITTÀ DI FOLLONICA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 4, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-04-10', 'follonica', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1176, 1, '2016-04-10', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15309, 118, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1177, 2, '2016-04-10', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15309, 118, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14310-strianocittadistriano MEETING CITTA' DI STRIANO 2015-04-12
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15310, 'MEETING CITTA\' DI STRIANO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-04-10', 'strianocittadistriano', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1178, 1, '2016-04-10', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15310, 62, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1179, 2, '2016-04-10', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15310, 62, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14311-castellanagrotteswimonthecaves TROFEO SWIM ON THE CAVES 2015-04-12
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15311, 'TROFEO SWIM ON THE CAVES', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 1, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-04-10', 'castellanagrotteswimonthecaves', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1180, 1, '2016-04-10', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15311, 125, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1181, 2, '2016-04-10', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15311, 125, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14312-campodipietraokmasterm2 TROFEO OK MASTER M2 2015-04-12
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15312, 'TROFEO OK MASTER M2', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 3, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-04-10', 'campodipietraokmasterm2', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1182, 1, '2016-04-10', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15312, 119, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1183, 2, '2016-04-10', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15312, 119, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14313-trentotrentinomaster MEETING TRENTINO MASTER 2015-04-18
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15313, 'MEETING TRENTINO MASTER', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 28, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-04-16', 'trentotrentinomaster', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1184, 1, '2016-04-16', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15313, 112, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1185, 2, '2016-04-16', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15313, 112, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);


-- 14314-gualdotadinorolandopinacoli TROFEO ROLANDO PINACOLI 2015-03-18
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15314, 'TROFEO ROLANDO PINACOLI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 8, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-16', 'gualdotadinorolandopinacoli', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1186, 1, '2016-03-16', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15314, 127, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1187, 2, '2016-03-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15314, 127, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 1);


-- 14315-baripaolopinto TROFEO PAOLO PINTO 2015-03-18
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15315, 'TROFEO PAOLO PINTO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 6, 152, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 1, '2016-03-16', 'baripaolopinto', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1188, 1, '2016-03-16', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15315, 130, 2, '2015-11-04 11:05:56', '2015-11-04 11:05:56', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1189, 2, '2016-03-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15315, 130, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1190, 3, '2016-03-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15315, 130, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 2);


-- 14316-palermopolisportivapalermo TROFEO POLISPORTIVA PALERMO 2015-03-18
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15316, 'TROFEO POLISPORTIVA PALERMO', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 11, 152, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 1, '2016-03-16', 'palermopolisportivapalermo', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1191, 1, '2016-03-16', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15316, 126, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1192, 2, '2016-03-16', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15316, 126, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1193, 3, '2016-03-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15316, 126, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1194, 4, '2016-03-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15316, 126, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 2);


-- 14317-genovanuotoponente TROFEO NUOTO PONENTE 2015-04-19
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15317, 'TROFEO NUOTO PONENTE', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 3, 152, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 1, '2016-04-17', 'genovanuotoponente', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1195, 1, '2016-04-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15317, 176, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 1);


-- 14318-cagliarikikkomontisci MEMORIAL KIKKO MONTISCI 2015-04-19
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15318, 'MEMORIAL KIKKO MONTISCI', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 3, 152, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 1, '2016-04-17', 'cagliarikikkomontisci', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1196, 1, '2016-04-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15318, 157, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 1);


-- 14319-sandonadelpiavedelpiave TROFEO DEL PIAVE 2015-04-19
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15319, 'TROFEO DEL PIAVE', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 1, '2016-04-17', 'sandonadelpiavedelpiave', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1197, 1, '2016-04-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15319, 177, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1198, 2, '2016-04-17', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15319, 177, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 2);


-- 14320-romaacqaniene TROFEO ACQANIENE 2015-03-25
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15320, 'TROFEO ACQANIENE', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 3, 152, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 1, '2016-03-23', 'romaacqaniene', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1199, 1, '2016-03-23', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15320, 178, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1200, 2, '2016-03-24', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15320, 178, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 1);


-- 14321-civitanovamarche TROFEO CITTÀ DI CIVITANOVA MARCHE 2015-03-25
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15321, 'TROFEO CITTÀ DI CIVITANOVA MARCHE', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 1, '2016-03-23', 'civitanovamarche', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1201, 1, '2016-03-23', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15321, 150, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1202, 2, '2016-03-24', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15321, 150, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 1);


-- 14322-massarosagiovanniciuffrida MEMORIAL GIOVANNI CIUFFRIDA 2015-04-26
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15322, 'MEMORIAL GIOVANNI CIUFFRIDA', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 15, 152, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 1, '2016-04-24', 'massarosagiovanniciuffrida', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1203, 1, '2016-04-24', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15322, 81, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1204, 2, '2016-04-24', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15322, 81, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 2);


-- 14323-massalubrenseterredellesirene MEETING TERRE DELLE SIRENE 2015-04-26
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15323, 'MEETING TERRE DELLE SIRENE', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 1, '2016-04-24', 'massalubrenseterredellesirene', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1205, 1, '2016-04-24', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15323, 131, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1206, 2, '2016-04-24', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15323, 131, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 2);


-- 14324-bustogarolfo TROFEO DELLA CITTÀ 2015-05-01
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15324, 'TROFEO DELLA CITTÀ', NULL, 0, 1, NULL, NULL, NULL, 'Lombardia Nuoto', 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 1, '2016-04-29', 'bustogarolfo', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1207, 1, '2016-04-29', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15324, 132, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4197, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1207, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4198, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 2, '2000-01-01 08:34:00', 0, 1, NULL, 1207, 12, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4199, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 3, '2000-01-01 09:02:00', 0, 1, NULL, 1207, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4200, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 4, '2000-01-01 09:34:00', 0, 1, NULL, 1207, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4201, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 5, '2000-01-01 10:10:00', 0, 1, NULL, 1207, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4202, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 6, '2000-01-01 10:32:00', 0, 1, NULL, 1207, 5, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4203, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 7, '2000-01-01 11:08:00', 0, 1, NULL, 1207, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4204, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 8, '2000-01-01 11:42:00', 0, 1, NULL, 1207, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4205, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 9, '2000-01-01 12:22:00', 0, 1, NULL, 1207, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4206, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 10, '2000-01-01 13:00:00', 0, 1, NULL, 1207, 2, 3, 1, 1, 0);


-- 14325-bastiaumbra TROFEO DELLA CITTÀ 2015-05-02
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15325, 'TROFEO DELLA CITTÀ', NULL, 0, 1, NULL, NULL, NULL, 'CN Bastia', 0, 0, 0, 2, '?', 10, 152, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 1, '2016-04-30', 'bastiaumbra', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1208, 1, '2016-04-30', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15325, 113, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4207, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1208, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4208, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 2, '2000-01-01 08:16:00', 0, 1, NULL, 1208, 22, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4209, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 3, '2000-01-01 08:46:00', 0, 1, NULL, 1208, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4210, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 4, '2000-01-01 09:26:00', 0, 1, NULL, 1208, 13, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4211, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 5, '2000-01-01 09:44:00', 0, 1, NULL, 1208, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4212, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 6, '2000-01-01 10:00:00', 0, 1, NULL, 1208, 21, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4213, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 7, '2000-01-01 10:24:00', 0, 1, NULL, 1208, 4, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4214, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 8, '2000-01-01 10:56:00', 0, 1, NULL, 1208, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4215, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 9, '2000-01-01 11:22:00', 0, 1, NULL, 1208, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4216, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 10, '2000-01-01 11:54:00', 0, 1, NULL, 1208, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4217, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 11, '2000-01-01 12:26:00', 0, 1, NULL, 1208, 2, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4218, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 12, '2000-01-01 13:06:00', 0, 1, NULL, 1208, 6, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4219, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 13, '2000-01-01 13:50:35', 0, 1, NULL, 1208, 33, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4220, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 14, '2000-01-01 14:13:35', 0, 1, NULL, 1208, 29, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1209, 2, '2016-04-30', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15325, 113, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 1);


-- 14326-giulianoswim4life TROFEO SWIM4LIFE 2015-05-03
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15326, 'TROFEO SWIM4LIFE', NULL, 0, 1, NULL, NULL, NULL, 'MAX & Chris Swimming', 0, 0, 0, 2, '?', 3, 152, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 1, '2016-05-01', 'giulianoswim4life', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1210, 1, '2016-05-01', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15326, 77, 2, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4221, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 1, '2000-01-01 08:04:00', 0, 1, NULL, 1210, 22, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4222, '2015-11-04 11:05:57', '2015-11-04 11:05:57', 2, '2000-01-01 08:46:00', 0, 1, NULL, 1210, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4223, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 3, '2000-01-01 09:28:00', 0, 1, NULL, 1210, 17, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4224, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 4, '2000-01-01 10:04:00', 0, 1, NULL, 1210, 4, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4225, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 5, '2000-01-01 10:44:00', 0, 1, NULL, 1210, 5, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4226, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 6, '2000-01-01 11:24:00', 0, 1, NULL, 1210, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4227, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 7, '2000-01-01 12:08:00', 0, 1, NULL, 1210, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4228, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 8, '2000-01-01 12:42:00', 0, 1, NULL, 1210, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4229, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 9, '2000-01-01 13:28:00', 0, 1, NULL, 1210, 2, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4230, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 10, '2000-01-01 14:12:30', 0, 1, NULL, 1210, 25, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1211, 2, '2016-05-01', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15326, 77, 2, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 'FINALI', 1, 2);


-- 14327-siracusasluciadellequaglie S.LUCIA DELLE QUAGLIE 2015-05-03
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15327, 'S.LUCIA DELLE QUAGLIE', NULL, 0, 1, NULL, NULL, NULL, 'Ortigia', 0, 0, 0, 2, '?', 13, 152, 2, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 1, '2016-05-01', 'siracusasluciadellequaglie', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1212, 1, '2016-05-01', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15327, 179, 2, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4231, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1212, 12, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4232, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 2, '2000-01-01 08:18:00', 0, 1, NULL, 1212, 17, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4233, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 3, '2000-01-01 08:42:00', 0, 1, NULL, 1212, 21, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4234, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 4, '2000-01-01 09:12:00', 0, 1, NULL, 1212, 5, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4235, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 5, '2000-01-01 09:42:00', 0, 1, NULL, 1212, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4236, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 6, '2000-01-01 10:14:00', 0, 1, NULL, 1212, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4237, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 7, '2000-01-01 10:46:00', 0, 1, NULL, 1212, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4238, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 8, '2000-01-01 11:24:00', 0, 1, NULL, 1212, 2, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4239, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 9, '2000-01-01 12:02:30', 0, 1, NULL, 1212, 32, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1213, 2, '2016-05-01', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15327, 179, 2, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 'FINALI', 1, 2);


-- 14328-tarantomeridianamastercup MERIDIANA MASTER CUP 2015-05-10
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15328, 'MERIDIANA MASTER CUP', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 0, 152, 2, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 1, '2016-05-08', 'tarantomeridianamastercup', '2016', 0, 0, 4, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1214, 1, '2016-05-08', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15328, 180, 2, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4240, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1214, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4241, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 2, '2000-01-01 08:20:00', 0, 1, NULL, 1214, 12, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4242, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 3, '2000-01-01 08:46:00', 0, 1, NULL, 1214, 22, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4243, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 4, '2000-01-01 09:14:00', 0, 1, NULL, 1214, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4244, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 5, '2000-01-01 09:44:00', 0, 1, NULL, 1214, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4245, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 6, '2000-01-01 10:20:00', 0, 1, NULL, 1214, 17, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4246, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 7, '2000-01-01 10:48:00', 0, 1, NULL, 1214, 13, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4247, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 8, '2000-01-01 11:14:00', 0, 1, NULL, 1214, 21, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4248, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 9, '2000-01-01 11:40:00', 0, 1, NULL, 1214, 4, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4249, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 10, '2000-01-01 12:16:00', 0, 1, NULL, 1214, 5, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4250, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 11, '2000-01-01 12:48:00', 0, 1, NULL, 1214, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4251, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 12, '2000-01-01 13:22:00', 0, 1, NULL, 1214, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4252, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 13, '2000-01-01 13:46:00', 0, 1, NULL, 1214, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4253, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 14, '2000-01-01 14:24:00', 0, 1, NULL, 1214, 2, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4254, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 15, '2000-01-01 15:00:30', 0, 1, NULL, 1214, 26, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4255, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 16, '2000-01-01 14:55:00', 0, 1, NULL, 1214, 25, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1215, 2, '2016-05-08', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15328, 180, 2, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 'FINALI', 1, 2);


-- 14329-siracusa TROFEO DELLA CITTÀ 2015-05-17
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15329, 'TROFEO DELLA CITTÀ', NULL, 0, 1, NULL, NULL, NULL, 'Nuoto 95', 0, 0, 0, 2, '?', 19, 152, 2, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 1, '2016-05-15', 'siracusa', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1216, 1, '2016-05-15', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15329, 179, 2, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4256, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1216, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4257, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 2, '2000-01-01 08:32:00', 0, 1, NULL, 1216, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4258, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 3, '2000-01-01 09:02:00', 0, 1, NULL, 1216, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4259, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 4, '2000-01-01 09:28:00', 0, 1, NULL, 1216, 7, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4260, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 5, '2000-01-01 09:54:00', 0, 1, NULL, 1216, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4261, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 6, '2000-01-01 10:30:00', 0, 1, NULL, 1216, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4262, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 7, '2000-01-01 11:00:00', 0, 1, NULL, 1216, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4263, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 8, '2000-01-01 11:32:00', 0, 1, NULL, 1216, 2, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4264, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 9, '2000-01-01 12:02:30', 0, 1, NULL, 1216, 25, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1217, 2, '2016-05-15', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15329, 179, 2, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 'FINALI', 1, 2);


-- 14330-trevisoabettiol MEMORIAL A. BETTIOL 2015-04-22
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15330, 'MEMORIAL A. BETTIOL', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 15, 152, 2, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 1, '2016-04-20', 'trevisoabettiol', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1218, 1, '2016-04-20', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15330, 134, 2, '2015-11-04 11:05:58', '2015-11-04 11:05:58', 'FINALI', 1, 2);


-- 14331-genovapiscinedialbaro TROFEO PISCINE DI ALBARO 2015-05-23
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15331, 'TROFEO PISCINE DI ALBARO', NULL, 0, 1, NULL, NULL, NULL, 'Nuotatori Genovesi', 0, 0, 0, 2, '?', 4, 152, 2, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 1, '2016-05-21', 'genovapiscinedialbaro', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1219, 1, '2016-05-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15331, 138, 2, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4265, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1219, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4266, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 2, '2000-01-01 08:24:00', 0, 1, NULL, 1219, 12, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4267, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 3, '2000-01-01 08:40:00', 0, 1, NULL, 1219, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4268, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 4, '2000-01-01 09:08:00', 0, 1, NULL, 1219, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4269, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 5, '2000-01-01 09:46:00', 0, 1, NULL, 1219, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4270, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 6, '2000-01-01 10:10:00', 0, 1, NULL, 1219, 4, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4271, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 7, '2000-01-01 10:42:00', 0, 1, NULL, 1219, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4272, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 8, '2000-01-01 11:06:00', 0, 1, NULL, 1219, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4273, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 9, '2000-01-01 11:34:00', 0, 1, NULL, 1219, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4274, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 10, '2000-01-01 12:04:00', 0, 1, NULL, 1219, 2, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4275, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 11, '2000-01-01 12:44:30', 0, 1, NULL, 1219, 33, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4276, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 12, '2000-01-01 12:44:30', 0, 1, NULL, 1219, 25, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1220, 2, '2016-05-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15331, 138, 2, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 'FINALI', 1, 2);


-- 14332-cremonacanottieribaldesio MEETING CANOTTIERI BALDESIO 2015-05-23
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15332, 'MEETING CANOTTIERI BALDESIO', NULL, 0, 1, NULL, NULL, NULL, 'Canottieri Baldesio ASD', 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 1, '2016-05-21', 'cremonacanottieribaldesio', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1221, 1, '2016-05-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15332, 56, 2, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4277, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1221, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4278, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 2, '2000-01-01 08:24:00', 0, 1, NULL, 1221, 12, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4279, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 3, '2000-01-01 08:50:00', 0, 1, NULL, 1221, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4280, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 4, '2000-01-01 09:24:00', 0, 1, NULL, 1221, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4281, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 5, '2000-01-01 10:06:00', 0, 1, NULL, 1221, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4282, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 6, '2000-01-01 10:38:00', 0, 1, NULL, 1221, 4, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4283, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 7, '2000-01-01 11:16:00', 0, 1, NULL, 1221, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4284, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 8, '2000-01-01 12:02:00', 0, 1, NULL, 1221, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4285, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 9, '2000-01-01 12:44:00', 0, 1, NULL, 1221, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4286, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 10, '2000-01-01 13:22:00', 0, 1, NULL, 1221, 2, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4287, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 11, '2000-01-01 14:04:30', 0, 1, NULL, 1221, 28, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4288, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 12, '2000-01-01 14:03:30', 0, 1, NULL, 1221, 27, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1222, 2, '2016-05-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15332, 56, 2, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 'FINALI', 1, 1);


-- 14333-putignanospeedonadir TROFEO SPEEDO NADIR 2015-05-23
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15333, 'TROFEO SPEEDO NADIR', NULL, 0, 1, NULL, NULL, NULL, 'Nadir SSD', 0, 0, 0, 2, '?', 8, 152, 2, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 1, '2016-05-21', 'putignanospeedonadir', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1223, 1, '2016-05-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15333, 135, 2, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 'FINALI', 1, 2);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4289, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1223, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4290, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 2, '2000-01-01 08:38:00', 0, 1, NULL, 1223, 22, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4291, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 3, '2000-01-01 09:14:00', 0, 1, NULL, 1223, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4292, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 4, '2000-01-01 09:50:00', 0, 1, NULL, 1223, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4293, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 5, '2000-01-01 10:34:00', 0, 1, NULL, 1223, 7, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4294, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 6, '2000-01-01 11:06:00', 0, 1, NULL, 1223, 13, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4295, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 7, '2000-01-01 11:32:00', 0, 1, NULL, 1223, 21, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4296, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 8, '2000-01-01 11:58:00', 0, 1, NULL, 1223, 24, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4297, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 9, '2000-01-01 12:24:00', 0, 1, NULL, 1223, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4298, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 10, '2000-01-01 13:02:00', 0, 1, NULL, 1223, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4299, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 11, '2000-01-01 13:42:00', 0, 1, NULL, 1223, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4300, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 12, '2000-01-01 14:26:00', 0, 1, NULL, 1223, 2, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4301, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 13, '2000-01-01 15:14:00', 0, 1, NULL, 1223, 6, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4302, '2015-11-04 11:05:59', '2015-11-04 11:05:59', 14, '2000-01-01 15:52:30', 0, 1, NULL, 1223, 35, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4303, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 15, '2000-01-01 15:52:00', 0, 1, NULL, 1223, 34, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4304, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 16, '2000-01-01 15:51:30', 0, 1, NULL, 1223, 33, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4305, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 17, '2000-01-01 15:47:00', 0, 1, NULL, 1223, 32, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4306, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 18, '2000-01-01 15:43:00', 0, 1, NULL, 1223, 28, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4307, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 19, '2000-01-01 15:42:30', 0, 1, NULL, 1223, 27, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4308, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 20, '2000-01-01 15:32:00', 0, 1, NULL, 1223, 26, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4309, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 21, '2000-01-01 15:08:00', 0, 1, NULL, 1223, 25, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1224, 2, '2016-05-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15333, 135, 2, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1225, 3, '2016-05-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15333, 135, 2, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 'FINALI', 1, 2);


-- 14334-napoliilgabbiano TROFEO IL GABBIANO 2015-05-23
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15334, 'TROFEO IL GABBIANO', NULL, 0, 1, NULL, NULL, NULL, 'Il Gabbiano Napoli', 0, 0, 0, 2, '?', 7, 152, 2, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 1, '2016-05-21', 'napoliilgabbiano', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1226, 1, '2016-05-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15334, 101, 2, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4310, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1226, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4311, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 2, '2000-01-01 08:32:00', 0, 1, NULL, 1226, 12, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4312, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 3, '2000-01-01 09:00:00', 0, 1, NULL, 1226, 22, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4313, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 4, '2000-01-01 09:30:00', 0, 1, NULL, 1226, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4314, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 5, '2000-01-01 10:10:00', 0, 1, NULL, 1226, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4315, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 6, '2000-01-01 10:52:00', 0, 1, NULL, 1226, 7, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4316, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 7, '2000-01-01 11:24:00', 0, 1, NULL, 1226, 17, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4317, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 8, '2000-01-01 12:04:00', 0, 1, NULL, 1226, 13, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4318, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 9, '2000-01-01 12:24:00', 0, 1, NULL, 1226, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4319, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 10, '2000-01-01 12:54:00', 0, 1, NULL, 1226, 21, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4320, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 11, '2000-01-01 13:26:00', 0, 1, NULL, 1226, 4, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4321, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 12, '2000-01-01 14:12:00', 0, 1, NULL, 1226, 24, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4322, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 13, '2000-01-01 14:34:00', 0, 1, NULL, 1226, 5, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4323, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 14, '2000-01-01 15:10:00', 0, 1, NULL, 1226, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4324, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 15, '2000-01-01 15:54:00', 0, 1, NULL, 1226, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4325, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 16, '2000-01-01 16:22:00', 0, 1, NULL, 1226, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4326, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 17, '2000-01-01 17:00:00', 0, 1, NULL, 1226, 2, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4327, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 18, '2000-01-01 17:44:00', 0, 1, NULL, 1226, 6, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4328, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 19, '2000-01-01 18:18:30', 0, 1, NULL, 1226, 35, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4329, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 20, '2000-01-01 18:17:30', 0, 1, NULL, 1226, 34, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4330, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 21, '2000-01-01 18:13:00', 0, 1, NULL, 1226, 33, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4331, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 22, '2000-01-01 18:12:30', 0, 1, NULL, 1226, 32, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4332, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 23, '2000-01-01 18:03:30', 0, 1, NULL, 1226, 28, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4333, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 24, '2000-01-01 17:50:30', 0, 1, NULL, 1226, 27, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4334, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 25, '2000-01-01 17:24:00', 0, 1, NULL, 1226, 26, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4335, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 26, '2000-01-01 17:01:00', 0, 1, NULL, 1226, 25, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1227, 2, '2016-05-21', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15334, 101, 2, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1228, 3, '2016-05-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15334, 101, 2, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 'FINALI', 1, 1);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1229, 4, '2016-05-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15334, 101, 2, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 'FINALI', 1, 2);


-- 14335-palermopinacattarinich TROFEO PINA CATTARINICH 2015-05-24
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15335, 'TROFEO PINA CATTARINICH', NULL, 0, 1, NULL, NULL, NULL, 'Polisportiva Nadir', 0, 0, 0, 2, '?', 6, 152, 2, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 1, '2016-05-22', 'palermopinacattarinich', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1230, 1, '2016-05-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15335, 80, 2, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4336, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1230, 12, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4337, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 2, '2000-01-01 08:16:00', 0, 1, NULL, 1230, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4338, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 3, '2000-01-01 08:52:00', 0, 1, NULL, 1230, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4339, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 4, '2000-01-01 09:38:00', 0, 1, NULL, 1230, 17, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4340, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 5, '2000-01-01 10:10:00', 0, 1, NULL, 1230, 24, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4341, '2015-11-04 11:06:00', '2015-11-04 11:06:00', 6, '2000-01-01 10:22:00', 0, 1, NULL, 1230, 5, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4342, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 7, '2000-01-01 10:58:00', 0, 1, NULL, 1230, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4343, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 8, '2000-01-01 11:40:00', 0, 1, NULL, 1230, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4344, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 9, '2000-01-01 12:16:00', 0, 1, NULL, 1230, 19, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1231, 2, '2016-05-22', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15335, 80, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 'FINALI', 1, 2);


-- 14336-caldierodelleterme TROFEO DELLE TERME 2015-05-30
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15336, 'TROFEO DELLE TERME', NULL, 0, 1, NULL, NULL, NULL, 'Nuoto Giunone', 0, 0, 0, 2, '?', 25, 152, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 1, '2016-05-28', 'caldierodelleterme', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1232, 1, '2016-05-28', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15336, 137, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4345, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 1, '2000-01-01 08:04:00', 0, 1, NULL, 1232, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4346, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 2, '2000-01-01 08:44:00', 0, 1, NULL, 1232, 12, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4347, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 3, '2000-01-01 09:16:00', 0, 1, NULL, 1232, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4348, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 4, '2000-01-01 09:58:00', 0, 1, NULL, 1232, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4349, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 5, '2000-01-01 10:40:00', 0, 1, NULL, 1232, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4350, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 6, '2000-01-01 11:18:00', 0, 1, NULL, 1232, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4351, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 7, '2000-01-01 12:00:00', 0, 1, NULL, 1232, 2, 3, 1, 1, 0);


-- 14337-gallarate MEETING DELLA CITTÀ 2015-05-30
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15337, 'MEETING DELLA CITTÀ', NULL, 0, 1, NULL, NULL, NULL, 'NC Gallarate', 0, 0, 0, 2, '?', 23, 152, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 1, '2016-05-28', 'gallarate', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1233, 1, '2016-05-28', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15337, 141, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4352, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1233, 12, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4353, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 2, '2000-01-01 08:38:00', 0, 1, NULL, 1233, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4354, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 3, '2000-01-01 09:20:00', 0, 1, NULL, 1233, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4355, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 4, '2000-01-01 10:00:00', 0, 1, NULL, 1233, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4356, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 5, '2000-01-01 10:36:00', 0, 1, NULL, 1233, 5, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4357, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 6, '2000-01-01 11:12:00', 0, 1, NULL, 1233, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4358, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 7, '2000-01-01 11:58:00', 0, 1, NULL, 1233, 2, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1234, 2, '2016-05-28', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15337, 141, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 'FINALI', 1, 2);


-- 14338-canosadipugliasottolestelle TROFEO SOTTO LE STELLE 2015-05-30
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15338, 'TROFEO SOTTO LE STELLE', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 8, 152, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 1, '2016-05-28', 'canosadipugliasottolestelle', '2015', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1235, 1, '2016-05-28', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15338, 181, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 'FINALI', 1, 1);


-- 14339-romaflaminiosg MEETING FLAMINIO SG 2015-05-31
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15339, 'MEETING FLAMINIO SG', NULL, 0, 1, NULL, NULL, NULL, 'Flaminio SC', 0, 0, 0, 2, '?', 15, 152, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 1, '2016-05-29', 'romaflaminiosg', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1236, 1, '2016-05-29', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15339, 182, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4359, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1236, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4360, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 2, '2000-01-01 08:40:00', 0, 1, NULL, 1236, 12, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4361, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 3, '2000-01-01 09:10:00', 0, 1, NULL, 1236, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4362, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 4, '2000-01-01 09:56:00', 0, 1, NULL, 1236, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4363, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 5, '2000-01-01 10:40:00', 0, 1, NULL, 1236, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4364, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 6, '2000-01-01 11:24:00', 0, 1, NULL, 1236, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4365, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 7, '2000-01-01 12:08:00', 0, 1, NULL, 1236, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4366, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 8, '2000-01-01 12:50:00', 0, 1, NULL, 1236, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4367, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 9, '2000-01-01 13:40:00', 0, 1, NULL, 1236, 2, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1237, 2, '2016-05-29', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15339, 182, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 'FINALI', 1, 2);


-- 14340-nocioltre TROFEO OLTRE' 2015-05-31
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15340, 'TROFEO OLTRE\'', NULL, 0, 1, NULL, NULL, NULL, 'OTRE S.S.D.a.R.L', 0, 0, 0, 2, '?', 1, 152, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 1, '2016-05-29', 'nocioltre', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1238, 1, '2016-05-29', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15340, 183, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4368, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1238, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4369, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 2, '2000-01-01 08:30:00', 0, 1, NULL, 1238, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4370, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 3, '2000-01-01 09:04:00', 0, 1, NULL, 1238, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4371, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 4, '2000-01-01 09:42:00', 0, 1, NULL, 1238, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4372, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 5, '2000-01-01 10:16:00', 0, 1, NULL, 1238, 5, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4373, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 6, '2000-01-01 10:50:00', 0, 1, NULL, 1238, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4374, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 7, '2000-01-01 11:22:00', 0, 1, NULL, 1238, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4375, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 8, '2000-01-01 11:54:00', 0, 1, NULL, 1238, 2, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1239, 2, '2016-05-29', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15340, 183, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 'FINALI', 1, 2);


-- 14341-spoletodeiduemondi TROFEO DEI DUE MONDI 2015-06-02
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15341, 'TROFEO DEI DUE MONDI', NULL, 0, 1, NULL, NULL, NULL, 'Delfino Spoleto', 0, 0, 0, 2, '?', 1, 152, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 1, '2016-05-31', 'spoletodeiduemondi', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1240, 1, '2016-05-31', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15341, 184, 2, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4376, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1240, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4377, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 2, '2000-01-01 08:14:00', 0, 1, NULL, 1240, 12, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4378, '2015-11-04 11:06:01', '2015-11-04 11:06:01', 3, '2000-01-01 08:28:00', 0, 1, NULL, 1240, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4379, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 4, '2000-01-01 08:56:00', 0, 1, NULL, 1240, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4380, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 5, '2000-01-01 09:24:00', 0, 1, NULL, 1240, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4381, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 6, '2000-01-01 09:40:00', 0, 1, NULL, 1240, 4, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4382, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 7, '2000-01-01 10:06:00', 0, 1, NULL, 1240, 5, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4383, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 8, '2000-01-01 10:30:00', 0, 1, NULL, 1240, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4384, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 9, '2000-01-01 10:48:00', 0, 1, NULL, 1240, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4385, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 10, '2000-01-01 11:08:00', 0, 1, NULL, 1240, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4386, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 11, '2000-01-01 11:40:00', 0, 1, NULL, 1240, 2, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1241, 2, '2016-05-31', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15341, 184, 2, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 'FINALI', 1, 2);


-- 14342-trentonuotatoritrentini TROFEO NUOTATORI TRENTINI 2015-06-06
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15342, 'TROFEO NUOTATORI TRENTINI', NULL, 0, 1, NULL, NULL, NULL, 'Nuotatori Trentini a.s.d.', 0, 0, 0, 2, '?', 1, 152, 2, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 1, '2016-06-04', 'trentonuotatoritrentini', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1242, 1, '2016-06-04', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15342, 185, 2, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4387, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1242, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4388, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 2, '2000-01-01 08:22:00', 0, 1, NULL, 1242, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4389, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 3, '2000-01-01 09:02:00', 0, 1, NULL, 1242, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4390, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 4, '2000-01-01 09:18:00', 0, 1, NULL, 1242, 21, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4391, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 5, '2000-01-01 09:42:00', 0, 1, NULL, 1242, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4392, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 6, '2000-01-01 10:14:00', 0, 1, NULL, 1242, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4393, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 7, '2000-01-01 10:42:00', 0, 1, NULL, 1242, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4394, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 8, '2000-01-01 11:16:00', 0, 1, NULL, 1242, 2, 3, 1, 1, 0);


-- 14343-padova CITTÀ DELLA SPERANZA 2015-06-06
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15343, 'CITTÀ DELLA SPERANZA', NULL, 0, 1, NULL, NULL, NULL, 'Nuotatori Padovani', 0, 0, 0, 2, '?', 1, 152, 2, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 1, '2016-06-04', 'padova', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1243, 1, '2016-06-04', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15343, 186, 2, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4395, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1243, 12, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4396, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 2, '2000-01-01 08:32:00', 0, 1, NULL, 1243, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4397, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 3, '2000-01-01 09:10:00', 0, 1, NULL, 1243, 17, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4398, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 4, '2000-01-01 09:42:00', 0, 1, NULL, 1243, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4399, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 5, '2000-01-01 10:12:00', 0, 1, NULL, 1243, 4, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4400, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 6, '2000-01-01 10:48:00', 0, 1, NULL, 1243, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4401, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 7, '2000-01-01 11:26:00', 0, 1, NULL, 1243, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4402, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 8, '2000-01-01 12:02:00', 0, 1, NULL, 1243, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4403, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 9, '2000-01-01 12:34:00', 0, 1, NULL, 1243, 2, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1244, 2, '2016-06-04', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15343, 186, 2, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 'FINALI', 1, 2);


-- 14344-cittadicastelloitalogalluzzi TROFEO ITALO GALLUZZI 2015-06-06
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15344, 'TROFEO ITALO GALLUZZI', NULL, 0, 1, NULL, NULL, NULL, 'Polisport', 0, 0, 0, 2, '?', 30, 152, 2, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 1, '2016-06-04', 'cittadicastelloitalogalluzzi', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1245, 1, '2016-06-04', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15344, 142, 2, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4404, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1245, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4405, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 2, '2000-01-01 08:34:00', 0, 1, NULL, 1245, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4406, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 3, '2000-01-01 09:10:00', 0, 1, NULL, 1245, 7, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4407, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 4, '2000-01-01 09:46:00', 0, 1, NULL, 1245, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4408, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 5, '2000-01-01 10:14:00', 0, 1, NULL, 1245, 4, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4409, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 6, '2000-01-01 10:46:00', 0, 1, NULL, 1245, 24, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4410, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 7, '2000-01-01 11:02:00', 0, 1, NULL, 1245, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4411, '2015-11-04 11:06:02', '2015-11-04 11:06:02', 8, '2000-01-01 11:36:00', 0, 1, NULL, 1245, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4412, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 9, '2000-01-01 12:08:00', 0, 1, NULL, 1245, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4413, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 10, '2000-01-01 12:44:00', 0, 1, NULL, 1245, 2, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4414, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 11, '2000-01-01 13:20:30', 0, 1, NULL, 1245, 26, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4415, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 12, '2000-01-01 13:17:30', 0, 1, NULL, 1245, 25, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1246, 2, '2016-06-04', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15344, 142, 2, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 'FINALI', 1, 2);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1247, 3, '2016-06-04', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15344, 142, 2, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 'FINALI', 1, 1);


-- 14345-comognovaticittadicomo MEMORIAL G NOVATI CITTA' DI COMO 2015-06-07
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15345, 'MEMORIAL G NOVATI CITTA\' DI COMO', NULL, 0, 1, NULL, NULL, NULL, 'ICE CLUB COMO', 0, 0, 0, 2, '?', 7, 152, 2, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 1, '2016-06-05', 'comognovaticittadicomo', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1248, 1, '2016-06-05', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15345, 143, 2, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4416, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1248, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4417, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 2, '2000-01-01 08:44:00', 0, 1, NULL, 1248, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4418, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 3, '2000-01-01 09:22:00', 0, 1, NULL, 1248, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4419, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 4, '2000-01-01 10:04:00', 0, 1, NULL, 1248, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4420, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 5, '2000-01-01 10:36:00', 0, 1, NULL, 1248, 4, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4421, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 6, '2000-01-01 11:14:00', 0, 1, NULL, 1248, 24, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4422, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 7, '2000-01-01 11:36:00', 0, 1, NULL, 1248, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4423, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 8, '2000-01-01 12:10:00', 0, 1, NULL, 1248, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4424, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 9, '2000-01-01 12:52:00', 0, 1, NULL, 1248, 2, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4425, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 10, '2000-01-01 13:30:30', 0, 1, NULL, 1248, 26, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1249, 2, '2016-06-05', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15345, 143, 2, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 'FINALI', 1, 2);


-- 14346-romaromanuotomaster TROFEO ROMA NUOTO MASTER 2015-06-07
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15346, 'TROFEO ROMA NUOTO MASTER', NULL, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 2, '?', 1, 152, 2, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 1, '2016-06-05', 'romaromanuotomaster', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1250, 1, '2016-06-05', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15346, 187, 2, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4426, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1250, 17, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4427, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 2, '2000-01-01 08:40:00', 0, 1, NULL, 1250, 13, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4428, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 3, '2000-01-01 09:02:00', 0, 1, NULL, 1250, 21, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4429, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 4, '2000-01-01 09:40:00', 0, 1, NULL, 1250, 4, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4430, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 5, '2000-01-01 10:24:00', 0, 1, NULL, 1250, 24, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4431, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 6, '2000-01-01 10:48:00', 0, 1, NULL, 1250, 5, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4432, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 7, '2000-01-01 11:26:00', 0, 1, NULL, 1250, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4433, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 8, '2000-01-01 12:14:00', 0, 1, NULL, 1250, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4434, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 9, '2000-01-01 12:52:00', 0, 1, NULL, 1250, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4435, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 10, '2000-01-01 13:34:00', 0, 1, NULL, 1250, 2, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1251, 2, '2016-06-05', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15346, 187, 2, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 'FINALI', 1, 2);


-- 14347-cataniadellaregione TROFEO DELLA REGIONE 2015-06-07
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15347, 'TROFEO DELLA REGIONE', NULL, 0, 1, NULL, NULL, NULL, 'Sicilia Nuoto', 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 1, '2016-06-05', 'cataniadellaregione', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1252, 1, '2016-06-05', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15347, 188, 2, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4436, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1252, 16, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4437, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 2, '2000-01-01 08:36:00', 0, 1, NULL, 1252, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4438, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 3, '2000-01-01 09:12:00', 0, 1, NULL, 1252, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4439, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 4, '2000-01-01 09:44:00', 0, 1, NULL, 1252, 13, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4440, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 5, '2000-01-01 09:48:00', 0, 1, NULL, 1252, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4441, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 6, '2000-01-01 10:16:00', 0, 1, NULL, 1252, 21, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4442, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 7, '2000-01-01 10:40:00', 0, 1, NULL, 1252, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4443, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 8, '2000-01-01 11:16:00', 0, 1, NULL, 1252, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4444, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 9, '2000-01-01 11:50:00', 0, 1, NULL, 1252, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4445, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 10, '2000-01-01 12:28:00', 0, 1, NULL, 1252, 2, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4446, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 11, '2000-01-01 13:06:30', 0, 1, NULL, 1252, 32, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4447, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 12, '2000-01-01 13:05:30', 0, 1, NULL, 1252, 26, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1253, 2, '2016-06-05', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15347, 188, 2, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 'FINALI', 1, 2);


-- 14348-pietrelcinajollynuoto TROFEO JOLLY NUOTO 2015-06-07
INSERT INTO `meetings` (`id`, `description`, `entry_deadline`, `has_warm_up_pool`, `is_under_25_admitted`, `reference_phone`, `reference_e_mail`, `reference_name`, `notes`, `has_invitation`, `has_start_list`, `are_results_acquired`, `max_individual_events`, `configuration_file`, `edition`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `header_date`, `code`, `header_year`, `max_individual_events_per_session`, `is_out_of_season`, `edition_type_id`, `timing_type_id`, `individual_score_computation_type_id`, `relay_score_computation_type_id`, `team_score_computation_type_id`, `meeting_score_computation_type_id`, `invitation`, `is_confirmed`)
  VALUES (15348, 'TROFEO JOLLY NUOTO', NULL, 0, 1, NULL, NULL, NULL, 'Jolly Nuoto Club', 0, 0, 0, 2, '?', 2, 152, 2, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 1, '2016-06-05', 'pietrelcinajollynuoto', '2016', 0, 0, 2, 3, 1, 1, 12, 1, NULL, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1254, 1, '2016-06-05', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15348, 189, 2, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 'FINALI', 1, 1);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4448, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1254, 12, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4449, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 2, '2000-01-01 08:14:00', 0, 1, NULL, 1254, 22, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4450, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 3, '2000-01-01 08:36:00', 0, 1, NULL, 1254, 20, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4451, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 4, '2000-01-01 08:48:00', 0, 1, NULL, 1254, 3, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4452, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 5, '2000-01-01 09:12:00', 0, 1, NULL, 1254, 23, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4453, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 6, '2000-01-01 09:32:00', 0, 1, NULL, 1254, 21, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4454, '2015-11-04 11:06:03', '2015-11-04 11:06:03', 7, '2000-01-01 09:54:00', 0, 1, NULL, 1254, 4, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4455, '2015-11-04 11:06:04', '2015-11-04 11:06:04', 8, '2000-01-01 10:20:00', 0, 1, NULL, 1254, 24, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4456, '2015-11-04 11:06:04', '2015-11-04 11:06:04', 9, '2000-01-01 10:34:00', 0, 1, NULL, 1254, 5, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4457, '2015-11-04 11:06:04', '2015-11-04 11:06:04', 10, '2000-01-01 11:00:00', 0, 1, NULL, 1254, 15, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4458, '2015-11-04 11:06:04', '2015-11-04 11:06:04', 11, '2000-01-01 11:32:00', 0, 1, NULL, 1254, 11, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4459, '2015-11-04 11:06:04', '2015-11-04 11:06:04', 12, '2000-01-01 11:54:00', 0, 1, NULL, 1254, 19, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4460, '2015-11-04 11:06:04', '2015-11-04 11:06:04', 13, '2000-01-01 12:26:00', 0, 1, NULL, 1254, 2, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4461, '2015-11-04 11:06:04', '2015-11-04 11:06:04', 14, '2000-01-01 12:56:58', 0, 1, NULL, 1254, 32, 3, 1, 1, 0);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4462, '2015-11-04 11:06:04', '2015-11-04 11:06:04', 15, '2000-01-01 12:55:02', 0, 1, NULL, 1254, 26, 3, 1, 1, 0);

INSERT INTO `meeting_sessions` (`id`, `session_order`, `scheduled_date`, `warm_up_time`, `begin_time`, `notes`, `meeting_id`, `swimming_pool_id`, `user_id`, `created_at`, `updated_at`, `description`, `is_autofilled`, `day_part_type_id`)
  VALUES (1255, 2, '2016-06-05', '2000-01-01 00:00:00', '2000-01-01 00:00:00', '', 15348, 189, 2, '2015-11-04 11:06:04', '2015-11-04 11:06:04', 'FINALI', 1, 2);



-- 152-Circuito italiano supermaster FIN 2015/2016 duplication script ended
