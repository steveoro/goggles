-- *** SQL Diff file for ris20150222csiprova3.csv ***
-- Timestamp: 201502241340
INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (13535, 'PIRAZZOLI', 'ELISA', 1984, NULL, NULL, NULL, '', NULL, 2, 1, '2015-02-24 13:41:57', '2015-02-24 13:41:57', 'PIRAZZOLI ELISA', 0);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`)
  VALUES (17336, '?', 141, 13535, 17, 824, 1, '2015-02-24 13:41:57', '2015-02-24 13:41:57', 5, 493);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2407, '2015-02-24 13:41:57', '2015-02-24 13:41:57', NULL, NULL, NULL, NULL, 14018, 1197, 14, 492, 17326, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2408, '2015-02-24 13:41:57', '2015-02-24 13:41:57', NULL, NULL, NULL, NULL, 14014, 1197, 14, 492, 17326, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2409, '2015-02-24 13:41:57', '2015-02-24 13:41:57', NULL, NULL, NULL, NULL, 14009, 685, 11, 491, 8357, NULL, 1, 3, 40, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2410, '2015-02-24 13:41:57', '2015-02-24 13:41:57', NULL, NULL, NULL, NULL, 14011, 13535, 17, 493, 17336, NULL, 1, 1, 32, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2411, '2015-02-24 13:41:57', '2015-02-24 13:41:57', NULL, NULL, NULL, NULL, 14004, 1454, 17, 493, 8205, NULL, 1, 0, 35, 50, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2412, '2015-02-24 13:41:57', '2015-02-24 13:41:57', NULL, NULL, NULL, NULL, 14053, 4855, 290, 499, 8277, NULL, 1, 0, 40, 80, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2413, '2015-02-24 13:41:57', '2015-02-24 13:41:57', NULL, NULL, NULL, NULL, 13992, 4855, 290, 499, 8277, NULL, 1, 1, 36, 60, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2414, '2015-02-24 13:41:58', '2015-02-24 13:41:58', NULL, NULL, NULL, NULL, 13995, 4852, 290, 499, 8165, NULL, 1, 3, 5, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2415, '2015-02-24 13:41:58', '2015-02-24 13:41:58', NULL, NULL, NULL, NULL, 13996, 4852, 290, 499, 8165, NULL, 1, 0, 33, 50, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2416, '2015-02-24 13:41:58', '2015-02-24 13:41:58', NULL, NULL, NULL, NULL, 14034, 4850, 290, 499, 8175, NULL, 1, 0, 31, 50, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2417, '2015-02-24 13:41:58', '2015-02-24 13:41:58', NULL, NULL, NULL, NULL, 14047, 1363, 32, 495, 8253, NULL, 1, 0, 50, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2418, '2015-02-24 13:41:58', '2015-02-24 13:41:58', NULL, NULL, NULL, NULL, 14017, 1303, 32, 495, 8360, NULL, 1, 0, 38, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2419, '2015-02-24 13:41:58', '2015-02-24 13:41:58', NULL, NULL, NULL, NULL, 14016, 1303, 32, 495, 8360, NULL, 1, 0, 45, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2420, '2015-02-24 13:41:58', '2015-02-24 13:41:58', NULL, NULL, NULL, NULL, 13989, 4813, 39, 498, 8260, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2421, '2015-02-24 13:41:58', '2015-02-24 13:41:58', NULL, NULL, NULL, NULL, 14036, 1568, 39, 498, 8267, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2422, '2015-02-24 13:41:58', '2015-02-24 13:41:58', NULL, NULL, NULL, NULL, 14018, 3988, 39, 498, 8344, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (2423, '2015-02-24 13:41:58', '2015-02-24 13:41:58', NULL, NULL, NULL, NULL, 13991, 4828, 39, 498, 8145, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149920, 6, 1, 0, 0, 0.0, 75.0, 0, 48, 10, 13989, 1692, 10, 8269, 1, '2015-02-24 13:41:59', '2015-02-24 13:41:59', NULL, 0.0, 0.0, 0.0, 490);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149921, 5, 1, 0, 0, 0.0, 80.0, 0, 53, 60, 13991, 1692, 10, 8269, 1, '2015-02-24 13:41:59', '2015-02-24 13:41:59', NULL, 0.0, 0.0, 0.0, 490);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149922, 6, 1, 0, 0, 0.0, 75.0, 1, 38, 50, 13994, 1709, 21, 8266, 1, '2015-02-24 13:41:59', '2015-02-24 13:41:59', NULL, 0.0, 0.0, 0.0, 497);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149923, 1, 1, 0, 0, 0.0, 100.0, 2, 20, 70, 13995, 4806, 21, 8154, 1, '2015-02-24 13:41:59', '2015-02-24 13:41:59', NULL, 0.0, 0.0, 0.0, 497);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149924, 4, 1, 0, 0, 0.0, 85.0, 0, 31, 30, 13996, 4807, 21, 8278, 1, '2015-02-24 13:41:59', '2015-02-24 13:41:59', NULL, 0.0, 0.0, 0.0, 497);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149925, 8, 1, 0, 0, 0.0, 65.0, 1, 48, 10, 13997, 11737, 21, 17308, 1, '2015-02-24 13:41:59', '2015-02-24 13:41:59', NULL, 0.0, 0.0, 0.0, 497);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149926, 8, 1, 0, 0, 0.0, 65.0, 0, 50, 20, 13999, 1709, 21, 8266, 1, '2015-02-24 13:41:59', '2015-02-24 13:41:59', NULL, 0.0, 0.0, 0.0, 497);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149927, 1, 1, 0, 0, 0.0, 100.0, 0, 32, 40, 14000, 4806, 21, 8154, 1, '2015-02-24 13:41:59', '2015-02-24 13:41:59', NULL, 0.0, 0.0, 0.0, 497);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149928, 3, 1, 0, 0, 0.0, 90.0, 0, 35, 90, 14000, 4807, 21, 8278, 1, '2015-02-24 13:41:59', '2015-02-24 13:41:59', NULL, 0.0, 0.0, 0.0, 497);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149929, 6, 1, 0, 0, 0.0, 75.0, 0, 54, 80, 13991, 11737, 21, 17308, 1, '2015-02-24 13:42:00', '2015-02-24 13:42:00', NULL, 0.0, 0.0, 0.0, 497);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149930, 3, 1, 0, 0, 0.0, 90.0, 0, 30, 10, 13996, 1308, 32, 8156, 1, '2015-02-24 13:42:00', '2015-02-24 13:42:00', NULL, 0.0, 0.0, 0.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149931, 1, 1, 0, 0, 0.0, 100.0, 0, 30, 40, 14001, 1612, 32, 8209, 1, '2015-02-24 13:42:00', '2015-02-24 13:42:00', NULL, 0.0, 0.0, 0.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149932, 5, 1, 0, 0, 0.0, 80.0, 0, 33, 50, 14001, 1218, 32, 8293, 1, '2015-02-24 13:42:00', '2015-02-24 13:42:00', NULL, 0.0, 0.0, 0.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149933, 9, 1, 0, 0, 0.0, 60.0, 0, 44, 10, 14002, 1270, 32, 8371, 1, '2015-02-24 13:42:00', '2015-02-24 13:42:00', NULL, 0.0, 0.0, 0.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149934, 3, 1, 0, 0, 0.0, 90.0, 0, 30, 70, 14001, 1187, 32, 8298, 1, '2015-02-24 13:42:00', '2015-02-24 13:42:00', NULL, 0.0, 0.0, 0.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149935, 7, 1, 0, 0, 0.0, 70.0, 0, 31, 90, 13996, 1531, 32, 8334, 1, '2015-02-24 13:42:00', '2015-02-24 13:42:00', NULL, 0.0, 0.0, 0.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149936, 3, 1, 0, 0, 0.0, 90.0, 2, 29, 30, 13995, 1308, 32, 8156, 1, '2015-02-24 13:42:00', '2015-02-24 13:42:00', NULL, 0.0, 0.0, 0.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149937, 9, 1, 0, 0, 0.0, 60.0, 0, 41, 0, 14004, 1612, 32, 8209, 1, '2015-02-24 13:42:00', '2015-02-24 13:42:00', NULL, 0.0, 0.0, 0.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149938, 4, 1, 0, 0, 0.0, 85.0, 0, 36, 30, 14004, 1218, 32, 8293, 1, '2015-02-24 13:42:00', '2015-02-24 13:42:00', NULL, 0.0, 0.0, 0.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149939, 4, 1, 0, 0, 0.0, 85.0, 1, 19, 40, 14007, 1187, 32, 8298, 1, '2015-02-24 13:42:01', '2015-02-24 13:42:01', NULL, 0.0, 0.0, 0.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149940, 3, 1, 0, 0, 0.0, 90.0, 1, 18, 30, 14008, 1531, 32, 8334, 1, '2015-02-24 13:42:01', '2015-02-24 13:42:01', NULL, 0.0, 0.0, 0.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149941, 1, 1, 0, 0, 0.0, 100.0, 0, 39, 10, 14009, 4838, 5, 8218, 1, '2015-02-24 13:42:01', '2015-02-24 13:42:01', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149942, 1, 1, 0, 0, 0.0, 100.0, 0, 45, 40, 14010, 101, 5, 8230, 1, '2015-02-24 13:42:01', '2015-02-24 13:42:01', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149943, 3, 1, 0, 0, 0.0, 90.0, 0, 45, 50, 13998, 843, 5, 8420, 1, '2015-02-24 13:42:01', '2015-02-24 13:42:01', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149944, 3, 1, 0, 0, 0.0, 90.0, 1, 26, 40, 13993, 822, 5, 8179, 1, '2015-02-24 13:42:01', '2015-02-24 13:42:01', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149945, 2, 1, 0, 0, 0.0, 95.0, 0, 42, 40, 14009, 966, 5, 8356, 1, '2015-02-24 13:42:01', '2015-02-24 13:42:01', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149946, 1, 1, 0, 0, 0.0, 100.0, 0, 43, 10, 14012, 136, 5, 8228, 1, '2015-02-24 13:42:01', '2015-02-24 13:42:01', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149947, 1, 1, 0, 0, 0.0, 100.0, 1, 26, 20, 14013, 92, 5, 8219, 1, '2015-02-24 13:42:01', '2015-02-24 13:42:01', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149948, 3, 1, 0, 0, 0.0, 90.0, 1, 10, 60, 14014, 1403, 5, 8189, 1, '2015-02-24 13:42:02', '2015-02-24 13:42:02', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149949, 7, 1, 0, 0, 0.0, 70.0, 0, 34, 90, 14001, 769, 5, 8355, 1, '2015-02-24 13:42:02', '2015-02-24 13:42:02', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149950, 6, 1, 0, 0, 0.0, 75.0, 1, 23, 0, 14007, 276, 5, 8421, 1, '2015-02-24 13:42:02', '2015-02-24 13:42:02', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149951, 6, 1, 0, 0, 0.0, 75.0, 0, 35, 50, 14015, 40, 5, 8236, 1, '2015-02-24 13:42:02', '2015-02-24 13:42:02', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149952, 6, 1, 0, 0, 0.0, 75.0, 0, 31, 50, 13996, 1662, 5, 8275, 1, '2015-02-24 13:42:02', '2015-02-24 13:42:02', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149953, 5, 1, 0, 0, 0.0, 80.0, 0, 40, 10, 14016, 4871, 5, 8422, 1, '2015-02-24 13:42:02', '2015-02-24 13:42:02', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149954, 8, 1, 0, 0, 0.0, 65.0, 0, 40, 0, 14004, 768, 5, 8295, 1, '2015-02-24 13:42:02', '2015-02-24 13:42:02', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149955, 5, 1, 0, 0, 0.0, 80.0, 0, 36, 70, 14017, 124, 5, 8227, 1, '2015-02-24 13:42:02', '2015-02-24 13:42:02', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149956, 2, 1, 0, 0, 0.0, 95.0, 0, 32, 60, 14018, 960, 5, 8192, 1, '2015-02-24 13:42:02', '2015-02-24 13:42:02', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149957, 5, 1, 0, 0, 0.0, 80.0, 0, 34, 50, 14015, 1564, 5, 8234, 1, '2015-02-24 13:42:03', '2015-02-24 13:42:03', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149958, 5, 1, 0, 0, 0.0, 80.0, 0, 34, 70, 14018, 1247, 5, 8345, 1, '2015-02-24 13:42:03', '2015-02-24 13:42:03', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149959, 5, 1, 0, 0, 0.0, 80.0, 1, 22, 70, 14007, 720, 5, 8208, 1, '2015-02-24 13:42:03', '2015-02-24 13:42:03', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149960, 3, 1, 0, 0, 0.0, 90.0, 0, 33, 40, 14015, 1160, 5, 8310, 1, '2015-02-24 13:42:03', '2015-02-24 13:42:03', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149961, 4, 1, 0, 0, 0.0, 85.0, 0, 41, 80, 14019, 1750, 5, 17309, 1, '2015-02-24 13:42:03', '2015-02-24 13:42:03', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149962, 2, 1, 0, 0, 0.0, 95.0, 3, 17, 70, 14020, 4838, 5, 8218, 1, '2015-02-24 13:42:03', '2015-02-24 13:42:03', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149963, 2, 1, 0, 0, 0.0, 95.0, 1, 39, 30, 14021, 101, 5, 8230, 1, '2015-02-24 13:42:03', '2015-02-24 13:42:03', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149964, 6, 1, 0, 0, 0.0, 75.0, 3, 20, 80, 14022, 843, 5, 8420, 1, '2015-02-24 13:42:03', '2015-02-24 13:42:03', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149965, 4, 1, 0, 0, 0.0, 85.0, 3, 5, 90, 14022, 822, 5, 8179, 1, '2015-02-24 13:42:03', '2015-02-24 13:42:03', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149966, 3, 1, 0, 0, 0.0, 90.0, 1, 34, 0, 14013, 966, 5, 8356, 1, '2015-02-24 13:42:03', '2015-02-24 13:42:03', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149967, 1, 1, 0, 0, 0.0, 100.0, 3, 7, 40, 14024, 136, 5, 8228, 1, '2015-02-24 13:42:04', '2015-02-24 13:42:04', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149968, 1, 1, 0, 0, 0.0, 100.0, 3, 17, 10, 14020, 92, 5, 8219, 1, '2015-02-24 13:42:04', '2015-02-24 13:42:04', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149969, 2, 1, 0, 0, 0.0, 95.0, 2, 38, 70, 14025, 1403, 5, 8189, 1, '2015-02-24 13:42:04', '2015-02-24 13:42:04', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149970, 8, 1, 0, 0, 0.0, 65.0, 1, 30, 50, 14007, 769, 5, 8355, 1, '2015-02-24 13:42:04', '2015-02-24 13:42:04', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149971, 12, 1, 0, 0, 0.0, 45.0, 0, 44, 0, 14004, 276, 5, 8421, 1, '2015-02-24 13:42:04', '2015-02-24 13:42:04', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149972, 2, 1, 0, 0, 0.0, 95.0, 1, 18, 60, 14026, 40, 5, 8236, 1, '2015-02-24 13:42:04', '2015-02-24 13:42:04', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149973, 4, 1, 0, 0, 0.0, 85.0, 2, 43, 60, 13995, 1662, 5, 8275, 1, '2015-02-24 13:42:04', '2015-02-24 13:42:04', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149974, 2, 1, 0, 0, 0.0, 95.0, 2, 56, 90, 14027, 4871, 5, 8422, 1, '2015-02-24 13:42:04', '2015-02-24 13:42:04', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149975, 7, 1, 0, 0, 0.0, 70.0, 3, 6, 60, 14028, 768, 5, 8295, 1, '2015-02-24 13:42:04', '2015-02-24 13:42:04', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149976, 6, 1, 0, 0, 0.0, 75.0, 0, 40, 40, 14016, 124, 5, 8227, 1, '2015-02-24 13:42:05', '2015-02-24 13:42:05', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149977, 4, 1, 0, 0, 0.0, 85.0, 2, 49, 70, 14025, 960, 5, 8192, 1, '2015-02-24 13:42:05', '2015-02-24 13:42:05', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149978, 3, 1, 0, 0, 0.0, 90.0, 1, 33, 80, 14026, 1564, 5, 8234, 1, '2015-02-24 13:42:05', '2015-02-24 13:42:05', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149979, 3, 1, 0, 0, 0.0, 90.0, 0, 41, 0, 14019, 1247, 5, 8345, 1, '2015-02-24 13:42:05', '2015-02-24 13:42:05', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149980, 5, 1, 0, 0, 0.0, 80.0, 2, 49, 0, 14028, 720, 5, 8208, 1, '2015-02-24 13:42:05', '2015-02-24 13:42:05', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149981, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 10, 14029, 1160, 5, 8310, 1, '2015-02-24 13:42:05', '2015-02-24 13:42:05', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149982, 6, 1, 0, 0, 0.0, 75.0, 0, 36, 70, 14018, 1750, 5, 17309, 1, '2015-02-24 13:42:05', '2015-02-24 13:42:05', NULL, 0.0, 0.0, 0.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149983, 3, 1, 0, 0, 0.0, 90.0, 1, 17, 10, 14030, 1462, 17, 8428, 1, '2015-02-24 13:42:05', '2015-02-24 13:42:05', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149984, 2, 1, 0, 0, 0.0, 95.0, 0, 32, 20, 13989, 11731, 17, 17310, 1, '2015-02-24 13:42:05', '2015-02-24 13:42:05', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149985, 5, 1, 0, 0, 0.0, 80.0, 0, 42, 20, 14003, 772, 17, 17311, 1, '2015-02-24 13:42:05', '2015-02-24 13:42:05', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149986, 4, 1, 0, 0, 0.0, 85.0, 1, 35, 90, 13994, 4863, 17, 8434, 1, '2015-02-24 13:42:06', '2015-02-24 13:42:06', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149987, 4, 1, 0, 0, 0.0, 85.0, 2, 38, 60, 14028, 1454, 17, 8205, 1, '2015-02-24 13:42:06', '2015-02-24 13:42:06', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149988, 17, 1, 0, 0, 0.0, 20.0, 0, 36, 60, 13996, 1813, 17, 8158, 1, '2015-02-24 13:42:06', '2015-02-24 13:42:06', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149989, 1, 1, 0, 0, 0.0, 100.0, 0, 59, 60, 14014, 1710, 17, 8186, 1, '2015-02-24 13:42:06', '2015-02-24 13:42:06', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149990, 15, 1, 0, 0, 0.0, 30.0, 0, 35, 60, 13996, 1717, 17, 8429, 1, '2015-02-24 13:42:06', '2015-02-24 13:42:06', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149991, 1, 1, 0, 0, 0.0, 100.0, 1, 18, 0, 14031, 4809, 17, 8255, 1, '2015-02-24 13:42:06', '2015-02-24 13:42:06', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149992, 2, 1, 0, 0, 0.0, 95.0, 1, 36, 10, 14032, 1088, 17, 8241, 1, '2015-02-24 13:42:06', '2015-02-24 13:42:06', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149993, 1, 1, 0, 0, 0.0, 100.0, 1, 3, 60, 14005, 2546, 17, 8245, 1, '2015-02-24 13:42:06', '2015-02-24 13:42:06', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149994, 16, 1, 0, 0, 0.0, 25.0, 0, 35, 80, 13996, 1830, 17, 8172, 1, '2015-02-24 13:42:06', '2015-02-24 13:42:06', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149995, 10, 1, 0, 0, 0.0, 55.0, 0, 40, 80, 14015, 754, 17, 8430, 1, '2015-02-24 13:42:06', '2015-02-24 13:42:06', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149996, 2, 1, 0, 0, 0.0, 95.0, 0, 35, 0, 14033, 961, 17, 8348, 1, '2015-02-24 13:42:07', '2015-02-24 13:42:07', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149997, 1, 1, 0, 0, 0.0, 100.0, 0, 30, 50, 13989, 1753, 17, 8140, 1, '2015-02-24 13:42:07', '2015-02-24 13:42:07', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149998, 2, 1, 0, 0, 0.0, 95.0, 0, 33, 30, 14015, 1436, 17, 8312, 1, '2015-02-24 13:42:07', '2015-02-24 13:42:07', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (149999, 4, 1, 0, 0, 0.0, 85.0, 0, 33, 90, 14015, 951, 17, 8311, 1, '2015-02-24 13:42:07', '2015-02-24 13:42:07', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150000, 4, 1, 0, 0, 0.0, 85.0, 0, 37, 30, 14034, 1135, 17, 8178, 1, '2015-02-24 13:42:07', '2015-02-24 13:42:07', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150001, 3, 1, 0, 0, 0.0, 90.0, 1, 33, 70, 14005, 1117, 17, 8247, 1, '2015-02-24 13:42:07', '2015-02-24 13:42:07', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150002, 3, 1, 0, 0, 0.0, 90.0, 0, 42, 90, 14009, 601, 17, 8221, 1, '2015-02-24 13:42:07', '2015-02-24 13:42:07', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150003, 1, 1, 0, 0, 0.0, 100.0, 1, 6, 20, 14007, 1060, 17, 8291, 1, '2015-02-24 13:42:07', '2015-02-24 13:42:07', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150004, 2, 1, 0, 0, 0.0, 95.0, 0, 30, 40, 14017, 582, 17, 8225, 1, '2015-02-24 13:42:07', '2015-02-24 13:42:07', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150005, 4, 1, 0, 0, 0.0, 85.0, 0, 33, 80, 14018, 1629, 17, 8188, 1, '2015-02-24 13:42:08', '2015-02-24 13:42:08', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150006, 5, 1, 0, 0, 0.0, 80.0, 0, 42, 90, 14006, 590, 17, 8254, 1, '2015-02-24 13:42:08', '2015-02-24 13:42:08', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150007, 4, 1, 0, 0, 0.0, 85.0, 1, 49, 30, 14005, 1318, 17, 8250, 1, '2015-02-24 13:42:08', '2015-02-24 13:42:08', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150008, 18, 1, 0, 0, 0.0, 15.0, 0, 41, 10, 13996, 1599, 17, 8171, 1, '2015-02-24 13:42:08', '2015-02-24 13:42:08', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150009, 6, 1, 0, 0, 0.0, 75.0, 0, 34, 80, 14001, 867, 17, 8431, 1, '2015-02-24 13:42:08', '2015-02-24 13:42:08', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150010, 1, 1, 0, 0, 0.0, 100.0, 0, 30, 70, 14035, 4019, 17, 8246, 1, '2015-02-24 13:42:08', '2015-02-24 13:42:08', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150011, 6, 1, 0, 0, 0.0, 75.0, 0, 47, 80, 14009, 580, 17, 8215, 1, '2015-02-24 13:42:08', '2015-02-24 13:42:08', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150012, 7, 1, 0, 0, 0.0, 70.0, 0, 40, 30, 14017, 1766, 17, 8304, 1, '2015-02-24 13:42:08', '2015-02-24 13:42:08', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150013, 6, 1, 0, 0, 0.0, 75.0, 0, 41, 90, 14036, 1639, 17, 8432, 1, '2015-02-24 13:42:08', '2015-02-24 13:42:08', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150014, 1, 1, 0, 0, 0.0, 100.0, 0, 30, 40, 14001, 1097, 17, 8292, 1, '2015-02-24 13:42:08', '2015-02-24 13:42:08', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150015, 6, 1, 0, 0, 0.0, 75.0, 0, 39, 0, 14033, 993, 17, 8197, 1, '2015-02-24 13:42:09', '2015-02-24 13:42:09', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150016, 3, 1, 0, 0, 0.0, 90.0, 0, 35, 0, 13989, 4810, 17, 8148, 1, '2015-02-24 13:42:09', '2015-02-24 13:42:09', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150017, 11, 1, 0, 0, 0.0, 50.0, 0, 40, 60, 14000, 1721, 17, 8160, 1, '2015-02-24 13:42:09', '2015-02-24 13:42:09', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150018, 3, 1, 0, 0, 0.0, 90.0, 1, 7, 10, 14007, 1102, 17, 8203, 1, '2015-02-24 13:42:09', '2015-02-24 13:42:09', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150019, 5, 1, 0, 0, 0.0, 80.0, 0, 41, 70, 14036, 1760, 17, 8433, 1, '2015-02-24 13:42:09', '2015-02-24 13:42:09', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150020, 6, 1, 0, 0, 0.0, 75.0, 0, 37, 90, 14035, 1116, 17, 8317, 1, '2015-02-24 13:42:09', '2015-02-24 13:42:09', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150021, 1, 1, 0, 0, 0.0, 100.0, 0, 29, 70, 14017, 1456, 17, 8359, 1, '2015-02-24 13:42:09', '2015-02-24 13:42:09', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150022, 8, 1, 0, 0, 0.0, 65.0, 0, 39, 20, 14001, 4812, 17, 8300, 1, '2015-02-24 13:42:09', '2015-02-24 13:42:09', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150023, 4, 1, 0, 0, 0.0, 85.0, 0, 48, 70, 14037, 1107, 17, 8258, 1, '2015-02-24 13:42:09', '2015-02-24 13:42:09', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150024, 4, 1, 0, 0, 0.0, 85.0, 0, 40, 0, 14016, 1392, 17, 17313, 1, '2015-02-24 13:42:10', '2015-02-24 13:42:10', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150025, 2, 1, 0, 0, 0.0, 95.0, 0, 43, 90, 13998, 967, 17, 17314, 1, '2015-02-24 13:42:10', '2015-02-24 13:42:10', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150026, 4, 1, 0, 0, 0.0, 85.0, 0, 38, 60, 14029, 1661, 17, 17316, 1, '2015-02-24 13:42:10', '2015-02-24 13:42:10', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150027, 1, 1, 0, 0, 0.0, 100.0, 0, 33, 90, 14033, 1535, 17, 17317, 1, '2015-02-24 13:42:10', '2015-02-24 13:42:10', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150028, 3, 1, 0, 0, 0.0, 90.0, 0, 34, 90, 14004, 1538, 17, 17318, 1, '2015-02-24 13:42:10', '2015-02-24 13:42:10', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150029, 1, 1, 0, 0, 0.0, 100.0, 0, 45, 40, 14038, 878, 17, 17319, 1, '2015-02-24 13:42:10', '2015-02-24 13:42:10', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150030, 7, 1, 0, 0, 0.0, 70.0, 0, 43, 20, 14006, 1138, 17, 17320, 1, '2015-02-24 13:42:10', '2015-02-24 13:42:10', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150031, 5, 1, 0, 0, 0.0, 80.0, 0, 43, 10, 14019, 11738, 17, 17321, 1, '2015-02-24 13:42:10', '2015-02-24 13:42:10', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150032, 3, 1, 0, 0, 0.0, 90.0, 2, 51, 0, 14039, 11733, 17, 17322, 1, '2015-02-24 13:42:10', '2015-02-24 13:42:10', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150033, 2, 1, 0, 0, 0.0, 95.0, 0, 36, 0, 14016, 1462, 17, 8428, 1, '2015-02-24 13:42:11', '2015-02-24 13:42:11', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150034, 3, 1, 0, 0, 0.0, 90.0, 1, 14, 60, 13997, 11731, 17, 17310, 1, '2015-02-24 13:42:11', '2015-02-24 13:42:11', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150035, 2, 1, 0, 0, 0.0, 95.0, 0, 41, 0, 14006, 772, 17, 17311, 1, '2015-02-24 13:42:11', '2015-02-24 13:42:11', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150036, 3, 1, 0, 0, 0.0, 90.0, 0, 46, 90, 13999, 4863, 17, 8434, 1, '2015-02-24 13:42:11', '2015-02-24 13:42:11', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150037, 6, 1, 0, 0, 0.0, 75.0, 0, 38, 0, 14000, 1813, 17, 8158, 1, '2015-02-24 13:42:11', '2015-02-24 13:42:11', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150038, 1, 1, 0, 0, 0.0, 100.0, 2, 18, 0, 14025, 1710, 17, 8186, 1, '2015-02-24 13:42:11', '2015-02-24 13:42:11', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150039, 4, 1, 0, 0, 0.0, 85.0, 1, 22, 20, 14008, 1717, 17, 8429, 1, '2015-02-24 13:42:11', '2015-02-24 13:42:11', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150040, 1, 1, 0, 0, 0.0, 100.0, 3, 2, 90, 14040, 4809, 17, 8255, 1, '2015-02-24 13:42:11', '2015-02-24 13:42:11', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150041, 2, 1, 0, 0, 0.0, 95.0, 3, 30, 90, 14041, 1088, 17, 8241, 1, '2015-02-24 13:42:11', '2015-02-24 13:42:11', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150042, 1, 1, 0, 0, 0.0, 100.0, 2, 20, 0, 14042, 2546, 17, 8245, 1, '2015-02-24 13:42:11', '2015-02-24 13:42:11', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150043, 10, 1, 0, 0, 0.0, 55.0, 0, 40, 50, 14000, 1830, 17, 8172, 1, '2015-02-24 13:42:12', '2015-02-24 13:42:12', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150044, 6, 1, 0, 0, 0.0, 75.0, 0, 41, 70, 14029, 754, 17, 8430, 1, '2015-02-24 13:42:12', '2015-02-24 13:42:12', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150045, 2, 1, 0, 0, 0.0, 95.0, 0, 45, 0, 14043, 961, 17, 8348, 1, '2015-02-24 13:42:12', '2015-02-24 13:42:12', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150046, 1, 1, 0, 0, 0.0, 100.0, 1, 8, 80, 13997, 1753, 17, 8140, 1, '2015-02-24 13:42:12', '2015-02-24 13:42:12', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150047, 5, 1, 0, 0, 0.0, 80.0, 0, 40, 40, 14029, 1436, 17, 8312, 1, '2015-02-24 13:42:12', '2015-02-24 13:42:12', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150048, 3, 1, 0, 0, 0.0, 90.0, 2, 49, 60, 14044, 951, 17, 8311, 1, '2015-02-24 13:42:12', '2015-02-24 13:42:12', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150049, 2, 1, 0, 0, 0.0, 95.0, 3, 5, 80, 14022, 1135, 17, 8178, 1, '2015-02-24 13:42:12', '2015-02-24 13:42:12', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150050, 2, 1, 0, 0, 0.0, 95.0, 3, 20, 30, 14042, 1117, 17, 8247, 1, '2015-02-24 13:42:12', '2015-02-24 13:42:12', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150051, 3, 1, 0, 0, 0.0, 90.0, 0, 47, 40, 14038, 601, 17, 8221, 1, '2015-02-24 13:42:12', '2015-02-24 13:42:12', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150052, 1, 1, 0, 0, 0.0, 100.0, 0, 32, 50, 14004, 1060, 17, 8291, 1, '2015-02-24 13:42:13', '2015-02-24 13:42:13', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150053, 1, 1, 0, 0, 0.0, 100.0, 0, 34, 40, 14016, 582, 17, 8225, 1, '2015-02-24 13:42:13', '2015-02-24 13:42:13', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150054, 2, 1, 0, 0, 0.0, 95.0, 0, 40, 40, 14019, 1629, 17, 8188, 1, '2015-02-24 13:42:13', '2015-02-24 13:42:13', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150055, 2, 1, 0, 0, 0.0, 95.0, 3, 21, 60, 14040, 590, 17, 8254, 1, '2015-02-24 13:42:13', '2015-02-24 13:42:13', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150056, 10, 1, 0, 0, 0.0, 55.0, 0, 48, 80, 14002, 1318, 17, 8250, 1, '2015-02-24 13:42:13', '2015-02-24 13:42:13', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150057, 13, 1, 0, 0, 0.0, 40.0, 0, 41, 60, 14000, 1599, 17, 8171, 1, '2015-02-24 13:42:13', '2015-02-24 13:42:13', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150058, 11, 1, 0, 0, 0.0, 50.0, 0, 41, 60, 14004, 867, 17, 8431, 1, '2015-02-24 13:42:13', '2015-02-24 13:42:13', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150059, 3, 1, 0, 0, 0.0, 90.0, 0, 38, 30, 14002, 4019, 17, 8246, 1, '2015-02-24 13:42:13', '2015-02-24 13:42:13', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150060, 3, 1, 0, 0, 0.0, 90.0, 3, 41, 50, 14020, 580, 17, 8215, 1, '2015-02-24 13:42:13', '2015-02-24 13:42:13', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150061, 7, 1, 0, 0, 0.0, 70.0, 0, 44, 40, 14016, 1766, 17, 8304, 1, '2015-02-24 13:42:13', '2015-02-24 13:42:13', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150062, 4, 1, 0, 0, 0.0, 85.0, 0, 47, 20, 13999, 1639, 17, 8432, 1, '2015-02-24 13:42:14', '2015-02-24 13:42:14', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150063, 6, 1, 0, 0, 0.0, 75.0, 0, 37, 20, 14004, 1097, 17, 8292, 1, '2015-02-24 13:42:14', '2015-02-24 13:42:14', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150064, 3, 1, 0, 0, 0.0, 90.0, 0, 45, 70, 13991, 4810, 17, 8148, 1, '2015-02-24 13:42:14', '2015-02-24 13:42:14', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150065, 8, 1, 0, 0, 0.0, 65.0, 2, 58, 60, 13995, 1721, 17, 8160, 1, '2015-02-24 13:42:14', '2015-02-24 13:42:14', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150066, 2, 1, 0, 0, 0.0, 95.0, 2, 26, 60, 14028, 1102, 17, 8203, 1, '2015-02-24 13:42:14', '2015-02-24 13:42:14', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150067, 5, 1, 0, 0, 0.0, 80.0, 0, 48, 60, 13999, 1760, 17, 8433, 1, '2015-02-24 13:42:14', '2015-02-24 13:42:14', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150068, 4, 1, 0, 0, 0.0, 85.0, 0, 39, 30, 14002, 1116, 17, 8317, 1, '2015-02-24 13:42:14', '2015-02-24 13:42:14', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150069, 1, 1, 0, 0, 0.0, 100.0, 1, 10, 50, 14030, 1456, 17, 8359, 1, '2015-02-24 13:42:14', '2015-02-24 13:42:14', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150070, 13, 1, 0, 0, 0.0, 40.0, 0, 44, 40, 14004, 4812, 17, 8300, 1, '2015-02-24 13:42:14', '2015-02-24 13:42:14', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150071, 1, 1, 0, 0, 0.0, 100.0, 1, 57, 70, 14045, 1107, 17, 8258, 1, '2015-02-24 13:42:14', '2015-02-24 13:42:14', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150072, 1, 1, 0, 0, 0.0, 100.0, 2, 45, 40, 14027, 1392, 17, 17313, 1, '2015-02-24 13:42:15', '2015-02-24 13:42:15', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150073, 2, 1, 0, 0, 0.0, 95.0, 1, 23, 30, 13993, 967, 17, 17314, 1, '2015-02-24 13:42:15', '2015-02-24 13:42:15', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150074, 7, 1, 0, 0, 0.0, 70.0, 0, 35, 90, 14015, 1661, 17, 17316, 1, '2015-02-24 13:42:15', '2015-02-24 13:42:15', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150075, 1, 1, 0, 0, 0.0, 100.0, 2, 46, 90, 14023, 1535, 17, 17317, 1, '2015-02-24 13:42:15', '2015-02-24 13:42:15', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150076, 3, 1, 0, 0, 0.0, 90.0, 2, 35, 60, 14028, 1538, 17, 17318, 1, '2015-02-24 13:42:15', '2015-02-24 13:42:15', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150077, 2, 1, 0, 0, 0.0, 95.0, 1, 32, 90, 14013, 878, 17, 17319, 1, '2015-02-24 13:42:15', '2015-02-24 13:42:15', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150078, 2, 1, 0, 0, 0.0, 95.0, 0, 36, 20, 14003, 1138, 17, 17320, 1, '2015-02-24 13:42:15', '2015-02-24 13:42:15', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150079, 3, 1, 0, 0, 0.0, 90.0, 0, 33, 0, 14036, 11733, 17, 17322, 1, '2015-02-24 13:42:15', '2015-02-24 13:42:15', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150080, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 20, 14002, 142, 1, 8091, 1, '2015-02-24 13:42:15', '2015-02-24 13:42:15', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150081, 4, 1, 0, 0, 0.0, 85.0, 0, 38, 40, 14003, 51, 1, 8092, 1, '2015-02-24 13:42:16', '2015-02-24 13:42:16', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150082, 1, 1, 0, 0, 0.0, 100.0, 0, 44, 60, 14046, 192, 1, 8087, 1, '2015-02-24 13:42:16', '2015-02-24 13:42:16', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150083, 5, 1, 0, 0, 0.0, 80.0, 2, 49, 40, 13995, 1430, 1, 8112, 1, '2015-02-24 13:42:16', '2015-02-24 13:42:16', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150084, 5, 1, 0, 0, 0.0, 80.0, 3, 12, 80, 14022, 1843, 1, 8126, 1, '2015-02-24 13:42:16', '2015-02-24 13:42:16', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150085, 1, 1, 0, 0, 0.0, 100.0, 0, 36, 0, 14003, 456, 1, 8096, 1, '2015-02-24 13:42:16', '2015-02-24 13:42:16', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150086, 2, 1, 0, 0, 0.0, 95.0, 0, 45, 70, 14038, 550, 1, 8131, 1, '2015-02-24 13:42:16', '2015-02-24 13:42:16', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150087, 6, 1, 0, 0, 0.0, 75.0, 3, 3, 20, 14025, 785, 1, 8102, 1, '2015-02-24 13:42:16', '2015-02-24 13:42:16', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150088, 7, 1, 0, 0, 0.0, 70.0, 0, 42, 50, 14029, 1016, 1, 8104, 1, '2015-02-24 13:42:16', '2015-02-24 13:42:16', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150089, 2, 1, 0, 0, 0.0, 95.0, 3, 36, 0, 14024, 468, 1, 8132, 1, '2015-02-24 13:42:16', '2015-02-24 13:42:16', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150090, 2, 1, 0, 0, 0.0, 95.0, 2, 41, 80, 14044, 23, 1, 8099, 1, '2015-02-24 13:42:16', '2015-02-24 13:42:16', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150091, 6, 1, 0, 0, 0.0, 75.0, 0, 43, 0, 14006, 773, 1, 8101, 1, '2015-02-24 13:42:17', '2015-02-24 13:42:17', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150092, 1, 1, 0, 0, 0.0, 100.0, 0, 34, 70, 13999, 1491, 1, 8113, 1, '2015-02-24 13:42:17', '2015-02-24 13:42:17', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150093, 2, 1, 0, 0, 0.0, 95.0, 2, 42, 70, 14039, 1841, 1, 8127, 1, '2015-02-24 13:42:17', '2015-02-24 13:42:17', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150094, 2, 1, 0, 0, 0.0, 95.0, 2, 59, 60, 14023, 1788, 1, 8123, 1, '2015-02-24 13:42:17', '2015-02-24 13:42:17', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150095, 1, 1, 0, 0, 0.0, 100.0, 2, 31, 40, 14044, 1541, 1, 8424, 1, '2015-02-24 13:42:17', '2015-02-24 13:42:17', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150096, 3, 1, 0, 0, 0.0, 90.0, 0, 38, 50, 14016, 500, 1, 8133, 1, '2015-02-24 13:42:17', '2015-02-24 13:42:17', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150097, 1, 1, 0, 0, 0.0, 100.0, 1, 33, 70, 14021, 98, 1, 8089, 1, '2015-02-24 13:42:17', '2015-02-24 13:42:17', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150098, 3, 1, 0, 0, 0.0, 90.0, 3, 49, 60, 14024, 503, 1, 8130, 1, '2015-02-24 13:42:17', '2015-02-24 13:42:17', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150099, 5, 1, 0, 0, 0.0, 80.0, 1, 36, 90, 13994, 1777, 1, 8125, 1, '2015-02-24 13:42:17', '2015-02-24 13:42:17', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150100, 1, 1, 0, 0, 0.0, 100.0, 1, 15, 30, 14008, 11742, 1, 17323, 1, '2015-02-24 13:42:17', '2015-02-24 13:42:17', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150101, 2, 1, 0, 0, 0.0, 95.0, 2, 29, 10, 13995, 1496, 1, 8114, 1, '2015-02-24 13:42:18', '2015-02-24 13:42:18', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150102, 3, 1, 0, 0, 0.0, 90.0, 0, 32, 20, 14035, 142, 1, 8091, 1, '2015-02-24 13:42:18', '2015-02-24 13:42:18', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150103, 1, 1, 0, 0, 0.0, 100.0, 0, 40, 70, 14006, 51, 1, 8092, 1, '2015-02-24 13:42:18', '2015-02-24 13:42:18', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150104, 12, 1, 0, 0, 0.0, 45.0, 0, 34, 20, 13996, 1430, 1, 8112, 1, '2015-02-24 13:42:18', '2015-02-24 13:42:18', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150105, 6, 1, 0, 0, 0.0, 75.0, 0, 40, 40, 14034, 1843, 1, 8126, 1, '2015-02-24 13:42:18', '2015-02-24 13:42:18', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150106, 3, 1, 0, 0, 0.0, 90.0, 0, 41, 90, 14006, 456, 1, 8096, 1, '2015-02-24 13:42:18', '2015-02-24 13:42:18', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150107, 5, 1, 0, 0, 0.0, 80.0, 0, 47, 30, 14009, 550, 1, 8131, 1, '2015-02-24 13:42:18', '2015-02-24 13:42:18', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150108, 7, 1, 0, 0, 0.0, 70.0, 0, 39, 30, 14018, 785, 1, 8102, 1, '2015-02-24 13:42:18', '2015-02-24 13:42:18', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150109, 9, 1, 0, 0, 0.0, 60.0, 0, 38, 90, 14015, 1016, 1, 8104, 1, '2015-02-24 13:42:18', '2015-02-24 13:42:18', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150110, 3, 1, 0, 0, 0.0, 90.0, 0, 49, 10, 14010, 468, 1, 8132, 1, '2015-02-24 13:42:19', '2015-02-24 13:42:19', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150111, 1, 1, 0, 0, 0.0, 100.0, 0, 32, 0, 14015, 23, 1, 8099, 1, '2015-02-24 13:42:19', '2015-02-24 13:42:19', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150112, 7, 1, 0, 0, 0.0, 70.0, 0, 31, 90, 13996, 4856, 1, 8135, 1, '2015-02-24 13:42:19', '2015-02-24 13:42:19', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150113, 2, 1, 0, 0, 0.0, 95.0, 1, 40, 80, 14031, 773, 1, 8101, 1, '2015-02-24 13:42:19', '2015-02-24 13:42:19', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150114, 1, 1, 0, 0, 0.0, 100.0, 0, 32, 60, 14036, 1841, 1, 8127, 1, '2015-02-24 13:42:19', '2015-02-24 13:42:19', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150115, 2, 1, 0, 0, 0.0, 95.0, 0, 35, 0, 14033, 1788, 1, 8123, 1, '2015-02-24 13:42:19', '2015-02-24 13:42:19', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150116, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 0, 14029, 1541, 1, 8424, 1, '2015-02-24 13:42:19', '2015-02-24 13:42:19', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150117, 4, 1, 0, 0, 0.0, 85.0, 0, 32, 30, 14017, 500, 1, 8133, 1, '2015-02-24 13:42:19', '2015-02-24 13:42:19', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150118, 2, 1, 0, 0, 0.0, 95.0, 0, 46, 90, 14010, 98, 1, 8089, 1, '2015-02-24 13:42:19', '2015-02-24 13:42:19', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150119, 2, 1, 0, 0, 0.0, 95.0, 0, 52, 90, 14012, 503, 1, 8130, 1, '2015-02-24 13:42:19', '2015-02-24 13:42:19', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150120, 13, 1, 0, 0, 0.0, 40.0, 0, 34, 90, 13996, 11742, 1, 17323, 1, '2015-02-24 13:42:20', '2015-02-24 13:42:20', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150121, 1, 1, 0, 0, 0.0, 100.0, 0, 27, 40, 13996, 1496, 1, 8114, 1, '2015-02-24 13:42:20', '2015-02-24 13:42:20', NULL, 0.0, 0.0, 0.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150122, 1, 1, 0, 0, 0.0, 100.0, 0, 36, 20, 14002, 25, 4, 8316, 1, '2015-02-24 13:42:20', '2015-02-24 13:42:20', NULL, 0.0, 0.0, 0.0, 487);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150123, 4, 1, 0, 0, 0.0, 85.0, 0, 49, 40, 14038, 11734, 4, 17325, 1, '2015-02-24 13:42:20', '2015-02-24 13:42:20', NULL, 0.0, 0.0, 0.0, 487);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150124, 4, 1, 0, 0, 0.0, 85.0, 1, 2, 0, 14046, 1601, 4, 8425, 1, '2015-02-24 13:42:20', '2015-02-24 13:42:20', NULL, 0.0, 0.0, 0.0, 487);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150125, 4, 1, 0, 0, 0.0, 85.0, 0, 43, 40, 14009, 11734, 4, 17325, 1, '2015-02-24 13:42:20', '2015-02-24 13:42:20', NULL, 0.0, 0.0, 0.0, 487);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150126, 10, 1, 0, 0, 0.0, 55.0, 1, 2, 50, 14018, 1197, 14, 17326, 1, '2015-02-24 13:42:20', '2015-02-24 13:42:20', NULL, 0.0, 0.0, 0.0, 492);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150127, 5, 1, 0, 0, 0.0, 80.0, 2, 6, 60, 14014, 1197, 14, 17326, 1, '2015-02-24 13:42:20', '2015-02-24 13:42:20', NULL, 0.0, 0.0, 0.0, 492);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150128, 7, 1, 0, 0, 0.0, 70.0, 0, 42, 20, 14033, 1537, 35, 8199, 1, '2015-02-24 13:42:20', '2015-02-24 13:42:20', NULL, 0.0, 0.0, 0.0, 496);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150129, 5, 1, 0, 0, 0.0, 80.0, 1, 54, 50, 13993, 11732, 35, 17327, 1, '2015-02-24 13:42:20', '2015-02-24 13:42:20', NULL, 0.0, 0.0, 0.0, 496);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150130, 7, 1, 0, 0, 0.0, 70.0, 0, 39, 50, 14004, 1409, 35, 8212, 1, '2015-02-24 13:42:21', '2015-02-24 13:42:21', NULL, 0.0, 0.0, 0.0, 496);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150131, 2, 1, 0, 0, 0.0, 95.0, 1, 4, 70, 14047, 1699, 35, 8391, 1, '2015-02-24 13:42:21', '2015-02-24 13:42:21', NULL, 0.0, 0.0, 0.0, 496);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150132, 1, 1, 0, 0, 0.0, 100.0, 0, 36, 70, 14037, 64, 35, 8377, 1, '2015-02-24 13:42:21', '2015-02-24 13:42:21', NULL, 0.0, 0.0, 0.0, 496);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150133, 2, 1, 0, 0, 0.0, 95.0, 1, 32, 80, 14011, 1537, 35, 8199, 1, '2015-02-24 13:42:21', '2015-02-24 13:42:21', NULL, 0.0, 0.0, 0.0, 496);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150134, 6, 1, 0, 0, 0.0, 75.0, 2, 59, 30, 14028, 1409, 35, 8212, 1, '2015-02-24 13:42:21', '2015-02-24 13:42:21', NULL, 0.0, 0.0, 0.0, 496);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150135, 1, 1, 0, 0, 0.0, 100.0, 3, 7, 90, 14048, 64, 35, 8377, 1, '2015-02-24 13:42:21', '2015-02-24 13:42:21', NULL, 0.0, 0.0, 0.0, 496);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150136, 1, 1, 0, 0, 0.0, 100.0, 3, 4, 80, 14022, 1532, 35, 8176, 1, '2015-02-24 13:42:21', '2015-02-24 13:42:21', NULL, 0.0, 0.0, 0.0, 496);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150137, 2, 1, 0, 0, 0.0, 95.0, 1, 13, 80, 13997, 4864, 28, 8439, 1, '2015-02-24 13:42:21', '2015-02-24 13:42:21', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150138, 2, 1, 0, 0, 0.0, 95.0, 1, 16, 80, 14008, 4867, 28, 8443, 1, '2015-02-24 13:42:21', '2015-02-24 13:42:21', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150139, 14, 1, 0, 0, 0.0, 35.0, 0, 44, 90, 14000, 11735, 28, 17328, 1, '2015-02-24 13:42:22', '2015-02-24 13:42:22', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150140, 5, 1, 0, 0, 0.0, 80.0, 1, 27, 50, 14008, 1786, 28, 17329, 1, '2015-02-24 13:42:22', '2015-02-24 13:42:22', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150141, 2, 1, 0, 0, 0.0, 95.0, 0, 33, 30, 14000, 1779, 28, 8435, 1, '2015-02-24 13:42:22', '2015-02-24 13:42:22', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150142, 2, 1, 0, 0, 0.0, 95.0, 1, 9, 70, 14014, 1038, 28, 8436, 1, '2015-02-24 13:42:22', '2015-02-24 13:42:22', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150143, 5, 1, 0, 0, 0.0, 80.0, 0, 37, 70, 14000, 1471, 28, 8438, 1, '2015-02-24 13:42:22', '2015-02-24 13:42:22', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150144, 1, 1, 0, 0, 0.0, 100.0, 1, 23, 10, 13993, 4865, 28, 8440, 1, '2015-02-24 13:42:22', '2015-02-24 13:42:22', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150145, 6, 1, 0, 0, 0.0, 75.0, 0, 49, 10, 13999, 1850, 28, 17330, 1, '2015-02-24 13:42:22', '2015-02-24 13:42:22', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150146, 1, 1, 0, 0, 0.0, 100.0, 1, 17, 10, 13994, 1396, 28, 8441, 1, '2015-02-24 13:42:22', '2015-02-24 13:42:22', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150147, 5, 1, 0, 0, 0.0, 80.0, 0, 36, 0, 13989, 4864, 28, 8439, 1, '2015-02-24 13:42:22', '2015-02-24 13:42:22', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150148, 9, 1, 0, 0, 0.0, 60.0, 0, 38, 90, 14000, 4867, 28, 8443, 1, '2015-02-24 13:42:22', '2015-02-24 13:42:22', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150149, 11, 1, 0, 0, 0.0, 50.0, 0, 40, 60, 14000, 1786, 28, 17329, 1, '2015-02-24 13:42:23', '2015-02-24 13:42:23', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150150, 2, 1, 0, 0, 0.0, 95.0, 0, 28, 70, 13996, 1779, 28, 8435, 1, '2015-02-24 13:42:23', '2015-02-24 13:42:23', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150151, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 90, 14019, 1038, 28, 8436, 1, '2015-02-24 13:42:23', '2015-02-24 13:42:23', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150152, 9, 1, 0, 0, 0.0, 60.0, 0, 33, 20, 13996, 1471, 28, 8438, 1, '2015-02-24 13:42:23', '2015-02-24 13:42:23', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150153, 2, 1, 0, 0, 0.0, 95.0, 3, 5, 80, 14022, 4865, 28, 8440, 1, '2015-02-24 13:42:23', '2015-02-24 13:42:23', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150154, 5, 1, 0, 0, 0.0, 80.0, 3, 2, 0, 14039, 1396, 28, 8441, 1, '2015-02-24 13:42:23', '2015-02-24 13:42:23', NULL, 0.0, 0.0, 0.0, 503);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150155, 2, 1, 0, 0, 0.0, 95.0, 0, 43, 90, 14049, 1807, 18, 8243, 1, '2015-02-24 13:42:23', '2015-02-24 13:42:23', NULL, 0.0, 0.0, 0.0, 494);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150156, 3, 1, 0, 0, 0.0, 90.0, 3, 32, 80, 14041, 1807, 18, 8243, 1, '2015-02-24 13:42:23', '2015-02-24 13:42:23', NULL, 0.0, 0.0, 0.0, 494);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150157, 4, 1, 0, 0, 0.0, 85.0, 0, 32, 10, 14001, 1685, 11, 8210, 1, '2015-02-24 13:42:24', '2015-02-24 13:42:24', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150158, 9, 1, 0, 0, 0.0, 60.0, 0, 53, 60, 14035, 746, 11, 8315, 1, '2015-02-24 13:42:24', '2015-02-24 13:42:24', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150159, 4, 1, 0, 0, 0.0, 85.0, 0, 35, 10, 14035, 1679, 11, 8373, 1, '2015-02-24 13:42:24', '2015-02-24 13:42:24', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150160, 3, 1, 0, 0, 0.0, 90.0, 0, 36, 40, 14003, 4032, 11, 8374, 1, '2015-02-24 13:42:24', '2015-02-24 13:42:24', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150161, 4, 1, 0, 0, 0.0, 85.0, 0, 34, 0, 14036, 4847, 11, 8142, 1, '2015-02-24 13:42:24', '2015-02-24 13:42:24', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150162, 1, 1, 0, 0, 0.0, 100.0, 0, 42, 50, 14050, 1450, 11, 8326, 1, '2015-02-24 13:42:24', '2015-02-24 13:42:24', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150163, 2, 1, 0, 0, 0.0, 95.0, 0, 32, 90, 14036, 1776, 11, 8141, 1, '2015-02-24 13:42:24', '2015-02-24 13:42:24', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150164, 7, 1, 0, 0, 0.0, 70.0, 1, 23, 90, 14007, 1659, 11, 8294, 1, '2015-02-24 13:42:24', '2015-02-24 13:42:24', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150165, 5, 1, 0, 0, 0.0, 80.0, 0, 35, 90, 14035, 228, 11, 8248, 1, '2015-02-24 13:42:24', '2015-02-24 13:42:24', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150166, 8, 1, 0, 0, 0.0, 65.0, 0, 41, 10, 14035, 148, 11, 8322, 1, '2015-02-24 13:42:25', '2015-02-24 13:42:25', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150167, 4, 1, 0, 0, 0.0, 85.0, 0, 57, 50, 14010, 140, 11, 8450, 1, '2015-02-24 13:42:25', '2015-02-24 13:42:25', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150168, 5, 1, 0, 0, 0.0, 80.0, 0, 52, 40, 14038, 685, 11, 8357, 1, '2015-02-24 13:42:25', '2015-02-24 13:42:25', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150169, 3, 1, 0, 0, 0.0, 90.0, 0, 37, 0, 14034, 882, 11, 8180, 1, '2015-02-24 13:42:25', '2015-02-24 13:42:25', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150170, 3, 1, 0, 0, 0.0, 90.0, 0, 31, 10, 14017, 87, 11, 8226, 1, '2015-02-24 13:42:25', '2015-02-24 13:42:25', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150171, 2, 1, 0, 0, 0.0, 95.0, 0, 43, 80, 14037, 114, 11, 8257, 1, '2015-02-24 13:42:25', '2015-02-24 13:42:25', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150172, 4, 1, 0, 0, 0.0, 85.0, 1, 42, 50, 13993, 1556, 11, 8174, 1, '2015-02-24 13:42:25', '2015-02-24 13:42:25', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150173, 1, 1, 0, 0, 0.0, 100.0, 1, 13, 0, 14026, 553, 11, 8233, 1, '2015-02-24 13:42:25', '2015-02-24 13:42:25', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150174, 2, 1, 0, 0, 0.0, 95.0, 0, 46, 70, 14046, 1244, 11, 8314, 1, '2015-02-24 13:42:25', '2015-02-24 13:42:25', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150175, 8, 1, 0, 0, 0.0, 65.0, 0, 37, 70, 14015, 1680, 11, 8313, 1, '2015-02-24 13:42:26', '2015-02-24 13:42:26', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150176, 1, 1, 0, 0, 0.0, 100.0, 0, 40, 50, 14049, 1457, 11, 8242, 1, '2015-02-24 13:42:26', '2015-02-24 13:42:26', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150177, 2, 1, 0, 0, 0.0, 95.0, 0, 32, 60, 14018, 4849, 11, 8191, 1, '2015-02-24 13:42:26', '2015-02-24 13:42:26', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150178, 10, 1, 0, 0, 0.0, 55.0, 0, 41, 10, 14004, 1685, 11, 8210, 1, '2015-02-24 13:42:26', '2015-02-24 13:42:26', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150179, 11, 1, 0, 0, 0.0, 50.0, 0, 49, 60, 14002, 746, 11, 8315, 1, '2015-02-24 13:42:26', '2015-02-24 13:42:26', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150180, 2, 1, 0, 0, 0.0, 95.0, 1, 27, 60, 14005, 1679, 11, 8373, 1, '2015-02-24 13:42:26', '2015-02-24 13:42:26', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150181, 4, 1, 0, 0, 0.0, 85.0, 0, 42, 0, 14006, 4032, 11, 8374, 1, '2015-02-24 13:42:26', '2015-02-24 13:42:26', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150182, 2, 1, 0, 0, 0.0, 95.0, 0, 40, 90, 13999, 4847, 11, 8142, 1, '2015-02-24 13:42:26', '2015-02-24 13:42:26', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150183, 2, 1, 0, 0, 0.0, 95.0, 3, 13, 60, 14048, 1450, 11, 8326, 1, '2015-02-24 13:42:26', '2015-02-24 13:42:26', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150184, 1, 1, 0, 0, 0.0, 100.0, 2, 41, 10, 14039, 1776, 11, 8141, 1, '2015-02-24 13:42:26', '2015-02-24 13:42:26', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150185, 5, 1, 0, 0, 0.0, 80.0, 0, 36, 80, 14004, 1659, 11, 8294, 1, '2015-02-24 13:42:27', '2015-02-24 13:42:27', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150186, 5, 1, 0, 0, 0.0, 80.0, 0, 40, 20, 14002, 228, 11, 8248, 1, '2015-02-24 13:42:27', '2015-02-24 13:42:27', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150187, 7, 1, 0, 0, 0.0, 70.0, 0, 43, 30, 14002, 148, 11, 8322, 1, '2015-02-24 13:42:27', '2015-02-24 13:42:27', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150188, 3, 1, 0, 0, 0.0, 90.0, 0, 57, 50, 14012, 140, 11, 8450, 1, '2015-02-24 13:42:27', '2015-02-24 13:42:27', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150189, 7, 1, 0, 0, 0.0, 70.0, 0, 51, 30, 14009, 685, 11, 8357, 1, '2015-02-24 13:42:27', '2015-02-24 13:42:27', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150190, 1, 1, 0, 0, 0.0, 100.0, 0, 41, 40, 13998, 882, 11, 8180, 1, '2015-02-24 13:42:27', '2015-02-24 13:42:27', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150191, 2, 1, 0, 0, 0.0, 95.0, 1, 14, 60, 14030, 87, 11, 8226, 1, '2015-02-24 13:42:27', '2015-02-24 13:42:27', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150192, 3, 1, 0, 0, 0.0, 90.0, 3, 18, 50, 14048, 114, 11, 8257, 1, '2015-02-24 13:42:28', '2015-02-24 13:42:28', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150193, 4, 1, 0, 0, 0.0, 85.0, 0, 49, 50, 13998, 1556, 11, 8174, 1, '2015-02-24 13:42:28', '2015-02-24 13:42:28', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150194, 3, 1, 0, 0, 0.0, 90.0, 0, 38, 0, 14029, 553, 11, 8233, 1, '2015-02-24 13:42:28', '2015-02-24 13:42:28', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150195, 1, 1, 0, 0, 0.0, 100.0, 3, 28, 30, 14041, 1244, 11, 8314, 1, '2015-02-24 13:42:28', '2015-02-24 13:42:28', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150196, 8, 1, 0, 0, 0.0, 65.0, 0, 43, 20, 14029, 1680, 11, 8313, 1, '2015-02-24 13:42:28', '2015-02-24 13:42:28', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150197, 1, 1, 0, 0, 0.0, 100.0, 1, 33, 90, 14032, 1457, 11, 8242, 1, '2015-02-24 13:42:28', '2015-02-24 13:42:28', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150198, 5, 1, 0, 0, 0.0, 80.0, 2, 52, 70, 14025, 4849, 11, 8191, 1, '2015-02-24 13:42:28', '2015-02-24 13:42:28', NULL, 0.0, 0.0, 0.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150199, 1, 1, 0, 0, 0.0, 100.0, 2, 55, 0, 14051, 4813, 39, 8260, 1, '2015-02-24 13:42:28', '2015-02-24 13:42:28', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150200, 5, 1, 0, 0, 0.0, 80.0, 1, 27, 30, 13997, 4814, 39, 8146, 1, '2015-02-24 13:42:28', '2015-02-24 13:42:28', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150201, 5, 1, 0, 0, 0.0, 80.0, 0, 31, 40, 13996, 1569, 39, 17331, 1, '2015-02-24 13:42:29', '2015-02-24 13:42:29', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150202, 3, 1, 0, 0, 0.0, 90.0, 0, 33, 60, 13990, 1583, 39, 8169, 1, '2015-02-24 13:42:29', '2015-02-24 13:42:29', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150203, 3, 1, 0, 0, 0.0, 90.0, 1, 35, 50, 13994, 1728, 39, 8332, 1, '2015-02-24 13:42:29', '2015-02-24 13:42:29', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150204, 6, 1, 0, 0, 0.0, 75.0, 1, 43, 30, 13997, 1840, 39, 8327, 1, '2015-02-24 13:42:29', '2015-02-24 13:42:29', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150205, 9, 1, 0, 0, 0.0, 60.0, 1, 59, 30, 13997, 4817, 39, 8329, 1, '2015-02-24 13:42:29', '2015-02-24 13:42:29', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150206, 7, 1, 0, 0, 0.0, 70.0, 1, 45, 10, 13997, 1607, 39, 8445, 1, '2015-02-24 13:42:29', '2015-02-24 13:42:29', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150207, 5, 1, 0, 0, 0.0, 80.0, 0, 37, 10, 14033, 1723, 39, 8198, 1, '2015-02-24 13:42:29', '2015-02-24 13:42:29', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150208, 3, 1, 0, 0, 0.0, 90.0, 0, 44, 70, 14037, 1672, 39, 8256, 1, '2015-02-24 13:42:29', '2015-02-24 13:42:29', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150209, 6, 1, 0, 0, 0.0, 75.0, 0, 42, 10, 14002, 1820, 39, 8318, 1, '2015-02-24 13:42:29', '2015-02-24 13:42:29', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150210, 10, 1, 0, 0, 0.0, 55.0, 2, 1, 50, 13997, 4818, 39, 8328, 1, '2015-02-24 13:42:30', '2015-02-24 13:42:30', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150211, 3, 1, 0, 0, 0.0, 90.0, 2, 46, 10, 14025, 3988, 39, 8344, 1, '2015-02-24 13:42:30', '2015-02-24 13:42:30', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150212, 3, 1, 0, 0, 0.0, 90.0, 2, 35, 50, 14011, 4819, 39, 8350, 1, '2015-02-24 13:42:30', '2015-02-24 13:42:30', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150213, 6, 1, 0, 0, 0.0, 75.0, 2, 52, 70, 13995, 1716, 39, 8336, 1, '2015-02-24 13:42:30', '2015-02-24 13:42:30', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150214, 2, 1, 0, 0, 0.0, 95.0, 0, 31, 40, 13990, 1623, 39, 8279, 1, '2015-02-24 13:42:30', '2015-02-24 13:42:30', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150215, 7, 1, 0, 0, 0.0, 70.0, 0, 41, 0, 14035, 4820, 39, 8320, 1, '2015-02-24 13:42:30', '2015-02-24 13:42:30', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150216, 3, 1, 0, 0, 0.0, 90.0, 1, 44, 20, 14032, 1729, 39, 8244, 1, '2015-02-24 13:42:30', '2015-02-24 13:42:30', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150217, 1, 1, 0, 0, 0.0, 100.0, 2, 26, 0, 14028, 1656, 39, 8204, 1, '2015-02-24 13:42:30', '2015-02-24 13:42:30', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150218, 4, 1, 0, 0, 0.0, 85.0, 1, 20, 70, 13997, 4823, 39, 8259, 1, '2015-02-24 13:42:30', '2015-02-24 13:42:30', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150219, 10, 1, 0, 0, 0.0, 55.0, 0, 56, 70, 13991, 11736, 39, 17332, 1, '2015-02-24 13:42:31', '2015-02-24 13:42:31', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150220, 2, 1, 0, 0, 0.0, 95.0, 3, 1, 20, 14051, 4828, 39, 8145, 1, '2015-02-24 13:42:31', '2015-02-24 13:42:31', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150221, 7, 1, 0, 0, 0.0, 70.0, 0, 49, 70, 13999, 1568, 39, 8267, 1, '2015-02-24 13:42:31', '2015-02-24 13:42:31', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150222, 3, 1, 0, 0, 0.0, 90.0, 1, 25, 0, 13992, 4827, 39, 8164, 1, '2015-02-24 13:42:31', '2015-02-24 13:42:31', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150223, 5, 1, 0, 0, 0.0, 80.0, 0, 34, 0, 13990, 1606, 39, 8446, 1, '2015-02-24 13:42:31', '2015-02-24 13:42:31', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150224, 10, 1, 0, 0, 0.0, 55.0, 1, 14, 50, 13999, 11739, 39, 17333, 1, '2015-02-24 13:42:31', '2015-02-24 13:42:31', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150225, 4, 1, 0, 0, 0.0, 85.0, 3, 0, 20, 14039, 1544, 39, 8447, 1, '2015-02-24 13:42:31', '2015-02-24 13:42:31', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150226, 2, 1, 0, 0, 0.0, 95.0, 1, 21, 50, 13992, 4870, 39, 8452, 1, '2015-02-24 13:42:31', '2015-02-24 13:42:31', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150227, 8, 1, 0, 0, 0.0, 65.0, 0, 56, 40, 13991, 11740, 39, 17334, 1, '2015-02-24 13:42:31', '2015-02-24 13:42:31', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150228, 14, 1, 0, 0, 0.0, 35.0, 0, 35, 0, 13996, 1571, 39, 8273, 1, '2015-02-24 13:42:32', '2015-02-24 13:42:32', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150229, 6, 1, 0, 0, 0.0, 75.0, 1, 46, 20, 14008, 11741, 39, 17335, 1, '2015-02-24 13:42:32', '2015-02-24 13:42:32', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150230, 1, 1, 0, 0, 0.0, 100.0, 2, 48, 40, 14052, 4825, 39, 8337, 1, '2015-02-24 13:42:32', '2015-02-24 13:42:32', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150231, 7, 1, 0, 0, 0.0, 70.0, 0, 38, 0, 13990, 1756, 39, 8265, 1, '2015-02-24 13:42:32', '2015-02-24 13:42:32', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150232, 4, 1, 0, 0, 0.0, 85.0, 0, 36, 10, 14033, 1725, 39, 8448, 1, '2015-02-24 13:42:32', '2015-02-24 13:42:32', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150233, 1, 1, 0, 0, 0.0, 100.0, 1, 9, 80, 13992, 1596, 39, 8155, 1, '2015-02-24 13:42:32', '2015-02-24 13:42:32', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150234, 2, 1, 0, 0, 0.0, 95.0, 0, 43, 50, 13991, 4814, 39, 8146, 1, '2015-02-24 13:42:32', '2015-02-24 13:42:32', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150235, 6, 1, 0, 0, 0.0, 75.0, 0, 38, 0, 14000, 1569, 39, 17331, 1, '2015-02-24 13:42:32', '2015-02-24 13:42:32', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150236, 2, 1, 0, 0, 0.0, 95.0, 2, 52, 10, 14052, 1583, 39, 8169, 1, '2015-02-24 13:42:32', '2015-02-24 13:42:32', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150237, 9, 1, 0, 0, 0.0, 60.0, 0, 56, 70, 13999, 1728, 39, 8332, 1, '2015-02-24 13:42:32', '2015-02-24 13:42:32', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150238, 4, 1, 0, 0, 0.0, 85.0, 0, 52, 90, 13991, 1840, 39, 8327, 1, '2015-02-24 13:42:33', '2015-02-24 13:42:33', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150239, 11, 1, 0, 0, 0.0, 50.0, 0, 57, 10, 13991, 4817, 39, 8329, 1, '2015-02-24 13:42:33', '2015-02-24 13:42:33', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150240, 7, 1, 0, 0, 0.0, 70.0, 0, 54, 90, 13991, 1607, 39, 8445, 1, '2015-02-24 13:42:33', '2015-02-24 13:42:33', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150241, 3, 1, 0, 0, 0.0, 90.0, 0, 45, 20, 14043, 1723, 39, 8198, 1, '2015-02-24 13:42:33', '2015-02-24 13:42:33', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150242, 9, 1, 0, 0, 0.0, 60.0, 0, 56, 60, 13991, 4818, 39, 8328, 1, '2015-02-24 13:42:33', '2015-02-24 13:42:33', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150243, 8, 1, 0, 0, 0.0, 65.0, 1, 16, 20, 14033, 4819, 39, 8350, 1, '2015-02-24 13:42:33', '2015-02-24 13:42:33', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150244, 10, 1, 0, 0, 0.0, 55.0, 0, 33, 60, 13996, 1716, 39, 8336, 1, '2015-02-24 13:42:33', '2015-02-24 13:42:33', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150245, 1, 1, 0, 0, 0.0, 100.0, 0, 37, 60, 14053, 1623, 39, 8279, 1, '2015-02-24 13:42:33', '2015-02-24 13:42:33', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150246, 8, 1, 0, 0, 0.0, 65.0, 0, 43, 60, 14002, 4820, 39, 8320, 1, '2015-02-24 13:42:33', '2015-02-24 13:42:33', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150247, 3, 1, 0, 0, 0.0, 90.0, 0, 55, 20, 14046, 1729, 39, 8244, 1, '2015-02-24 13:42:34', '2015-02-24 13:42:34', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150248, 2, 1, 0, 0, 0.0, 95.0, 1, 6, 80, 14007, 1656, 39, 8204, 1, '2015-02-24 13:42:34', '2015-02-24 13:42:34', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150249, 4, 1, 0, 0, 0.0, 85.0, 0, 35, 20, 13989, 4823, 39, 8259, 1, '2015-02-24 13:42:34', '2015-02-24 13:42:34', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150250, 6, 1, 0, 0, 0.0, 75.0, 0, 34, 70, 13990, 4827, 39, 8164, 1, '2015-02-24 13:42:34', '2015-02-24 13:42:34', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150251, 4, 1, 0, 0, 0.0, 85.0, 0, 41, 80, 14053, 1606, 39, 8446, 1, '2015-02-24 13:42:34', '2015-02-24 13:42:34', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150252, 2, 1, 0, 0, 0.0, 95.0, 1, 23, 50, 13994, 1544, 39, 8447, 1, '2015-02-24 13:42:34', '2015-02-24 13:42:34', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150253, 3, 1, 0, 0, 0.0, 90.0, 0, 41, 40, 14053, 4870, 39, 8452, 1, '2015-02-24 13:42:34', '2015-02-24 13:42:34', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150254, 8, 1, 0, 0, 0.0, 65.0, 0, 38, 30, 14000, 1571, 39, 8273, 1, '2015-02-24 13:42:34', '2015-02-24 13:42:34', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150255, 4, 1, 0, 0, 0.0, 85.0, 0, 33, 70, 13990, 4825, 39, 8337, 1, '2015-02-24 13:42:35', '2015-02-24 13:42:35', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150256, 5, 1, 0, 0, 0.0, 80.0, 0, 48, 20, 14053, 1756, 39, 8265, 1, '2015-02-24 13:42:35', '2015-02-24 13:42:35', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150257, 1, 1, 0, 0, 0.0, 100.0, 0, 44, 20, 14043, 1725, 39, 8448, 1, '2015-02-24 13:42:35', '2015-02-24 13:42:35', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150258, 1, 1, 0, 0, 0.0, 100.0, 0, 30, 30, 13990, 1596, 39, 8155, 1, '2015-02-24 13:42:35', '2015-02-24 13:42:35', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150259, 1, 1, 0, 0, 0.0, 100.0, 1, 31, 30, 14011, 13535, 17, 17336, 1, '2015-02-24 13:42:35', '2015-02-24 13:42:35', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150260, 2, 1, 0, 0, 0.0, 95.0, 0, 34, 70, 14004, 1454, 17, 8205, 1, '2015-02-24 13:42:35', '2015-02-24 13:42:35', NULL, 0.0, 0.0, 0.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150261, 2, 1, 0, 0, 0.0, 95.0, 0, 40, 70, 14053, 4855, 290, 8277, 1, '2015-02-24 13:42:35', '2015-02-24 13:42:35', NULL, 0.0, 0.0, 0.0, 499);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150262, 4, 1, 0, 0, 0.0, 85.0, 1, 33, 70, 13992, 4855, 290, 8277, 1, '2015-02-24 13:42:35', '2015-02-24 13:42:35', NULL, 0.0, 0.0, 0.0, 499);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150263, 7, 1, 0, 0, 0.0, 70.0, 2, 57, 80, 13995, 4852, 290, 8165, 1, '2015-02-24 13:42:35', '2015-02-24 13:42:35', NULL, 0.0, 0.0, 0.0, 499);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150264, 11, 1, 0, 0, 0.0, 50.0, 0, 33, 80, 13996, 4852, 290, 8165, 1, '2015-02-24 13:42:36', '2015-02-24 13:42:36', NULL, 0.0, 0.0, 0.0, 499);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150265, 1, 1, 0, 0, 0.0, 100.0, 0, 32, 10, 14034, 4850, 290, 8175, 1, '2015-02-24 13:42:36', '2015-02-24 13:42:36', NULL, 0.0, 0.0, 0.0, 499);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150266, 1, 1, 0, 0, 0.0, 100.0, 1, 2, 80, 14047, 1363, 32, 8253, 1, '2015-02-24 13:42:36', '2015-02-24 13:42:36', NULL, 0.0, 0.0, 0.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150267, 6, 1, 0, 0, 0.0, 75.0, 0, 37, 90, 14017, 1303, 32, 8360, 1, '2015-02-24 13:42:36', '2015-02-24 13:42:36', NULL, 0.0, 0.0, 0.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150268, 3, 1, 0, 1, 0.0, 105.0, 0, 0, 0, 14016, 1303, 32, 8360, 1, '2015-02-24 13:42:36', '2015-02-24 13:42:36', 1, 0.0, 0.0, 0.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150269, 2, 1, 0, 0, 0.0, 95.0, 0, 35, 40, 13989, 4813, 39, 8260, 1, '2015-02-24 13:42:36', '2015-02-24 13:42:36', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150270, 7, 1, 0, 0, 0.0, 70.0, 0, 44, 90, 14036, 1568, 39, 8267, 1, '2015-02-24 13:42:36', '2015-02-24 13:42:36', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150271, 5, 1, 0, 0, 0.0, 80.0, 0, 37, 60, 14034, 1532, 35, 8176, 1, '2015-02-24 13:42:36', '2015-02-24 13:42:36', NULL, 0.0, 0.0, 0.0, 496);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150272, 2, 1, 0, 0, 0.0, 95.0, 0, 31, 90, 14035, 25, 4, 8316, 1, '2015-02-24 13:42:36', '2015-02-24 13:42:36', NULL, 0.0, 0.0, 0.0, 487);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150273, 1, 1, 0, 0, 0.0, 100.0, 0, 31, 50, 14018, 3988, 39, 8344, 1, '2015-02-24 13:42:36', '2015-02-24 13:42:36', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150274, 1, 1, 0, 0, 0.0, 100.0, 0, 41, 30, 13991, 4828, 39, 8145, 1, '2015-02-24 13:42:37', '2015-02-24 13:42:37', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150275, 15, 1, 0, 0, 0.0, 30.0, 0, 45, 50, 14000, 11741, 39, 17335, 1, '2015-02-24 13:42:37', '2015-02-24 13:42:37', NULL, 0.0, 0.0, 0.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (150276, 4, 1, 0, 0, 0.0, 85.0, 0, 36, 50, 14000, 4856, 1, 8135, 1, '2015-02-24 13:42:37', '2015-02-24 13:42:37', NULL, 0.0, 0.0, 0.0, 488);


-- Meeting 14103
-- 'Results acquired' flag setting:
UPDATE meetings SET are_results_acquired = '1' WHERE id = 14103;


-- Meeting 14103
-- 'has_start_list' flag setting:
UPDATE meetings SET has_start_list = '1' WHERE id = 14103;

-- --- BeginTimeCalculator: compute_for_all( 14103 )
-- ----------------------------------------------------
-- Using RESULTS to compute heat length.

-- Event #1, M.Prg: 13989, tot. athletes: 7
-- Tot. progr. duration: 198 (sec), Heat durations: [10810, 9050] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 13989;

-- Event #1, M.Prg: 14003, tot. athletes: 5
-- Tot. progr. duration: 102 (sec), Heat durations: [10220] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:05:18 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:05' WHERE id = 14003;

-- Event #1, M.Prg: 14017, tot. athletes: 7
-- Tot. progr. duration: 190 (sec), Heat durations: [10030, 8970] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:07:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:07' WHERE id = 14017;

-- Event #1, M.Prg: 14035, tot. athletes: 9
-- Tot. progr. duration: 205 (sec), Heat durations: [11360, 9220] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:10:10 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:10' WHERE id = 14035;

-- Event #1, M.Prg: 13990, tot. athletes: 7
-- Tot. progr. duration: 188 (sec), Heat durations: [9800, 9030] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:13:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:13' WHERE id = 13990;

-- Event #1, M.Prg: 14009, tot. athletes: 7
-- Tot. progr. duration: 210 (sec), Heat durations: [11130, 9910] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:16:43 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:16' WHERE id = 14009;

-- Event #1, M.Prg: 14018, tot. athletes: 8
-- Tot. progr. duration: 215 (sec), Heat durations: [12250, 9260] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:20:13 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:20' WHERE id = 14018;

-- Event #1, M.Prg: 14036, tot. athletes: 7
-- Tot. progr. duration: 197 (sec), Heat durations: [10490, 9260] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:23:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:23' WHERE id = 14036;

-- Event #1, M.Prg: 13996, tot. athletes: 18
-- Tot. progr. duration: 286 (sec), Heat durations: [10110, 9420, 9150] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:27:05 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:27' WHERE id = 13996;

-- Event #1, M.Prg: 14010, tot. athletes: 4
-- Tot. progr. duration: 117 (sec), Heat durations: [11750] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:31:51 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:31' WHERE id = 14010;

-- Event #1, M.Prg: 14033, tot. athletes: 8
-- Tot. progr. duration: 231 (sec), Heat durations: [13620, 9500] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:33:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:33' WHERE id = 14033;

-- Event #1, M.Prg: 14037, tot. athletes: 4
-- Tot. progr. duration: 108 (sec), Heat durations: [10870] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:37:39 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:37' WHERE id = 14037;

-- Event #1, M.Prg: 14001, tot. athletes: 8
-- Tot. progr. duration: 189 (sec), Heat durations: [9920, 9040] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:39:27 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:39' WHERE id = 14001;

-- Event #1, M.Prg: 14015, tot. athletes: 10
-- Tot. progr. duration: 194 (sec), Heat durations: [10080, 9390] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:42:36 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:42' WHERE id = 14015;

-- Event #1, M.Prg: 14034, tot. athletes: 5
-- Tot. progr. duration: 100 (sec), Heat durations: [10040] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:45:50 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:45' WHERE id = 14034;

-- Event #1, M.Prg: 14049, tot. athletes: 2
-- Tot. progr. duration: 103 (sec), Heat durations: [10390] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:47:30 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:47' WHERE id = 14049;

-- Event #2, M.Prg: 13991, tot. athletes: 11
-- Tot. progr. duration: 230 (sec), Heat durations: [11710, 11360] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:49:13 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:49' WHERE id = 13991;

-- Event #2, M.Prg: 14002, tot. athletes: 11
-- Tot. progr. duration: 209 (sec), Heat durations: [10960, 10020] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:53:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:53' WHERE id = 14002;

-- Event #2, M.Prg: 14016, tot. athletes: 8
-- Tot. progr. duration: 198 (sec), Heat durations: [10440, 9440] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:56:32 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:56' WHERE id = 14016;

-- Event #2, M.Prg: 14043, tot. athletes: 3
-- Tot. progr. duration: 105 (sec), Heat durations: [10520] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:59:50 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:59' WHERE id = 14043;

-- Event #2, M.Prg: 14053, tot. athletes: 5
-- Tot. progr. duration: 108 (sec), Heat durations: [10820] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:01:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:01' WHERE id = 14053;

-- Event #2, M.Prg: 13998, tot. athletes: 4
-- Tot. progr. duration: 109 (sec), Heat durations: [10950] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:03:23 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:03' WHERE id = 13998;

-- Event #2, M.Prg: 14004, tot. athletes: 13
-- Tot. progr. duration: 296 (sec), Heat durations: [10440, 9950, 9250] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:05:12 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:05' WHERE id = 14004;

-- Event #2, M.Prg: 14019, tot. athletes: 5
-- Tot. progr. duration: 103 (sec), Heat durations: [10310] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:10:08 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:10' WHERE id = 14019;

-- Event #2, M.Prg: 14046, tot. athletes: 4
-- Tot. progr. duration: 122 (sec), Heat durations: [12200] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:11:51 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:11' WHERE id = 14046;

-- Event #2, M.Prg: 13999, tot. athletes: 10
-- Tot. progr. duration: 241 (sec), Heat durations: [13450, 10720] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:13:53 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:13' WHERE id = 13999;

-- Event #2, M.Prg: 14006, tot. athletes: 7
-- Tot. progr. duration: 203 (sec), Heat durations: [10320, 10070] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:17:54 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:17' WHERE id = 14006;

-- Event #2, M.Prg: 14029, tot. athletes: 8
-- Tot. progr. duration: 200 (sec), Heat durations: [10320, 9710] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:21:17 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:21' WHERE id = 14029;

-- Event #2, M.Prg: 14047, tot. athletes: 2
-- Tot. progr. duration: 124 (sec), Heat durations: [12470] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:24:37 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:24' WHERE id = 14047;

-- Event #2, M.Prg: 14000, tot. athletes: 15
-- Tot. progr. duration: 300 (sec), Heat durations: [10550, 9890, 9590] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:26:41 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:26' WHERE id = 14000;

-- Event #2, M.Prg: 14012, tot. athletes: 3
-- Tot. progr. duration: 117 (sec), Heat durations: [11750] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:31:41 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:31' WHERE id = 14012;

-- Event #2, M.Prg: 14038, tot. athletes: 5
-- Tot. progr. duration: 112 (sec), Heat durations: [11240] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:33:38 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:33' WHERE id = 14038;

-- Event #2, M.Prg: 14050, tot. athletes: 1
-- Tot. progr. duration: 102 (sec), Heat durations: [10250] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:35:30 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:35' WHERE id = 14050;

-- Event #3, M.Prg: 13992, tot. athletes: 4
-- Tot. progr. duration: 153 (sec), Heat durations: [15370] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:37:12 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:37' WHERE id = 13992;

-- Event #3, M.Prg: 14005, tot. athletes: 4
-- Tot. progr. duration: 169 (sec), Heat durations: [16930] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:39:45 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:39' WHERE id = 14005;

-- Event #3, M.Prg: 14013, tot. athletes: 3
-- Tot. progr. duration: 154 (sec), Heat durations: [15400] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:42:34 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:42' WHERE id = 14013;

-- Event #3, M.Prg: 14030, tot. athletes: 3
-- Tot. progr. duration: 137 (sec), Heat durations: [13710] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:45:08 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:45' WHERE id = 14030;

-- Event #3, M.Prg: 13993, tot. athletes: 5
-- Tot. progr. duration: 174 (sec), Heat durations: [17450] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:47:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:47' WHERE id = 13993;

-- Event #3, M.Prg: 14007, tot. athletes: 8
-- Tot. progr. duration: 277 (sec), Heat durations: [15050, 12680] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:50:19 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:50' WHERE id = 14007;

-- Event #3, M.Prg: 14014, tot. athletes: 4
-- Tot. progr. duration: 186 (sec), Heat durations: [18660] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:54:56 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:54' WHERE id = 14014;

-- Event #3, M.Prg: 14031, tot. athletes: 2
-- Tot. progr. duration: 160 (sec), Heat durations: [16080] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:58:02 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:58' WHERE id = 14031;

-- Event #3, M.Prg: 13994, tot. athletes: 6
-- Tot. progr. duration: 158 (sec), Heat durations: [15850] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:00:42 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:00' WHERE id = 13994;

-- Event #3, M.Prg: 14008, tot. athletes: 6
-- Tot. progr. duration: 166 (sec), Heat durations: [16620] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:03:20 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:03' WHERE id = 14008;

-- Event #3, M.Prg: 14021, tot. athletes: 2
-- Tot. progr. duration: 159 (sec), Heat durations: [15930] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:06:06 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:06' WHERE id = 14021;

-- Event #3, M.Prg: 14032, tot. athletes: 3
-- Tot. progr. duration: 164 (sec), Heat durations: [16420] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:08:45 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:08' WHERE id = 14032;

-- Event #3, M.Prg: 13997, tot. athletes: 10
-- Tot. progr. duration: 322 (sec), Heat durations: [18150, 14070] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:11:29 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:11' WHERE id = 13997;

-- Event #3, M.Prg: 14011, tot. athletes: 3
-- Tot. progr. duration: 215 (sec), Heat durations: [21550] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:16:51 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:16' WHERE id = 14011;

-- Event #3, M.Prg: 14026, tot. athletes: 3
-- Tot. progr. duration: 153 (sec), Heat durations: [15380] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:20:26 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:20' WHERE id = 14026;

-- Event #3, M.Prg: 14045, tot. athletes: 1
-- Tot. progr. duration: 177 (sec), Heat durations: [17770] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:22:59 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:22' WHERE id = 14045;

-- Event #4, M.Prg: 14023, tot. athletes: 2
-- Tot. progr. duration: 239 (sec), Heat durations: [23960] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:25:56 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:25' WHERE id = 14023;

-- Event #4, M.Prg: 14028, tot. athletes: 7
-- Tot. progr. duration: 452 (sec), Heat durations: [24660, 20600] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:29:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:29' WHERE id = 14028;

-- Event #4, M.Prg: 14042, tot. athletes: 2
-- Tot. progr. duration: 260 (sec), Heat durations: [26030] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:37:27 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:37' WHERE id = 14042;

-- Event #4, M.Prg: 14052, tot. athletes: 2
-- Tot. progr. duration: 232 (sec), Heat durations: [23210] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:41:47 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:41' WHERE id = 14052;

-- Event #4, M.Prg: 13995, tot. athletes: 8
-- Tot. progr. duration: 447 (sec), Heat durations: [23860, 20910] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:45:39 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:45' WHERE id = 13995;

-- Event #4, M.Prg: 14024, tot. athletes: 3
-- Tot. progr. duration: 289 (sec), Heat durations: [28960] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:53:06 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:53' WHERE id = 14024;

-- Event #4, M.Prg: 14039, tot. athletes: 5
-- Tot. progr. duration: 242 (sec), Heat durations: [24200] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:57:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:57' WHERE id = 14039;

-- Event #4, M.Prg: 14044, tot. athletes: 3
-- Tot. progr. duration: 229 (sec), Heat durations: [22960] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:01:57 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:01' WHERE id = 14044;

-- Event #4, M.Prg: 14020, tot. athletes: 3
-- Tot. progr. duration: 281 (sec), Heat durations: [28150] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:05:46 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:05' WHERE id = 14020;

-- Event #4, M.Prg: 14025, tot. athletes: 6
-- Tot. progr. duration: 243 (sec), Heat durations: [24320] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:10:27 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:10' WHERE id = 14025;

-- Event #4, M.Prg: 14040, tot. athletes: 2
-- Tot. progr. duration: 261 (sec), Heat durations: [26160] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:14:30 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:14' WHERE id = 14040;

-- Event #4, M.Prg: 14048, tot. athletes: 3
-- Tot. progr. duration: 258 (sec), Heat durations: [25850] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:18:51 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:18' WHERE id = 14048;

-- Event #4, M.Prg: 14022, tot. athletes: 6
-- Tot. progr. duration: 260 (sec), Heat durations: [26080] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:23:09 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:23' WHERE id = 14022;

-- Event #4, M.Prg: 14027, tot. athletes: 2
-- Tot. progr. duration: 236 (sec), Heat durations: [23690] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:27:29 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:27' WHERE id = 14027;

-- Event #4, M.Prg: 14041, tot. athletes: 3
-- Tot. progr. duration: 272 (sec), Heat durations: [27280] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:31:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:31' WHERE id = 14041;

-- Event #4, M.Prg: 14051, tot. athletes: 2
-- Tot. progr. duration: 241 (sec), Heat durations: [24120] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:35:57 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:35' WHERE id = 14051;


-- Last completed phase code: 30
