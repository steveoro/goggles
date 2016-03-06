-- *** SQL Diff file for ris20160306csiprova4.csv ***
-- Timestamp: 201603062244
INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (23101, 'ODORICI', 'MASSIMO', 1970, NULL, NULL, NULL, '', NULL, 1, 1, '2016-03-06 22:53:41', '2016-03-06 22:53:41', 'ODORICI MASSIMO', 0);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (23102, 'SIROLA', 'LUCA', 1961, NULL, NULL, NULL, '', NULL, 1, 1, '2016-03-06 22:53:41', '2016-03-06 22:53:41', 'SIROLA LUCA', 0);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (41643, '?', 151, 23101, 9, 901, 1, '2016-03-06 22:53:42', '2016-03-06 22:53:42', 5, 1583, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (41644, '?', 151, 23102, 5, 903, 1, '2016-03-06 22:53:42', '2016-03-06 22:53:42', 5, 1593, NULL);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (5399, '2016-03-06 22:53:42', '2016-03-06 22:53:42', NULL, NULL, NULL, NULL, 41764, 23101, 9, 1583, 41643, NULL, 1, 0, 45, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (5400, '2016-03-06 22:53:42', '2016-03-06 22:53:42', NULL, NULL, NULL, NULL, 41782, 23101, 9, 1583, 41643, NULL, 1, 1, 12, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (5401, '2016-03-06 22:53:42', '2016-03-06 22:53:42', NULL, NULL, NULL, NULL, 41780, 1538, 17, 1591, 32725, NULL, 1, 2, 18, 50, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (5402, '2016-03-06 22:53:42', '2016-03-06 22:53:42', NULL, NULL, NULL, NULL, 41808, 20998, 17, 1591, 32743, NULL, 1, 2, 55, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (5403, '2016-03-06 22:53:42', '2016-03-06 22:53:42', NULL, NULL, NULL, NULL, 41753, 1533, 32, 1590, 32774, NULL, 1, 1, 0, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (5404, '2016-03-06 22:53:42', '2016-03-06 22:53:42', NULL, NULL, NULL, NULL, 41761, 1533, 32, 1590, 32774, NULL, 1, 2, 14, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (5405, '2016-03-06 22:53:42', '2016-03-06 22:53:42', NULL, NULL, NULL, NULL, 41749, 1495, 32, 1590, 32773, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (5406, '2016-03-06 22:53:42', '2016-03-06 22:53:42', NULL, NULL, NULL, NULL, 41748, 1495, 32, 1590, 32773, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (5407, '2016-03-06 22:53:42', '2016-03-06 22:53:42', NULL, NULL, NULL, NULL, 41766, 23102, 5, 1593, 41644, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285217, 7, 1, 0, 0, 0.0, 70.0, 0, 41, 80, 41745, 1685, 9, 32534, 1, '2016-03-06 22:53:43', '2016-03-06 22:53:43', NULL, 0.0, 0.0, 4.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285218, 6, 1, 0, 0, 0.0, 75.0, 0, 40, 10, 41745, 1731, 9, 38727, 1, '2016-03-06 22:53:43', '2016-03-06 22:53:43', NULL, 0.0, 0.0, 6.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285219, 5, 1, 0, 0, 0.0, 80.0, 2, 36, 10, 41746, 1679, 9, 32535, 1, '2016-03-06 22:53:43', '2016-03-06 22:53:43', NULL, 0.0, 0.0, 8.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285220, 1, 1, 0, 0, 0.0, 100.0, 2, 41, 50, 41747, 4032, 9, 32537, 1, '2016-03-06 22:53:43', '2016-03-06 22:53:43', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285221, 3, 1, 0, 0, 0.0, 90.0, 0, 44, 10, 41748, 1450, 9, 32538, 1, '2016-03-06 22:53:43', '2016-03-06 22:53:43', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285222, 4, 1, 0, 0, 0.0, 85.0, 3, 4, 70, 41749, 5073, 9, 38093, 1, '2016-03-06 22:53:43', '2016-03-06 22:53:43', NULL, 0.0, 0.0, 10.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285223, 3, 1, 0, 0, 0.0, 90.0, 0, 39, 40, 41750, 1678, 9, 38728, 1, '2016-03-06 22:53:43', '2016-03-06 22:53:43', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285224, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 40, 41751, 21044, 9, 32540, 1, '2016-03-06 22:53:43', '2016-03-06 22:53:43', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285225, 5, 1, 0, 0, 0.0, 80.0, 1, 7, 90, 41752, 4848, 9, 32541, 1, '2016-03-06 22:53:43', '2016-03-06 22:53:43', NULL, 0.0, 0.0, 8.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285226, 6, 1, 0, 0, 0.0, 75.0, 0, 48, 40, 41754, 1556, 9, 38729, 1, '2016-03-06 22:53:43', '2016-03-06 22:53:43', NULL, 0.0, 0.0, 6.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285227, 9, 1, 0, 0, 0.0, 60.0, 0, 46, 40, 41755, 1030, 9, 32543, 1, '2016-03-06 22:53:44', '2016-03-06 22:53:44', NULL, 0.0, 0.0, 2.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285228, 6, 1, 0, 0, 0.0, 75.0, 0, 44, 0, 41764, 23101, 9, 41643, 1, '2016-03-06 22:53:44', '2016-03-06 22:53:44', NULL, 0.0, 0.0, 6.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285229, 4, 1, 0, 0, 0.0, 85.0, 0, 33, 10, 41755, 95, 9, 32550, 1, '2016-03-06 22:53:44', '2016-03-06 22:53:44', NULL, 0.0, 0.0, 10.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285230, 9, 1, 0, 0, 0.0, 60.0, 2, 42, 70, 41757, 1680, 9, 32546, 1, '2016-03-06 22:53:44', '2016-03-06 22:53:44', NULL, 0.0, 0.0, 2.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285231, 2, 1, 0, 0, 0.0, 95.0, 0, 40, 0, 41758, 21990, 9, 38089, 1, '2016-03-06 22:53:44', '2016-03-06 22:53:44', NULL, 0.0, 0.0, 14.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285232, 1, 1, 0, 0, 0.0, 100.0, 0, 42, 0, 41759, 1457, 9, 32547, 1, '2016-03-06 22:53:44', '2016-03-06 22:53:44', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285233, 1, 1, 0, 0, 0.0, 100.0, 2, 27, 90, 41760, 1449, 9, 38091, 1, '2016-03-06 22:53:44', '2016-03-06 22:53:44', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285234, 1, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 41761, 4849, 9, 32548, 1, '2016-03-06 22:53:44', '2016-03-06 22:53:44', 1, 0.0, 0.0, 0.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285235, 4, 1, 0, 0, 0.0, 85.0, 1, 3, 20, 41763, 1685, 9, 32534, 1, '2016-03-06 22:53:44', '2016-03-06 22:53:44', NULL, 0.0, 0.0, 10.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285236, 9, 1, 0, 0, 0.0, 60.0, 1, 12, 60, 41763, 1731, 9, 38727, 1, '2016-03-06 22:53:44', '2016-03-06 22:53:44', NULL, 0.0, 0.0, 2.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285237, 3, 1, 0, 0, 0.0, 90.0, 0, 39, 20, 41764, 1679, 9, 32535, 1, '2016-03-06 22:53:45', '2016-03-06 22:53:45', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285238, 3, 1, 0, 0, 0.0, 90.0, 1, 12, 40, 41765, 4032, 9, 32537, 1, '2016-03-06 22:53:45', '2016-03-06 22:53:45', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285239, 2, 1, 0, 0, 0.0, 95.0, 1, 12, 60, 41766, 1450, 9, 32538, 1, '2016-03-06 22:53:45', '2016-03-06 22:53:45', NULL, 0.0, 0.0, 14.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285240, 3, 1, 0, 0, 0.0, 90.0, 3, 35, 60, 41767, 5073, 9, 38093, 1, '2016-03-06 22:53:45', '2016-03-06 22:53:45', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285241, 6, 1, 0, 0, 0.0, 75.0, 1, 10, 80, 41753, 1678, 9, 38728, 1, '2016-03-06 22:53:45', '2016-03-06 22:53:45', NULL, 0.0, 0.0, 6.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285242, 1, 1, 0, 0, 0.0, 100.0, 1, 5, 20, 41768, 21044, 9, 32540, 1, '2016-03-06 22:53:45', '2016-03-06 22:53:45', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285243, 7, 1, 0, 0, 0.0, 70.0, 2, 31, 60, 41769, 4848, 9, 32541, 1, '2016-03-06 22:53:45', '2016-03-06 22:53:45', NULL, 0.0, 0.0, 4.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285244, 13, 1, 0, 0, 0.0, 40.0, 1, 29, 50, 41770, 1556, 9, 38729, 1, '2016-03-06 22:53:45', '2016-03-06 22:53:45', NULL, 0.0, 0.0, 2.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285245, 8, 1, 0, 0, 0.0, 65.0, 1, 12, 50, 41752, 1030, 9, 32543, 1, '2016-03-06 22:53:45', '2016-03-06 22:53:45', NULL, 0.0, 0.0, 2.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285246, 6, 1, 0, 0, 0.0, 75.0, 1, 10, 70, 41782, 23101, 9, 41643, 1, '2016-03-06 22:53:45', '2016-03-06 22:53:45', NULL, 0.0, 0.0, 6.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285247, 4, 1, 0, 0, 0.0, 85.0, 2, 24, 40, 41769, 95, 9, 32550, 1, '2016-03-06 22:53:45', '2016-03-06 22:53:45', NULL, 0.0, 0.0, 10.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285248, 4, 1, 0, 0, 0.0, 85.0, 3, 18, 60, 41771, 1680, 9, 32546, 1, '2016-03-06 22:53:46', '2016-03-06 22:53:46', NULL, 0.0, 0.0, 10.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285249, 3, 1, 0, 0, 0.0, 90.0, 1, 15, 40, 41772, 21990, 9, 38089, 1, '2016-03-06 22:53:46', '2016-03-06 22:53:46', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285250, 1, 1, 0, 0, 0.0, 100.0, 1, 11, 10, 41773, 1457, 9, 32547, 1, '2016-03-06 22:53:46', '2016-03-06 22:53:46', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285251, 1, 1, 0, 0, 0.0, 100.0, 2, 48, 70, 41774, 1449, 9, 38091, 1, '2016-03-06 22:53:46', '2016-03-06 22:53:46', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285252, 4, 1, 0, 0, 0.0, 85.0, 2, 44, 60, 41775, 4849, 9, 32548, 1, '2016-03-06 22:53:46', '2016-03-06 22:53:46', NULL, 0.0, 0.0, 10.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285253, 4, 1, 0, 0, 0.0, 85.0, 2, 12, 30, 41778, 1308, 32, 32713, 1, '2016-03-06 22:53:46', '2016-03-06 22:53:46', NULL, 0.0, 0.0, 10.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285254, 4, 1, 0, 0, 0.0, 85.0, 0, 35, 20, 41779, 1531, 32, 32712, 1, '2016-03-06 22:53:46', '2016-03-06 22:53:46', NULL, 0.0, 0.0, 10.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285255, 8, 1, 0, 0, 0.0, 65.0, 0, 41, 90, 41745, 1218, 32, 38726, 1, '2016-03-06 22:53:46', '2016-03-06 22:53:46', NULL, 0.0, 0.0, 2.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285256, 9, 1, 0, 0, 0.0, 60.0, 2, 57, 50, 41746, 1270, 32, 32716, 1, '2016-03-06 22:53:46', '2016-03-06 22:53:46', NULL, 0.0, 0.0, 2.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285257, 4, 1, 0, 0, 0.0, 85.0, 2, 32, 60, 41746, 1269, 32, 32717, 1, '2016-03-06 22:53:46', '2016-03-06 22:53:46', NULL, 0.0, 0.0, 10.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285258, 3, 1, 0, 0, 0.0, 90.0, 3, 56, 10, 41760, 1363, 32, 32714, 1, '2016-03-06 22:53:46', '2016-03-06 22:53:46', NULL, 0.0, 0.0, 12.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285259, 5, 1, 0, 0, 0.0, 80.0, 2, 15, 90, 41780, 1240, 32, 32719, 1, '2016-03-06 22:53:47', '2016-03-06 22:53:47', NULL, 0.0, 0.0, 8.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285260, 4, 1, 0, 0, 0.0, 85.0, 2, 14, 20, 41780, 1612, 32, 32721, 1, '2016-03-06 22:53:47', '2016-03-06 22:53:47', NULL, 0.0, 0.0, 10.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285261, 3, 1, 0, 0, 0.0, 90.0, 2, 11, 0, 41780, 1187, 32, 32720, 1, '2016-03-06 22:53:47', '2016-03-06 22:53:47', NULL, 0.0, 0.0, 12.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285262, 6, 1, 0, 0, 0.0, 75.0, 0, 59, 0, 41781, 1308, 32, 32713, 1, '2016-03-06 22:53:47', '2016-03-06 22:53:47', NULL, 0.0, 0.0, 6.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285263, 4, 1, 0, 0, 0.0, 85.0, 0, 57, 0, 41781, 1531, 32, 32712, 1, '2016-03-06 22:53:47', '2016-03-06 22:53:47', NULL, 0.0, 0.0, 10.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285264, 6, 1, 0, 0, 0.0, 75.0, 1, 6, 20, 41763, 1218, 32, 38726, 1, '2016-03-06 22:53:47', '2016-03-06 22:53:47', NULL, 0.0, 0.0, 6.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285265, 2, 1, 0, 0, 0.0, 95.0, 1, 5, 60, 41782, 1269, 32, 32717, 1, '2016-03-06 22:53:47', '2016-03-06 22:53:47', NULL, 0.0, 0.0, 14.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285266, 3, 1, 0, 0, 0.0, 90.0, 0, 57, 0, 41751, 1363, 32, 32714, 1, '2016-03-06 22:53:47', '2016-03-06 22:53:47', NULL, 0.0, 0.0, 12.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285267, 3, 1, 0, 0, 0.0, 90.0, 1, 2, 10, 41763, 1240, 32, 32719, 1, '2016-03-06 22:53:47', '2016-03-06 22:53:47', NULL, 0.0, 0.0, 12.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285268, 3, 1, 0, 0, 0.0, 90.0, 0, 36, 0, 41745, 1612, 32, 32721, 1, '2016-03-06 22:53:47', '2016-03-06 22:53:47', NULL, 0.0, 0.0, 12.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285269, 4, 1, 0, 0, 0.0, 85.0, 0, 36, 90, 41745, 1187, 32, 32720, 1, '2016-03-06 22:53:47', '2016-03-06 22:53:47', NULL, 0.0, 0.0, 10.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285270, 7, 1, 0, 0, 0.0, 70.0, 1, 15, 80, 41770, 1733, 21, 38071, 1, '2016-03-06 22:53:47', '2016-03-06 22:53:47', NULL, 0.0, 0.0, 4.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285271, 8, 1, 0, 0, 0.0, 65.0, 1, 19, 40, 41783, 21001, 21, 32532, 1, '2016-03-06 22:53:48', '2016-03-06 22:53:48', NULL, 0.0, 0.0, 2.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285272, 9, 1, 0, 0, 0.0, 60.0, 1, 19, 60, 41783, 21012, 21, 32533, 1, '2016-03-06 22:53:48', '2016-03-06 22:53:48', NULL, 0.0, 0.0, 2.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285273, 1, 1, 0, 0, 0.0, 100.0, 0, 54, 20, 41781, 1824, 21, 32526, 1, '2016-03-06 22:53:48', '2016-03-06 22:53:48', NULL, 0.0, 0.0, 16.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285274, 2, 1, 0, 0, 0.0, 95.0, 0, 55, 0, 41781, 4806, 21, 32527, 1, '2016-03-06 22:53:48', '2016-03-06 22:53:48', NULL, 0.0, 0.0, 14.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285275, 5, 1, 0, 0, 0.0, 80.0, 0, 58, 60, 41781, 4807, 21, 32528, 1, '2016-03-06 22:53:48', '2016-03-06 22:53:48', NULL, 0.0, 0.0, 8.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285276, 3, 1, 0, 0, 0.0, 90.0, 0, 56, 10, 41781, 21031, 21, 32529, 1, '2016-03-06 22:53:48', '2016-03-06 22:53:48', NULL, 0.0, 0.0, 12.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285277, 4, 1, 0, 0, 0.0, 85.0, 1, 11, 60, 41783, 21041, 21, 32531, 1, '2016-03-06 22:53:48', '2016-03-06 22:53:48', NULL, 0.0, 0.0, 10.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285278, 5, 1, 0, 0, 0.0, 80.0, 0, 44, 40, 41754, 1733, 21, 38071, 1, '2016-03-06 22:53:48', '2016-03-06 22:53:48', NULL, 0.0, 0.0, 8.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285279, 9, 1, 0, 0, 0.0, 60.0, 0, 41, 50, 41784, 21001, 21, 32532, 1, '2016-03-06 22:53:48', '2016-03-06 22:53:48', NULL, 0.0, 0.0, 2.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285280, 9, 1, 0, 0, 0.0, 60.0, 0, 41, 50, 41784, 21012, 21, 32533, 1, '2016-03-06 22:53:48', '2016-03-06 22:53:48', NULL, 0.0, 0.0, 2.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285281, 1, 1, 0, 0, 0.0, 100.0, 0, 28, 80, 41779, 1824, 21, 32526, 1, '2016-03-06 22:53:48', '2016-03-06 22:53:48', NULL, 0.0, 0.0, 16.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285282, 1, 1, 0, 0, 0.0, 100.0, 2, 22, 30, 41785, 4806, 21, 32527, 1, '2016-03-06 22:53:48', '2016-03-06 22:53:48', NULL, 0.0, 0.0, 16.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285283, 2, 1, 0, 0, 0.0, 95.0, 0, 30, 80, 41779, 4807, 21, 32528, 1, '2016-03-06 22:53:49', '2016-03-06 22:53:49', NULL, 0.0, 0.0, 14.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285284, 1, 1, 0, 0, 0.0, 100.0, 2, 4, 70, 41778, 21031, 21, 32529, 1, '2016-03-06 22:53:49', '2016-03-06 22:53:49', NULL, 0.0, 0.0, 16.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285285, 6, 1, 0, 0, 0.0, 75.0, 3, 4, 70, 41786, 21041, 21, 32531, 1, '2016-03-06 22:53:49', '2016-03-06 22:53:49', NULL, 0.0, 0.0, 6.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285286, 5, 1, 0, 0, 0.0, 80.0, 0, 36, 60, 41784, 20983, 17, 32733, 1, '2016-03-06 22:53:49', '2016-03-06 22:53:49', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285287, 8, 1, 0, 0, 0.0, 65.0, 1, 18, 80, 41770, 21981, 17, 38087, 1, '2016-03-06 22:53:49', '2016-03-06 22:53:49', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285288, 2, 1, 0, 0, 0.0, 95.0, 0, 34, 40, 41745, 1454, 17, 38072, 1, '2016-03-06 22:53:49', '2016-03-06 22:53:49', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285289, 5, 1, 0, 0, 0.0, 80.0, 0, 37, 40, 41779, 1717, 17, 32736, 1, '2016-03-06 22:53:49', '2016-03-06 22:53:49', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285290, 2, 1, 0, 0, 0.0, 95.0, 0, 36, 60, 41750, 1460, 17, 38073, 1, '2016-03-06 22:53:49', '2016-03-06 22:53:49', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285291, 1, 1, 0, 0, 0.0, 100.0, 2, 55, 70, 41787, 1088, 17, 32737, 1, '2016-03-06 22:53:49', '2016-03-06 22:53:49', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285292, 1, 1, 0, 0, 0.0, 100.0, 1, 6, 10, 41770, 11733, 17, 32729, 1, '2016-03-06 22:53:50', '2016-03-06 22:53:50', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285293, 8, 1, 0, 0, 0.0, 65.0, 2, 49, 20, 41778, 1830, 17, 38074, 1, '2016-03-06 22:53:50', '2016-03-06 22:53:50', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285294, 1, 1, 0, 0, 0.0, 100.0, 2, 32, 70, 41788, 961, 17, 32740, 1, '2016-03-06 22:53:50', '2016-03-06 22:53:50', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285295, 3, 1, 0, 0, 0.0, 90.0, 0, 38, 50, 41789, 951, 17, 32742, 1, '2016-03-06 22:53:50', '2016-03-06 22:53:50', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285296, 6, 1, 0, 0, 0.0, 75.0, 1, 15, 40, 41770, 20997, 17, 32730, 1, '2016-03-06 22:53:50', '2016-03-06 22:53:50', NULL, 0.0, 0.0, 6.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285297, 7, 1, 0, 0, 0.0, 70.0, 0, 40, 0, 41784, 20998, 17, 32743, 1, '2016-03-06 22:53:50', '2016-03-06 22:53:50', NULL, 0.0, 0.0, 4.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285298, 6, 1, 0, 0, 0.0, 75.0, 2, 16, 50, 41780, 1538, 17, 32725, 1, '2016-03-06 22:53:50', '2016-03-06 22:53:50', NULL, 0.0, 0.0, 6.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285299, 5, 1, 0, 0, 0.0, 80.0, 2, 46, 60, 41790, 1135, 17, 32744, 1, '2016-03-06 22:53:50', '2016-03-06 22:53:50', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285300, 5, 1, 0, 0, 0.0, 80.0, 0, 43, 90, 41756, 1117, 17, 32745, 1, '2016-03-06 22:53:50', '2016-03-06 22:53:50', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285301, 7, 1, 0, 0, 0.0, 70.0, 2, 28, 30, 41780, 1060, 17, 32747, 1, '2016-03-06 22:53:50', '2016-03-06 22:53:50', NULL, 0.0, 0.0, 4.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285302, 9, 1, 0, 0, 0.0, 60.0, 0, 50, 70, 41745, 21988, 17, 38077, 1, '2016-03-06 22:53:50', '2016-03-06 22:53:50', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285303, 2, 1, 0, 0, 0.0, 95.0, 2, 53, 20, 41747, 590, 17, 32748, 1, '2016-03-06 22:53:51', '2016-03-06 22:53:51', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285304, 7, 1, 0, 0, 0.0, 70.0, 0, 49, 0, 41764, 1318, 17, 32749, 1, '2016-03-06 22:53:51', '2016-03-06 22:53:51', NULL, 0.0, 0.0, 4.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285305, 10, 1, 0, 0, 0.0, 55.0, 2, 37, 10, 41780, 867, 17, 32752, 1, '2016-03-06 22:53:51', '2016-03-06 22:53:51', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285306, 2, 1, 0, 0, 0.0, 95.0, 0, 43, 20, 41777, 580, 17, 32754, 1, '2016-03-06 22:53:51', '2016-03-06 22:53:51', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285307, 11, 1, 0, 0, 0.0, 50.0, 3, 3, 40, 41757, 1766, 17, 32763, 1, '2016-03-06 22:53:51', '2016-03-06 22:53:51', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285308, 4, 1, 0, 0, 0.0, 85.0, 0, 42, 10, 41791, 993, 17, 32757, 1, '2016-03-06 22:53:51', '2016-03-06 22:53:51', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285309, 3, 1, 0, 0, 0.0, 90.0, 3, 15, 10, 41762, 602, 17, 32758, 1, '2016-03-06 22:53:51', '2016-03-06 22:53:51', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285310, 3, 1, 0, 0, 0.0, 90.0, 0, 37, 60, 41791, 1535, 17, 32728, 1, '2016-03-06 22:53:51', '2016-03-06 22:53:51', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285311, 1, 1, 0, 0, 0.0, 100.0, 2, 41, 90, 41792, 4810, 17, 38080, 1, '2016-03-06 22:53:51', '2016-03-06 22:53:51', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285312, 6, 1, 0, 0, 0.0, 75.0, 0, 39, 0, 41779, 1721, 17, 32759, 1, '2016-03-06 22:53:51', '2016-03-06 22:53:51', NULL, 0.0, 0.0, 6.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285313, 2, 1, 0, 0, 0.0, 95.0, 2, 9, 90, 41780, 1102, 17, 32760, 1, '2016-03-06 22:53:52', '2016-03-06 22:53:52', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285314, 6, 1, 0, 0, 0.0, 75.0, 0, 38, 40, 41784, 21035, 17, 32761, 1, '2016-03-06 22:53:52', '2016-03-06 22:53:52', NULL, 0.0, 0.0, 6.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285315, 4, 1, 0, 0, 0.0, 85.0, 0, 39, 70, 41764, 1116, 17, 32762, 1, '2016-03-06 22:53:52', '2016-03-06 22:53:52', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285316, 1, 1, 0, 0, 0.0, 100.0, 2, 15, 30, 41769, 1456, 17, 38081, 1, '2016-03-06 22:53:52', '2016-03-06 22:53:52', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285317, 3, 1, 0, 0, 0.0, 90.0, 2, 23, 30, 41746, 1426, 17, 32727, 1, '2016-03-06 22:53:52', '2016-03-06 22:53:52', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285318, 5, 1, 0, 0, 0.0, 80.0, 2, 59, 60, 41786, 20983, 17, 32733, 1, '2016-03-06 22:53:52', '2016-03-06 22:53:52', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285319, 2, 1, 0, 0, 0.0, 95.0, 0, 41, 90, 41754, 21981, 17, 38087, 1, '2016-03-06 22:53:52', '2016-03-06 22:53:52', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285320, 3, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 41781, 1717, 17, 32736, 1, '2016-03-06 22:53:52', '2016-03-06 22:53:52', 1, 0.0, 0.0, 0.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285321, 5, 1, 0, 0, 0.0, 80.0, 2, 53, 40, 41775, 1460, 17, 38073, 1, '2016-03-06 22:53:52', '2016-03-06 22:53:52', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285322, 2, 1, 0, 0, 0.0, 95.0, 3, 28, 60, 41793, 1088, 17, 32737, 1, '2016-03-06 22:53:53', '2016-03-06 22:53:53', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285323, 1, 1, 0, 0, 0.0, 100.0, 2, 24, 40, 41790, 11733, 17, 32729, 1, '2016-03-06 22:53:53', '2016-03-06 22:53:53', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285324, 7, 1, 0, 0, 0.0, 70.0, 0, 41, 30, 41779, 1830, 17, 38074, 1, '2016-03-06 22:53:53', '2016-03-06 22:53:53', NULL, 0.0, 0.0, 4.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285325, 2, 1, 0, 0, 0.0, 95.0, 1, 9, 10, 41794, 961, 17, 32740, 1, '2016-03-06 22:53:53', '2016-03-06 22:53:53', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285326, 5, 1, 0, 0, 0.0, 80.0, 2, 32, 0, 41757, 951, 17, 32742, 1, '2016-03-06 22:53:53', '2016-03-06 22:53:53', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285327, 1, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 41795, 20997, 17, 32730, 1, '2016-03-06 22:53:53', '2016-03-06 22:53:53', 1, 0.0, 0.0, 0.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285328, 4, 1, 0, 0, 0.0, 85.0, 2, 52, 0, 41808, 20998, 17, 32743, 1, '2016-03-06 22:53:53', '2016-03-06 22:53:53', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285329, 1, 1, 0, 0, 0.0, 100.0, 2, 33, 60, 41796, 1538, 17, 32725, 1, '2016-03-06 22:53:53', '2016-03-06 22:53:53', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285330, 2, 1, 0, 0, 0.0, 95.0, 3, 5, 0, 41795, 1135, 17, 32744, 1, '2016-03-06 22:53:53', '2016-03-06 22:53:53', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285331, 2, 1, 0, 0, 0.0, 95.0, 3, 20, 50, 41797, 1117, 17, 32745, 1, '2016-03-06 22:53:53', '2016-03-06 22:53:53', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285332, 1, 1, 0, 0, 0.0, 100.0, 0, 30, 30, 41745, 1060, 17, 32747, 1, '2016-03-06 22:53:53', '2016-03-06 22:53:53', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285333, 12, 1, 0, 0, 0.0, 45.0, 1, 32, 80, 41763, 21988, 17, 38077, 1, '2016-03-06 22:53:53', '2016-03-06 22:53:53', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285334, 5, 1, 0, 0, 0.0, 80.0, 1, 14, 80, 41765, 590, 17, 32748, 1, '2016-03-06 22:53:54', '2016-03-06 22:53:54', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285335, 13, 1, 0, 0, 0.0, 40.0, 1, 36, 50, 41782, 1318, 17, 32749, 1, '2016-03-06 22:53:54', '2016-03-06 22:53:54', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285336, 7, 1, 0, 0, 0.0, 70.0, 1, 8, 80, 41763, 867, 17, 32752, 1, '2016-03-06 22:53:54', '2016-03-06 22:53:54', NULL, 0.0, 0.0, 4.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285337, 2, 1, 0, 0, 0.0, 95.0, 3, 21, 40, 41798, 580, 17, 32754, 1, '2016-03-06 22:53:54', '2016-03-06 22:53:54', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285338, 9, 1, 0, 0, 0.0, 60.0, 1, 17, 0, 41776, 1766, 17, 32763, 1, '2016-03-06 22:53:54', '2016-03-06 22:53:54', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285339, 1, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 41799, 993, 17, 32757, 1, '2016-03-06 22:53:54', '2016-03-06 22:53:54', 1, 0.0, 0.0, 0.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285340, 4, 1, 0, 0, 0.0, 85.0, 0, 48, 10, 41777, 602, 17, 32758, 1, '2016-03-06 22:53:54', '2016-03-06 22:53:54', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285341, 1, 1, 0, 0, 0.0, 100.0, 2, 45, 80, 41799, 1535, 17, 32728, 1, '2016-03-06 22:53:54', '2016-03-06 22:53:54', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285342, 4, 1, 0, 0, 0.0, 85.0, 0, 44, 40, 41758, 4810, 17, 38080, 1, '2016-03-06 22:53:54', '2016-03-06 22:53:54', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285343, 9, 1, 0, 0, 0.0, 60.0, 1, 8, 10, 41781, 1721, 17, 32759, 1, '2016-03-06 22:53:55', '2016-03-06 22:53:55', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285344, 2, 1, 0, 0, 0.0, 95.0, 0, 57, 90, 41763, 1102, 17, 32760, 1, '2016-03-06 22:53:55', '2016-03-06 22:53:55', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285345, 8, 1, 0, 0, 0.0, 65.0, 3, 5, 90, 41786, 21035, 17, 32761, 1, '2016-03-06 22:53:55', '2016-03-06 22:53:55', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285346, 4, 1, 0, 0, 0.0, 85.0, 1, 6, 50, 41782, 1116, 17, 32762, 1, '2016-03-06 22:53:55', '2016-03-06 22:53:55', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285347, 3, 1, 0, 0, 0.0, 90.0, 0, 31, 50, 41755, 1456, 17, 38081, 1, '2016-03-06 22:53:55', '2016-03-06 22:53:55', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285348, 2, 1, 0, 0, 0.0, 95.0, 2, 44, 80, 41800, 1426, 17, 32727, 1, '2016-03-06 22:53:55', '2016-03-06 22:53:55', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285349, 2, 1, 0, 0, 0.0, 95.0, 1, 5, 60, 41782, 142, 1, 32559, 1, '2016-03-06 22:53:55', '2016-03-06 22:53:55', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285350, 1, 1, 0, 0, 0.0, 100.0, 1, 9, 40, 41772, 19088, 1, 32589, 1, '2016-03-06 22:53:55', '2016-03-06 22:53:55', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285351, 4, 1, 0, 0, 0.0, 85.0, 1, 14, 0, 41765, 51, 1, 32560, 1, '2016-03-06 22:53:55', '2016-03-06 22:53:55', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285352, 2, 1, 0, 0, 0.0, 95.0, 1, 10, 60, 41772, 19089, 1, 32590, 1, '2016-03-06 22:53:55', '2016-03-06 22:53:55', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285353, 2, 1, 0, 0, 0.0, 95.0, 2, 22, 10, 41746, 1227, 1, 32562, 1, '2016-03-06 22:53:55', '2016-03-06 22:53:55', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285354, 4, 1, 0, 0, 0.0, 85.0, 1, 30, 60, 41773, 192, 1, 32563, 1, '2016-03-06 22:53:56', '2016-03-06 22:53:56', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285355, 3, 1, 0, 0, 0.0, 90.0, 1, 20, 30, 41773, 138, 1, 32564, 1, '2016-03-06 22:53:56', '2016-03-06 22:53:56', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285356, 5, 1, 0, 0, 0.0, 80.0, 1, 29, 20, 41766, 410, 1, 41518, 1, '2016-03-06 22:53:56', '2016-03-06 22:53:56', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285357, 8, 1, 0, 0, 0.0, 65.0, 0, 42, 50, 41755, 1805, 1, 41520, 1, '2016-03-06 22:53:56', '2016-03-06 22:53:56', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285358, 4, 1, 0, 0, 0.0, 85.0, 1, 10, 40, 41770, 1843, 1, 32565, 1, '2016-03-06 22:53:56', '2016-03-06 22:53:56', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285359, 2, 1, 0, 0, 0.0, 95.0, 1, 14, 70, 41801, 20995, 1, 32591, 1, '2016-03-06 22:53:56', '2016-03-06 22:53:56', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285360, 10, 1, 0, 0, 0.0, 55.0, 1, 15, 40, 41752, 20996, 1, 32603, 1, '2016-03-06 22:53:56', '2016-03-06 22:53:56', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285361, 5, 1, 0, 0, 0.0, 80.0, 0, 50, 70, 41777, 550, 1, 32568, 1, '2016-03-06 22:53:56', '2016-03-06 22:53:56', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285362, 6, 1, 0, 0, 0.0, 75.0, 3, 3, 90, 41775, 785, 1, 32569, 1, '2016-03-06 22:53:56', '2016-03-06 22:53:56', NULL, 0.0, 0.0, 6.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285363, 4, 1, 0, 0, 0.0, 85.0, 1, 6, 10, 41752, 620, 1, 32608, 1, '2016-03-06 22:53:56', '2016-03-06 22:53:56', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285364, 5, 1, 0, 0, 0.0, 80.0, 1, 42, 30, 41773, 1644, 1, 41521, 1, '2016-03-06 22:53:56', '2016-03-06 22:53:56', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285365, 5, 1, 0, 0, 0.0, 80.0, 0, 48, 60, 41802, 468, 1, 32770, 1, '2016-03-06 22:53:56', '2016-03-06 22:53:56', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285366, 6, 1, 0, 0, 0.0, 75.0, 1, 26, 20, 41803, 728, 1, 32572, 1, '2016-03-06 22:53:57', '2016-03-06 22:53:57', NULL, 0.0, 0.0, 6.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285367, 1, 1, 0, 0, 0.0, 100.0, 2, 41, 0, 41800, 23, 1, 32573, 1, '2016-03-06 22:53:57', '2016-03-06 22:53:57', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285368, 3, 1, 0, 0, 0.0, 90.0, 1, 12, 80, 41766, 773, 1, 32574, 1, '2016-03-06 22:53:57', '2016-03-06 22:53:57', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285369, 1, 1, 0, 0, 0.0, 100.0, 1, 10, 60, 41801, 23057, 1, 41522, 1, '2016-03-06 22:53:57', '2016-03-06 22:53:57', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285370, 12, 1, 0, 0, 0.0, 45.0, 1, 26, 70, 41770, 21016, 1, 32575, 1, '2016-03-06 22:53:57', '2016-03-06 22:53:57', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285371, 1, 1, 0, 0, 0.0, 100.0, 3, 8, 0, 41767, 64, 1, 32577, 1, '2016-03-06 22:53:57', '2016-03-06 22:53:57', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285372, 1, 1, 0, 0, 0.0, 100.0, 1, 4, 80, 41783, 1841, 1, 32578, 1, '2016-03-06 22:53:57', '2016-03-06 22:53:57', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285373, 1, 1, 0, 0, 0.0, 100.0, 2, 49, 90, 41798, 1788, 1, 32579, 1, '2016-03-06 22:53:57', '2016-03-06 22:53:57', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285374, 5, 1, 0, 0, 0.0, 80.0, 1, 5, 20, 41763, 1279, 1, 32580, 1, '2016-03-06 22:53:57', '2016-03-06 22:53:57', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285375, 1, 1, 0, 0, 0.0, 100.0, 2, 36, 80, 41771, 1541, 1, 32581, 1, '2016-03-06 22:53:57', '2016-03-06 22:53:57', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285376, 10, 1, 0, 0, 0.0, 55.0, 1, 17, 20, 41782, 632, 1, 32606, 1, '2016-03-06 22:53:57', '2016-03-06 22:53:57', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285377, 2, 1, 0, 0, 0.0, 95.0, 0, 42, 90, 41759, 98, 1, 32582, 1, '2016-03-06 22:53:58', '2016-03-06 22:53:58', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285378, 1, 1, 0, 0, 0.0, 100.0, 0, 33, 0, 41804, 19099, 1, 32593, 1, '2016-03-06 22:53:58', '2016-03-06 22:53:58', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285379, 6, 1, 0, 0, 0.0, 75.0, 1, 21, 90, 41765, 1516, 1, 32583, 1, '2016-03-06 22:53:58', '2016-03-06 22:53:58', NULL, 0.0, 0.0, 6.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285380, 6, 1, 0, 0, 0.0, 75.0, 0, 53, 60, 41802, 503, 1, 32584, 1, '2016-03-06 22:53:58', '2016-03-06 22:53:58', NULL, 0.0, 0.0, 6.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285381, 2, 1, 0, 0, 0.0, 95.0, 2, 31, 60, 41775, 1025, 1, 32585, 1, '2016-03-06 22:53:58', '2016-03-06 22:53:58', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285382, 5, 1, 0, 0, 0.0, 80.0, 1, 12, 50, 41783, 1777, 1, 32586, 1, '2016-03-06 22:53:58', '2016-03-06 22:53:58', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285383, 3, 1, 0, 0, 0.0, 90.0, 0, 31, 20, 41779, 1496, 1, 32588, 1, '2016-03-06 22:53:58', '2016-03-06 22:53:58', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285384, 1, 1, 0, 0, 0.0, 100.0, 0, 37, 30, 41764, 142, 1, 32559, 1, '2016-03-06 22:53:58', '2016-03-06 22:53:58', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285385, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 90, 41758, 19088, 1, 32589, 1, '2016-03-06 22:53:58', '2016-03-06 22:53:58', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285386, 4, 1, 0, 0, 0.0, 85.0, 0, 41, 30, 41756, 51, 1, 32560, 1, '2016-03-06 22:53:58', '2016-03-06 22:53:58', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285387, 1, 1, 0, 0, 0.0, 100.0, 2, 53, 50, 41805, 19089, 1, 32590, 1, '2016-03-06 22:53:59', '2016-03-06 22:53:59', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285388, 1, 1, 0, 0, 0.0, 100.0, 1, 3, 60, 41782, 1227, 1, 32562, 1, '2016-03-06 22:53:59', '2016-03-06 22:53:59', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285389, 4, 1, 0, 0, 0.0, 85.0, 3, 19, 70, 41787, 192, 1, 32563, 1, '2016-03-06 22:53:59', '2016-03-06 22:53:59', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285390, 2, 1, 0, 0, 0.0, 95.0, 2, 56, 70, 41787, 138, 1, 32564, 1, '2016-03-06 22:53:59', '2016-03-06 22:53:59', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285391, 5, 1, 0, 0, 0.0, 80.0, 3, 13, 30, 41749, 410, 1, 41518, 1, '2016-03-06 22:53:59', '2016-03-06 22:53:59', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285392, 5, 1, 0, 0, 0.0, 80.0, 3, 9, 20, 41806, 1805, 1, 41520, 1, '2016-03-06 22:53:59', '2016-03-06 22:53:59', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285393, 2, 1, 0, 0, 0.0, 95.0, 2, 29, 90, 41790, 1843, 1, 32565, 1, '2016-03-06 22:53:59', '2016-03-06 22:53:59', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285394, 3, 1, 0, 0, 0.0, 90.0, 0, 41, 20, 41804, 20995, 1, 32591, 1, '2016-03-06 22:53:59', '2016-03-06 22:53:59', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285395, 9, 1, 0, 0, 0.0, 60.0, 2, 46, 20, 41769, 20996, 1, 32603, 1, '2016-03-06 22:53:59', '2016-03-06 22:53:59', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285396, 4, 1, 0, 0, 0.0, 85.0, 3, 30, 40, 41798, 550, 1, 32568, 1, '2016-03-06 22:53:59', '2016-03-06 22:53:59', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285397, 4, 1, 0, 0, 0.0, 85.0, 0, 41, 60, 41750, 785, 1, 32569, 1, '2016-03-06 22:53:59', '2016-03-06 22:53:59', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285398, 3, 1, 0, 0, 0.0, 90.0, 2, 24, 10, 41769, 620, 1, 32608, 1, '2016-03-06 22:53:59', '2016-03-06 22:53:59', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285399, 4, 1, 0, 0, 0.0, 85.0, 0, 51, 80, 41759, 1644, 1, 41521, 1, '2016-03-06 22:54:00', '2016-03-06 22:54:00', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285400, 3, 1, 0, 0, 0.0, 90.0, 3, 10, 30, 41807, 468, 1, 32770, 1, '2016-03-06 22:54:00', '2016-03-06 22:54:00', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285401, 5, 1, 0, 0, 0.0, 80.0, 3, 17, 10, 41807, 728, 1, 32572, 1, '2016-03-06 22:54:00', '2016-03-06 22:54:00', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285402, 1, 1, 0, 0, 0.0, 100.0, 2, 22, 0, 41746, 23, 1, 32573, 1, '2016-03-06 22:54:00', '2016-03-06 22:54:00', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285403, 2, 1, 0, 0, 0.0, 95.0, 0, 41, 30, 41748, 773, 1, 32574, 1, '2016-03-06 22:54:00', '2016-03-06 22:54:00', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285404, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 90, 41804, 23057, 1, 41522, 1, '2016-03-06 22:54:00', '2016-03-06 22:54:00', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285405, 10, 1, 0, 0, 0.0, 55.0, 3, 19, 0, 41790, 21016, 1, 32575, 1, '2016-03-06 22:54:00', '2016-03-06 22:54:00', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285406, 2, 1, 0, 0, 0.0, 95.0, 2, 43, 40, 41749, 64, 1, 32577, 1, '2016-03-06 22:54:00', '2016-03-06 22:54:00', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285407, 1, 1, 0, 0, 0.0, 100.0, 2, 21, 0, 41808, 1841, 1, 32578, 1, '2016-03-06 22:54:00', '2016-03-06 22:54:00', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285408, 1, 1, 0, 0, 0.0, 100.0, 1, 7, 60, 41809, 1788, 1, 32579, 1, '2016-03-06 22:54:00', '2016-03-06 22:54:00', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285409, 8, 1, 0, 0, 0.0, 65.0, 2, 30, 10, 41780, 1279, 1, 32580, 1, '2016-03-06 22:54:00', '2016-03-06 22:54:00', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285410, 5, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 41757, 1541, 1, 32581, 1, '2016-03-06 22:54:01', '2016-03-06 22:54:01', 1, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285411, 1, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 41764, 632, 1, 32606, 1, '2016-03-06 22:54:01', '2016-03-06 22:54:01', 1, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285412, 3, 1, 0, 0, 0.0, 90.0, 2, 59, 20, 41787, 98, 1, 32582, 1, '2016-03-06 22:54:01', '2016-03-06 22:54:01', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285413, 1, 1, 0, 0, 0.0, 100.0, 2, 19, 20, 41810, 19099, 1, 32593, 1, '2016-03-06 22:54:01', '2016-03-06 22:54:01', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285414, 6, 1, 0, 0, 0.0, 75.0, 0, 44, 50, 41756, 1516, 1, 32583, 1, '2016-03-06 22:54:01', '2016-03-06 22:54:01', NULL, 0.0, 0.0, 6.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285415, 4, 1, 0, 0, 0.0, 85.0, 3, 10, 80, 41807, 503, 1, 32584, 1, '2016-03-06 22:54:01', '2016-03-06 22:54:01', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285416, 5, 1, 0, 0, 0.0, 80.0, 2, 16, 10, 41761, 1025, 1, 32585, 1, '2016-03-06 22:54:01', '2016-03-06 22:54:01', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285417, 8, 1, 0, 0, 0.0, 65.0, 0, 40, 50, 41784, 1777, 1, 32586, 1, '2016-03-06 22:54:01', '2016-03-06 22:54:01', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285418, 2, 1, 0, 0, 0.0, 95.0, 2, 11, 40, 41778, 1496, 1, 32588, 1, '2016-03-06 22:54:01', '2016-03-06 22:54:01', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285419, 2, 1, 0, 0, 0.0, 95.0, 2, 58, 60, 41788, 1537, 35, 41523, 1, '2016-03-06 22:54:01', '2016-03-06 22:54:01', NULL, 0.0, 0.0, 14.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285420, 10, 1, 0, 0, 0.0, 55.0, 2, 54, 30, 41769, 1463, 35, 41524, 1, '2016-03-06 22:54:02', '2016-03-06 22:54:02', NULL, 0.0, 0.0, 2.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285421, 7, 1, 0, 0, 0.0, 70.0, 3, 2, 50, 41790, 11732, 35, 32709, 1, '2016-03-06 22:54:02', '2016-03-06 22:54:02', NULL, 0.0, 0.0, 4.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285422, 9, 1, 0, 0, 0.0, 60.0, 2, 35, 60, 41780, 1409, 35, 32710, 1, '2016-03-06 22:54:02', '2016-03-06 22:54:02', NULL, 0.0, 0.0, 2.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285423, 5, 1, 0, 0, 0.0, 80.0, 0, 43, 10, 41791, 1537, 35, 41523, 1, '2016-03-06 22:54:02', '2016-03-06 22:54:02', NULL, 0.0, 0.0, 8.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285424, 4, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 41752, 1463, 35, 41524, 1, '2016-03-06 22:54:02', '2016-03-06 22:54:02', 1, 0.0, 0.0, 0.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285425, 11, 1, 0, 0, 0.0, 50.0, 1, 22, 70, 41770, 11732, 35, 32709, 1, '2016-03-06 22:54:02', '2016-03-06 22:54:02', NULL, 0.0, 0.0, 2.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285426, 2, 1, 0, 0, 0.0, 95.0, 2, 55, 10, 41796, 1409, 35, 32710, 1, '2016-03-06 22:54:02', '2016-03-06 22:54:02', NULL, 0.0, 0.0, 14.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285427, 7, 1, 0, 0, 0.0, 70.0, 1, 14, 80, 41776, 1513, 18, 32616, 1, '2016-03-06 22:54:02', '2016-03-06 22:54:02', NULL, 0.0, 0.0, 4.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285428, 8, 1, 0, 0, 0.0, 65.0, 1, 13, 30, 41782, 1808, 18, 32612, 1, '2016-03-06 22:54:02', '2016-03-06 22:54:02', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285429, 8, 1, 0, 0, 0.0, 65.0, 2, 42, 60, 41769, 1576, 18, 32626, 1, '2016-03-06 22:54:02', '2016-03-06 22:54:02', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285430, 5, 1, 0, 0, 0.0, 80.0, 1, 7, 90, 41753, 1863, 18, 32617, 1, '2016-03-06 22:54:02', '2016-03-06 22:54:02', NULL, 0.0, 0.0, 8.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285431, 4, 1, 0, 0, 0.0, 85.0, 1, 5, 10, 41753, 21010, 18, 32629, 1, '2016-03-06 22:54:02', '2016-03-06 22:54:02', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285432, 1, 1, 0, 0, 0.0, 100.0, 2, 29, 0, 41806, 1845, 18, 32637, 1, '2016-03-06 22:54:03', '2016-03-06 22:54:03', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285433, 12, 1, 0, 0, 0.0, 45.0, 3, 13, 0, 41780, 21982, 18, 38095, 1, '2016-03-06 22:54:03', '2016-03-06 22:54:03', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285434, 2, 1, 0, 0, 0.0, 95.0, 2, 58, 60, 41762, 20986, 18, 32630, 1, '2016-03-06 22:54:03', '2016-03-06 22:54:03', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285435, 6, 1, 0, 0, 0.0, 75.0, 3, 17, 80, 41806, 20994, 18, 32640, 1, '2016-03-06 22:54:03', '2016-03-06 22:54:03', NULL, 0.0, 0.0, 6.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285436, 3, 1, 0, 0, 0.0, 90.0, 3, 15, 30, 41747, 21004, 18, 32641, 1, '2016-03-06 22:54:03', '2016-03-06 22:54:03', NULL, 0.0, 0.0, 12.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285437, 12, 1, 0, 0, 0.0, 45.0, 3, 10, 40, 41757, 21011, 18, 32642, 1, '2016-03-06 22:54:03', '2016-03-06 22:54:03', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285438, 8, 1, 0, 0, 0.0, 65.0, 3, 4, 80, 41790, 21014, 18, 32633, 1, '2016-03-06 22:54:03', '2016-03-06 22:54:03', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285439, 2, 1, 0, 0, 0.0, 95.0, 2, 28, 0, 41757, 1475, 18, 38094, 1, '2016-03-06 22:54:03', '2016-03-06 22:54:03', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285440, 9, 1, 0, 0, 0.0, 60.0, 3, 14, 80, 41790, 4835, 18, 32638, 1, '2016-03-06 22:54:03', '2016-03-06 22:54:03', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285441, 1, 1, 0, 0, 0.0, 100.0, 3, 19, 80, 41793, 1807, 18, 32631, 1, '2016-03-06 22:54:03', '2016-03-06 22:54:03', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285442, 10, 1, 0, 0, 0.0, 55.0, 3, 5, 20, 41746, 22158, 18, 38735, 1, '2016-03-06 22:54:03', '2016-03-06 22:54:03', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285443, 4, 1, 0, 0, 0.0, 85.0, 1, 7, 10, 41776, 1838, 18, 32622, 1, '2016-03-06 22:54:03', '2016-03-06 22:54:03', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285444, 10, 1, 0, 0, 0.0, 55.0, 1, 19, 70, 41770, 1810, 18, 32613, 1, '2016-03-06 22:54:04', '2016-03-06 22:54:04', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285445, 7, 1, 0, 0, 0.0, 70.0, 0, 39, 20, 41755, 21018, 18, 32628, 1, '2016-03-06 22:54:04', '2016-03-06 22:54:04', NULL, 0.0, 0.0, 4.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285446, 7, 1, 0, 0, 0.0, 70.0, 3, 5, 20, 41786, 1476, 18, 32615, 1, '2016-03-06 22:54:04', '2016-03-06 22:54:04', NULL, 0.0, 0.0, 4.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285447, 6, 1, 0, 0, 0.0, 75.0, 3, 35, 70, 41807, 21040, 18, 32632, 1, '2016-03-06 22:54:04', '2016-03-06 22:54:04', NULL, 0.0, 0.0, 6.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285448, 6, 1, 0, 0, 0.0, 75.0, 2, 29, 40, 41778, 4836, 18, 32621, 1, '2016-03-06 22:54:04', '2016-03-06 22:54:04', NULL, 0.0, 0.0, 6.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285449, 1, 1, 0, 0, 0.0, 100.0, 2, 20, 90, 41757, 131, 18, 41525, 1, '2016-03-06 22:54:04', '2016-03-06 22:54:04', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285450, 10, 1, 0, 0, 0.0, 55.0, 2, 44, 50, 41757, 1513, 18, 32616, 1, '2016-03-06 22:54:04', '2016-03-06 22:54:04', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285451, 6, 1, 0, 0, 0.0, 75.0, 2, 40, 90, 41746, 1808, 18, 32612, 1, '2016-03-06 22:54:04', '2016-03-06 22:54:04', NULL, 0.0, 0.0, 6.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285452, 8, 1, 0, 0, 0.0, 65.0, 2, 34, 30, 41761, 1863, 18, 32617, 1, '2016-03-06 22:54:04', '2016-03-06 22:54:04', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285453, 7, 1, 0, 0, 0.0, 70.0, 2, 33, 0, 41761, 21010, 18, 32629, 1, '2016-03-06 22:54:04', '2016-03-06 22:54:04', NULL, 0.0, 0.0, 4.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285454, 11, 1, 0, 0, 0.0, 50.0, 1, 26, 70, 41763, 21982, 18, 38095, 1, '2016-03-06 22:54:04', '2016-03-06 22:54:04', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285455, 3, 1, 0, 0, 0.0, 90.0, 3, 23, 0, 41798, 20986, 18, 32630, 1, '2016-03-06 22:54:05', '2016-03-06 22:54:05', NULL, 0.0, 0.0, 12.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285456, 9, 1, 0, 0, 0.0, 60.0, 1, 13, 90, 41752, 20994, 18, 32640, 1, '2016-03-06 22:54:05', '2016-03-06 22:54:05', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285457, 7, 1, 0, 0, 0.0, 70.0, 1, 30, 60, 41765, 21004, 18, 32641, 1, '2016-03-06 22:54:05', '2016-03-06 22:54:05', NULL, 0.0, 0.0, 4.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285458, 10, 1, 0, 0, 0.0, 55.0, 1, 25, 10, 41776, 21011, 18, 32642, 1, '2016-03-06 22:54:05', '2016-03-06 22:54:05', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285459, 4, 1, 0, 0, 0.0, 85.0, 0, 43, 90, 41754, 21014, 18, 32633, 1, '2016-03-06 22:54:05', '2016-03-06 22:54:05', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285460, 3, 1, 0, 0, 0.0, 90.0, 2, 55, 80, 41771, 1475, 18, 38094, 1, '2016-03-06 22:54:05', '2016-03-06 22:54:05', NULL, 0.0, 0.0, 12.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285461, 7, 1, 0, 0, 0.0, 70.0, 0, 53, 10, 41754, 4835, 18, 32638, 1, '2016-03-06 22:54:05', '2016-03-06 22:54:05', NULL, 0.0, 0.0, 4.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285462, 2, 1, 0, 0, 0.0, 95.0, 1, 18, 60, 41773, 1807, 18, 32631, 1, '2016-03-06 22:54:05', '2016-03-06 22:54:05', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285463, 9, 1, 0, 0, 0.0, 60.0, 1, 17, 0, 41782, 22158, 18, 38735, 1, '2016-03-06 22:54:05', '2016-03-06 22:54:05', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285464, 6, 1, 0, 0, 0.0, 75.0, 2, 39, 90, 41757, 1838, 18, 32622, 1, '2016-03-06 22:54:05', '2016-03-06 22:54:05', NULL, 0.0, 0.0, 6.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285465, 4, 1, 0, 0, 0.0, 85.0, 2, 57, 10, 41806, 21018, 18, 32628, 1, '2016-03-06 22:54:05', '2016-03-06 22:54:05', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285466, 7, 1, 0, 0, 0.0, 70.0, 1, 15, 0, 41783, 1476, 18, 32615, 1, '2016-03-06 22:54:06', '2016-03-06 22:54:06', NULL, 0.0, 0.0, 4.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285467, 3, 1, 0, 0, 0.0, 90.0, 4, 2, 20, 41811, 21040, 18, 32632, 1, '2016-03-06 22:54:06', '2016-03-06 22:54:06', NULL, 0.0, 0.0, 12.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285468, 1, 1, 0, 0, 0.0, 100.0, 1, 0, 0, 41776, 131, 18, 41525, 1, '2016-03-06 22:54:06', '2016-03-06 22:54:06', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285469, 2, 1, 0, 0, 0.0, 95.0, 0, 35, 10, 41784, 4847, 11, 32647, 1, '2016-03-06 22:54:06', '2016-03-06 22:54:06', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285470, 3, 1, 0, 0, 0.0, 90.0, 2, 25, 60, 41808, 1776, 11, 32648, 1, '2016-03-06 22:54:06', '2016-03-06 22:54:06', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285471, 4, 1, 0, 0, 0.0, 85.0, 0, 36, 30, 41784, 23055, 11, 41526, 1, '2016-03-06 22:54:06', '2016-03-06 22:54:06', NULL, 0.0, 0.0, 10.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285472, 1, 1, 0, 0, 0.0, 100.0, 2, 53, 40, 41795, 984, 11, 38746, 1, '2016-03-06 22:54:06', '2016-03-06 22:54:06', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285473, 1, 1, 0, 0, 0.0, 100.0, 0, 32, 90, 41750, 21980, 11, 38106, 1, '2016-03-06 22:54:06', '2016-03-06 22:54:06', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285474, 3, 1, 0, 0, 0.0, 90.0, 2, 35, 80, 41790, 882, 11, 32649, 1, '2016-03-06 22:54:06', '2016-03-06 22:54:06', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285475, 6, 1, 0, 0, 0.0, 75.0, 0, 38, 90, 41755, 1659, 11, 32650, 1, '2016-03-06 22:54:06', '2016-03-06 22:54:06', NULL, 0.0, 0.0, 6.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285476, 1, 1, 0, 0, 0.0, 100.0, 0, 31, 10, 41755, 1657, 11, 32651, 1, '2016-03-06 22:54:06', '2016-03-06 22:54:06', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285477, 4, 1, 0, 0, 0.0, 85.0, 2, 24, 40, 41769, 87, 11, 38747, 1, '2016-03-06 22:54:07', '2016-03-06 22:54:07', NULL, 0.0, 0.0, 10.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285478, 2, 1, 0, 0, 0.0, 95.0, 3, 4, 60, 41807, 685, 11, 32652, 1, '2016-03-06 22:54:07', '2016-03-06 22:54:07', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285479, 1, 1, 0, 0, 0.0, 100.0, 0, 31, 90, 41789, 553, 11, 32654, 1, '2016-03-06 22:54:07', '2016-03-06 22:54:07', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285480, 7, 1, 0, 0, 0.0, 70.0, 2, 42, 50, 41757, 22159, 11, 38748, 1, '2016-03-06 22:54:07', '2016-03-06 22:54:07', NULL, 0.0, 0.0, 4.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285481, 8, 1, 0, 0, 0.0, 65.0, 2, 54, 40, 41746, 228, 11, 32655, 1, '2016-03-06 22:54:07', '2016-03-06 22:54:07', NULL, 0.0, 0.0, 2.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285482, 11, 1, 0, 0, 0.0, 50.0, 3, 32, 80, 41746, 746, 11, 32656, 1, '2016-03-06 22:54:07', '2016-03-06 22:54:07', NULL, 0.0, 0.0, 2.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285483, 7, 1, 0, 0, 0.0, 70.0, 2, 46, 70, 41746, 148, 11, 32657, 1, '2016-03-06 22:54:07', '2016-03-06 22:54:07', NULL, 0.0, 0.0, 4.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285484, 2, 1, 0, 0, 0.0, 95.0, 2, 55, 10, 41760, 1244, 11, 32658, 1, '2016-03-06 22:54:07', '2016-03-06 22:54:07', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285485, 4, 1, 0, 0, 0.0, 85.0, 1, 0, 50, 41751, 21032, 11, 32659, 1, '2016-03-06 22:54:07', '2016-03-06 22:54:07', NULL, 0.0, 0.0, 10.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285486, 2, 1, 0, 0, 0.0, 95.0, 0, 46, 40, 41751, 229, 11, 32660, 1, '2016-03-06 22:54:07', '2016-03-06 22:54:07', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285487, 3, 1, 0, 0, 0.0, 90.0, 2, 51, 10, 41749, 114, 11, 32661, 1, '2016-03-06 22:54:07', '2016-03-06 22:54:07', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285488, 2, 1, 0, 0, 0.0, 95.0, 1, 6, 30, 41783, 4847, 11, 32647, 1, '2016-03-06 22:54:07', '2016-03-06 22:54:07', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285489, 1, 1, 0, 0, 0.0, 100.0, 2, 49, 40, 41786, 1776, 11, 32648, 1, '2016-03-06 22:54:08', '2016-03-06 22:54:08', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285490, 3, 1, 0, 0, 0.0, 90.0, 1, 10, 50, 41783, 23055, 11, 41526, 1, '2016-03-06 22:54:08', '2016-03-06 22:54:08', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285491, 2, 1, 0, 0, 0.0, 95.0, 1, 8, 40, 41770, 984, 11, 38746, 1, '2016-03-06 22:54:08', '2016-03-06 22:54:08', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285492, 5, 1, 0, 0, 0.0, 80.0, 1, 11, 70, 41770, 882, 11, 32649, 1, '2016-03-06 22:54:08', '2016-03-06 22:54:08', NULL, 0.0, 0.0, 8.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285493, 3, 1, 0, 0, 0.0, 90.0, 2, 52, 80, 41806, 1659, 11, 32650, 1, '2016-03-06 22:54:08', '2016-03-06 22:54:08', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285494, 1, 1, 0, 0, 0.0, 100.0, 0, 57, 50, 41752, 1657, 11, 32651, 1, '2016-03-06 22:54:08', '2016-03-06 22:54:08', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285495, 3, 1, 0, 0, 0.0, 90.0, 1, 21, 60, 41803, 685, 11, 32652, 1, '2016-03-06 22:54:08', '2016-03-06 22:54:08', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285496, 2, 1, 0, 0, 0.0, 95.0, 1, 4, 50, 41776, 553, 11, 32654, 1, '2016-03-06 22:54:08', '2016-03-06 22:54:08', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285497, 4, 1, 0, 0, 0.0, 85.0, 0, 39, 40, 41789, 22159, 11, 38748, 1, '2016-03-06 22:54:08', '2016-03-06 22:54:08', NULL, 0.0, 0.0, 10.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285498, 5, 1, 0, 0, 0.0, 80.0, 0, 40, 80, 41764, 228, 11, 32655, 1, '2016-03-06 22:54:08', '2016-03-06 22:54:08', NULL, 0.0, 0.0, 8.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285499, 12, 1, 0, 0, 0.0, 45.0, 1, 34, 30, 41782, 746, 11, 32656, 1, '2016-03-06 22:54:08', '2016-03-06 22:54:08', NULL, 0.0, 0.0, 2.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285500, 7, 1, 0, 0, 0.0, 70.0, 1, 11, 70, 41782, 148, 11, 32657, 1, '2016-03-06 22:54:09', '2016-03-06 22:54:09', NULL, 0.0, 0.0, 4.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285501, 2, 1, 0, 0, 0.0, 95.0, 3, 33, 20, 41774, 1244, 11, 32658, 1, '2016-03-06 22:54:09', '2016-03-06 22:54:09', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285502, 3, 1, 0, 0, 0.0, 90.0, 1, 44, 30, 41768, 21032, 11, 32659, 1, '2016-03-06 22:54:09', '2016-03-06 22:54:09', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285503, 2, 1, 0, 0, 0.0, 95.0, 1, 27, 20, 41768, 229, 11, 32660, 1, '2016-03-06 22:54:09', '2016-03-06 22:54:09', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285504, 2, 1, 0, 0, 0.0, 95.0, 3, 17, 70, 41767, 114, 11, 32661, 1, '2016-03-06 22:54:09', '2016-03-06 22:54:09', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285505, 2, 1, 0, 0, 0.0, 95.0, 2, 12, 20, 41761, 1403, 5, 32664, 1, '2016-03-06 22:54:09', '2016-03-06 22:54:09', NULL, 0.0, 0.0, 14.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285506, 5, 1, 0, 0, 0.0, 80.0, 1, 7, 50, 41782, 172, 5, 32667, 1, '2016-03-06 22:54:09', '2016-03-06 22:54:09', NULL, 0.0, 0.0, 8.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285507, 3, 1, 0, 0, 0.0, 90.0, 2, 28, 40, 41757, 12, 5, 32679, 1, '2016-03-06 22:54:09', '2016-03-06 22:54:09', NULL, 0.0, 0.0, 12.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285508, 9, 1, 0, 0, 0.0, 60.0, 1, 19, 0, 41770, 1432, 5, 32688, 1, '2016-03-06 22:54:09', '2016-03-06 22:54:09', NULL, 0.0, 0.0, 2.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285509, 2, 1, 0, 0, 0.0, 95.0, 0, 36, 80, 41789, 40, 5, 32666, 1, '2016-03-06 22:54:09', '2016-03-06 22:54:09', NULL, 0.0, 0.0, 14.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285510, 4, 1, 0, 0, 0.0, 85.0, 0, 43, 90, 41802, 101, 5, 32689, 1, '2016-03-06 22:54:09', '2016-03-06 22:54:09', NULL, 0.0, 0.0, 10.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285511, 1, 1, 0, 0, 0.0, 100.0, 0, 31, 70, 41756, 803, 5, 32708, 1, '2016-03-06 22:54:10', '2016-03-06 22:54:10', NULL, 0.0, 0.0, 16.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285512, 7, 1, 0, 0, 0.0, 70.0, 2, 42, 50, 41757, 4841, 5, 32681, 1, '2016-03-06 22:54:10', '2016-03-06 22:54:10', NULL, 0.0, 0.0, 4.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285513, 2, 1, 0, 0, 0.0, 95.0, 0, 39, 80, 41802, 136, 5, 32665, 1, '2016-03-06 22:54:10', '2016-03-06 22:54:10', NULL, 0.0, 0.0, 14.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285514, 3, 1, 0, 0, 0.0, 90.0, 1, 5, 60, 41776, 1564, 5, 32683, 1, '2016-03-06 22:54:10', '2016-03-06 22:54:10', NULL, 0.0, 0.0, 12.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285515, 1, 1, 0, 0, 0.0, 100.0, 2, 45, 10, 41762, 4838, 5, 32674, 1, '2016-03-06 22:54:10', '2016-03-06 22:54:10', NULL, 0.0, 0.0, 16.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285516, 3, 1, 0, 0, 0.0, 90.0, 1, 4, 10, 41753, 960, 5, 32693, 1, '2016-03-06 22:54:10', '2016-03-06 22:54:10', NULL, 0.0, 0.0, 12.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285517, 5, 1, 0, 0, 0.0, 80.0, 1, 8, 70, 41776, 1160, 5, 32670, 1, '2016-03-06 22:54:10', '2016-03-06 22:54:10', NULL, 0.0, 0.0, 8.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285518, 5, 1, 0, 0, 0.0, 80.0, 0, 36, 40, 41755, 162, 5, 32668, 1, '2016-03-06 22:54:10', '2016-03-06 22:54:10', NULL, 0.0, 0.0, 8.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285519, 2, 1, 0, 0, 0.0, 95.0, 2, 22, 30, 41769, 697, 5, 32687, 1, '2016-03-06 22:54:10', '2016-03-06 22:54:10', NULL, 0.0, 0.0, 14.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285520, 2, 1, 0, 0, 0.0, 95.0, 0, 35, 50, 41756, 982, 5, 32690, 1, '2016-03-06 22:54:10', '2016-03-06 22:54:10', NULL, 0.0, 0.0, 14.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285521, 8, 1, 0, 0, 0.0, 65.0, 1, 3, 50, 41781, 1662, 5, 32671, 1, '2016-03-06 22:54:10', '2016-03-06 22:54:10', NULL, 0.0, 0.0, 2.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285522, 3, 1, 0, 0, 0.0, 90.0, 2, 53, 70, 41786, 1621, 5, 32682, 1, '2016-03-06 22:54:10', '2016-03-06 22:54:10', NULL, 0.0, 0.0, 12.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285523, 3, 1, 0, 0, 0.0, 90.0, 3, 2, 80, 41796, 1688, 5, 32694, 1, '2016-03-06 22:54:11', '2016-03-06 22:54:11', NULL, 0.0, 0.0, 12.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285524, 3, 1, 0, 0, 0.0, 90.0, 1, 10, 30, 41770, 687, 5, 32686, 1, '2016-03-06 22:54:11', '2016-03-06 22:54:11', NULL, 0.0, 0.0, 12.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285525, 1, 1, 0, 0, 0.0, 100.0, 0, 39, 10, 41777, 92, 5, 32692, 1, '2016-03-06 22:54:11', '2016-03-06 22:54:11', NULL, 0.0, 0.0, 16.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285526, 5, 1, 0, 0, 0.0, 80.0, 0, 37, 50, 41745, 276, 5, 32691, 1, '2016-03-06 22:54:11', '2016-03-06 22:54:11', NULL, 0.0, 0.0, 8.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285527, 3, 1, 0, 0, 0.0, 90.0, 2, 13, 60, 41761, 4861, 5, 32680, 1, '2016-03-06 22:54:11', '2016-03-06 22:54:11', NULL, 0.0, 0.0, 12.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285528, 2, 1, 0, 0, 0.0, 95.0, 0, 36, 10, 41791, 1522, 5, 32675, 1, '2016-03-06 22:54:11', '2016-03-06 22:54:11', NULL, 0.0, 0.0, 14.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285529, 3, 1, 0, 0, 0.0, 90.0, 1, 2, 10, 41752, 1574, 5, 32676, 1, '2016-03-06 22:54:11', '2016-03-06 22:54:11', NULL, 0.0, 0.0, 12.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285530, 1, 1, 0, 0, 0.0, 100.0, 0, 57, 40, 41763, 1164, 5, 32677, 1, '2016-03-06 22:54:11', '2016-03-06 22:54:11', NULL, 0.0, 0.0, 16.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285531, 11, 1, 0, 0, 0.0, 50.0, 2, 42, 90, 41780, 21221, 5, 41527, 1, '2016-03-06 22:54:11', '2016-03-06 22:54:11', NULL, 0.0, 0.0, 2.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285532, 1, 1, 0, 0, 0.0, 100.0, 0, 58, 40, 41753, 1403, 5, 32664, 1, '2016-03-06 22:54:11', '2016-03-06 22:54:11', NULL, 0.0, 0.0, 16.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285533, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 40, 41764, 172, 5, 32667, 1, '2016-03-06 22:54:11', '2016-03-06 22:54:11', NULL, 0.0, 0.0, 14.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285534, 2, 1, 0, 0, 0.0, 95.0, 2, 44, 60, 41771, 12, 5, 32679, 1, '2016-03-06 22:54:11', '2016-03-06 22:54:11', NULL, 0.0, 0.0, 14.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285535, 6, 1, 0, 0, 0.0, 75.0, 1, 11, 10, 41776, 40, 5, 32666, 1, '2016-03-06 22:54:12', '2016-03-06 22:54:12', NULL, 0.0, 0.0, 6.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285536, 4, 1, 0, 0, 0.0, 85.0, 1, 22, 20, 41803, 101, 5, 32689, 1, '2016-03-06 22:54:12', '2016-03-06 22:54:12', NULL, 0.0, 0.0, 10.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285537, 1, 1, 0, 0, 0.0, 100.0, 1, 0, 0, 41765, 803, 5, 32708, 1, '2016-03-06 22:54:12', '2016-03-06 22:54:12', NULL, 0.0, 0.0, 16.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285538, 1, 1, 0, 0, 0.0, 100.0, 3, 8, 60, 41811, 136, 5, 32665, 1, '2016-03-06 22:54:12', '2016-03-06 22:54:12', NULL, 0.0, 0.0, 16.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285539, 4, 1, 0, 0, 0.0, 85.0, 2, 30, 50, 41757, 1564, 5, 32683, 1, '2016-03-06 22:54:12', '2016-03-06 22:54:12', NULL, 0.0, 0.0, 10.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285540, 3, 1, 0, 0, 0.0, 90.0, 1, 15, 70, 41809, 4838, 5, 32674, 1, '2016-03-06 22:54:12', '2016-03-06 22:54:12', NULL, 0.0, 0.0, 12.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285541, 6, 1, 0, 0, 0.0, 75.0, 2, 22, 60, 41761, 960, 5, 32693, 1, '2016-03-06 22:54:12', '2016-03-06 22:54:12', NULL, 0.0, 0.0, 6.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285542, 5, 1, 0, 0, 0.0, 80.0, 0, 40, 20, 41789, 1160, 5, 32670, 1, '2016-03-06 22:54:12', '2016-03-06 22:54:12', NULL, 0.0, 0.0, 8.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285543, 6, 1, 0, 0, 0.0, 75.0, 1, 8, 20, 41752, 162, 5, 32668, 1, '2016-03-06 22:54:12', '2016-03-06 22:54:12', NULL, 0.0, 0.0, 6.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285544, 2, 1, 0, 0, 0.0, 95.0, 2, 45, 20, 41806, 697, 5, 32687, 1, '2016-03-06 22:54:12', '2016-03-06 22:54:12', NULL, 0.0, 0.0, 14.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285545, 2, 1, 0, 0, 0.0, 95.0, 1, 4, 0, 41765, 982, 5, 32690, 1, '2016-03-06 22:54:12', '2016-03-06 22:54:12', NULL, 0.0, 0.0, 14.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285546, 5, 1, 0, 0, 0.0, 80.0, 2, 22, 40, 41778, 1662, 5, 32671, 1, '2016-03-06 22:54:13', '2016-03-06 22:54:13', NULL, 0.0, 0.0, 8.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285547, 4, 1, 0, 0, 0.0, 85.0, 2, 40, 80, 41790, 687, 5, 32686, 1, '2016-03-06 22:54:13', '2016-03-06 22:54:13', NULL, 0.0, 0.0, 10.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285548, 2, 1, 0, 0, 0.0, 95.0, 1, 12, 80, 41809, 92, 5, 32692, 1, '2016-03-06 22:54:13', '2016-03-06 22:54:13', NULL, 0.0, 0.0, 14.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285549, 8, 1, 0, 0, 0.0, 65.0, 1, 10, 40, 41763, 276, 5, 32691, 1, '2016-03-06 22:54:13', '2016-03-06 22:54:13', NULL, 0.0, 0.0, 2.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285550, 1, 1, 0, 0, 0.0, 100.0, 2, 29, 40, 41775, 4861, 5, 32680, 1, '2016-03-06 22:54:13', '2016-03-06 22:54:13', NULL, 0.0, 0.0, 16.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285551, 3, 1, 0, 0, 0.0, 90.0, 1, 11, 40, 41794, 1522, 5, 32675, 1, '2016-03-06 22:54:13', '2016-03-06 22:54:13', NULL, 0.0, 0.0, 12.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285552, 6, 1, 0, 0, 0.0, 75.0, 2, 25, 0, 41769, 1574, 5, 32676, 1, '2016-03-06 22:54:13', '2016-03-06 22:54:13', NULL, 0.0, 0.0, 6.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285553, 1, 1, 0, 0, 0.0, 100.0, 2, 9, 20, 41780, 1164, 5, 32677, 1, '2016-03-06 22:54:13', '2016-03-06 22:54:13', NULL, 0.0, 0.0, 16.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285554, 6, 1, 0, 0, 0.0, 75.0, 0, 42, 10, 41789, 69, 4, 32698, 1, '2016-03-06 22:54:13', '2016-03-06 22:54:13', NULL, 0.0, 0.0, 6.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285555, 3, 1, 0, 0, 0.0, 90.0, 0, 47, 0, 41777, 11734, 4, 32701, 1, '2016-03-06 22:54:13', '2016-03-06 22:54:13', NULL, 0.0, 0.0, 12.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285556, 4, 1, 0, 0, 0.0, 85.0, 0, 48, 50, 41748, 230, 4, 38108, 1, '2016-03-06 22:54:13', '2016-03-06 22:54:13', NULL, 0.0, 0.0, 10.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285557, 3, 1, 0, 0, 0.0, 90.0, 0, 36, 10, 41756, 25, 4, 32706, 1, '2016-03-06 22:54:14', '2016-03-06 22:54:14', NULL, 0.0, 0.0, 12.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285558, 7, 1, 0, 0, 0.0, 70.0, 1, 9, 40, 41752, 20951, 4, 32699, 1, '2016-03-06 22:54:14', '2016-03-06 22:54:14', NULL, 0.0, 0.0, 4.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285559, 8, 1, 0, 0, 0.0, 65.0, 1, 16, 30, 41776, 69, 4, 32698, 1, '2016-03-06 22:54:14', '2016-03-06 22:54:14', NULL, 0.0, 0.0, 2.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285560, 4, 1, 0, 0, 0.0, 85.0, 1, 25, 70, 41809, 11734, 4, 32701, 1, '2016-03-06 22:54:14', '2016-03-06 22:54:14', NULL, 0.0, 0.0, 10.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285561, 4, 1, 0, 0, 0.0, 85.0, 1, 27, 0, 41766, 230, 4, 38108, 1, '2016-03-06 22:54:14', '2016-03-06 22:54:14', NULL, 0.0, 0.0, 10.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285562, 1, 1, 0, 0, 0.0, 100.0, 2, 43, 80, 41797, 25, 4, 32706, 1, '2016-03-06 22:54:14', '2016-03-06 22:54:14', NULL, 0.0, 0.0, 16.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285563, 1, 1, 0, 0, 0.0, 100.0, 0, 32, 80, 41791, 992, 10, 32486, 1, '2016-03-06 22:54:14', '2016-03-06 22:54:14', NULL, 0.0, 0.0, 16.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285564, 1, 1, 0, 0, 0.0, 100.0, 0, 36, 60, 41802, 428, 10, 32495, 1, '2016-03-06 22:54:14', '2016-03-06 22:54:14', NULL, 0.0, 0.0, 16.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285565, 5, 1, 0, 0, 0.0, 80.0, 1, 22, 90, 41803, 698, 10, 32488, 1, '2016-03-06 22:54:14', '2016-03-06 22:54:14', NULL, 0.0, 0.0, 8.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285566, 1, 1, 0, 0, 0.0, 100.0, 2, 33, 60, 41807, 440, 10, 32505, 1, '2016-03-06 22:54:14', '2016-03-06 22:54:14', NULL, 0.0, 0.0, 16.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285567, 11, 1, 0, 0, 0.0, 50.0, 1, 23, 70, 41782, 1254, 10, 41528, 1, '2016-03-06 22:54:14', '2016-03-06 22:54:14', NULL, 0.0, 0.0, 2.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285568, 11, 1, 0, 0, 0.0, 50.0, 3, 0, 10, 41769, 20988, 10, 32513, 1, '2016-03-06 22:54:14', '2016-03-06 22:54:14', NULL, 0.0, 0.0, 2.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285569, 2, 1, 0, 0, 0.0, 95.0, 2, 34, 60, 41785, 1439, 10, 32509, 1, '2016-03-06 22:54:15', '2016-03-06 22:54:15', NULL, 0.0, 0.0, 14.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285570, 3, 1, 0, 0, 0.0, 90.0, 0, 40, 70, 41802, 430, 10, 32490, 1, '2016-03-06 22:54:15', '2016-03-06 22:54:15', NULL, 0.0, 0.0, 12.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285571, 4, 1, 0, 0, 0.0, 85.0, 2, 55, 80, 41786, 21013, 10, 32508, 1, '2016-03-06 22:54:15', '2016-03-06 22:54:15', NULL, 0.0, 0.0, 10.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285572, 3, 1, 0, 0, 0.0, 90.0, 2, 12, 20, 41778, 1697, 10, 32511, 1, '2016-03-06 22:54:15', '2016-03-06 22:54:15', NULL, 0.0, 0.0, 12.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285573, 4, 1, 0, 0, 0.0, 85.0, 2, 15, 30, 41761, 1196, 10, 32492, 1, '2016-03-06 22:54:15', '2016-03-06 22:54:15', NULL, 0.0, 0.0, 10.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285574, 2, 1, 0, 0, 0.0, 95.0, 0, 31, 40, 41755, 1170, 10, 32507, 1, '2016-03-06 22:54:15', '2016-03-06 22:54:15', NULL, 0.0, 0.0, 14.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285575, 11, 1, 0, 0, 0.0, 50.0, 1, 12, 0, 41781, 1579, 10, 32497, 1, '2016-03-06 22:54:15', '2016-03-06 22:54:15', NULL, 0.0, 0.0, 2.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285576, 3, 1, 0, 0, 0.0, 90.0, 0, 35, 80, 41784, 1446, 10, 32484, 1, '2016-03-06 22:54:15', '2016-03-06 22:54:15', NULL, 0.0, 0.0, 12.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285577, 2, 1, 0, 0, 0.0, 95.0, 2, 22, 70, 41808, 20993, 10, 32504, 1, '2016-03-06 22:54:15', '2016-03-06 22:54:15', NULL, 0.0, 0.0, 14.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285578, 10, 1, 0, 0, 0.0, 55.0, 1, 11, 70, 41781, 1719, 10, 32493, 1, '2016-03-06 22:54:15', '2016-03-06 22:54:15', NULL, 0.0, 0.0, 2.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285579, 3, 1, 0, 0, 0.0, 90.0, 0, 43, 70, 41754, 21017, 10, 32500, 1, '2016-03-06 22:54:15', '2016-03-06 22:54:15', NULL, 0.0, 0.0, 12.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285580, 6, 1, 0, 0, 0.0, 75.0, 2, 46, 80, 41790, 1175, 10, 32506, 1, '2016-03-06 22:54:15', '2016-03-06 22:54:15', NULL, 0.0, 0.0, 6.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285581, 4, 1, 0, 0, 0.0, 85.0, 0, 43, 60, 41804, 21005, 10, 32501, 1, '2016-03-06 22:54:16', '2016-03-06 22:54:16', NULL, 0.0, 0.0, 10.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285582, 5, 1, 0, 0, 0.0, 80.0, 0, 59, 0, 41758, 20991, 10, 32502, 1, '2016-03-06 22:54:16', '2016-03-06 22:54:16', NULL, 0.0, 0.0, 8.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285583, 3, 1, 0, 0, 0.0, 90.0, 0, 44, 30, 41758, 22145, 10, 38749, 1, '2016-03-06 22:54:16', '2016-03-06 22:54:16', NULL, 0.0, 0.0, 12.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285584, 7, 1, 0, 0, 0.0, 70.0, 1, 3, 10, 41781, 1782, 10, 32496, 1, '2016-03-06 22:54:16', '2016-03-06 22:54:16', NULL, 0.0, 0.0, 4.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285585, 1, 1, 0, 0, 0.0, 100.0, 1, 5, 50, 41794, 992, 10, 32486, 1, '2016-03-06 22:54:16', '2016-03-06 22:54:16', NULL, 0.0, 0.0, 16.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285586, 2, 1, 0, 0, 0.0, 95.0, 1, 13, 70, 41803, 428, 10, 32495, 1, '2016-03-06 22:54:16', '2016-03-06 22:54:16', NULL, 0.0, 0.0, 14.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285587, 1, 1, 0, 0, 0.0, 100.0, 1, 9, 10, 41803, 440, 10, 32505, 1, '2016-03-06 22:54:16', '2016-03-06 22:54:16', NULL, 0.0, 0.0, 16.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285588, 3, 1, 0, 0, 0.0, 90.0, 2, 39, 0, 41775, 1196, 10, 32492, 1, '2016-03-06 22:54:16', '2016-03-06 22:54:16', NULL, 0.0, 0.0, 12.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285589, 2, 1, 0, 0, 0.0, 95.0, 1, 0, 80, 41752, 1170, 10, 32507, 1, '2016-03-06 22:54:16', '2016-03-06 22:54:16', NULL, 0.0, 0.0, 14.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285590, 2, 1, 0, 0, 0.0, 95.0, 2, 52, 0, 41786, 1446, 10, 32484, 1, '2016-03-06 22:54:16', '2016-03-06 22:54:16', NULL, 0.0, 0.0, 14.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285591, 1, 1, 0, 0, 0.0, 100.0, 0, 34, 0, 41784, 20993, 10, 32504, 1, '2016-03-06 22:54:16', '2016-03-06 22:54:16', NULL, 0.0, 0.0, 16.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285592, 7, 1, 0, 0, 0.0, 70.0, 2, 48, 10, 41778, 1719, 10, 32493, 1, '2016-03-06 22:54:17', '2016-03-06 22:54:17', NULL, 0.0, 0.0, 4.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285593, 1, 1, 0, 0, 0.0, 100.0, 0, 40, 0, 41754, 1175, 10, 32506, 1, '2016-03-06 22:54:17', '2016-03-06 22:54:17', NULL, 0.0, 0.0, 16.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285594, 2, 1, 0, 0, 0.0, 95.0, 1, 14, 70, 41801, 21005, 10, 32501, 1, '2016-03-06 22:54:17', '2016-03-06 22:54:17', NULL, 0.0, 0.0, 14.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285595, 7, 1, 0, 0, 0.0, 70.0, 1, 43, 90, 41772, 20991, 10, 32502, 1, '2016-03-06 22:54:17', '2016-03-06 22:54:17', NULL, 0.0, 0.0, 4.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285596, 4, 1, 0, 0, 0.0, 85.0, 1, 22, 90, 41772, 22145, 10, 38749, 1, '2016-03-06 22:54:17', '2016-03-06 22:54:17', NULL, 0.0, 0.0, 10.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285597, 3, 1, 0, 0, 0.0, 90.0, 0, 45, 50, 41759, 20987, 826, 32552, 1, '2016-03-06 22:54:17', '2016-03-06 22:54:17', NULL, 0.0, 0.0, 12.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285598, 2, 1, 0, 0, 0.0, 95.0, 3, 55, 50, 41811, 20989, 826, 32557, 1, '2016-03-06 22:54:17', '2016-03-06 22:54:17', NULL, 0.0, 0.0, 14.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285599, 5, 1, 0, 0, 0.0, 80.0, 1, 28, 30, 41772, 22147, 826, 38756, 1, '2016-03-06 22:54:17', '2016-03-06 22:54:17', NULL, 0.0, 0.0, 8.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285600, 6, 1, 0, 0, 0.0, 75.0, 1, 14, 30, 41783, 22148, 826, 38755, 1, '2016-03-06 22:54:17', '2016-03-06 22:54:17', NULL, 0.0, 0.0, 6.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285601, 6, 1, 0, 0, 0.0, 75.0, 1, 31, 70, 41772, 21021, 826, 32553, 1, '2016-03-06 22:54:17', '2016-03-06 22:54:17', NULL, 0.0, 0.0, 6.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285602, 10, 1, 0, 0, 0.0, 55.0, 1, 29, 70, 41783, 23052, 826, 41530, 1, '2016-03-06 22:54:17', '2016-03-06 22:54:17', NULL, 0.0, 0.0, 2.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285603, 10, 1, 0, 0, 0.0, 55.0, 1, 13, 60, 41763, 22151, 826, 38753, 1, '2016-03-06 22:54:18', '2016-03-06 22:54:18', NULL, 0.0, 0.0, 2.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285604, 3, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 41756, 22149, 826, 38754, 1, '2016-03-06 22:54:18', '2016-03-06 22:54:18', 1, 0.0, 0.0, 0.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285605, 11, 1, 0, 0, 0.0, 50.0, 0, 45, 90, 41784, 23052, 826, 41530, 1, '2016-03-06 22:54:18', '2016-03-06 22:54:18', NULL, 0.0, 0.0, 2.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285606, 2, 1, 0, 0, 0.0, 95.0, 0, 59, 10, 41753, 1533, 32, 32774, 1, '2016-03-06 22:54:18', '2016-03-06 22:54:18', NULL, 0.0, 0.0, 14.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285607, 1, 1, 0, 0, 0.0, 100.0, 2, 11, 70, 41761, 1533, 32, 32774, 1, '2016-03-06 22:54:18', '2016-03-06 22:54:18', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285608, 1, 1, 0, 0, 0.0, 100.0, 2, 24, 50, 41749, 1495, 32, 32773, 1, '2016-03-06 22:54:18', '2016-03-06 22:54:18', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285609, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 80, 41748, 1495, 32, 32773, 1, '2016-03-06 22:54:18', '2016-03-06 22:54:18', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (285610, 1, 1, 0, 0, 0.0, 100.0, 1, 7, 50, 41766, 23102, 5, 41644, 1, '2016-03-06 22:54:18', '2016-03-06 22:54:18', NULL, 0.0, 0.0, 16.0, 1593, 0, 0);


-- Meeting 15104
-- 'Results acquired' flag setting:
UPDATE meetings SET are_results_acquired = '1' WHERE id = 15104;


-- Meeting 15104
-- 'has_start_list' flag setting:
UPDATE meetings SET has_start_list = '1' WHERE id = 15104;

-- --- BeginTimeCalculator: compute_for_all( 15104 )
-- ----------------------------------------------------
-- Using RESULTS to compute heat length.

-- Event #1, M.Prg: 41745, tot. athletes: 9
-- Tot. progr. duration: 201 (sec), Heat durations: [11070, 9030] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 14:52:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 14:52' WHERE id = 41745;

-- Event #1, M.Prg: 41791, tot. athletes: 5
-- Tot. progr. duration: 103 (sec), Heat durations: [10310] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 14:55:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 14:55' WHERE id = 41791;

-- Event #2, M.Prg: 41746, tot. athletes: 11
-- Tot. progr. duration: 476 (sec), Heat durations: [27280, 20330] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 14:57:04 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 14:57' WHERE id = 41746;

-- Event #2, M.Prg: 41787, tot. athletes: 4
-- Tot. progr. duration: 259 (sec), Heat durations: [25970] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:05:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:05' WHERE id = 41787;

-- Event #3, M.Prg: 41760, tot. athletes: 3
-- Tot. progr. duration: 296 (sec), Heat durations: [29610] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:09:19 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:09' WHERE id = 41760;

-- Event #3, M.Prg: 41747, tot. athletes: 3
-- Tot. progr. duration: 255 (sec), Heat durations: [25530] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:14:15 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:14' WHERE id = 41747;

-- Event #4, M.Prg: 41748, tot. athletes: 4
-- Tot. progr. duration: 108 (sec), Heat durations: [10850] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:18:30 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:18' WHERE id = 41748;

-- Event #5, M.Prg: 41749, tot. athletes: 5
-- Tot. progr. duration: 253 (sec), Heat durations: [25330] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:20:18 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:20' WHERE id = 41749;

-- Event #6, M.Prg: 41754, tot. athletes: 7
-- Tot. progr. duration: 113 (sec), Heat durations: [11310] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:24:31 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:24' WHERE id = 41754;

-- Event #6, M.Prg: 41750, tot. athletes: 4
-- Tot. progr. duration: 101 (sec), Heat durations: [10160] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:26:24 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:26' WHERE id = 41750;

-- Event #7, M.Prg: 41751, tot. athletes: 4
-- Tot. progr. duration: 120 (sec), Heat durations: [12050] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:28:05 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:28' WHERE id = 41751;

-- Event #7, M.Prg: 41759, tot. athletes: 4
-- Tot. progr. duration: 111 (sec), Heat durations: [11180] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:30:05 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:30' WHERE id = 41759;

-- Event #8, M.Prg: 41752, tot. athletes: 11
-- Tot. progr. duration: 256 (sec), Heat durations: [13540, 12080] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:31:56 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:31' WHERE id = 41752;

-- Event #8, M.Prg: 41809, tot. athletes: 4
-- Tot. progr. duration: 145 (sec), Heat durations: [14570] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:36:12 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:36' WHERE id = 41809;

-- Event #9, M.Prg: 41753, tot. athletes: 6
-- Tot. progr. duration: 130 (sec), Heat durations: [13080] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:38:37 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:38' WHERE id = 41753;

-- Event #9, M.Prg: 41770, tot. athletes: 13
-- Tot. progr. duration: 281 (sec), Heat durations: [14950, 13170] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:40:47 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:40' WHERE id = 41770;

-- Event #10, M.Prg: 41755, tot. athletes: 9
-- Tot. progr. duration: 197 (sec), Heat durations: [10640, 9110] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:45:28 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:45' WHERE id = 41755;

-- Event #10, M.Prg: 41777, tot. athletes: 5
-- Tot. progr. duration: 110 (sec), Heat durations: [11070] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:48:45 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:48' WHERE id = 41777;

-- Event #11, M.Prg: 41764, tot. athletes: 8
-- Tot. progr. duration: 109 (sec), Heat durations: [10900] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:50:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:50' WHERE id = 41764;

-- Event #11, M.Prg: 41756, tot. athletes: 7
-- Tot. progr. duration: 104 (sec), Heat durations: [10450] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:52:24 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:52' WHERE id = 41756;

-- Event #12, M.Prg: 41757, tot. athletes: 13
-- Tot. progr. duration: 460 (sec), Heat durations: [25040, 21050] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:54:08 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 41757;

-- Event #12, M.Prg: 41807, tot. athletes: 6
-- Tot. progr. duration: 275 (sec), Heat durations: [27570] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:01:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:01' WHERE id = 41807;

-- Event #13, M.Prg: 41758, tot. athletes: 5
-- Tot. progr. duration: 119 (sec), Heat durations: [11900] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:06:23 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:06' WHERE id = 41758;

-- Event #13, M.Prg: 41804, tot. athletes: 4
-- Tot. progr. duration: 103 (sec), Heat durations: [10360] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:08:22 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:08' WHERE id = 41804;

-- Event #14, M.Prg: 41790, tot. athletes: 10
-- Tot. progr. duration: 468 (sec), Heat durations: [25900, 20990] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:10:05 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:10' WHERE id = 41790;

-- Event #14, M.Prg: 41761, tot. athletes: 9
-- Tot. progr. duration: 274 (sec), Heat durations: [21430, 6000] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:17:53 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:17' WHERE id = 41761;

-- Event #15, M.Prg: 41769, tot. athletes: 11
-- Tot. progr. duration: 444 (sec), Heat durations: [24010, 20410] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:22:27 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:22' WHERE id = 41769;

-- Event #15, M.Prg: 41762, tot. athletes: 3
-- Tot. progr. duration: 255 (sec), Heat durations: [25510] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:29:51 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:29' WHERE id = 41762;

-- Event #16, M.Prg: 41794, tot. athletes: 3
-- Tot. progr. duration: 131 (sec), Heat durations: [13140] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:34:06 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:34' WHERE id = 41794;

-- Event #16, M.Prg: 41763, tot. athletes: 12
-- Tot. progr. duration: 276 (sec), Heat durations: [15280, 12320] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:36:17 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:36' WHERE id = 41763;

-- Event #17, M.Prg: 41773, tot. athletes: 5
-- Tot. progr. duration: 162 (sec), Heat durations: [16230] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:40:53 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:40' WHERE id = 41773;

-- Event #17, M.Prg: 41768, tot. athletes: 3
-- Tot. progr. duration: 164 (sec), Heat durations: [16430] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:43:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:43' WHERE id = 41768;

-- Event #17, M.Prg: 41765, tot. athletes: 7
-- Tot. progr. duration: 150 (sec), Heat durations: [15060] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:46:19 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:46' WHERE id = 41765;

-- Event #18, M.Prg: 41766, tot. athletes: 5
-- Tot. progr. duration: 149 (sec), Heat durations: [14920] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:48:49 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:48' WHERE id = 41766;

-- Event #19, M.Prg: 41767, tot. athletes: 3
-- Tot. progr. duration: 275 (sec), Heat durations: [27560] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:51:18 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:51' WHERE id = 41767;

-- Event #20, M.Prg: 41782, tot. athletes: 13
-- Tot. progr. duration: 284 (sec), Heat durations: [15650, 12750] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:55:53 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:55' WHERE id = 41782;

-- Event #21, M.Prg: 41771, tot. athletes: 4
-- Tot. progr. duration: 258 (sec), Heat durations: [25860] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:00:37 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:00' WHERE id = 41771;

-- Event #21, M.Prg: 41811, tot. athletes: 3
-- Tot. progr. duration: 302 (sec), Heat durations: [30220] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:04:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:04' WHERE id = 41811;

-- Event #22, M.Prg: 41801, tot. athletes: 3
-- Tot. progr. duration: 134 (sec), Heat durations: [13470] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:09:57 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:09' WHERE id = 41801;

-- Event #22, M.Prg: 41772, tot. athletes: 7
-- Tot. progr. duration: 163 (sec), Heat durations: [16390] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:12:11 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:12' WHERE id = 41772;

-- Event #23, M.Prg: 41797, tot. athletes: 2
-- Tot. progr. duration: 260 (sec), Heat durations: [26050] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:14:54 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:14' WHERE id = 41797;

-- Event #23, M.Prg: 41774, tot. athletes: 2
-- Tot. progr. duration: 273 (sec), Heat durations: [27320] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:19:14 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:19' WHERE id = 41774;

-- Event #24, M.Prg: 41795, tot. athletes: 3
-- Tot. progr. duration: 245 (sec), Heat durations: [24500] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:23:47 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:23' WHERE id = 41795;

-- Event #24, M.Prg: 41775, tot. athletes: 6
-- Tot. progr. duration: 243 (sec), Heat durations: [24390] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:27:52 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:27' WHERE id = 41775;

-- Event #25, M.Prg: 41776, tot. athletes: 10
-- Tot. progr. duration: 269 (sec), Heat durations: [14510, 12450] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:31:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:31' WHERE id = 41776;

-- Event #25, M.Prg: 41803, tot. athletes: 6
-- Tot. progr. duration: 146 (sec), Heat durations: [14620] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:36:24 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:36' WHERE id = 41803;

-- Event #26, M.Prg: 41778, tot. athletes: 8
-- Tot. progr. duration: 229 (sec), Heat durations: [22920] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:38:50 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:38' WHERE id = 41778;

-- Event #26, M.Prg: 41808, tot. athletes: 4
-- Tot. progr. duration: 232 (sec), Heat durations: [23200] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:42:39 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:42' WHERE id = 41808;

-- Event #27, M.Prg: 41784, tot. athletes: 11
-- Tot. progr. duration: 201 (sec), Heat durations: [10590, 9580] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:46:31 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:46' WHERE id = 41784;

-- Event #27, M.Prg: 41779, tot. athletes: 7
-- Tot. progr. duration: 101 (sec), Heat durations: [10130] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:49:52 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:49' WHERE id = 41779;

-- Event #28, M.Prg: 41780, tot. athletes: 12
-- Tot. progr. duration: 447 (sec), Heat durations: [25300, 19420] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:51:33 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:51' WHERE id = 41780;

-- Event #28, M.Prg: 41788, tot. athletes: 2
-- Tot. progr. duration: 238 (sec), Heat durations: [23860] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:59:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:59' WHERE id = 41788;

-- Event #29, M.Prg: 41781, tot. athletes: 12
-- Tot. progr. duration: 248 (sec), Heat durations: [13200, 11610] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:02:58 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:02' WHERE id = 41781;

-- Event #29, M.Prg: 41783, tot. athletes: 10
-- Tot. progr. duration: 276 (sec), Heat durations: [14970, 12630] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:07:06 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 41783;

-- Event #30, M.Prg: 41785, tot. athletes: 2
-- Tot. progr. duration: 214 (sec), Heat durations: [21460] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:11:42 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:11' WHERE id = 41785;

-- Event #30, M.Prg: 41786, tot. athletes: 8
-- Tot. progr. duration: 245 (sec), Heat durations: [24590] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:15:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:15' WHERE id = 41786;

-- Event #31, M.Prg: 41789, tot. athletes: 6
-- Tot. progr. duration: 102 (sec), Heat durations: [10210] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:19:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:19' WHERE id = 41789;

-- Event #31, M.Prg: 41802, tot. athletes: 6
-- Tot. progr. duration: 113 (sec), Heat durations: [11360] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:21:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:21' WHERE id = 41802;

-- Event #32, M.Prg: 41810, tot. athletes: 1
-- Tot. progr. duration: 199 (sec), Heat durations: [19920] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:22:56 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:22' WHERE id = 41810;

-- Event #32, M.Prg: 41792, tot. athletes: 1
-- Tot. progr. duration: 221 (sec), Heat durations: [22190] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:26:15 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:26' WHERE id = 41792;

-- Event #33, M.Prg: 41800, tot. athletes: 2
-- Tot. progr. duration: 224 (sec), Heat durations: [22480] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:29:56 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:29' WHERE id = 41800;

-- Event #33, M.Prg: 41793, tot. athletes: 2
-- Tot. progr. duration: 268 (sec), Heat durations: [26860] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:33:40 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:33' WHERE id = 41793;

-- Event #34, M.Prg: 41796, tot. athletes: 3
-- Tot. progr. duration: 242 (sec), Heat durations: [24280] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:38:08 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:38' WHERE id = 41796;

-- Event #34, M.Prg: 41799, tot. athletes: 2
-- Tot. progr. duration: 225 (sec), Heat durations: [22580] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:42:10 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:42' WHERE id = 41799;

-- Event #35, M.Prg: 41806, tot. athletes: 6
-- Tot. progr. duration: 257 (sec), Heat durations: [25780] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:45:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:45' WHERE id = 41806;

-- Event #35, M.Prg: 41798, tot. athletes: 4
-- Tot. progr. duration: 270 (sec), Heat durations: [27040] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:50:12 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:50' WHERE id = 41798;

-- Event #36, M.Prg: 41805, tot. athletes: 1
-- Tot. progr. duration: 233 (sec), Heat durations: [23350] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:54:42 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:54' WHERE id = 41805;


-- Last completed phase code: 30
