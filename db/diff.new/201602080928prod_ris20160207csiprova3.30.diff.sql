-- *** SQL Diff file for ris20160207csiprova3.csv ***
-- Timestamp: 201602080928
INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (22160, 'CERRETTI', 'CHIARA', 2003, NULL, NULL, NULL, '', NULL, 2, 1, '2016-02-08 09:52:20', '2016-02-08 09:52:20', 'CERRETTI CHIARA', 0);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (38757, '?', 151, 22160, 290, 904, 1, '2016-02-08 09:52:21', '2016-02-08 09:52:21', 5, 1596, NULL);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4944, '2016-02-08 09:52:21', '2016-02-08 09:52:21', NULL, NULL, NULL, NULL, 39449, 5166, 9, 1583, 38241, NULL, 1, 1, 1, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4945, '2016-02-08 09:52:22', '2016-02-08 09:52:22', NULL, NULL, NULL, NULL, 39446, 5166, 9, 1583, 38241, NULL, 1, 2, 18, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4946, '2016-02-08 09:52:23', '2016-02-08 09:52:23', NULL, NULL, NULL, NULL, 39421, 1292, 17, 1591, 32753, NULL, 1, 0, 33, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4947, '2016-02-08 09:52:23', '2016-02-08 09:52:23', NULL, NULL, NULL, NULL, 39432, 22160, 290, 1596, 38757, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4948, '2016-02-08 09:52:24', '2016-02-08 09:52:24', NULL, NULL, NULL, NULL, 39407, 1240, 32, 1590, 32719, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4949, '2016-02-08 09:52:25', '2016-02-08 09:52:25', NULL, NULL, NULL, NULL, 39427, 1240, 32, 1590, 32719, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4950, '2016-02-08 09:52:25', '2016-02-08 09:52:25', NULL, NULL, NULL, NULL, 39446, 1533, 32, 1590, 32774, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4951, '2016-02-08 09:52:26', '2016-02-08 09:52:26', NULL, NULL, NULL, NULL, 39416, 1533, 32, 1590, 32774, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272941, 1, 1, 0, 0, 0.0, 100.0, 0, 57, 30, 39400, 1531, 32, 32712, 1, '2016-02-08 09:52:27', '2016-02-08 09:52:27', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272942, 5, 1, 0, 0, 0.0, 80.0, 0, 41, 0, 39401, 1218, 32, 38726, 1, '2016-02-08 09:52:27', '2016-02-08 09:52:27', NULL, 0.0, 0.0, 8.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272943, 1, 1, 0, 0, 0.0, 100.0, 0, 29, 70, 39402, 1612, 32, 32721, 1, '2016-02-08 09:52:28', '2016-02-08 09:52:28', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272944, 4, 1, 0, 0, 0.0, 85.0, 1, 48, 30, 39403, 1363, 32, 32714, 1, '2016-02-08 09:52:28', '2016-02-08 09:52:28', NULL, 0.0, 0.0, 10.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272945, 2, 1, 0, 0, 0.0, 95.0, 1, 5, 90, 39404, 1269, 32, 32717, 1, '2016-02-08 09:52:29', '2016-02-08 09:52:29', NULL, 0.0, 0.0, 14.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272946, 1, 1, 0, 0, 0.0, 100.0, 2, 12, 80, 39405, 1308, 32, 32713, 1, '2016-02-08 09:52:30', '2016-02-08 09:52:30', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272947, 2, 1, 0, 0, 0.0, 95.0, 0, 31, 70, 39406, 1531, 32, 32712, 1, '2016-02-08 09:52:30', '2016-02-08 09:52:30', NULL, 0.0, 0.0, 14.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272948, 6, 1, 0, 0, 0.0, 75.0, 1, 6, 60, 39407, 1218, 32, 38726, 1, '2016-02-08 09:52:31', '2016-02-08 09:52:31', NULL, 0.0, 0.0, 6.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272949, 2, 1, 0, 0, 0.0, 95.0, 0, 36, 10, 39401, 1612, 32, 32721, 1, '2016-02-08 09:52:31', '2016-02-08 09:52:31', NULL, 0.0, 0.0, 14.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272950, 3, 1, 0, 0, 0.0, 90.0, 0, 57, 20, 39408, 1363, 32, 32714, 1, '2016-02-08 09:52:32', '2016-02-08 09:52:32', NULL, 0.0, 0.0, 12.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272951, 3, 1, 0, 0, 0.0, 90.0, 2, 32, 0, 39409, 1269, 32, 32717, 1, '2016-02-08 09:52:33', '2016-02-08 09:52:33', NULL, 0.0, 0.0, 12.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272952, 2, 1, 0, 0, 0.0, 95.0, 0, 58, 0, 39410, 5879, 827, 32765, 1, '2016-02-08 09:52:33', '2016-02-08 09:52:33', NULL, 0.0, 0.0, 14.0, 1595, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272953, 3, 1, 0, 0, 0.0, 90.0, 3, 55, 90, 39411, 5879, 827, 32765, 1, '2016-02-08 09:52:34', '2016-02-08 09:52:34', NULL, 0.0, 0.0, 12.0, 1595, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272954, 3, 1, 0, 0, 0.0, 90.0, 0, 31, 80, 39402, 1685, 9, 32534, 1, '2016-02-08 09:52:35', '2016-02-08 09:52:35', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272955, 6, 1, 0, 0, 0.0, 75.0, 0, 42, 70, 39401, 1731, 9, 38727, 1, '2016-02-08 09:52:35', '2016-02-08 09:52:35', NULL, 0.0, 0.0, 6.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272956, 8, 1, 0, 0, 0.0, 65.0, 1, 10, 20, 39407, 1804, 9, 38090, 1, '2016-02-08 09:52:36', '2016-02-08 09:52:36', NULL, 0.0, 0.0, 2.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272957, 1, 1, 0, 0, 0.0, 100.0, 0, 39, 50, 39412, 1679, 9, 32535, 1, '2016-02-08 09:52:36', '2016-02-08 09:52:36', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272958, 3, 1, 0, 0, 0.0, 90.0, 0, 36, 80, 39401, 20990, 9, 32536, 1, '2016-02-08 09:52:37', '2016-02-08 09:52:37', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272959, 1, 1, 0, 0, 0.0, 100.0, 1, 19, 70, 39415, 5073, 9, 38093, 1, '2016-02-08 09:52:37', '2016-02-08 09:52:37', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272960, 4, 1, 0, 0, 0.0, 85.0, 0, 39, 90, 39416, 1678, 9, 38728, 1, '2016-02-08 09:52:38', '2016-02-08 09:52:38', NULL, 0.0, 0.0, 10.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272961, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 80, 39408, 21044, 9, 32540, 1, '2016-02-08 09:52:39', '2016-02-08 09:52:39', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272962, 3, 1, 0, 0, 0.0, 90.0, 1, 7, 90, 39417, 4848, 9, 32541, 1, '2016-02-08 09:52:39', '2016-02-08 09:52:39', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272963, 2, 1, 0, 0, 0.0, 95.0, 1, 4, 70, 39449, 5166, 9, 38241, 1, '2016-02-08 09:52:40', '2016-02-08 09:52:40', NULL, 0.0, 0.0, 14.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272964, 4, 1, 0, 0, 0.0, 85.0, 0, 48, 60, 39418, 1556, 9, 38729, 1, '2016-02-08 09:52:41', '2016-02-08 09:52:41', NULL, 0.0, 0.0, 10.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272965, 6, 1, 0, 0, 0.0, 75.0, 0, 39, 0, 39419, 1030, 9, 32543, 1, '2016-02-08 09:52:41', '2016-02-08 09:52:41', NULL, 0.0, 0.0, 6.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272966, 3, 1, 0, 0, 0.0, 90.0, 0, 38, 90, 39421, 1680, 9, 32546, 1, '2016-02-08 09:52:42', '2016-02-08 09:52:42', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272967, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 90, 39422, 21990, 9, 38089, 1, '2016-02-08 09:52:43', '2016-02-08 09:52:43', NULL, 0.0, 0.0, 14.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272968, 1, 1, 0, 0, 0.0, 100.0, 0, 40, 50, 39423, 1457, 9, 32547, 1, '2016-02-08 09:52:43', '2016-02-08 09:52:43', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272969, 1, 1, 0, 0, 0.0, 100.0, 1, 7, 10, 39403, 1449, 9, 38091, 1, '2016-02-08 09:52:44', '2016-02-08 09:52:44', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272970, 4, 1, 0, 0, 0.0, 85.0, 0, 43, 60, 39421, 21042, 9, 32549, 1, '2016-02-08 09:52:44', '2016-02-08 09:52:44', NULL, 0.0, 0.0, 10.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272971, 2, 1, 0, 0, 0.0, 95.0, 0, 33, 70, 39426, 95, 9, 32550, 1, '2016-02-08 09:52:45', '2016-02-08 09:52:45', NULL, 0.0, 0.0, 14.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272972, 3, 1, 0, 0, 0.0, 90.0, 1, 2, 70, 39407, 1685, 9, 32534, 1, '2016-02-08 09:52:46', '2016-02-08 09:52:46', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272973, 10, 1, 0, 0, 0.0, 55.0, 1, 13, 20, 39407, 1731, 9, 38727, 1, '2016-02-08 09:52:46', '2016-02-08 09:52:46', NULL, 0.0, 0.0, 2.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272974, 4, 1, 0, 0, 0.0, 85.0, 2, 38, 20, 39427, 1804, 9, 38090, 1, '2016-02-08 09:52:47', '2016-02-08 09:52:47', NULL, 0.0, 0.0, 10.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272975, 4, 1, 0, 0, 0.0, 85.0, 1, 8, 50, 39404, 1679, 9, 32535, 1, '2016-02-08 09:52:48', '2016-02-08 09:52:48', NULL, 0.0, 0.0, 10.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272976, 7, 1, 0, 0, 0.0, 70.0, 1, 8, 50, 39407, 20990, 9, 32536, 1, '2016-02-08 09:52:48', '2016-02-08 09:52:48', NULL, 0.0, 0.0, 4.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272977, 3, 1, 0, 0, 0.0, 90.0, 3, 5, 40, 39428, 5073, 9, 38093, 1, '2016-02-08 09:52:49', '2016-02-08 09:52:49', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272978, 6, 1, 0, 0, 0.0, 75.0, 0, 35, 90, 39424, 1678, 9, 38728, 1, '2016-02-08 09:52:49', '2016-02-08 09:52:49', NULL, 0.0, 0.0, 6.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272979, 1, 1, 0, 0, 0.0, 100.0, 2, 26, 70, 39411, 21044, 9, 32540, 1, '2016-02-08 09:52:50', '2016-02-08 09:52:50', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272980, 3, 1, 0, 0, 0.0, 90.0, 2, 29, 80, 39429, 4848, 9, 32541, 1, '2016-02-08 09:52:50', '2016-02-08 09:52:50', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272981, 3, 1, 0, 0, 0.0, 90.0, 2, 24, 60, 39446, 5166, 9, 38241, 1, '2016-02-08 09:52:51', '2016-02-08 09:52:51', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272982, 7, 1, 0, 0, 0.0, 70.0, 1, 26, 80, 39430, 1556, 9, 38729, 1, '2016-02-08 09:52:52', '2016-02-08 09:52:52', NULL, 0.0, 0.0, 4.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272983, 1, 1, 0, 0, 0.0, 100.0, 1, 12, 80, 39429, 1030, 9, 32543, 1, '2016-02-08 09:52:52', '2016-02-08 09:52:52', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272984, 3, 1, 0, 0, 0.0, 90.0, 2, 47, 90, 39431, 1680, 9, 32546, 1, '2016-02-08 09:52:53', '2016-02-08 09:52:53', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272985, 1, 1, 0, 0, 0.0, 100.0, 0, 41, 30, 39432, 21990, 9, 38089, 1, '2016-02-08 09:52:53', '2016-02-08 09:52:53', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272986, 1, 1, 0, 0, 0.0, 100.0, 1, 11, 90, 39433, 1457, 9, 32547, 1, '2016-02-08 09:52:54', '2016-02-08 09:52:54', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272987, 1, 1, 0, 0, 0.0, 100.0, 0, 33, 50, 39410, 1449, 9, 38091, 1, '2016-02-08 09:52:55', '2016-02-08 09:52:55', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272988, 7, 1, 0, 0, 0.0, 70.0, 1, 22, 80, 39434, 21042, 9, 32549, 1, '2016-02-08 09:52:55', '2016-02-08 09:52:55', NULL, 0.0, 0.0, 4.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272989, 3, 1, 0, 0, 0.0, 90.0, 0, 31, 60, 39419, 95, 9, 32550, 1, '2016-02-08 09:52:56', '2016-02-08 09:52:56', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272990, 1, 1, 0, 0, 0.0, 100.0, 0, 31, 30, 39436, 142, 1, 32559, 1, '2016-02-08 09:52:56', '2016-02-08 09:52:56', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272991, 12, 1, 0, 0, 0.0, 45.0, 1, 50, 30, 39407, 1197, 1, 32607, 1, '2016-02-08 09:52:57', '2016-02-08 09:52:57', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272992, 1, 1, 0, 0, 0.0, 100.0, 0, 39, 0, 39413, 51, 1, 32560, 1, '2016-02-08 09:52:58', '2016-02-08 09:52:58', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272993, 1, 1, 0, 0, 0.0, 100.0, 2, 17, 50, 39409, 1227, 1, 32562, 1, '2016-02-08 09:52:58', '2016-02-08 09:52:58', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272994, 2, 1, 0, 0, 0.0, 95.0, 3, 16, 60, 39437, 192, 1, 32563, 1, '2016-02-08 09:52:59', '2016-02-08 09:52:59', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272995, 1, 1, 0, 0, 0.0, 100.0, 2, 32, 30, 39438, 1843, 1, 32565, 1, '2016-02-08 09:53:00', '2016-02-08 09:53:00', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272996, 4, 1, 0, 0, 0.0, 85.0, 0, 33, 40, 39424, 1405, 1, 38732, 1, '2016-02-08 09:53:00', '2016-02-08 09:53:00', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272997, 5, 1, 0, 0, 0.0, 80.0, 0, 44, 20, 39439, 550, 1, 32568, 1, '2016-02-08 09:53:01', '2016-02-08 09:53:01', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272998, 5, 1, 0, 0, 0.0, 80.0, 0, 41, 10, 39416, 785, 1, 32569, 1, '2016-02-08 09:53:01', '2016-02-08 09:53:01', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (272999, 5, 1, 0, 0, 0.0, 80.0, 1, 12, 80, 39434, 1016, 1, 32570, 1, '2016-02-08 09:53:02', '2016-02-08 09:53:02', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273000, 1, 1, 0, 0, 0.0, 100.0, 1, 20, 30, 39425, 149, 1, 32571, 1, '2016-02-08 09:53:02', '2016-02-08 09:53:02', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273001, 1, 1, 0, 0, 0.0, 100.0, 0, 50, 40, 39440, 468, 1, 32770, 1, '2016-02-08 09:53:03', '2016-02-08 09:53:03', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273002, 2, 1, 0, 0, 0.0, 95.0, 0, 32, 0, 39436, 23, 1, 32573, 1, '2016-02-08 09:53:04', '2016-02-08 09:53:04', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273003, 1, 1, 0, 0, 0.0, 100.0, 1, 1, 40, 39441, 1491, 1, 32576, 1, '2016-02-08 09:53:04', '2016-02-08 09:53:04', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273004, 1, 1, 0, 0, 0.0, 100.0, 2, 43, 80, 39428, 64, 1, 32577, 1, '2016-02-08 09:53:05', '2016-02-08 09:53:05', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273005, 1, 1, 0, 0, 0.0, 100.0, 2, 22, 80, 39442, 1841, 1, 32578, 1, '2016-02-08 09:53:05', '2016-02-08 09:53:05', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273006, 1, 1, 0, 0, 0.0, 100.0, 2, 31, 50, 39443, 1788, 1, 32579, 1, '2016-02-08 09:53:06', '2016-02-08 09:53:06', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273007, 5, 1, 0, 0, 0.0, 80.0, 0, 35, 10, 39402, 1279, 1, 32580, 1, '2016-02-08 09:53:07', '2016-02-08 09:53:07', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273008, 4, 1, 0, 0, 0.0, 85.0, 0, 37, 80, 39426, 500, 1, 38733, 1, '2016-02-08 09:53:07', '2016-02-08 09:53:07', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273009, 2, 1, 0, 0, 0.0, 95.0, 0, 43, 10, 39444, 98, 1, 32582, 1, '2016-02-08 09:53:08', '2016-02-08 09:53:08', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273010, 5, 1, 0, 0, 0.0, 80.0, 0, 46, 50, 39420, 1516, 1, 32583, 1, '2016-02-08 09:53:09', '2016-02-08 09:53:09', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273011, 4, 1, 0, 0, 0.0, 85.0, 3, 13, 80, 39445, 503, 1, 32584, 1, '2016-02-08 09:53:09', '2016-02-08 09:53:09', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273012, 1, 1, 0, 0, 0.0, 100.0, 2, 9, 70, 39446, 1025, 1, 32585, 1, '2016-02-08 09:53:10', '2016-02-08 09:53:10', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273013, 4, 1, 0, 0, 0.0, 85.0, 1, 12, 0, 39441, 1777, 1, 32586, 1, '2016-02-08 09:53:10', '2016-02-08 09:53:10', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273014, 1, 1, 0, 0, 0.0, 100.0, 0, 31, 0, 39447, 1496, 1, 32588, 1, '2016-02-08 09:53:11', '2016-02-08 09:53:11', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273015, 2, 1, 0, 0, 0.0, 95.0, 0, 40, 20, 39412, 142, 1, 32559, 1, '2016-02-08 09:53:12', '2016-02-08 09:53:12', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273016, 7, 1, 0, 0, 0.0, 70.0, 0, 57, 70, 39401, 1197, 1, 32607, 1, '2016-02-08 09:53:12', '2016-02-08 09:53:12', NULL, 0.0, 0.0, 4.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273017, 2, 1, 0, 0, 0.0, 95.0, 0, 41, 0, 39420, 51, 1, 32560, 1, '2016-02-08 09:53:13', '2016-02-08 09:53:13', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273018, 1, 1, 0, 0, 0.0, 100.0, 1, 2, 80, 39404, 1227, 1, 32562, 1, '2016-02-08 09:53:13', '2016-02-08 09:53:13', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273019, 3, 1, 0, 0, 0.0, 90.0, 1, 30, 90, 39433, 192, 1, 32563, 1, '2016-02-08 09:53:14', '2016-02-08 09:53:14', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273020, 2, 1, 0, 0, 0.0, 95.0, 0, 38, 20, 39448, 1843, 1, 32565, 1, '2016-02-08 09:53:15', '2016-02-08 09:53:15', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273021, 3, 1, 0, 0, 0.0, 90.0, 1, 5, 90, 39449, 1405, 1, 38732, 1, '2016-02-08 09:53:15', '2016-02-08 09:53:15', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273022, 2, 1, 0, 0, 0.0, 95.0, 0, 50, 60, 39450, 550, 1, 32568, 1, '2016-02-08 09:53:16', '2016-02-08 09:53:16', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273023, 7, 1, 0, 0, 0.0, 70.0, 0, 39, 60, 39424, 785, 1, 32569, 1, '2016-02-08 09:53:17', '2016-02-08 09:53:17', NULL, 0.0, 0.0, 4.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273024, 2, 1, 0, 0, 0.0, 95.0, 2, 43, 50, 39431, 1016, 1, 32570, 1, '2016-02-08 09:53:17', '2016-02-08 09:53:17', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273025, 3, 1, 0, 0, 0.0, 90.0, 3, 12, 20, 39445, 468, 1, 32770, 1, '2016-02-08 09:53:18', '2016-02-08 09:53:18', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273026, 2, 1, 0, 0, 0.0, 95.0, 2, 21, 70, 39409, 23, 1, 32573, 1, '2016-02-08 09:53:18', '2016-02-08 09:53:18', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273027, 1, 1, 0, 0, 0.0, 100.0, 0, 37, 70, 39451, 64, 1, 32577, 1, '2016-02-08 09:53:19', '2016-02-08 09:53:19', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273028, 1, 1, 0, 0, 0.0, 100.0, 0, 32, 50, 39452, 1841, 1, 32578, 1, '2016-02-08 09:53:19', '2016-02-08 09:53:19', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273029, 1, 1, 0, 0, 0.0, 100.0, 1, 8, 10, 39453, 1788, 1, 32579, 1, '2016-02-08 09:53:20', '2016-02-08 09:53:20', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273030, 4, 1, 0, 0, 0.0, 85.0, 1, 5, 80, 39407, 1279, 1, 32580, 1, '2016-02-08 09:53:21', '2016-02-08 09:53:21', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273031, 5, 1, 0, 0, 0.0, 80.0, 0, 33, 10, 39419, 500, 1, 38733, 1, '2016-02-08 09:53:21', '2016-02-08 09:53:21', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273032, 3, 1, 0, 0, 0.0, 90.0, 0, 43, 40, 39423, 98, 1, 32582, 1, '2016-02-08 09:53:22', '2016-02-08 09:53:22', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273033, 2, 1, 0, 0, 0.0, 95.0, 1, 21, 10, 39425, 1516, 1, 32583, 1, '2016-02-08 09:53:22', '2016-02-08 09:53:22', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273034, 3, 1, 0, 0, 0.0, 90.0, 0, 53, 20, 39440, 503, 1, 32584, 1, '2016-02-08 09:53:23', '2016-02-08 09:53:23', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273035, 2, 1, 0, 0, 0.0, 95.0, 0, 29, 70, 39424, 1025, 1, 32585, 1, '2016-02-08 09:53:24', '2016-02-08 09:53:24', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273036, 1, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 39454, 1777, 1, 32586, 1, '2016-02-08 09:53:24', '2016-02-08 09:53:24', 1, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273037, 1, 1, 0, 0, 0.0, 100.0, 0, 27, 70, 39406, 1496, 1, 32588, 1, '2016-02-08 09:53:25', '2016-02-08 09:53:25', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273038, 2, 1, 0, 0, 0.0, 95.0, 0, 40, 80, 39423, 1807, 18, 32631, 1, '2016-02-08 09:53:25', '2016-02-08 09:53:25', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273039, 11, 1, 0, 0, 0.0, 50.0, 1, 26, 40, 39407, 21982, 18, 38095, 1, '2016-02-08 09:53:26', '2016-02-08 09:53:26', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273040, 2, 1, 0, 0, 0.0, 95.0, 0, 39, 90, 39439, 20986, 18, 32630, 1, '2016-02-08 09:53:27', '2016-02-08 09:53:27', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273041, 4, 1, 0, 0, 0.0, 85.0, 1, 33, 70, 39455, 22141, 18, 38734, 1, '2016-02-08 09:53:27', '2016-02-08 09:53:27', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273042, 7, 1, 0, 0, 0.0, 70.0, 1, 16, 0, 39417, 20994, 18, 32640, 1, '2016-02-08 09:53:28', '2016-02-08 09:53:28', NULL, 0.0, 0.0, 4.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273043, 4, 1, 0, 0, 0.0, 85.0, 1, 43, 60, 39453, 21002, 18, 32639, 1, '2016-02-08 09:53:29', '2016-02-08 09:53:29', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273044, 8, 1, 0, 0, 0.0, 65.0, 1, 30, 90, 39434, 21011, 18, 32642, 1, '2016-02-08 09:53:29', '2016-02-08 09:53:29', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273045, 2, 1, 0, 0, 0.0, 95.0, 0, 43, 90, 39418, 21014, 18, 32633, 1, '2016-02-08 09:53:30', '2016-02-08 09:53:30', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273046, 2, 1, 0, 0, 0.0, 95.0, 1, 22, 80, 39456, 21023, 18, 32645, 1, '2016-02-08 09:53:30', '2016-02-08 09:53:30', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273047, 3, 1, 0, 0, 0.0, 90.0, 1, 8, 10, 39434, 1475, 18, 38094, 1, '2016-02-08 09:53:31', '2016-02-08 09:53:31', NULL, 0.0, 0.0, 12.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273048, 1, 1, 0, 0, 0.0, 100.0, 0, 52, 0, 39457, 21040, 18, 32632, 1, '2016-02-08 09:53:31', '2016-02-08 09:53:31', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273049, 6, 1, 0, 0, 0.0, 75.0, 1, 17, 0, 39404, 22158, 18, 38735, 1, '2016-02-08 09:53:32', '2016-02-08 09:53:32', NULL, 0.0, 0.0, 6.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273050, 7, 1, 0, 0, 0.0, 70.0, 1, 29, 0, 39459, 22153, 18, 38737, 1, '2016-02-08 09:53:33', '2016-02-08 09:53:33', NULL, 0.0, 0.0, 4.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273051, 4, 1, 0, 0, 0.0, 85.0, 1, 24, 60, 39459, 22150, 18, 38738, 1, '2016-02-08 09:53:33', '2016-02-08 09:53:33', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273052, 6, 1, 0, 0, 0.0, 75.0, 1, 26, 70, 39459, 22157, 18, 38739, 1, '2016-02-08 09:53:34', '2016-02-08 09:53:34', NULL, 0.0, 0.0, 6.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273053, 5, 1, 0, 0, 0.0, 80.0, 0, 49, 30, 39422, 22155, 18, 38740, 1, '2016-02-08 09:53:34', '2016-02-08 09:53:34', NULL, 0.0, 0.0, 8.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273054, 1, 1, 0, 0, 0.0, 100.0, 1, 3, 80, 39460, 22138, 18, 38741, 1, '2016-02-08 09:53:35', '2016-02-08 09:53:35', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273055, 4, 1, 0, 0, 0.0, 85.0, 1, 18, 50, 39460, 22143, 18, 38742, 1, '2016-02-08 09:53:36', '2016-02-08 09:53:36', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273056, 3, 1, 0, 0, 0.0, 90.0, 1, 9, 90, 39461, 22154, 18, 38743, 1, '2016-02-08 09:53:36', '2016-02-08 09:53:36', NULL, 0.0, 0.0, 12.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273057, 2, 1, 0, 0, 0.0, 95.0, 1, 15, 20, 39460, 22144, 18, 38745, 1, '2016-02-08 09:53:37', '2016-02-08 09:53:37', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273058, 1, 1, 0, 0, 0.0, 100.0, 2, 56, 90, 39437, 1807, 18, 32631, 1, '2016-02-08 09:53:38', '2016-02-08 09:53:38', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273059, 5, 1, 0, 0, 0.0, 80.0, 3, 19, 90, 39427, 21982, 18, 38095, 1, '2016-02-08 09:53:38', '2016-02-08 09:53:38', NULL, 0.0, 0.0, 8.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273060, 2, 1, 0, 0, 0.0, 95.0, 2, 58, 30, 39443, 20986, 18, 32630, 1, '2016-02-08 09:53:39', '2016-02-08 09:53:39', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273061, 2, 1, 0, 0, 0.0, 95.0, 3, 22, 10, 39462, 22141, 18, 38734, 1, '2016-02-08 09:53:39', '2016-02-08 09:53:39', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273062, 5, 1, 0, 0, 0.0, 80.0, 2, 59, 10, 39429, 20994, 18, 32640, 1, '2016-02-08 09:53:40', '2016-02-08 09:53:40', NULL, 0.0, 0.0, 8.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273063, 3, 1, 0, 0, 0.0, 90.0, 0, 57, 30, 39450, 21002, 18, 32639, 1, '2016-02-08 09:53:41', '2016-02-08 09:53:41', NULL, 0.0, 0.0, 12.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273064, 4, 1, 0, 0, 0.0, 85.0, 3, 16, 20, 39431, 21011, 18, 32642, 1, '2016-02-08 09:53:41', '2016-02-08 09:53:41', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273065, 4, 1, 0, 0, 0.0, 85.0, 3, 7, 40, 39438, 21014, 18, 32633, 1, '2016-02-08 09:53:42', '2016-02-08 09:53:42', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273066, 2, 1, 0, 0, 0.0, 95.0, 3, 3, 70, 39445, 21023, 18, 32645, 1, '2016-02-08 09:53:42', '2016-02-08 09:53:42', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273067, 1, 1, 0, 0, 0.0, 100.0, 2, 34, 70, 39431, 1475, 18, 38094, 1, '2016-02-08 09:53:43', '2016-02-08 09:53:43', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273068, 6, 1, 0, 0, 0.0, 75.0, 3, 30, 70, 39445, 21040, 18, 32632, 1, '2016-02-08 09:53:44', '2016-02-08 09:53:44', NULL, 0.0, 0.0, 6.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273069, 5, 1, 0, 0, 0.0, 80.0, 3, 1, 60, 39409, 22158, 18, 38735, 1, '2016-02-08 09:53:44', '2016-02-08 09:53:44', NULL, 0.0, 0.0, 8.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273070, 3, 1, 0, 0, 0.0, 90.0, 0, 43, 40, 39422, 22153, 18, 38737, 1, '2016-02-08 09:53:45', '2016-02-08 09:53:45', NULL, 0.0, 0.0, 12.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273071, 4, 1, 0, 0, 0.0, 85.0, 0, 46, 40, 39432, 22150, 18, 38738, 1, '2016-02-08 09:53:46', '2016-02-08 09:53:46', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273072, 4, 1, 0, 0, 0.0, 85.0, 0, 44, 30, 39422, 22157, 18, 38739, 1, '2016-02-08 09:53:46', '2016-02-08 09:53:46', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273073, 6, 1, 0, 0, 0.0, 75.0, 0, 49, 60, 39432, 22155, 18, 38740, 1, '2016-02-08 09:53:47', '2016-02-08 09:53:47', NULL, 0.0, 0.0, 6.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273074, 1, 1, 0, 0, 0.0, 100.0, 2, 25, 20, 39463, 22138, 18, 38741, 1, '2016-02-08 09:53:47', '2016-02-08 09:53:47', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273075, 2, 1, 0, 0, 0.0, 95.0, 0, 39, 50, 39461, 22143, 18, 38742, 1, '2016-02-08 09:53:48', '2016-02-08 09:53:48', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273076, 4, 1, 0, 0, 0.0, 85.0, 1, 5, 70, 39464, 22154, 18, 38743, 1, '2016-02-08 09:53:48', '2016-02-08 09:53:48', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273077, 2, 1, 0, 0, 0.0, 95.0, 0, 40, 20, 39464, 22144, 18, 38745, 1, '2016-02-08 09:53:49', '2016-02-08 09:53:49', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273078, 2, 1, 0, 0, 0.0, 95.0, 1, 6, 70, 39441, 4847, 11, 32647, 1, '2016-02-08 09:53:50', '2016-02-08 09:53:50', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273079, 3, 1, 0, 0, 0.0, 90.0, 0, 34, 20, 39452, 1776, 11, 32648, 1, '2016-02-08 09:53:50', '2016-02-08 09:53:50', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273080, 1, 1, 0, 0, 0.0, 100.0, 1, 8, 10, 39430, 984, 11, 38746, 1, '2016-02-08 09:53:51', '2016-02-08 09:53:51', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273081, 2, 1, 0, 0, 0.0, 95.0, 0, 29, 70, 39424, 21980, 11, 38106, 1, '2016-02-08 09:53:51', '2016-02-08 09:53:51', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273082, 1, 1, 0, 0, 0.0, 100.0, 0, 37, 30, 39448, 882, 11, 32649, 1, '2016-02-08 09:53:52', '2016-02-08 09:53:52', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273083, 4, 1, 0, 0, 0.0, 85.0, 1, 8, 20, 39417, 1659, 11, 32650, 1, '2016-02-08 09:53:53', '2016-02-08 09:53:53', NULL, 0.0, 0.0, 10.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273084, 1, 1, 0, 0, 0.0, 100.0, 0, 29, 0, 39419, 1657, 11, 32651, 1, '2016-02-08 09:53:53', '2016-02-08 09:53:53', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273085, 4, 1, 0, 0, 0.0, 85.0, 0, 32, 20, 39419, 87, 11, 38747, 1, '2016-02-08 09:53:54', '2016-02-08 09:53:54', NULL, 0.0, 0.0, 10.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273086, 1, 1, 0, 0, 0.0, 100.0, 1, 21, 70, 39456, 685, 11, 32652, 1, '2016-02-08 09:53:55', '2016-02-08 09:53:55', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273087, 2, 1, 0, 0, 0.0, 95.0, 0, 56, 0, 39457, 140, 11, 32653, 1, '2016-02-08 09:53:55', '2016-02-08 09:53:55', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273088, 1, 1, 0, 0, 0.0, 100.0, 1, 4, 0, 39434, 553, 11, 32654, 1, '2016-02-08 09:53:56', '2016-02-08 09:53:56', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273089, 4, 1, 0, 0, 0.0, 85.0, 1, 12, 40, 39434, 22159, 11, 38748, 1, '2016-02-08 09:53:56', '2016-02-08 09:53:56', NULL, 0.0, 0.0, 10.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273090, 3, 1, 0, 0, 0.0, 90.0, 0, 35, 10, 39436, 228, 11, 32655, 1, '2016-02-08 09:53:57', '2016-02-08 09:53:57', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273091, 7, 1, 0, 0, 0.0, 70.0, 1, 33, 30, 39404, 746, 11, 32656, 1, '2016-02-08 09:53:57', '2016-02-08 09:53:57', NULL, 0.0, 0.0, 4.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273092, 4, 1, 0, 0, 0.0, 85.0, 0, 42, 20, 39436, 148, 11, 32657, 1, '2016-02-08 09:53:58', '2016-02-08 09:53:58', NULL, 0.0, 0.0, 10.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273093, 2, 1, 0, 0, 0.0, 95.0, 1, 19, 50, 39403, 1244, 11, 32658, 1, '2016-02-08 09:53:59', '2016-02-08 09:53:59', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273094, 5, 1, 0, 0, 0.0, 80.0, 1, 50, 80, 39403, 21032, 11, 32659, 1, '2016-02-08 09:53:59', '2016-02-08 09:53:59', NULL, 0.0, 0.0, 8.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273095, 3, 1, 0, 0, 0.0, 90.0, 1, 29, 20, 39403, 229, 11, 32660, 1, '2016-02-08 09:54:00', '2016-02-08 09:54:00', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273096, 2, 1, 0, 0, 0.0, 95.0, 1, 19, 90, 39415, 114, 11, 32661, 1, '2016-02-08 09:54:00', '2016-02-08 09:54:00', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273097, 2, 1, 0, 0, 0.0, 95.0, 0, 36, 0, 39454, 4847, 11, 32647, 1, '2016-02-08 09:54:01', '2016-02-08 09:54:01', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273098, 2, 1, 0, 0, 0.0, 95.0, 2, 25, 40, 39442, 1776, 11, 32648, 1, '2016-02-08 09:54:02', '2016-02-08 09:54:02', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273099, 2, 1, 0, 0, 0.0, 95.0, 0, 33, 20, 39416, 21980, 11, 38106, 1, '2016-02-08 09:54:02', '2016-02-08 09:54:02', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273100, 2, 1, 0, 0, 0.0, 95.0, 1, 11, 90, 39430, 882, 11, 32649, 1, '2016-02-08 09:54:03', '2016-02-08 09:54:03', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273101, 4, 1, 0, 0, 0.0, 85.0, 2, 40, 10, 39429, 1659, 11, 32650, 1, '2016-02-08 09:54:03', '2016-02-08 09:54:03', NULL, 0.0, 0.0, 10.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273102, 1, 1, 0, 0, 0.0, 100.0, 0, 58, 20, 39417, 1657, 11, 32651, 1, '2016-02-08 09:54:04', '2016-02-08 09:54:04', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273103, 3, 1, 0, 0, 0.0, 90.0, 0, 36, 20, 39426, 87, 11, 38747, 1, '2016-02-08 09:54:05', '2016-02-08 09:54:05', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273104, 1, 1, 0, 0, 0.0, 100.0, 3, 3, 10, 39445, 685, 11, 32652, 1, '2016-02-08 09:54:05', '2016-02-08 09:54:05', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273105, 5, 1, 0, 0, 0.0, 80.0, 3, 30, 30, 39445, 140, 11, 32653, 1, '2016-02-08 09:54:06', '2016-02-08 09:54:06', NULL, 0.0, 0.0, 8.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273106, 1, 1, 0, 0, 0.0, 100.0, 0, 32, 20, 39465, 553, 11, 32654, 1, '2016-02-08 09:54:07', '2016-02-08 09:54:07', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273107, 2, 1, 0, 0, 0.0, 95.0, 0, 39, 30, 39465, 22159, 11, 38748, 1, '2016-02-08 09:54:07', '2016-02-08 09:54:07', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273108, 4, 1, 0, 0, 0.0, 85.0, 2, 44, 90, 39409, 228, 11, 32655, 1, '2016-02-08 09:54:08', '2016-02-08 09:54:08', NULL, 0.0, 0.0, 10.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273109, 6, 1, 0, 0, 0.0, 75.0, 3, 35, 60, 39409, 746, 11, 32656, 1, '2016-02-08 09:54:08', '2016-02-08 09:54:08', NULL, 0.0, 0.0, 6.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273110, 5, 1, 0, 0, 0.0, 80.0, 1, 12, 90, 39404, 148, 11, 32657, 1, '2016-02-08 09:54:09', '2016-02-08 09:54:09', NULL, 0.0, 0.0, 8.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273111, 2, 1, 0, 0, 0.0, 95.0, 2, 59, 20, 39411, 1244, 11, 32658, 1, '2016-02-08 09:54:09', '2016-02-08 09:54:09', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273112, 4, 1, 0, 0, 0.0, 85.0, 1, 2, 0, 39408, 21032, 11, 32659, 1, '2016-02-08 09:54:10', '2016-02-08 09:54:10', NULL, 0.0, 0.0, 10.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273113, 2, 1, 0, 0, 0.0, 95.0, 0, 47, 40, 39408, 229, 11, 32660, 1, '2016-02-08 09:54:11', '2016-02-08 09:54:11', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273114, 2, 1, 0, 0, 0.0, 95.0, 2, 54, 80, 39428, 114, 11, 32661, 1, '2016-02-08 09:54:11', '2016-02-08 09:54:11', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273115, 3, 1, 0, 0, 0.0, 90.0, 1, 16, 50, 39460, 21005, 10, 32501, 1, '2016-02-08 09:54:12', '2016-02-08 09:54:12', NULL, 0.0, 0.0, 12.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273116, 10, 1, 0, 0, 0.0, 55.0, 1, 41, 90, 39459, 20991, 10, 32502, 1, '2016-02-08 09:54:12', '2016-02-08 09:54:12', NULL, 0.0, 0.0, 2.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273117, 3, 1, 0, 0, 0.0, 90.0, 1, 23, 60, 39459, 22145, 10, 38749, 1, '2016-02-08 09:54:13', '2016-02-08 09:54:13', NULL, 0.0, 0.0, 12.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273118, 2, 1, 0, 0, 0.0, 95.0, 1, 19, 20, 39459, 21015, 10, 32503, 1, '2016-02-08 09:54:14', '2016-02-08 09:54:14', NULL, 0.0, 0.0, 14.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273119, 3, 1, 0, 0, 0.0, 90.0, 0, 44, 80, 39464, 21005, 10, 32501, 1, '2016-02-08 09:54:14', '2016-02-08 09:54:14', NULL, 0.0, 0.0, 12.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273120, 7, 1, 0, 0, 0.0, 70.0, 1, 1, 20, 39432, 20991, 10, 32502, 1, '2016-02-08 09:54:15', '2016-02-08 09:54:15', NULL, 0.0, 0.0, 4.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273121, 3, 1, 0, 0, 0.0, 90.0, 0, 45, 90, 39432, 22145, 10, 38749, 1, '2016-02-08 09:54:16', '2016-02-08 09:54:16', NULL, 0.0, 0.0, 12.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273122, 3, 1, 0, 0, 0.0, 90.0, 0, 45, 90, 39432, 21015, 10, 32503, 1, '2016-02-08 09:54:16', '2016-02-08 09:54:16', NULL, 0.0, 0.0, 12.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273123, 6, 1, 0, 0, 0.0, 75.0, 1, 19, 0, 39434, 22139, 4, 38750, 1, '2016-02-08 09:54:17', '2016-02-08 09:54:17', NULL, 0.0, 0.0, 6.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273124, 3, 1, 0, 0, 0.0, 90.0, 1, 23, 60, 39453, 21985, 4, 38109, 1, '2016-02-08 09:54:17', '2016-02-08 09:54:17', NULL, 0.0, 0.0, 12.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273125, 5, 1, 0, 0, 0.0, 80.0, 1, 9, 50, 39417, 20951, 4, 32699, 1, '2016-02-08 09:54:18', '2016-02-08 09:54:18', NULL, 0.0, 0.0, 8.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273126, 2, 1, 0, 0, 0.0, 95.0, 0, 45, 30, 39451, 230, 4, 38108, 1, '2016-02-08 09:54:19', '2016-02-08 09:54:19', NULL, 0.0, 0.0, 14.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273127, 1, 1, 0, 0, 0.0, 100.0, 0, 37, 20, 39420, 25, 4, 32706, 1, '2016-02-08 09:54:19', '2016-02-08 09:54:19', NULL, 0.0, 0.0, 16.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273128, 4, 1, 0, 0, 0.0, 85.0, 3, 13, 10, 39443, 11734, 4, 32701, 1, '2016-02-08 09:54:20', '2016-02-08 09:54:20', NULL, 0.0, 0.0, 10.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273129, 4, 1, 0, 0, 0.0, 85.0, 0, 41, 30, 39465, 22139, 4, 38750, 1, '2016-02-08 09:54:20', '2016-02-08 09:54:20', NULL, 0.0, 0.0, 10.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273130, 3, 1, 0, 0, 0.0, 90.0, 0, 40, 60, 39439, 21985, 4, 38109, 1, '2016-02-08 09:54:21', '2016-02-08 09:54:21', NULL, 0.0, 0.0, 12.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273131, 5, 1, 0, 0, 0.0, 80.0, 0, 41, 60, 39426, 20951, 4, 32699, 1, '2016-02-08 09:54:22', '2016-02-08 09:54:22', NULL, 0.0, 0.0, 8.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273132, 3, 1, 0, 0, 0.0, 90.0, 1, 27, 40, 39415, 230, 4, 38108, 1, '2016-02-08 09:54:22', '2016-02-08 09:54:22', NULL, 0.0, 0.0, 12.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273133, 1, 1, 0, 0, 0.0, 100.0, 2, 29, 10, 39435, 25, 4, 32706, 1, '2016-02-08 09:54:23', '2016-02-08 09:54:23', NULL, 0.0, 0.0, 16.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273134, 3, 1, 0, 0, 0.0, 90.0, 1, 10, 40, 39441, 20983, 17, 32733, 1, '2016-02-08 09:54:24', '2016-02-08 09:54:24', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273135, 6, 1, 0, 0, 0.0, 75.0, 0, 43, 80, 39452, 20984, 17, 32734, 1, '2016-02-08 09:54:24', '2016-02-08 09:54:24', NULL, 0.0, 0.0, 6.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273136, 4, 1, 0, 0, 0.0, 85.0, 0, 43, 10, 39413, 772, 17, 32732, 1, '2016-02-08 09:54:25', '2016-02-08 09:54:25', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273137, 4, 1, 0, 0, 0.0, 85.0, 1, 8, 70, 39400, 1813, 17, 32735, 1, '2016-02-08 09:54:25', '2016-02-08 09:54:25', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273138, 5, 1, 0, 0, 0.0, 80.0, 0, 33, 90, 39424, 1460, 17, 38073, 1, '2016-02-08 09:54:26', '2016-02-08 09:54:26', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273139, 2, 1, 0, 0, 0.0, 95.0, 1, 18, 0, 39433, 1088, 17, 32737, 1, '2016-02-08 09:54:26', '2016-02-08 09:54:26', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273140, 1, 1, 0, 0, 0.0, 100.0, 1, 8, 30, 39455, 961, 17, 32740, 1, '2016-02-08 09:54:27', '2016-02-08 09:54:27', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273141, 4, 1, 0, 0, 0.0, 85.0, 1, 12, 40, 39434, 754, 17, 32739, 1, '2016-02-08 09:54:28', '2016-02-08 09:54:28', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273142, 2, 1, 0, 0, 0.0, 95.0, 0, 34, 10, 39421, 951, 17, 32742, 1, '2016-02-08 09:54:28', '2016-02-08 09:54:28', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273143, 3, 1, 0, 0, 0.0, 90.0, 0, 42, 60, 39413, 1117, 17, 32745, 1, '2016-02-08 09:54:29', '2016-02-08 09:54:29', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273144, 6, 1, 0, 0, 0.0, 75.0, 0, 44, 70, 39439, 601, 17, 32746, 1, '2016-02-08 09:54:29', '2016-02-08 09:54:29', NULL, 0.0, 0.0, 6.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273145, 5, 1, 0, 0, 0.0, 80.0, 1, 26, 60, 39459, 21986, 17, 38075, 1, '2016-02-08 09:54:30', '2016-02-08 09:54:30', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273146, 5, 1, 0, 0, 0.0, 80.0, 1, 6, 40, 39407, 1060, 17, 32747, 1, '2016-02-08 09:54:31', '2016-02-08 09:54:31', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273147, 3, 1, 0, 0, 0.0, 90.0, 0, 32, 90, 39424, 1629, 17, 38078, 1, '2016-02-08 09:54:31', '2016-02-08 09:54:31', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273148, 2, 1, 0, 0, 0.0, 95.0, 0, 39, 10, 39413, 590, 17, 32748, 1, '2016-02-08 09:54:32', '2016-02-08 09:54:32', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273149, 1, 1, 0, 0, 0.0, 100.0, 0, 26, 30, 39424, 1448, 17, 32750, 1, '2016-02-08 09:54:33', '2016-02-08 09:54:33', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273150, 2, 1, 0, 0, 0.0, 95.0, 1, 4, 10, 39434, 1292, 17, 32753, 1, '2016-02-08 09:54:33', '2016-02-08 09:54:33', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273151, 4, 1, 0, 0, 0.0, 85.0, 0, 42, 0, 39439, 580, 17, 32754, 1, '2016-02-08 09:54:34', '2016-02-08 09:54:34', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273152, 4, 1, 0, 0, 0.0, 85.0, 0, 37, 40, 39452, 21024, 17, 32755, 1, '2016-02-08 09:54:34', '2016-02-08 09:54:34', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273153, 2, 1, 0, 0, 0.0, 95.0, 0, 30, 90, 39402, 1097, 17, 38079, 1, '2016-02-08 09:54:35', '2016-02-08 09:54:35', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273154, 7, 1, 0, 0, 0.0, 70.0, 0, 45, 20, 39439, 602, 17, 32758, 1, '2016-02-08 09:54:36', '2016-02-08 09:54:36', NULL, 0.0, 0.0, 4.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273155, 3, 1, 0, 0, 0.0, 90.0, 0, 37, 30, 39406, 1721, 17, 32759, 1, '2016-02-08 09:54:36', '2016-02-08 09:54:36', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273156, 5, 1, 0, 0, 0.0, 80.0, 0, 37, 50, 39452, 21035, 17, 32761, 1, '2016-02-08 09:54:37', '2016-02-08 09:54:37', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273157, 3, 1, 0, 0, 0.0, 90.0, 1, 6, 70, 39404, 1116, 17, 32762, 1, '2016-02-08 09:54:37', '2016-02-08 09:54:37', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273158, 2, 1, 0, 0, 0.0, 95.0, 0, 29, 30, 39419, 1456, 17, 38081, 1, '2016-02-08 09:54:38', '2016-02-08 09:54:38', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273159, 1, 1, 0, 0, 0.0, 100.0, 0, 33, 80, 39439, 578, 17, 38082, 1, '2016-02-08 09:54:39', '2016-02-08 09:54:39', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273160, 2, 1, 0, 0, 0.0, 95.0, 0, 33, 0, 39452, 11731, 17, 38083, 1, '2016-02-08 09:54:39', '2016-02-08 09:54:39', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273161, 4, 1, 0, 0, 0.0, 85.0, 0, 32, 90, 39402, 1141, 17, 38751, 1, '2016-02-08 09:54:40', '2016-02-08 09:54:40', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273162, 2, 1, 0, 0, 0.0, 95.0, 1, 2, 40, 39407, 1538, 17, 32725, 1, '2016-02-08 09:54:41', '2016-02-08 09:54:41', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273163, 2, 1, 0, 0, 0.0, 95.0, 1, 5, 70, 39417, 1392, 17, 32726, 1, '2016-02-08 09:54:41', '2016-02-08 09:54:41', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273164, 2, 1, 0, 0, 0.0, 95.0, 1, 10, 70, 39455, 1535, 17, 32728, 1, '2016-02-08 09:54:42', '2016-02-08 09:54:42', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273165, 3, 1, 0, 0, 0.0, 90.0, 1, 13, 60, 39455, 1536, 17, 38086, 1, '2016-02-08 09:54:42', '2016-02-08 09:54:42', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273166, 4, 1, 0, 0, 0.0, 85.0, 1, 21, 10, 39430, 21981, 17, 38087, 1, '2016-02-08 09:54:43', '2016-02-08 09:54:43', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273167, 3, 1, 0, 0, 0.0, 90.0, 1, 14, 80, 39430, 20997, 17, 32730, 1, '2016-02-08 09:54:43', '2016-02-08 09:54:43', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273168, 1, 1, 0, 0, 0.0, 100.0, 1, 51, 0, 39467, 1414, 17, 32731, 1, '2016-02-08 09:54:44', '2016-02-08 09:54:44', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273169, 3, 1, 0, 0, 0.0, 90.0, 0, 37, 10, 39454, 20983, 17, 32733, 1, '2016-02-08 09:54:45', '2016-02-08 09:54:45', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273170, 5, 1, 0, 0, 0.0, 80.0, 0, 43, 10, 39454, 20984, 17, 32734, 1, '2016-02-08 09:54:45', '2016-02-08 09:54:45', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273171, 3, 1, 0, 0, 0.0, 90.0, 3, 30, 40, 39435, 772, 17, 32732, 1, '2016-02-08 09:54:46', '2016-02-08 09:54:46', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273172, 2, 1, 0, 0, 0.0, 95.0, 2, 38, 10, 39405, 1813, 17, 32735, 1, '2016-02-08 09:54:46', '2016-02-08 09:54:46', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273173, 4, 1, 0, 0, 0.0, 85.0, 1, 9, 10, 39449, 1460, 17, 38073, 1, '2016-02-08 09:54:47', '2016-02-08 09:54:47', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273174, 1, 1, 0, 0, 0.0, 100.0, 0, 42, 20, 39444, 1088, 17, 32737, 1, '2016-02-08 09:54:48', '2016-02-08 09:54:48', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273175, 1, 1, 0, 0, 0.0, 100.0, 2, 35, 70, 39462, 961, 17, 32740, 1, '2016-02-08 09:54:48', '2016-02-08 09:54:48', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273176, 5, 1, 0, 0, 0.0, 80.0, 0, 43, 40, 39465, 754, 17, 32739, 1, '2016-02-08 09:54:49', '2016-02-08 09:54:49', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273177, 3, 1, 0, 0, 0.0, 90.0, 0, 39, 70, 39465, 951, 17, 32742, 1, '2016-02-08 09:54:50', '2016-02-08 09:54:50', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273178, 3, 1, 0, 0, 0.0, 90.0, 0, 43, 70, 39420, 1117, 17, 32745, 1, '2016-02-08 09:54:50', '2016-02-08 09:54:50', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273179, 1, 1, 0, 0, 0.0, 100.0, 0, 50, 20, 39450, 601, 17, 32746, 1, '2016-02-08 09:54:51', '2016-02-08 09:54:51', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273180, 5, 1, 0, 0, 0.0, 80.0, 0, 48, 80, 39432, 21986, 17, 38075, 1, '2016-02-08 09:54:51', '2016-02-08 09:54:51', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273181, 1, 1, 0, 0, 0.0, 100.0, 0, 30, 90, 39401, 1060, 17, 32747, 1, '2016-02-08 09:54:52', '2016-02-08 09:54:52', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273182, 3, 1, 0, 0, 0.0, 90.0, 0, 37, 70, 39416, 1629, 17, 38078, 1, '2016-02-08 09:54:53', '2016-02-08 09:54:53', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273183, 2, 1, 0, 0, 0.0, 95.0, 2, 57, 80, 39435, 590, 17, 32748, 1, '2016-02-08 09:54:54', '2016-02-08 09:54:54', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273184, 1, 1, 0, 0, 0.0, 100.0, 0, 54, 30, 39449, 1448, 17, 32750, 1, '2016-02-08 09:54:54', '2016-02-08 09:54:54', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273185, 1, 1, 0, 0, 0.0, 100.0, 0, 31, 30, 39421, 1292, 17, 32753, 1, '2016-02-08 09:54:54', '2016-02-08 09:54:54', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273186, 3, 1, 0, 0, 0.0, 90.0, 3, 9, 80, 39443, 580, 17, 32754, 1, '2016-02-08 09:54:55', '2016-02-08 09:54:55', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273187, 4, 1, 0, 0, 0.0, 85.0, 0, 37, 70, 39454, 21024, 17, 32755, 1, '2016-02-08 09:54:56', '2016-02-08 09:54:56', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273188, 9, 1, 0, 0, 0.0, 60.0, 1, 11, 60, 39407, 1097, 17, 38079, 1, '2016-02-08 09:54:56', '2016-02-08 09:54:56', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273189, 5, 1, 0, 0, 0.0, 80.0, 3, 16, 30, 39443, 602, 17, 32758, 1, '2016-02-08 09:54:57', '2016-02-08 09:54:57', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273190, 3, 1, 0, 0, 0.0, 90.0, 1, 7, 60, 39400, 1721, 17, 32759, 1, '2016-02-08 09:54:58', '2016-02-08 09:54:58', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273191, 3, 1, 0, 0, 0.0, 90.0, 2, 44, 40, 39442, 21035, 17, 32761, 1, '2016-02-08 09:54:58', '2016-02-08 09:54:58', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273192, 2, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 39412, 1116, 17, 32762, 1, '2016-02-08 09:54:59', '2016-02-08 09:54:59', 1, 0.0, 0.0, 0.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273193, 1, 1, 0, 0, 0.0, 100.0, 0, 31, 40, 39426, 1456, 17, 38081, 1, '2016-02-08 09:54:59', '2016-02-08 09:54:59', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273194, 2, 1, 0, 0, 0.0, 95.0, 1, 11, 90, 39453, 578, 17, 38082, 1, '2016-02-08 09:55:00', '2016-02-08 09:55:00', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273195, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 30, 39454, 11731, 17, 38083, 1, '2016-02-08 09:55:00', '2016-02-08 09:55:00', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273196, 3, 1, 0, 0, 0.0, 90.0, 2, 21, 60, 39427, 1141, 17, 38751, 1, '2016-02-08 09:55:01', '2016-02-08 09:55:01', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273197, 2, 1, 0, 0, 0.0, 95.0, 2, 19, 10, 39427, 1538, 17, 32725, 1, '2016-02-08 09:55:02', '2016-02-08 09:55:02', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273198, 2, 1, 0, 0, 0.0, 95.0, 2, 28, 30, 39429, 1392, 17, 32726, 1, '2016-02-08 09:55:02', '2016-02-08 09:55:02', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273199, 1, 1, 0, 0, 0.0, 100.0, 0, 34, 0, 39468, 1535, 17, 32728, 1, '2016-02-08 09:55:03', '2016-02-08 09:55:03', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273200, 1, 1, 0, 0, 0.0, 100.0, 0, 41, 40, 39469, 1536, 17, 38086, 1, '2016-02-08 09:55:04', '2016-02-08 09:55:04', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273201, 1, 1, 0, 0, 0.0, 100.0, 0, 42, 40, 39418, 21981, 17, 38087, 1, '2016-02-08 09:55:04', '2016-02-08 09:55:04', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273202, 2, 1, 0, 0, 0.0, 95.0, 2, 43, 30, 39438, 20997, 17, 32730, 1, '2016-02-08 09:55:05', '2016-02-08 09:55:05', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273203, 1, 1, 0, 0, 0.0, 100.0, 0, 59, 70, 39470, 1414, 17, 32731, 1, '2016-02-08 09:55:05', '2016-02-08 09:55:05', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273204, 8, 1, 0, 0, 0.0, 65.0, 1, 31, 90, 39430, 21046, 290, 32767, 1, '2016-02-08 09:55:06', '2016-02-08 09:55:06', NULL, 0.0, 0.0, 2.0, 1596, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273205, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 90, 39461, 4853, 290, 32769, 1, '2016-02-08 09:55:07', '2016-02-08 09:55:07', NULL, 0.0, 0.0, 16.0, 1596, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273206, 8, 1, 0, 0, 0.0, 65.0, 0, 40, 60, 39424, 21047, 290, 32768, 1, '2016-02-08 09:55:07', '2016-02-08 09:55:07', NULL, 0.0, 0.0, 2.0, 1596, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273207, 1, 1, 0, 0, 0.0, 100.0, 0, 36, 0, 39422, 22146, 290, 38752, 1, '2016-02-08 09:55:08', '2016-02-08 09:55:08', NULL, 0.0, 0.0, 16.0, 1596, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273208, 5, 1, 0, 0, 0.0, 80.0, 3, 36, 90, 39438, 21046, 290, 32767, 1, '2016-02-08 09:55:08', '2016-02-08 09:55:08', NULL, 0.0, 0.0, 8.0, 1596, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273209, 1, 1, 0, 0, 0.0, 100.0, 0, 39, 30, 39464, 4853, 290, 32769, 1, '2016-02-08 09:55:09', '2016-02-08 09:55:09', NULL, 0.0, 0.0, 16.0, 1596, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273210, 5, 1, 0, 0, 0.0, 80.0, 1, 17, 40, 39449, 21047, 290, 32768, 1, '2016-02-08 09:55:10', '2016-02-08 09:55:10', NULL, 0.0, 0.0, 8.0, 1596, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273211, 1, 1, 0, 0, 0.0, 100.0, 1, 14, 70, 39459, 22146, 290, 38752, 1, '2016-02-08 09:55:10', '2016-02-08 09:55:10', NULL, 0.0, 0.0, 16.0, 1596, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273212, 5, 1, 0, 0, 0.0, 80.0, 1, 22, 90, 39430, 11732, 35, 32709, 1, '2016-02-08 09:55:11', '2016-02-08 09:55:11', NULL, 0.0, 0.0, 8.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273213, 6, 1, 0, 0, 0.0, 75.0, 0, 36, 40, 39402, 1409, 35, 32710, 1, '2016-02-08 09:55:11', '2016-02-08 09:55:11', NULL, 0.0, 0.0, 6.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273214, 3, 1, 0, 0, 0.0, 90.0, 3, 2, 50, 39438, 11732, 35, 32709, 1, '2016-02-08 09:55:12', '2016-02-08 09:55:12', NULL, 0.0, 0.0, 12.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273215, 4, 1, 0, 0, 0.0, 85.0, 0, 39, 40, 39401, 1409, 35, 32710, 1, '2016-02-08 09:55:12', '2016-02-08 09:55:12', NULL, 0.0, 0.0, 10.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273216, 6, 1, 0, 0, 0.0, 75.0, 1, 15, 20, 39417, 21003, 826, 32554, 1, '2016-02-08 09:55:13', '2016-02-08 09:55:13', NULL, 0.0, 0.0, 6.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273217, 6, 1, 0, 0, 0.0, 75.0, 1, 25, 70, 39430, 21030, 826, 32551, 1, '2016-02-08 09:55:14', '2016-02-08 09:55:14', NULL, 0.0, 0.0, 6.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273218, 7, 1, 0, 0, 0.0, 70.0, 0, 39, 70, 39402, 22151, 826, 38753, 1, '2016-02-08 09:55:15', '2016-02-08 09:55:15', NULL, 0.0, 0.0, 4.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273219, 4, 1, 0, 0, 0.0, 85.0, 0, 46, 0, 39420, 22149, 826, 38754, 1, '2016-02-08 09:55:15', '2016-02-08 09:55:15', NULL, 0.0, 0.0, 10.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273220, 3, 1, 0, 0, 0.0, 90.0, 0, 46, 40, 39444, 20987, 826, 32552, 1, '2016-02-08 09:55:16', '2016-02-08 09:55:16', NULL, 0.0, 0.0, 12.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273221, 5, 1, 0, 0, 0.0, 80.0, 1, 16, 40, 39441, 22148, 826, 38755, 1, '2016-02-08 09:55:16', '2016-02-08 09:55:16', NULL, 0.0, 0.0, 8.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273222, 9, 1, 0, 0, 0.0, 60.0, 1, 35, 20, 39459, 21021, 826, 32553, 1, '2016-02-08 09:55:17', '2016-02-08 09:55:17', NULL, 0.0, 0.0, 2.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273223, 8, 1, 0, 0, 0.0, 65.0, 1, 33, 40, 39459, 22147, 826, 38756, 1, '2016-02-08 09:55:17', '2016-02-08 09:55:17', NULL, 0.0, 0.0, 2.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273224, 2, 1, 0, 0, 0.0, 95.0, 0, 52, 0, 39440, 20989, 826, 32557, 1, '2016-02-08 09:55:18', '2016-02-08 09:55:18', NULL, 0.0, 0.0, 14.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273225, 3, 1, 0, 0, 0.0, 90.0, 0, 45, 60, 39418, 21030, 826, 32551, 1, '2016-02-08 09:55:19', '2016-02-08 09:55:19', NULL, 0.0, 0.0, 12.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273226, 9, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 39407, 22151, 826, 38753, 1, '2016-02-08 09:55:19', '2016-02-08 09:55:19', 1, 0.0, 0.0, 0.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273227, 2, 1, 0, 0, 0.0, 95.0, 0, 42, 70, 39432, 22160, 290, 38757, 1, '2016-02-08 09:55:20', '2016-02-08 09:55:20', NULL, 0.0, 0.0, 14.0, 1596, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273228, 1, 1, 0, 0, 0.0, 100.0, 1, 2, 30, 39407, 1240, 32, 32719, 1, '2016-02-08 09:55:20', '2016-02-08 09:55:20', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273229, 1, 1, 0, 0, 0.0, 100.0, 2, 15, 80, 39427, 1240, 32, 32719, 1, '2016-02-08 09:55:21', '2016-02-08 09:55:21', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273230, 2, 1, 0, 0, 0.0, 95.0, 2, 17, 90, 39446, 1533, 32, 32774, 1, '2016-02-08 09:55:22', '2016-02-08 09:55:22', NULL, 0.0, 0.0, 14.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273231, 1, 1, 0, 0, 0.0, 100.0, 0, 32, 60, 39416, 1533, 32, 32774, 1, '2016-02-08 09:55:22', '2016-02-08 09:55:22', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);


-- Meeting 15102
-- 'Results acquired' flag setting:
UPDATE meetings SET are_results_acquired = '1' WHERE id = 15102;


-- Meeting 15102
-- 'has_start_list' flag setting:
UPDATE meetings SET has_start_list = '1' WHERE id = 15102;

-- --- BeginTimeCalculator: compute_for_all( 15102 )
-- ----------------------------------------------------
-- Using RESULTS to compute heat length.

-- Event #1, M.Prg: 39400, tot. athletes: 3
-- Tot. progr. duration: 128 (sec), Heat durations: [12870] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 14:52:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 14:52' WHERE id = 39400;

-- Event #1, M.Prg: 39441, tot. athletes: 5
-- Tot. progr. duration: 136 (sec), Heat durations: [13640] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 14:54:08 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 14:54' WHERE id = 39441;

-- Event #2, M.Prg: 39469, tot. athletes: 1
-- Tot. progr. duration: 101 (sec), Heat durations: [10140] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 14:56:24 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 14:56' WHERE id = 39469;

-- Event #2, M.Prg: 39401, tot. athletes: 7
-- Tot. progr. duration: 208 (sec), Heat durations: [11770, 9090] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 14:58:05 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 14:58' WHERE id = 39401;

-- Event #3, M.Prg: 39468, tot. athletes: 1
-- Tot. progr. duration: 94 (sec), Heat durations: [9400] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:01:33 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:01' WHERE id = 39468;

-- Event #3, M.Prg: 39402, tot. athletes: 7
-- Tot. progr. duration: 189 (sec), Heat durations: [9970, 8970] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:03:07 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:03' WHERE id = 39402;

-- Event #4, M.Prg: 39403, tot. athletes: 5
-- Tot. progr. duration: 170 (sec), Heat durations: [17080] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:06:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:06' WHERE id = 39403;

-- Event #4, M.Prg: 39425, tot. athletes: 2
-- Tot. progr. duration: 141 (sec), Heat durations: [14110] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:09:06 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:09' WHERE id = 39425;

-- Event #5, M.Prg: 39404, tot. athletes: 7
-- Tot. progr. duration: 276 (sec), Heat durations: [15330, 12280] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:11:27 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:11' WHERE id = 39404;

-- Event #5, M.Prg: 39433, tot. athletes: 3
-- Tot. progr. duration: 150 (sec), Heat durations: [15090] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:16:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:16' WHERE id = 39433;

-- Event #6, M.Prg: 39442, tot. athletes: 3
-- Tot. progr. duration: 224 (sec), Heat durations: [22440] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:18:33 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:18' WHERE id = 39442;

-- Event #6, M.Prg: 39405, tot. athletes: 2
-- Tot. progr. duration: 218 (sec), Heat durations: [21810] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:22:17 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:22' WHERE id = 39405;

-- Event #7, M.Prg: 39452, tot. athletes: 6
-- Tot. progr. duration: 103 (sec), Heat durations: [10380] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:25:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:25' WHERE id = 39452;

-- Event #7, M.Prg: 39406, tot. athletes: 3
-- Tot. progr. duration: 97 (sec), Heat durations: [9730] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:27:38 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:27' WHERE id = 39406;

-- Event #8, M.Prg: 39407, tot. athletes: 13
-- Tot. progr. duration: 356 (sec), Heat durations: [17030, 12660, 6000] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:29:15 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:29' WHERE id = 39407;

-- Event #8, M.Prg: 39455, tot. athletes: 4
-- Tot. progr. duration: 153 (sec), Heat durations: [15370] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:35:11 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:35' WHERE id = 39455;

-- Event #9, M.Prg: 39408, tot. athletes: 4
-- Tot. progr. duration: 122 (sec), Heat durations: [12200] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:37:44 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:37' WHERE id = 39408;

-- Event #9, M.Prg: 39420, tot. athletes: 5
-- Tot. progr. duration: 106 (sec), Heat durations: [10650] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:39:46 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:39' WHERE id = 39420;

-- Event #10, M.Prg: 39409, tot. athletes: 6
-- Tot. progr. duration: 275 (sec), Heat durations: [27560] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:41:32 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:41' WHERE id = 39409;

-- Event #10, M.Prg: 39437, tot. athletes: 2
-- Tot. progr. duration: 256 (sec), Heat durations: [25660] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:46:07 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:46' WHERE id = 39437;

-- Event #11, M.Prg: 39410, tot. athletes: 2
-- Tot. progr. duration: 118 (sec), Heat durations: [11800] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:50:23 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:50' WHERE id = 39410;

-- Event #11, M.Prg: 39413, tot. athletes: 4
-- Tot. progr. duration: 103 (sec), Heat durations: [10310] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:52:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:52' WHERE id = 39413;

-- Event #12, M.Prg: 39411, tot. athletes: 3
-- Tot. progr. duration: 295 (sec), Heat durations: [29590] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:54:04 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 39411;

-- Event #12, M.Prg: 39435, tot. athletes: 3
-- Tot. progr. duration: 270 (sec), Heat durations: [27040] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:58:59 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:58' WHERE id = 39435;

-- Event #13, M.Prg: 39444, tot. athletes: 3
-- Tot. progr. duration: 106 (sec), Heat durations: [10640] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:03:29 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:03' WHERE id = 39444;

-- Event #13, M.Prg: 39412, tot. athletes: 3
-- Tot. progr. duration: 100 (sec), Heat durations: [10020] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:05:15 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:05' WHERE id = 39412;

-- Event #14, M.Prg: 39414, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:06:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:06' WHERE id = 39414;

-- Event #14, M.Prg: 39470, tot. athletes: 1
-- Tot. progr. duration: 119 (sec), Heat durations: [11970] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:06:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:06' WHERE id = 39470;

-- Event #15, M.Prg: 39467, tot. athletes: 1
-- Tot. progr. duration: 171 (sec), Heat durations: [17100] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:08:54 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:08' WHERE id = 39467;

-- Event #15, M.Prg: 39415, tot. athletes: 3
-- Tot. progr. duration: 147 (sec), Heat durations: [14740] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:11:45 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:11' WHERE id = 39415;

-- Event #16, M.Prg: 39418, tot. athletes: 4
-- Tot. progr. duration: 108 (sec), Heat durations: [10860] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:14:12 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:14' WHERE id = 39418;

-- Event #16, M.Prg: 39416, tot. athletes: 5
-- Tot. progr. duration: 101 (sec), Heat durations: [10110] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:16:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:16' WHERE id = 39416;

-- Event #17, M.Prg: 39417, tot. athletes: 7
-- Tot. progr. duration: 254 (sec), Heat durations: [13600, 11820] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:17:41 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:17' WHERE id = 39417;

-- Event #17, M.Prg: 39453, tot. athletes: 4
-- Tot. progr. duration: 163 (sec), Heat durations: [16360] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:21:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:21' WHERE id = 39453;

-- Event #18, M.Prg: 39419, tot. athletes: 6
-- Tot. progr. duration: 99 (sec), Heat durations: [9900] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:24:38 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:24' WHERE id = 39419;

-- Event #18, M.Prg: 39439, tot. athletes: 7
-- Tot. progr. duration: 199 (sec), Heat durations: [10520, 9380] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:26:17 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:26' WHERE id = 39439;

-- Event #19, M.Prg: 39457, tot. athletes: 2
-- Tot. progr. duration: 116 (sec), Heat durations: [11600] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:29:36 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:29' WHERE id = 39457;

-- Event #19, M.Prg: 39421, tot. athletes: 4
-- Tot. progr. duration: 103 (sec), Heat durations: [10360] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:31:32 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:31' WHERE id = 39421;

-- Event #20, M.Prg: 39461, tot. athletes: 3
-- Tot. progr. duration: 129 (sec), Heat durations: [12990] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:33:15 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:33' WHERE id = 39461;

-- Event #20, M.Prg: 39422, tot. athletes: 5
-- Tot. progr. duration: 109 (sec), Heat durations: [10930] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:35:24 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:35' WHERE id = 39422;

-- Event #21, M.Prg: 39423, tot. athletes: 3
-- Tot. progr. duration: 103 (sec), Heat durations: [10340] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:37:13 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:37' WHERE id = 39423;

-- Event #21, M.Prg: 39436, tot. athletes: 4
-- Tot. progr. duration: 102 (sec), Heat durations: [10220] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:38:56 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:38' WHERE id = 39436;

-- Event #22, M.Prg: 39448, tot. athletes: 2
-- Tot. progr. duration: 98 (sec), Heat durations: [9820] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:40:38 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:40' WHERE id = 39448;

-- Event #22, M.Prg: 39424, tot. athletes: 9
-- Tot. progr. duration: 190 (sec), Heat durations: [10060, 8970] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:42:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:42' WHERE id = 39424;

-- Event #23, M.Prg: 39426, tot. athletes: 5
-- Tot. progr. duration: 101 (sec), Heat durations: [10160] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:45:26 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:45' WHERE id = 39426;

-- Event #23, M.Prg: 39450, tot. athletes: 3
-- Tot. progr. duration: 117 (sec), Heat durations: [11730] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:47:07 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:47' WHERE id = 39450;

-- Event #24, M.Prg: 39462, tot. athletes: 2
-- Tot. progr. duration: 262 (sec), Heat durations: [26210] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:49:04 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:49' WHERE id = 39462;

-- Event #24, M.Prg: 39427, tot. athletes: 5
-- Tot. progr. duration: 259 (sec), Heat durations: [25990] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:53:26 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:53' WHERE id = 39427;

-- Event #25, M.Prg: 39428, tot. athletes: 3
-- Tot. progr. duration: 245 (sec), Heat durations: [24540] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:57:45 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:57' WHERE id = 39428;

-- Event #26, M.Prg: 39429, tot. athletes: 5
-- Tot. progr. duration: 239 (sec), Heat durations: [23910] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:01:50 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:01' WHERE id = 39429;

-- Event #26, M.Prg: 39443, tot. athletes: 5
-- Tot. progr. duration: 256 (sec), Heat durations: [25630] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:05:49 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:05' WHERE id = 39443;

-- Event #27, M.Prg: 39449, tot. athletes: 5
-- Tot. progr. duration: 137 (sec), Heat durations: [13740] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:10:05 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:10' WHERE id = 39449;

-- Event #27, M.Prg: 39430, tot. athletes: 8
-- Tot. progr. duration: 283 (sec), Heat durations: [15190, 13190] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:12:22 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:12' WHERE id = 39430;

-- Event #28, M.Prg: 39431, tot. athletes: 4
-- Tot. progr. duration: 256 (sec), Heat durations: [25620] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:17:05 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:17' WHERE id = 39431;

-- Event #28, M.Prg: 39445, tot. athletes: 6
-- Tot. progr. duration: 270 (sec), Heat durations: [27070] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:21:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:21' WHERE id = 39445;

-- Event #29, M.Prg: 39464, tot. athletes: 4
-- Tot. progr. duration: 125 (sec), Heat durations: [12570] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:25:51 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:25' WHERE id = 39464;

-- Event #29, M.Prg: 39432, tot. athletes: 8
-- Tot. progr. duration: 223 (sec), Heat durations: [12120, 10270] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:27:56 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:27' WHERE id = 39432;

-- Event #30, M.Prg: 39434, tot. athletes: 9
-- Tot. progr. duration: 279 (sec), Heat durations: [15090, 12810] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:31:39 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:31' WHERE id = 39434;

-- Event #30, M.Prg: 39456, tot. athletes: 2
-- Tot. progr. duration: 142 (sec), Heat durations: [14280] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:36:18 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:36' WHERE id = 39456;

-- Event #31, M.Prg: 39446, tot. athletes: 3
-- Tot. progr. duration: 204 (sec), Heat durations: [20460] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:38:40 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:38' WHERE id = 39446;

-- Event #31, M.Prg: 39438, tot. athletes: 5
-- Tot. progr. duration: 276 (sec), Heat durations: [27690] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:42:04 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:42' WHERE id = 39438;

-- Event #32, M.Prg: 39465, tot. athletes: 5
-- Tot. progr. duration: 103 (sec), Heat durations: [10340] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:46:40 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:46' WHERE id = 39465;

-- Event #32, M.Prg: 39440, tot. athletes: 3
-- Tot. progr. duration: 113 (sec), Heat durations: [11320] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:48:23 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:48' WHERE id = 39440;

-- Event #33, M.Prg: 39447, tot. athletes: 1
-- Tot. progr. duration: 91 (sec), Heat durations: [9100] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:50:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:50' WHERE id = 39447;

-- Event #33, M.Prg: 39454, tot. athletes: 6
-- Tot. progr. duration: 103 (sec), Heat durations: [10310] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:51:47 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:51' WHERE id = 39454;

-- Event #34, M.Prg: 39451, tot. athletes: 2
-- Tot. progr. duration: 105 (sec), Heat durations: [10530] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:53:30 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:53' WHERE id = 39451;

-- Event #35, M.Prg: 39463, tot. athletes: 1
-- Tot. progr. duration: 205 (sec), Heat durations: [20520] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:55:15 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:55' WHERE id = 39463;

-- Event #35, M.Prg: 39458, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:58:40 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:58' WHERE id = 39458;

-- Event #36, M.Prg: 39459, tot. athletes: 10
-- Tot. progr. duration: 306 (sec), Heat durations: [16190, 14460] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:58:40 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:58' WHERE id = 39459;

-- Event #36, M.Prg: 39460, tot. athletes: 4
-- Tot. progr. duration: 138 (sec), Heat durations: [13850] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:03:46 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:03' WHERE id = 39460;


-- Last completed phase code: 30
