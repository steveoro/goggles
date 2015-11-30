-- *** SQL Diff file for ris20151129csiprova1.csv ***
-- Timestamp: 201511302050
INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (21045, 'BARCHI', 'DANILO', 1977, NULL, NULL, NULL, '', NULL, 1, 1, '2015-11-30 20:54:33', '2015-11-30 20:54:33', 'BARCHI DANILO', 0);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (21046, 'BAZZANINI', 'ANNA', 1990, NULL, NULL, NULL, '', NULL, 2, 1, '2015-11-30 20:54:33', '2015-11-30 20:54:33', 'BAZZANINI ANNA', 0);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (21047, 'GRANDI', 'FABIO', 1989, NULL, NULL, NULL, '', NULL, 1, 1, '2015-11-30 20:54:33', '2015-11-30 20:54:33', 'GRANDI FABIO', 0);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`)
  VALUES (32766, '?', 151, 21045, 826, 899, 1, '2015-11-30 20:54:33', '2015-11-30 20:54:33', 5, 1594);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`)
  VALUES (32767, '?', 151, 21046, 290, 897, 1, '2015-11-30 20:54:33', '2015-11-30 20:54:33', 5, 1596);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`)
  VALUES (32768, '?', 151, 21047, 290, 897, 1, '2015-11-30 20:54:33', '2015-11-30 20:54:33', 5, 1596);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`)
  VALUES (32769, '?', 151, 4853, 290, 904, 1, '2015-11-30 20:54:33', '2015-11-30 20:54:33', 5, 1596);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`)
  VALUES (32770, '?', 151, 468, 1, 900, 1, '2015-11-30 20:54:33', '2015-11-30 20:54:33', 5, 1589);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`)
  VALUES (32771, '?', 151, 108, 1, 902, 1, '2015-11-30 20:54:33', '2015-11-30 20:54:33', 5, 1589);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`)
  VALUES (32772, '?', 151, 4019, 17, 901, 1, '2015-11-30 20:54:33', '2015-11-30 20:54:33', 5, 1591);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`)
  VALUES (32773, '?', 151, 1495, 32, 903, 1, '2015-11-30 20:54:33', '2015-11-30 20:54:33', 5, 1590);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`)
  VALUES (32774, '?', 151, 1533, 32, 897, 1, '2015-11-30 20:54:33', '2015-11-30 20:54:33', 5, 1590);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4281, '2015-11-30 20:54:34', '2015-11-30 20:54:34', NULL, NULL, NULL, NULL, 35502, 21045, 826, 1594, 32766, NULL, 1, 1, 28, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4282, '2015-11-30 20:54:34', '2015-11-30 20:54:34', NULL, NULL, NULL, NULL, 35541, 21045, 826, 1594, 32766, NULL, 1, 1, 36, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4283, '2015-11-30 20:54:34', '2015-11-30 20:54:34', NULL, NULL, NULL, NULL, 35499, 21038, 18, 1592, 32643, NULL, 1, 0, 44, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4284, '2015-11-30 20:54:34', '2015-11-30 20:54:34', NULL, NULL, NULL, NULL, 35552, 1270, 32, 1590, 32716, NULL, 1, 6, 10, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4285, '2015-11-30 20:54:34', '2015-11-30 20:54:34', NULL, NULL, NULL, NULL, 35523, 1766, 17, 1591, 32763, NULL, 1, 1, 47, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4286, '2015-11-30 20:54:34', '2015-11-30 20:54:34', NULL, NULL, NULL, NULL, 35535, 1766, 17, 1591, 32763, NULL, 1, 0, 41, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4287, '2015-11-30 20:54:34', '2015-11-30 20:54:34', NULL, NULL, NULL, NULL, 35512, 21046, 290, 1596, 32767, NULL, 1, 0, 40, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4288, '2015-11-30 20:54:34', '2015-11-30 20:54:34', NULL, NULL, NULL, NULL, 35530, 21047, 290, 1596, 32768, NULL, 1, 0, 34, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4289, '2015-11-30 20:54:35', '2015-11-30 20:54:35', NULL, NULL, NULL, NULL, 35526, 4853, 290, 1596, 32769, NULL, 1, 1, 30, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4290, '2015-11-30 20:54:35', '2015-11-30 20:54:35', NULL, NULL, NULL, NULL, 35513, 4853, 290, 1596, 32769, NULL, 1, 1, 40, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4291, '2015-11-30 20:54:35', '2015-11-30 20:54:35', NULL, NULL, NULL, NULL, 35510, 21046, 290, 1596, 32767, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4292, '2015-11-30 20:54:35', '2015-11-30 20:54:35', NULL, NULL, NULL, NULL, 35505, 21047, 290, 1596, 32768, NULL, 1, 6, 30, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4293, '2015-11-30 20:54:35', '2015-11-30 20:54:35', NULL, NULL, NULL, NULL, 35521, 468, 1, 1589, 32770, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4294, '2015-11-30 20:54:35', '2015-11-30 20:54:35', NULL, NULL, NULL, NULL, 35508, 468, 1, 1589, 32770, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4295, '2015-11-30 20:54:35', '2015-11-30 20:54:35', NULL, NULL, NULL, NULL, 35547, 108, 1, 1589, 32771, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4296, '2015-11-30 20:54:36', '2015-11-30 20:54:36', NULL, NULL, NULL, NULL, 35551, 108, 1, 1589, 32771, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4297, '2015-11-30 20:54:36', '2015-11-30 20:54:36', NULL, NULL, NULL, NULL, 35557, 4019, 17, 1591, 32772, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4298, '2015-11-30 20:54:36', '2015-11-30 20:54:36', NULL, NULL, NULL, NULL, 35546, 4019, 17, 1591, 32772, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4299, '2015-11-30 20:54:36', '2015-11-30 20:54:36', NULL, NULL, NULL, NULL, 35555, 1495, 32, 1590, 32773, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4300, '2015-11-30 20:54:36', '2015-11-30 20:54:36', NULL, NULL, NULL, NULL, 35548, 1495, 32, 1590, 32773, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4301, '2015-11-30 20:54:36', '2015-11-30 20:54:36', NULL, NULL, NULL, NULL, 35545, 1533, 32, 1590, 32774, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4302, '2015-11-30 20:54:36', '2015-11-30 20:54:36', NULL, NULL, NULL, NULL, 35530, 1533, 32, 1590, 32774, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254980, 1, 1, 0, 0, 0.0, 100.0, 1, 17, 90, 35497, 1446, 10, 32484, 1, '2015-11-30 20:54:37', '2015-11-30 20:54:37', NULL, 0.0, 0.0, 16.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254981, 1, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 35498, 4792, 10, 32485, 1, '2015-11-30 20:54:37', '2015-11-30 20:54:37', 1, 0.0, 0.0, 0.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254982, 1, 1, 0, 0, 0.0, 100.0, 0, 29, 80, 35499, 992, 10, 32486, 1, '2015-11-30 20:54:37', '2015-11-30 20:54:37', NULL, 0.0, 0.0, 16.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254983, 3, 1, 0, 0, 0.0, 90.0, 1, 51, 50, 35500, 20999, 10, 32487, 1, '2015-11-30 20:54:37', '2015-11-30 20:54:37', NULL, 0.0, 0.0, 12.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254984, 2, 1, 0, 0, 0.0, 95.0, 1, 44, 20, 35501, 21033, 10, 32484, 1, '2015-11-30 20:54:37', '2015-11-30 20:54:37', NULL, 0.0, 0.0, 14.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254985, 2, 1, 0, 0, 0.0, 95.0, 1, 42, 0, 35500, 698, 10, 32488, 1, '2015-11-30 20:54:37', '2015-11-30 20:54:37', NULL, 0.0, 0.0, 14.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254986, 4, 1, 0, 0, 0.0, 85.0, 1, 15, 90, 35502, 724, 10, 32489, 1, '2015-11-30 20:54:37', '2015-11-30 20:54:37', NULL, 0.0, 0.0, 10.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254987, 3, 1, 0, 0, 0.0, 90.0, 6, 28, 10, 35503, 430, 10, 32490, 1, '2015-11-30 20:54:38', '2015-11-30 20:54:38', NULL, 0.0, 0.0, 12.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254988, 8, 1, 0, 0, 0.0, 65.0, 1, 18, 30, 35504, 4795, 10, 32491, 1, '2015-11-30 20:54:38', '2015-11-30 20:54:38', NULL, 0.0, 0.0, 2.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254989, 3, 1, 0, 0, 0.0, 90.0, 4, 56, 80, 35505, 1196, 10, 32492, 1, '2015-11-30 20:54:38', '2015-11-30 20:54:38', NULL, 0.0, 0.0, 12.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254990, 8, 1, 0, 0, 0.0, 65.0, 5, 55, 60, 35506, 1719, 10, 32493, 1, '2015-11-30 20:54:38', '2015-11-30 20:54:38', NULL, 0.0, 0.0, 2.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254991, 6, 1, 0, 0, 0.0, 75.0, 4, 56, 80, 35507, 562, 10, 32494, 1, '2015-11-30 20:54:38', '2015-11-30 20:54:38', NULL, 0.0, 0.0, 6.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254992, 2, 1, 0, 0, 0.0, 95.0, 1, 22, 10, 35508, 428, 10, 32495, 1, '2015-11-30 20:54:38', '2015-11-30 20:54:38', NULL, 0.0, 0.0, 14.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254993, 6, 1, 0, 0, 0.0, 75.0, 0, 27, 20, 35509, 1782, 10, 32496, 1, '2015-11-30 20:54:38', '2015-11-30 20:54:38', NULL, 0.0, 0.0, 6.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254994, 16, 1, 0, 0, 0.0, 25.0, 0, 31, 70, 35509, 1579, 10, 32497, 1, '2015-11-30 20:54:38', '2015-11-30 20:54:38', NULL, 0.0, 0.0, 2.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254995, 3, 1, 0, 0, 0.0, 90.0, 5, 38, 70, 35510, 811, 10, 32498, 1, '2015-11-30 20:54:39', '2015-11-30 20:54:39', NULL, 0.0, 0.0, 12.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254996, 5, 1, 0, 0, 0.0, 80.0, 0, 45, 60, 35514, 20991, 10, 32502, 1, '2015-11-30 20:54:39', '2015-11-30 20:54:39', NULL, 0.0, 0.0, 8.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254997, 2, 1, 0, 0, 0.0, 95.0, 1, 32, 0, 35515, 21015, 10, 32503, 1, '2015-11-30 20:54:39', '2015-11-30 20:54:39', NULL, 0.0, 0.0, 14.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254998, 3, 1, 0, 0, 0.0, 90.0, 5, 22, 90, 35516, 20993, 10, 32504, 1, '2015-11-30 20:54:39', '2015-11-30 20:54:39', NULL, 0.0, 0.0, 12.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (254999, 1, 1, 0, 0, 0.0, 100.0, 5, 32, 70, 35503, 440, 10, 32505, 1, '2015-11-30 20:54:39', '2015-11-30 20:54:39', NULL, 0.0, 0.0, 16.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255000, 5, 1, 0, 0, 0.0, 80.0, 6, 1, 0, 35510, 1175, 10, 32506, 1, '2015-11-30 20:54:39', '2015-11-30 20:54:39', NULL, 0.0, 0.0, 8.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255001, 2, 1, 0, 0, 0.0, 95.0, 0, 27, 20, 35517, 1170, 10, 32507, 1, '2015-11-30 20:54:39', '2015-11-30 20:54:39', NULL, 0.0, 0.0, 14.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255002, 3, 1, 0, 0, 0.0, 90.0, 0, 30, 70, 35518, 21013, 10, 32508, 1, '2015-11-30 20:54:39', '2015-11-30 20:54:39', NULL, 0.0, 0.0, 12.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255003, 4, 1, 0, 0, 0.0, 85.0, 1, 11, 40, 35519, 1439, 10, 32509, 1, '2015-11-30 20:54:40', '2015-11-30 20:54:40', NULL, 0.0, 0.0, 10.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255004, 4, 1, 0, 0, 0.0, 85.0, 4, 51, 60, 35507, 638, 10, 32510, 1, '2015-11-30 20:54:40', '2015-11-30 20:54:40', NULL, 0.0, 0.0, 10.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255005, 4, 1, 0, 0, 0.0, 85.0, 4, 55, 30, 35506, 1697, 10, 32511, 1, '2015-11-30 20:54:40', '2015-11-30 20:54:40', NULL, 0.0, 0.0, 10.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255006, 6, 1, 0, 0, 0.0, 75.0, 6, 43, 80, 35520, 20988, 10, 32513, 1, '2015-11-30 20:54:40', '2015-11-30 20:54:40', NULL, 0.0, 0.0, 6.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255007, 2, 1, 0, 0, 0.0, 95.0, 5, 14, 70, 35516, 1674, 10, 32514, 1, '2015-11-30 20:54:40', '2015-11-30 20:54:40', NULL, 0.0, 0.0, 14.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255008, 8, 1, 0, 0, 0.0, 65.0, 1, 41, 70, 35521, 4798, 10, 32515, 1, '2015-11-30 20:54:40', '2015-11-30 20:54:40', NULL, 0.0, 0.0, 2.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255009, 3, 1, 0, 0, 0.0, 90.0, 3, 2, 30, 35522, 4799, 10, 32516, 1, '2015-11-30 20:54:40', '2015-11-30 20:54:40', NULL, 0.0, 0.0, 12.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255010, 2, 1, 0, 0, 0.0, 95.0, 2, 25, 10, 35513, 4800, 10, 32517, 1, '2015-11-30 20:54:41', '2015-11-30 20:54:41', NULL, 0.0, 0.0, 14.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255011, 6, 1, 0, 0, 0.0, 75.0, 0, 46, 70, 35514, 4802, 10, 32519, 1, '2015-11-30 20:54:41', '2015-11-30 20:54:41', NULL, 0.0, 0.0, 6.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255012, 11, 1, 0, 0, 0.0, 50.0, 2, 6, 80, 35523, 18956, 10, 32520, 1, '2015-11-30 20:54:41', '2015-11-30 20:54:41', NULL, 0.0, 0.0, 2.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255013, 6, 1, 0, 0, 0.0, 75.0, 0, 53, 50, 35524, 21006, 10, 32521, 1, '2015-11-30 20:54:41', '2015-11-30 20:54:41', NULL, 0.0, 0.0, 6.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255014, 8, 1, 0, 0, 0.0, 65.0, 1, 54, 10, 35525, 4804, 10, 32522, 1, '2015-11-30 20:54:41', '2015-11-30 20:54:41', NULL, 0.0, 0.0, 2.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255015, 2, 1, 0, 0, 0.0, 95.0, 1, 51, 40, 35526, 4803, 10, 32523, 1, '2015-11-30 20:54:41', '2015-11-30 20:54:41', NULL, 0.0, 0.0, 14.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255016, 3, 1, 0, 0, 0.0, 90.0, 7, 6, 60, 35527, 4805, 10, 32524, 1, '2015-11-30 20:54:41', '2015-11-30 20:54:41', NULL, 0.0, 0.0, 12.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255017, 2, 1, 0, 0, 0.0, 95.0, 0, 30, 30, 35518, 1446, 10, 32484, 1, '2015-11-30 20:54:42', '2015-11-30 20:54:42', NULL, 0.0, 0.0, 14.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255018, 1, 1, 0, 0, 0.0, 100.0, 0, 30, 30, 35512, 4792, 10, 32485, 1, '2015-11-30 20:54:42', '2015-11-30 20:54:42', NULL, 0.0, 0.0, 16.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255019, 1, 1, 0, 0, 0.0, 100.0, 1, 13, 60, 35528, 992, 10, 32486, 1, '2015-11-30 20:54:42', '2015-11-30 20:54:42', NULL, 0.0, 0.0, 16.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255020, 7, 1, 0, 0, 0.0, 70.0, 0, 29, 60, 35517, 724, 10, 32489, 1, '2015-11-30 20:54:42', '2015-11-30 20:54:42', NULL, 0.0, 0.0, 4.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255021, 6, 1, 0, 0, 0.0, 75.0, 0, 27, 80, 35529, 4795, 10, 32491, 1, '2015-11-30 20:54:42', '2015-11-30 20:54:42', NULL, 0.0, 0.0, 6.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255022, 4, 1, 0, 0, 0.0, 85.0, 0, 27, 30, 35530, 1196, 10, 32492, 1, '2015-11-30 20:54:42', '2015-11-30 20:54:42', NULL, 0.0, 0.0, 10.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255023, 15, 1, 0, 0, 0.0, 30.0, 0, 31, 10, 35509, 1719, 10, 32493, 1, '2015-11-30 20:54:42', '2015-11-30 20:54:42', NULL, 0.0, 0.0, 2.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255024, 2, 1, 0, 0, 0.0, 95.0, 1, 10, 0, 35504, 562, 10, 32494, 1, '2015-11-30 20:54:42', '2015-11-30 20:54:42', NULL, 0.0, 0.0, 14.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255025, 2, 1, 0, 0, 0.0, 95.0, 0, 33, 10, 35521, 428, 10, 32495, 1, '2015-11-30 20:54:43', '2015-11-30 20:54:43', NULL, 0.0, 0.0, 14.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255026, 6, 1, 0, 0, 0.0, 75.0, 1, 30, 30, 35525, 1782, 10, 32496, 1, '2015-11-30 20:54:43', '2015-11-30 20:54:43', NULL, 0.0, 0.0, 6.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255027, 11, 1, 0, 0, 0.0, 50.0, 1, 25, 40, 35519, 1579, 10, 32497, 1, '2015-11-30 20:54:43', '2015-11-30 20:54:43', NULL, 0.0, 0.0, 2.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255028, 6, 1, 0, 0, 0.0, 75.0, 0, 32, 70, 35512, 811, 10, 32498, 1, '2015-11-30 20:54:43', '2015-11-30 20:54:43', NULL, 0.0, 0.0, 6.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255029, 3, 1, 0, 0, 0.0, 90.0, 0, 32, 90, 35514, 21015, 10, 32503, 1, '2015-11-30 20:54:43', '2015-11-30 20:54:43', NULL, 0.0, 0.0, 12.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255030, 3, 1, 0, 0, 0.0, 90.0, 1, 19, 10, 35497, 20993, 10, 32504, 1, '2015-11-30 20:54:43', '2015-11-30 20:54:43', NULL, 0.0, 0.0, 12.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255031, 1, 1, 0, 0, 0.0, 100.0, 1, 21, 50, 35508, 440, 10, 32505, 1, '2015-11-30 20:54:43', '2015-11-30 20:54:43', NULL, 0.0, 0.0, 16.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255032, 5, 1, 0, 0, 0.0, 80.0, 1, 28, 30, 35532, 1175, 10, 32506, 1, '2015-11-30 20:54:44', '2015-11-30 20:54:44', NULL, 0.0, 0.0, 8.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255033, 4, 1, 0, 0, 0.0, 85.0, 1, 21, 20, 35497, 21013, 10, 32508, 1, '2015-11-30 20:54:44', '2015-11-30 20:54:44', NULL, 0.0, 0.0, 10.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255034, 7, 1, 0, 0, 0.0, 70.0, 0, 27, 90, 35509, 1439, 10, 32509, 1, '2015-11-30 20:54:44', '2015-11-30 20:54:44', NULL, 0.0, 0.0, 4.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255035, 3, 1, 0, 0, 0.0, 90.0, 0, 27, 30, 35529, 638, 10, 32510, 1, '2015-11-30 20:54:44', '2015-11-30 20:54:44', NULL, 0.0, 0.0, 12.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255036, 6, 1, 0, 0, 0.0, 75.0, 1, 12, 50, 35519, 1697, 10, 32511, 1, '2015-11-30 20:54:45', '2015-11-30 20:54:45', NULL, 0.0, 0.0, 6.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255037, 16, 1, 0, 0, 0.0, 25.0, 0, 37, 10, 35517, 20988, 10, 32513, 1, '2015-11-30 20:54:45', '2015-11-30 20:54:45', NULL, 0.0, 0.0, 2.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255038, 9, 1, 0, 0, 0.0, 60.0, 11, 10, 20, 35511, 4799, 10, 32516, 1, '2015-11-30 20:54:45', '2015-11-30 20:54:45', NULL, 0.0, 0.0, 2.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255039, 4, 1, 0, 0, 0.0, 85.0, 7, 14, 80, 35527, 4800, 10, 32517, 1, '2015-11-30 20:54:45', '2015-11-30 20:54:45', NULL, 0.0, 0.0, 10.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255040, 5, 1, 0, 0, 0.0, 80.0, 2, 13, 70, 35533, 4801, 10, 32518, 1, '2015-11-30 20:54:45', '2015-11-30 20:54:45', NULL, 0.0, 0.0, 8.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255041, 3, 1, 0, 0, 0.0, 90.0, 2, 6, 80, 35534, 4802, 10, 32519, 1, '2015-11-30 20:54:45', '2015-11-30 20:54:45', NULL, 0.0, 0.0, 12.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255042, 13, 1, 0, 0, 0.0, 40.0, 0, 50, 40, 35535, 18956, 10, 32520, 1, '2015-11-30 20:54:45', '2015-11-30 20:54:45', NULL, 0.0, 0.0, 2.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255043, 12, 1, 0, 0, 0.0, 45.0, 1, 50, 80, 35519, 4804, 10, 32522, 1, '2015-11-30 20:54:46', '2015-11-30 20:54:46', NULL, 0.0, 0.0, 2.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255044, 4, 1, 0, 0, 0.0, 85.0, 0, 38, 20, 35524, 4803, 10, 32523, 1, '2015-11-30 20:54:46', '2015-11-30 20:54:46', NULL, 0.0, 0.0, 10.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255045, 5, 1, 0, 0, 0.0, 80.0, 0, 39, 60, 35524, 4805, 10, 32524, 1, '2015-11-30 20:54:46', '2015-11-30 20:54:46', NULL, 0.0, 0.0, 8.0, 1587);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255046, 1, 1, 0, 0, 0.0, 100.0, 4, 23, 50, 35506, 1824, 21, 32526, 1, '2015-11-30 20:54:46', '2015-11-30 20:54:46', NULL, 0.0, 0.0, 16.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255047, 1, 1, 0, 0, 0.0, 100.0, 1, 11, 10, 35525, 4806, 21, 32527, 1, '2015-11-30 20:54:46', '2015-11-30 20:54:46', NULL, 0.0, 0.0, 16.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255048, 3, 1, 0, 0, 0.0, 90.0, 1, 22, 30, 35525, 4807, 21, 32528, 1, '2015-11-30 20:54:46', '2015-11-30 20:54:46', NULL, 0.0, 0.0, 12.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255049, 2, 1, 0, 0, 0.0, 95.0, 1, 16, 0, 35525, 21031, 21, 32529, 1, '2015-11-30 20:54:47', '2015-11-30 20:54:47', NULL, 0.0, 0.0, 14.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255050, 5, 1, 0, 0, 0.0, 80.0, 1, 48, 20, 35498, 1709, 21, 32530, 1, '2015-11-30 20:54:47', '2015-11-30 20:54:47', NULL, 0.0, 0.0, 8.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255051, 6, 1, 0, 0, 0.0, 75.0, 1, 25, 30, 35497, 21041, 21, 32531, 1, '2015-11-30 20:54:47', '2015-11-30 20:54:47', NULL, 0.0, 0.0, 6.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255052, 3, 1, 0, 0, 0.0, 90.0, 1, 44, 80, 35533, 21001, 21, 32532, 1, '2015-11-30 20:54:47', '2015-11-30 20:54:47', NULL, 0.0, 0.0, 12.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255053, 4, 1, 0, 0, 0.0, 85.0, 1, 49, 30, 35533, 21012, 21, 32533, 1, '2015-11-30 20:54:47', '2015-11-30 20:54:47', NULL, 0.0, 0.0, 10.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255054, 1, 1, 0, 0, 0.0, 100.0, 0, 24, 80, 35509, 1824, 21, 32526, 1, '2015-11-30 20:54:47', '2015-11-30 20:54:47', NULL, 0.0, 0.0, 16.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255055, 1, 1, 0, 0, 0.0, 100.0, 1, 2, 60, 35519, 4806, 21, 32527, 1, '2015-11-30 20:54:47', '2015-11-30 20:54:47', NULL, 0.0, 0.0, 16.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255056, 2, 1, 0, 0, 0.0, 95.0, 0, 25, 60, 35509, 4807, 21, 32528, 1, '2015-11-30 20:54:48', '2015-11-30 20:54:48', NULL, 0.0, 0.0, 14.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255057, 5, 1, 0, 0, 0.0, 80.0, 0, 26, 40, 35509, 21031, 21, 32529, 1, '2015-11-30 20:54:48', '2015-11-30 20:54:48', NULL, 0.0, 0.0, 8.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255058, 3, 1, 0, 0, 0.0, 90.0, 0, 32, 10, 35512, 1709, 21, 32530, 1, '2015-11-30 20:54:48', '2015-11-30 20:54:48', NULL, 0.0, 0.0, 12.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255059, 7, 1, 0, 0, 0.0, 70.0, 0, 32, 80, 35518, 21041, 21, 32531, 1, '2015-11-30 20:54:48', '2015-11-30 20:54:48', NULL, 0.0, 0.0, 4.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255060, 14, 1, 0, 0, 0.0, 35.0, 0, 36, 50, 35518, 21001, 21, 32532, 1, '2015-11-30 20:54:48', '2015-11-30 20:54:48', NULL, 0.0, 0.0, 2.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255061, 12, 1, 0, 0, 0.0, 45.0, 0, 35, 80, 35518, 21012, 21, 32533, 1, '2015-11-30 20:54:48', '2015-11-30 20:54:48', NULL, 0.0, 0.0, 2.0, 1588);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255062, 7, 1, 0, 0, 0.0, 70.0, 1, 16, 70, 35504, 1685, 9, 32534, 1, '2015-11-30 20:54:48', '2015-11-30 20:54:48', NULL, 0.0, 0.0, 4.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255063, 5, 1, 0, 0, 0.0, 80.0, 5, 42, 80, 35536, 1679, 9, 32535, 1, '2015-11-30 20:54:49', '2015-11-30 20:54:49', NULL, 0.0, 0.0, 8.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255064, 8, 1, 0, 0, 0.0, 65.0, 1, 18, 30, 35504, 20990, 9, 32536, 1, '2015-11-30 20:54:49', '2015-11-30 20:54:49', NULL, 0.0, 0.0, 2.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255065, 1, 1, 0, 0, 0.0, 100.0, 5, 46, 80, 35537, 4032, 9, 32537, 1, '2015-11-30 20:54:49', '2015-11-30 20:54:49', NULL, 0.0, 0.0, 16.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255066, 5, 1, 0, 0, 0.0, 80.0, 1, 38, 90, 35539, 1775, 9, 32539, 1, '2015-11-30 20:54:49', '2015-11-30 20:54:49', NULL, 0.0, 0.0, 8.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255067, 1, 1, 0, 0, 0.0, 100.0, 1, 20, 30, 35540, 21044, 9, 32540, 1, '2015-11-30 20:54:49', '2015-11-30 20:54:49', NULL, 0.0, 0.0, 16.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255068, 3, 1, 0, 0, 0.0, 90.0, 5, 24, 80, 35520, 4848, 9, 32541, 1, '2015-11-30 20:54:49', '2015-11-30 20:54:49', NULL, 0.0, 0.0, 12.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255069, 6, 1, 0, 0, 0.0, 75.0, 1, 30, 10, 35541, 1030, 9, 32543, 1, '2015-11-30 20:54:49', '2015-11-30 20:54:49', NULL, 0.0, 0.0, 6.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255070, 1, 1, 0, 0, 0.0, 100.0, 5, 51, 50, 35542, 1677, 9, 32544, 1, '2015-11-30 20:54:49', '2015-11-30 20:54:49', NULL, 0.0, 0.0, 16.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255071, 9, 1, 0, 0, 0.0, 60.0, 5, 56, 30, 35543, 1680, 9, 32546, 1, '2015-11-30 20:54:50', '2015-11-30 20:54:50', NULL, 0.0, 0.0, 2.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255072, 2, 1, 0, 0, 0.0, 95.0, 1, 31, 0, 35544, 1457, 9, 32547, 1, '2015-11-30 20:54:50', '2015-11-30 20:54:50', NULL, 0.0, 0.0, 14.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255073, 6, 1, 0, 0, 0.0, 75.0, 1, 14, 80, 35545, 4849, 9, 32548, 1, '2015-11-30 20:54:50', '2015-11-30 20:54:50', NULL, 0.0, 0.0, 6.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255074, 6, 1, 0, 0, 0.0, 75.0, 1, 17, 40, 35502, 95, 9, 32550, 1, '2015-11-30 20:54:50', '2015-11-30 20:54:50', NULL, 0.0, 0.0, 6.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255075, 7, 1, 0, 0, 0.0, 70.0, 0, 28, 10, 35529, 1685, 9, 32534, 1, '2015-11-30 20:54:50', '2015-11-30 20:54:50', NULL, 0.0, 0.0, 4.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255076, 5, 1, 0, 0, 0.0, 80.0, 0, 30, 40, 35546, 1679, 9, 32535, 1, '2015-11-30 20:54:50', '2015-11-30 20:54:50', NULL, 0.0, 0.0, 8.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255077, 10, 1, 0, 0, 0.0, 55.0, 0, 29, 90, 35529, 20990, 9, 32536, 1, '2015-11-30 20:54:50', '2015-11-30 20:54:50', NULL, 0.0, 0.0, 2.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255078, 7, 1, 0, 0, 0.0, 70.0, 1, 27, 90, 35547, 4032, 9, 32537, 1, '2015-11-30 20:54:50', '2015-11-30 20:54:50', NULL, 0.0, 0.0, 4.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255079, 9, 1, 0, 0, 0.0, 60.0, 1, 25, 40, 35523, 1775, 9, 32539, 1, '2015-11-30 20:54:51', '2015-11-30 20:54:51', NULL, 0.0, 0.0, 2.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255080, 1, 1, 0, 0, 0.0, 100.0, 0, 30, 80, 35549, 21044, 9, 32540, 1, '2015-11-30 20:54:51', '2015-11-30 20:54:51', NULL, 0.0, 0.0, 16.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255081, 4, 1, 0, 0, 0.0, 85.0, 1, 27, 70, 35541, 4848, 9, 32541, 1, '2015-11-30 20:54:51', '2015-11-30 20:54:51', NULL, 0.0, 0.0, 10.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255082, 12, 1, 0, 0, 0.0, 45.0, 0, 32, 20, 35517, 1030, 9, 32543, 1, '2015-11-30 20:54:51', '2015-11-30 20:54:51', NULL, 0.0, 0.0, 2.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255083, 3, 1, 0, 0, 0.0, 90.0, 0, 33, 80, 35499, 1677, 9, 32544, 1, '2015-11-30 20:54:51', '2015-11-30 20:54:51', NULL, 0.0, 0.0, 12.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255084, 3, 1, 0, 0, 0.0, 90.0, 1, 35, 20, 35539, 1680, 9, 32546, 1, '2015-11-30 20:54:51', '2015-11-30 20:54:51', NULL, 0.0, 0.0, 12.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255085, 1, 1, 0, 0, 0.0, 100.0, 0, 31, 80, 35550, 1457, 9, 32547, 1, '2015-11-30 20:54:51', '2015-11-30 20:54:51', NULL, 0.0, 0.0, 16.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255086, 7, 1, 0, 0, 0.0, 70.0, 0, 28, 90, 35530, 4849, 9, 32548, 1, '2015-11-30 20:54:51', '2015-11-30 20:54:51', NULL, 0.0, 0.0, 4.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255087, 5, 1, 0, 0, 0.0, 80.0, 0, 28, 90, 35517, 95, 9, 32550, 1, '2015-11-30 20:54:52', '2015-11-30 20:54:52', NULL, 0.0, 0.0, 8.0, 1583);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255088, 11, 1, 0, 0, 0.0, 50.0, 0, 36, 30, 35512, 21030, 826, 32551, 1, '2015-11-30 20:54:52', '2015-11-30 20:54:52', NULL, 0.0, 0.0, 2.0, 1594);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255089, 4, 1, 0, 0, 0.0, 85.0, 0, 38, 40, 35550, 20987, 826, 32552, 1, '2015-11-30 20:54:52', '2015-11-30 20:54:52', NULL, 0.0, 0.0, 10.0, 1594);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255090, 4, 1, 0, 0, 0.0, 85.0, 0, 41, 60, 35514, 21021, 826, 32553, 1, '2015-11-30 20:54:52', '2015-11-30 20:54:52', NULL, 0.0, 0.0, 10.0, 1594);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255091, 13, 1, 0, 0, 0.0, 40.0, 0, 32, 50, 35517, 21003, 826, 32554, 1, '2015-11-30 20:54:52', '2015-11-30 20:54:52', NULL, 0.0, 0.0, 2.0, 1594);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255092, 11, 1, 0, 0, 0.0, 50.0, 0, 43, 50, 35551, 21020, 826, 32555, 1, '2015-11-30 20:54:52', '2015-11-30 20:54:52', NULL, 0.0, 0.0, 2.0, 1594);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255093, 3, 1, 0, 0, 0.0, 90.0, 1, 11, 50, 35548, 20981, 826, 32556, 1, '2015-11-30 20:54:52', '2015-11-30 20:54:52', NULL, 0.0, 0.0, 12.0, 1594);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255094, 7, 1, 0, 0, 0.0, 70.0, 0, 43, 50, 35521, 20989, 826, 32557, 1, '2015-11-30 20:54:52', '2015-11-30 20:54:52', NULL, 0.0, 0.0, 4.0, 1594);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255095, 8, 1, 0, 0, 0.0, 65.0, 1, 37, 60, 35532, 21030, 826, 32551, 1, '2015-11-30 20:54:53', '2015-11-30 20:54:53', NULL, 0.0, 0.0, 2.0, 1594);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255096, 6, 1, 0, 0, 0.0, 75.0, 1, 44, 90, 35508, 20989, 826, 32557, 1, '2015-11-30 20:54:53', '2015-11-30 20:54:53', NULL, 0.0, 0.0, 6.0, 1594);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255097, 11, 1, 0, 0, 0.0, 50.0, 1, 37, 10, 35502, 21045, 826, 32766, 1, '2015-11-30 20:54:53', '2015-11-30 20:54:53', NULL, 0.0, 0.0, 2.0, 1594);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255098, 7, 1, 0, 0, 0.0, 70.0, 1, 41, 70, 35541, 21045, 826, 32766, 1, '2015-11-30 20:54:53', '2015-11-30 20:54:53', NULL, 0.0, 0.0, 4.0, 1594);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255099, 1, 1, 0, 0, 0.0, 100.0, 1, 19, 20, 35552, 142, 1, 32559, 1, '2015-11-30 20:54:53', '2015-11-30 20:54:53', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255100, 7, 1, 0, 0, 0.0, 70.0, 0, 32, 20, 35551, 51, 1, 32560, 1, '2015-11-30 20:54:53', '2015-11-30 20:54:53', NULL, 0.0, 0.0, 4.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255101, 11, 1, 0, 0, 0.0, 50.0, 0, 34, 40, 35546, 258, 1, 32561, 1, '2015-11-30 20:54:53', '2015-11-30 20:54:53', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255102, 2, 1, 0, 0, 0.0, 95.0, 0, 28, 60, 35546, 1227, 1, 32562, 1, '2015-11-30 20:54:53', '2015-11-30 20:54:53', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255103, 5, 1, 0, 0, 0.0, 80.0, 0, 41, 30, 35550, 192, 1, 32563, 1, '2015-11-30 20:54:54', '2015-11-30 20:54:54', NULL, 0.0, 0.0, 8.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255104, 2, 1, 0, 0, 0.0, 95.0, 6, 12, 30, 35553, 138, 1, 32564, 1, '2015-11-30 20:54:54', '2015-11-30 20:54:54', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255105, 4, 1, 0, 0, 0.0, 85.0, 1, 27, 20, 35532, 1843, 1, 32565, 1, '2015-11-30 20:54:54', '2015-11-30 20:54:54', NULL, 0.0, 0.0, 10.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255106, 8, 1, 0, 0, 0.0, 65.0, 0, 32, 70, 35551, 456, 1, 32566, 1, '2015-11-30 20:54:54', '2015-11-30 20:54:54', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255107, 12, 1, 0, 0, 0.0, 45.0, 0, 36, 60, 35512, 1483, 1, 32567, 1, '2015-11-30 20:54:54', '2015-11-30 20:54:54', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255108, 2, 1, 0, 0, 0.0, 95.0, 1, 40, 0, 35522, 550, 1, 32568, 1, '2015-11-30 20:54:54', '2015-11-30 20:54:54', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255109, 8, 1, 0, 0, 0.0, 65.0, 1, 22, 30, 35545, 785, 1, 32569, 1, '2015-11-30 20:54:54', '2015-11-30 20:54:54', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255110, 10, 1, 0, 0, 0.0, 55.0, 0, 34, 20, 35535, 1016, 1, 32570, 1, '2015-11-30 20:54:54', '2015-11-30 20:54:54', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255111, 10, 1, 0, 0, 0.0, 55.0, 0, 35, 30, 35551, 149, 1, 32571, 1, '2015-11-30 20:54:55', '2015-11-30 20:54:55', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255112, 1, 1, 0, 0, 0.0, 100.0, 5, 4, 50, 35536, 23, 1, 32573, 1, '2015-11-30 20:54:55', '2015-11-30 20:54:55', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255113, 2, 1, 0, 0, 0.0, 95.0, 5, 59, 70, 35554, 773, 1, 32574, 1, '2015-11-30 20:54:55', '2015-11-30 20:54:55', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255114, 14, 1, 0, 0, 0.0, 35.0, 0, 37, 40, 35512, 21016, 1, 32575, 1, '2015-11-30 20:54:55', '2015-11-30 20:54:55', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255115, 2, 1, 0, 0, 0.0, 95.0, 1, 26, 40, 35555, 64, 1, 32577, 1, '2015-11-30 20:54:55', '2015-11-30 20:54:55', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255116, 1, 1, 0, 0, 0.0, 100.0, 0, 29, 80, 35518, 1841, 1, 32578, 1, '2015-11-30 20:54:55', '2015-11-30 20:54:55', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255117, 1, 1, 0, 0, 0.0, 100.0, 0, 30, 80, 35531, 1788, 1, 32579, 1, '2015-11-30 20:54:56', '2015-11-30 20:54:56', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255118, 8, 1, 0, 0, 0.0, 65.0, 0, 28, 30, 35529, 1279, 1, 32580, 1, '2015-11-30 20:54:56', '2015-11-30 20:54:56', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255119, 1, 1, 0, 0, 0.0, 100.0, 1, 9, 70, 35523, 1541, 1, 32581, 1, '2015-11-30 20:54:56', '2015-11-30 20:54:56', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255120, 2, 1, 0, 0, 0.0, 95.0, 0, 36, 20, 35550, 98, 1, 32582, 1, '2015-11-30 20:54:56', '2015-11-30 20:54:56', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255121, 6, 1, 0, 0, 0.0, 75.0, 0, 40, 0, 35521, 503, 1, 32584, 1, '2015-11-30 20:54:56', '2015-11-30 20:54:56', NULL, 0.0, 0.0, 6.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255122, 3, 1, 0, 0, 0.0, 90.0, 0, 27, 20, 35530, 1025, 1, 32585, 1, '2015-11-30 20:54:56', '2015-11-30 20:54:56', NULL, 0.0, 0.0, 12.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255123, 10, 1, 0, 0, 0.0, 55.0, 0, 34, 40, 35518, 1777, 1, 32586, 1, '2015-11-30 20:54:56', '2015-11-30 20:54:56', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255124, 3, 1, 0, 0, 0.0, 90.0, 1, 8, 60, 35519, 1496, 1, 32588, 1, '2015-11-30 20:54:56', '2015-11-30 20:54:56', NULL, 0.0, 0.0, 12.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255125, 1, 1, 0, 0, 0.0, 100.0, 1, 17, 90, 35534, 19088, 1, 32589, 1, '2015-11-30 20:54:57', '2015-11-30 20:54:57', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255126, 2, 1, 0, 0, 0.0, 95.0, 1, 20, 10, 35534, 19089, 1, 32590, 1, '2015-11-30 20:54:57', '2015-11-30 20:54:57', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255127, 2, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 35513, 20995, 1, 32591, 1, '2015-11-30 20:54:57', '2015-11-30 20:54:57', 1, 0.0, 0.0, 0.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255128, 1, 1, 0, 0, 0.0, 100.0, 5, 20, 30, 35556, 21019, 1, 32592, 1, '2015-11-30 20:54:57', '2015-11-30 20:54:57', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255129, 2, 1, 0, 0, 0.0, 95.0, 5, 10, 10, 35527, 19099, 1, 32593, 1, '2015-11-30 20:54:57', '2015-11-30 20:54:57', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255130, 2, 1, 0, 0, 0.0, 95.0, 0, 26, 60, 35530, 21034, 1, 32594, 1, '2015-11-30 20:54:57', '2015-11-30 20:54:57', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255131, 9, 1, 0, 0, 0.0, 60.0, 0, 30, 20, 35530, 21028, 1, 32595, 1, '2015-11-30 20:54:57', '2015-11-30 20:54:57', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255132, 1, 1, 0, 0, 0.0, 100.0, 4, 32, 20, 35527, 21026, 1, 32596, 1, '2015-11-30 20:54:58', '2015-11-30 20:54:58', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255133, 1, 1, 0, 0, 0.0, 100.0, 0, 25, 80, 35524, 21022, 1, 32597, 1, '2015-11-30 20:54:58', '2015-11-30 20:54:58', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255134, 1, 1, 0, 0, 0.0, 100.0, 0, 25, 90, 35529, 21009, 1, 32598, 1, '2015-11-30 20:54:58', '2015-11-30 20:54:58', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255135, 6, 1, 0, 0, 0.0, 75.0, 0, 27, 90, 35530, 21036, 1, 32599, 1, '2015-11-30 20:54:58', '2015-11-30 20:54:58', NULL, 0.0, 0.0, 6.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255136, 3, 1, 0, 0, 0.0, 90.0, 0, 25, 80, 35509, 20992, 1, 32600, 1, '2015-11-30 20:54:58', '2015-11-30 20:54:58', NULL, 0.0, 0.0, 12.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255137, 2, 1, 0, 0, 0.0, 95.0, 4, 50, 50, 35507, 1686, 1, 32601, 1, '2015-11-30 20:54:58', '2015-11-30 20:54:58', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255138, 4, 1, 0, 0, 0.0, 85.0, 6, 13, 0, 35520, 20996, 1, 32603, 1, '2015-11-30 20:54:58', '2015-11-30 20:54:58', NULL, 0.0, 0.0, 10.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255139, 4, 1, 0, 0, 0.0, 85.0, 5, 30, 50, 35536, 627, 1, 32604, 1, '2015-11-30 20:54:59', '2015-11-30 20:54:59', NULL, 0.0, 0.0, 10.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255140, 2, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 35522, 20980, 1, 32605, 1, '2015-11-30 20:54:59', '2015-11-30 20:54:59', 1, 0.0, 0.0, 0.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255141, 5, 1, 0, 0, 0.0, 80.0, 1, 30, 60, 35557, 632, 1, 32606, 1, '2015-11-30 20:54:59', '2015-11-30 20:54:59', NULL, 0.0, 0.0, 8.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255142, 13, 1, 0, 0, 0.0, 40.0, 2, 15, 60, 35504, 1197, 1, 32607, 1, '2015-11-30 20:54:59', '2015-11-30 20:54:59', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255143, 2, 1, 0, 0, 0.0, 95.0, 5, 19, 80, 35520, 620, 1, 32608, 1, '2015-11-30 20:54:59', '2015-11-30 20:54:59', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255144, 3, 1, 0, 0, 0.0, 90.0, 1, 29, 80, 35558, 1868, 1, 32610, 1, '2015-11-30 20:54:59', '2015-11-30 20:54:59', NULL, 0.0, 0.0, 12.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255145, 3, 1, 0, 0, 0.0, 90.0, 1, 16, 30, 35557, 142, 1, 32559, 1, '2015-11-30 20:54:59', '2015-11-30 20:54:59', NULL, 0.0, 0.0, 12.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255146, 6, 1, 0, 0, 0.0, 75.0, 1, 24, 80, 35547, 51, 1, 32560, 1, '2015-11-30 20:55:00', '2015-11-30 20:55:00', NULL, 0.0, 0.0, 6.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255147, 8, 1, 0, 0, 0.0, 65.0, 6, 20, 10, 35536, 258, 1, 32561, 1, '2015-11-30 20:55:00', '2015-11-30 20:55:00', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255148, 2, 1, 0, 0, 0.0, 95.0, 5, 6, 10, 35536, 1227, 1, 32562, 1, '2015-11-30 20:55:00', '2015-11-30 20:55:00', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255149, 1, 1, 0, 0, 0.0, 100.0, 1, 38, 0, 35501, 192, 1, 32563, 1, '2015-11-30 20:55:00', '2015-11-30 20:55:00', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255150, 3, 1, 0, 0, 0.0, 90.0, 0, 36, 90, 35550, 138, 1, 32564, 1, '2015-11-30 20:55:00', '2015-11-30 20:55:00', NULL, 0.0, 0.0, 12.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255151, 2, 1, 0, 0, 0.0, 95.0, 5, 21, 40, 35510, 1843, 1, 32565, 1, '2015-11-30 20:55:00', '2015-11-30 20:55:00', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255152, 4, 1, 0, 0, 0.0, 85.0, 1, 34, 0, 35559, 456, 1, 32566, 1, '2015-11-30 20:55:00', '2015-11-30 20:55:00', NULL, 0.0, 0.0, 10.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255153, 3, 1, 0, 0, 0.0, 90.0, 1, 42, 50, 35498, 1483, 1, 32567, 1, '2015-11-30 20:55:00', '2015-11-30 20:55:00', NULL, 0.0, 0.0, 12.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255154, 5, 1, 0, 0, 0.0, 80.0, 1, 38, 60, 35560, 550, 1, 32568, 1, '2015-11-30 20:55:01', '2015-11-30 20:55:01', NULL, 0.0, 0.0, 8.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255155, 2, 1, 0, 0, 0.0, 95.0, 1, 29, 40, 35558, 785, 1, 32569, 1, '2015-11-30 20:55:01', '2015-11-30 20:55:01', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255156, 10, 1, 0, 0, 0.0, 55.0, 6, 1, 10, 35543, 1016, 1, 32570, 1, '2015-11-30 20:55:01', '2015-11-30 20:55:01', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255157, 2, 1, 0, 0, 0.0, 95.0, 1, 15, 10, 35557, 23, 1, 32573, 1, '2015-11-30 20:55:01', '2015-11-30 20:55:01', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255158, 2, 1, 0, 0, 0.0, 95.0, 0, 33, 70, 35548, 773, 1, 32574, 1, '2015-11-30 20:55:01', '2015-11-30 20:55:01', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255159, 1, 1, 0, 0, 0.0, 100.0, 5, 47, 60, 35554, 64, 1, 32577, 1, '2015-11-30 20:55:01', '2015-11-30 20:55:01', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255160, 1, 1, 0, 0, 0.0, 100.0, 4, 57, 50, 35516, 1841, 1, 32578, 1, '2015-11-30 20:55:02', '2015-11-30 20:55:02', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255161, 1, 1, 0, 0, 0.0, 100.0, 1, 17, 80, 35560, 1788, 1, 32579, 1, '2015-11-30 20:55:02', '2015-11-30 20:55:02', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255162, 10, 1, 0, 0, 0.0, 55.0, 1, 18, 60, 35504, 1279, 1, 32580, 1, '2015-11-30 20:55:02', '2015-11-30 20:55:02', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255163, 1, 1, 0, 0, 0.0, 100.0, 4, 54, 30, 35543, 1541, 1, 32581, 1, '2015-11-30 20:55:02', '2015-11-30 20:55:02', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255164, 3, 1, 0, 0, 0.0, 90.0, 6, 17, 70, 35553, 98, 1, 32582, 1, '2015-11-30 20:55:02', '2015-11-30 20:55:02', NULL, 0.0, 0.0, 12.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255165, 6, 1, 0, 0, 0.0, 75.0, 6, 52, 60, 35503, 503, 1, 32584, 1, '2015-11-30 20:55:02', '2015-11-30 20:55:02', NULL, 0.0, 0.0, 6.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255166, 1, 1, 0, 0, 0.0, 100.0, 4, 37, 30, 35505, 1025, 1, 32585, 1, '2015-11-30 20:55:02', '2015-11-30 20:55:02', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255167, 7, 1, 0, 0, 0.0, 70.0, 1, 26, 0, 35497, 1777, 1, 32586, 1, '2015-11-30 20:55:02', '2015-11-30 20:55:02', NULL, 0.0, 0.0, 4.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255168, 9, 1, 0, 0, 0.0, 60.0, 1, 16, 20, 35519, 11742, 1, 32587, 1, '2015-11-30 20:55:03', '2015-11-30 20:55:03', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255169, 2, 1, 0, 0, 0.0, 95.0, 4, 36, 90, 35506, 1496, 1, 32588, 1, '2015-11-30 20:55:03', '2015-11-30 20:55:03', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255170, 1, 1, 0, 0, 0.0, 100.0, 0, 30, 70, 35514, 19088, 1, 32589, 1, '2015-11-30 20:55:03', '2015-11-30 20:55:03', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255171, 2, 1, 0, 0, 0.0, 95.0, 0, 31, 40, 35514, 19089, 1, 32590, 1, '2015-11-30 20:55:03', '2015-11-30 20:55:03', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255172, 3, 1, 0, 0, 0.0, 90.0, 0, 35, 50, 35524, 20995, 1, 32591, 1, '2015-11-30 20:55:03', '2015-11-30 20:55:03', NULL, 0.0, 0.0, 12.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255173, 1, 1, 0, 0, 0.0, 100.0, 1, 30, 60, 35515, 21019, 1, 32592, 1, '2015-11-30 20:55:03', '2015-11-30 20:55:03', NULL, 0.0, 0.0, 16.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255174, 2, 1, 0, 0, 0.0, 95.0, 0, 27, 0, 35524, 19099, 1, 32593, 1, '2015-11-30 20:55:03', '2015-11-30 20:55:03', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255175, 4, 1, 0, 0, 0.0, 85.0, 1, 11, 80, 35545, 21034, 1, 32594, 1, '2015-11-30 20:55:04', '2015-11-30 20:55:04', NULL, 0.0, 0.0, 10.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255176, 5, 1, 0, 0, 0.0, 80.0, 1, 12, 30, 35545, 21036, 1, 32599, 1, '2015-11-30 20:55:04', '2015-11-30 20:55:04', NULL, 0.0, 0.0, 8.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255177, 2, 1, 0, 0, 0.0, 95.0, 1, 3, 90, 35519, 20992, 1, 32600, 1, '2015-11-30 20:55:04', '2015-11-30 20:55:04', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255178, 2, 1, 0, 0, 0.0, 95.0, 0, 27, 10, 35529, 1686, 1, 32601, 1, '2015-11-30 20:55:04', '2015-11-30 20:55:04', NULL, 0.0, 0.0, 14.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255179, 15, 1, 0, 0, 0.0, 30.0, 0, 33, 90, 35517, 20996, 1, 32603, 1, '2015-11-30 20:55:04', '2015-11-30 20:55:04', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255180, 3, 1, 0, 0, 0.0, 90.0, 1, 26, 70, 35552, 627, 1, 32604, 1, '2015-11-30 20:55:04', '2015-11-30 20:55:04', NULL, 0.0, 0.0, 12.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255181, 8, 1, 0, 0, 0.0, 65.0, 0, 42, 80, 35531, 20980, 1, 32605, 1, '2015-11-30 20:55:04', '2015-11-30 20:55:04', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255182, 9, 1, 0, 0, 0.0, 60.0, 0, 34, 10, 35546, 632, 1, 32606, 1, '2015-11-30 20:55:04', '2015-11-30 20:55:04', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255183, 18, 1, 0, 0, 0.0, 15.0, 0, 50, 30, 35529, 1197, 1, 32607, 1, '2015-11-30 20:55:05', '2015-11-30 20:55:05', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255184, 4, 1, 0, 0, 0.0, 85.0, 1, 15, 90, 35502, 620, 1, 32608, 1, '2015-11-30 20:55:05', '2015-11-30 20:55:05', NULL, 0.0, 0.0, 10.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255185, 14, 1, 0, 0, 0.0, 35.0, 0, 33, 50, 35530, 1868, 1, 32610, 1, '2015-11-30 20:55:05', '2015-11-30 20:55:05', NULL, 0.0, 0.0, 2.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255186, 4, 1, 0, 0, 0.0, 85.0, 1, 37, 0, 35558, 1866, 18, 32611, 1, '2015-11-30 20:55:05', '2015-11-30 20:55:05', NULL, 0.0, 0.0, 10.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255187, 6, 1, 0, 0, 0.0, 75.0, 1, 35, 70, 35557, 1808, 18, 32612, 1, '2015-11-30 20:55:05', '2015-11-30 20:55:05', NULL, 0.0, 0.0, 6.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255188, 2, 1, 0, 0, 0.0, 95.0, 1, 37, 30, 35498, 1810, 18, 32613, 1, '2015-11-30 20:55:05', '2015-11-30 20:55:05', NULL, 0.0, 0.0, 14.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255189, 6, 1, 0, 0, 0.0, 75.0, 6, 2, 10, 35536, 1542, 18, 32614, 1, '2015-11-30 20:55:05', '2015-11-30 20:55:05', NULL, 0.0, 0.0, 6.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255190, 4, 1, 0, 0, 0.0, 85.0, 5, 42, 70, 35516, 1476, 18, 32615, 1, '2015-11-30 20:55:06', '2015-11-30 20:55:06', NULL, 0.0, 0.0, 10.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255191, 10, 1, 0, 0, 0.0, 55.0, 6, 1, 10, 35543, 1513, 18, 32616, 1, '2015-11-30 20:55:06', '2015-11-30 20:55:06', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255192, 1, 1, 0, 0, 0.0, 100.0, 1, 18, 20, 35558, 1863, 18, 32617, 1, '2015-11-30 20:55:06', '2015-11-30 20:55:06', NULL, 0.0, 0.0, 16.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255193, 2, 1, 0, 0, 0.0, 95.0, 5, 46, 90, 35503, 579, 18, 32618, 1, '2015-11-30 20:55:06', '2015-11-30 20:55:06', NULL, 0.0, 0.0, 14.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255194, 3, 1, 0, 0, 0.0, 90.0, 6, 17, 40, 35537, 1428, 18, 32619, 1, '2015-11-30 20:55:06', '2015-11-30 20:55:06', NULL, 0.0, 0.0, 12.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255195, 3, 1, 0, 0, 0.0, 90.0, 0, 27, 70, 35551, 19860, 18, 32620, 1, '2015-11-30 20:55:06', '2015-11-30 20:55:06', NULL, 0.0, 0.0, 12.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255196, 6, 1, 0, 0, 0.0, 75.0, 5, 37, 80, 35543, 1475, 18, 32616, 1, '2015-11-30 20:55:06', '2015-11-30 20:55:06', NULL, 0.0, 0.0, 6.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255197, 5, 1, 0, 0, 0.0, 80.0, 1, 26, 50, 35525, 4836, 18, 32621, 1, '2015-11-30 20:55:06', '2015-11-30 20:55:06', NULL, 0.0, 0.0, 8.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255198, 12, 1, 0, 0, 0.0, 45.0, 6, 11, 90, 35543, 1838, 18, 32622, 1, '2015-11-30 20:55:07', '2015-11-30 20:55:07', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255199, 1, 1, 0, 0, 0.0, 100.0, 1, 23, 70, 35544, 1226, 18, 32623, 1, '2015-11-30 20:55:07', '2015-11-30 20:55:07', NULL, 0.0, 0.0, 16.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255200, 5, 1, 0, 0, 0.0, 80.0, 6, 45, 40, 35511, 1826, 18, 32624, 1, '2015-11-30 20:55:07', '2015-11-30 20:55:07', NULL, 0.0, 0.0, 8.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255201, 7, 1, 0, 0, 0.0, 70.0, 5, 22, 90, 35506, 1480, 18, 32625, 1, '2015-11-30 20:55:07', '2015-11-30 20:55:07', NULL, 0.0, 0.0, 4.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255202, 5, 1, 0, 0, 0.0, 80.0, 6, 13, 70, 35520, 1576, 18, 32626, 1, '2015-11-30 20:55:07', '2015-11-30 20:55:07', NULL, 0.0, 0.0, 8.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255203, 1, 1, 0, 0, 0.0, 100.0, 1, 23, 10, 35532, 21027, 18, 32627, 1, '2015-11-30 20:55:07', '2015-11-30 20:55:07', NULL, 0.0, 0.0, 16.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255204, 7, 1, 0, 0, 0.0, 70.0, 1, 20, 30, 35502, 21018, 18, 32628, 1, '2015-11-30 20:55:07', '2015-11-30 20:55:07', NULL, 0.0, 0.0, 4.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255205, 6, 1, 0, 0, 0.0, 75.0, 6, 5, 70, 35505, 21010, 18, 32629, 1, '2015-11-30 20:55:08', '2015-11-30 20:55:08', NULL, 0.0, 0.0, 6.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255206, 4, 1, 0, 0, 0.0, 85.0, 6, 24, 30, 35511, 20986, 18, 32630, 1, '2015-11-30 20:55:08', '2015-11-30 20:55:08', NULL, 0.0, 0.0, 10.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255207, 5, 1, 0, 0, 0.0, 80.0, 6, 43, 0, 35553, 1807, 18, 32631, 1, '2015-11-30 20:55:08', '2015-11-30 20:55:08', NULL, 0.0, 0.0, 8.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255208, 8, 1, 0, 0, 0.0, 65.0, 7, 34, 90, 35503, 21040, 18, 32632, 1, '2015-11-30 20:55:08', '2015-11-30 20:55:08', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255209, 12, 1, 0, 0, 0.0, 45.0, 0, 36, 60, 35512, 21014, 18, 32633, 1, '2015-11-30 20:55:08', '2015-11-30 20:55:08', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255210, 9, 1, 0, 0, 0.0, 60.0, 0, 28, 60, 35509, 1604, 18, 32634, 1, '2015-11-30 20:55:08', '2015-11-30 20:55:08', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255211, 6, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 35557, 21029, 18, 32635, 1, '2015-11-30 20:55:08', '2015-11-30 20:55:08', 1, 0.0, 0.0, 0.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255212, 8, 1, 0, 0, 0.0, 65.0, 1, 35, 20, 35561, 4834, 18, 32636, 1, '2015-11-30 20:55:09', '2015-11-30 20:55:09', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255213, 1, 1, 0, 0, 0.0, 100.0, 1, 7, 80, 35502, 1845, 18, 32637, 1, '2015-11-30 20:55:09', '2015-11-30 20:55:09', NULL, 0.0, 0.0, 16.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255214, 10, 1, 0, 0, 0.0, 55.0, 6, 46, 10, 35510, 4835, 18, 32638, 1, '2015-11-30 20:55:09', '2015-11-30 20:55:09', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255215, 9, 1, 0, 0, 0.0, 60.0, 0, 45, 60, 35531, 21002, 18, 32639, 1, '2015-11-30 20:55:09', '2015-11-30 20:55:09', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255216, 10, 1, 0, 0, 0.0, 55.0, 1, 30, 30, 35502, 20994, 18, 32640, 1, '2015-11-30 20:55:09', '2015-11-30 20:55:09', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255217, 12, 1, 0, 0, 0.0, 45.0, 0, 40, 50, 35535, 21011, 18, 32642, 1, '2015-11-30 20:55:09', '2015-11-30 20:55:09', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255218, 2, 1, 0, 0, 0.0, 95.0, 7, 8, 0, 35542, 21038, 18, 32643, 1, '2015-11-30 20:55:09', '2015-11-30 20:55:09', NULL, 0.0, 0.0, 14.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255219, 4, 1, 0, 0, 0.0, 85.0, 6, 33, 20, 35503, 21023, 18, 32645, 1, '2015-11-30 20:55:09', '2015-11-30 20:55:09', NULL, 0.0, 0.0, 10.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255220, 13, 1, 0, 0, 0.0, 40.0, 0, 32, 50, 35517, 21037, 18, 32646, 1, '2015-11-30 20:55:10', '2015-11-30 20:55:10', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255221, 12, 1, 0, 0, 0.0, 45.0, 0, 32, 30, 35530, 1866, 18, 32611, 1, '2015-11-30 20:55:10', '2015-11-30 20:55:10', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255222, 7, 1, 0, 0, 0.0, 70.0, 6, 2, 70, 35536, 1808, 18, 32612, 1, '2015-11-30 20:55:10', '2015-11-30 20:55:10', NULL, 0.0, 0.0, 4.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255223, 8, 1, 0, 0, 0.0, 65.0, 0, 35, 40, 35512, 1810, 18, 32613, 1, '2015-11-30 20:55:10', '2015-11-30 20:55:10', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255224, 8, 1, 0, 0, 0.0, 65.0, 0, 33, 50, 35546, 1542, 18, 32614, 1, '2015-11-30 20:55:10', '2015-11-30 20:55:10', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255225, 8, 1, 0, 0, 0.0, 65.0, 1, 27, 20, 35497, 1476, 18, 32615, 1, '2015-11-30 20:55:10', '2015-11-30 20:55:10', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255226, 11, 1, 0, 0, 0.0, 50.0, 0, 34, 30, 35535, 1513, 18, 32616, 1, '2015-11-30 20:55:10', '2015-11-30 20:55:10', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255227, 10, 1, 0, 0, 0.0, 55.0, 0, 30, 50, 35530, 1863, 18, 32617, 1, '2015-11-30 20:55:11', '2015-11-30 20:55:11', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255228, 1, 1, 0, 0, 0.0, 100.0, 0, 32, 20, 35521, 579, 18, 32618, 1, '2015-11-30 20:55:11', '2015-11-30 20:55:11', NULL, 0.0, 0.0, 16.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255229, 6, 1, 0, 0, 0.0, 75.0, 1, 42, 30, 35559, 1428, 18, 32619, 1, '2015-11-30 20:55:11', '2015-11-30 20:55:11', NULL, 0.0, 0.0, 6.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255230, 2, 1, 0, 0, 0.0, 95.0, 1, 12, 60, 35547, 19860, 18, 32620, 1, '2015-11-30 20:55:11', '2015-11-30 20:55:11', NULL, 0.0, 0.0, 14.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255231, 2, 1, 0, 0, 0.0, 95.0, 1, 34, 10, 35539, 1475, 18, 32616, 1, '2015-11-30 20:55:11', '2015-11-30 20:55:11', NULL, 0.0, 0.0, 14.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255232, 12, 1, 0, 0, 0.0, 45.0, 0, 29, 90, 35509, 4836, 18, 32621, 1, '2015-11-30 20:55:11', '2015-11-30 20:55:11', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255233, 3, 1, 0, 0, 0.0, 90.0, 0, 30, 20, 35535, 1838, 18, 32622, 1, '2015-11-30 20:55:11', '2015-11-30 20:55:11', NULL, 0.0, 0.0, 12.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255234, 1, 1, 0, 0, 0.0, 100.0, 5, 41, 10, 35553, 1226, 18, 32623, 1, '2015-11-30 20:55:11', '2015-11-30 20:55:11', NULL, 0.0, 0.0, 16.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255235, 5, 1, 0, 0, 0.0, 80.0, 0, 39, 50, 35531, 1826, 18, 32624, 1, '2015-11-30 20:55:12', '2015-11-30 20:55:12', NULL, 0.0, 0.0, 8.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255236, 11, 1, 0, 0, 0.0, 50.0, 0, 29, 50, 35509, 1480, 18, 32625, 1, '2015-11-30 20:55:12', '2015-11-30 20:55:12', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255237, 10, 1, 0, 0, 0.0, 55.0, 0, 30, 50, 35517, 1576, 18, 32626, 1, '2015-11-30 20:55:12', '2015-11-30 20:55:12', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255238, 8, 1, 0, 0, 0.0, 65.0, 0, 29, 90, 35517, 21018, 18, 32628, 1, '2015-11-30 20:55:12', '2015-11-30 20:55:12', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255239, 11, 1, 0, 0, 0.0, 50.0, 0, 31, 0, 35530, 21010, 18, 32629, 1, '2015-11-30 20:55:12', '2015-11-30 20:55:12', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255240, 3, 1, 0, 0, 0.0, 90.0, 1, 31, 0, 35560, 20986, 18, 32630, 1, '2015-11-30 20:55:12', '2015-11-30 20:55:12', NULL, 0.0, 0.0, 12.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255241, 3, 1, 0, 0, 0.0, 90.0, 1, 31, 30, 35544, 1807, 18, 32631, 1, '2015-11-30 20:55:12', '2015-11-30 20:55:12', NULL, 0.0, 0.0, 12.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255242, 5, 1, 0, 0, 0.0, 80.0, 1, 53, 50, 35500, 21040, 18, 32632, 1, '2015-11-30 20:55:13', '2015-11-30 20:55:13', NULL, 0.0, 0.0, 8.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255243, 9, 1, 0, 0, 0.0, 60.0, 6, 38, 10, 35510, 21014, 18, 32633, 1, '2015-11-30 20:55:13', '2015-11-30 20:55:13', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255244, 9, 1, 0, 0, 0.0, 60.0, 0, 34, 10, 35546, 21029, 18, 32635, 1, '2015-11-30 20:55:13', '2015-11-30 20:55:13', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255245, 17, 1, 0, 0, 0.0, 20.0, 0, 33, 60, 35529, 4834, 18, 32636, 1, '2015-11-30 20:55:13', '2015-11-30 20:55:13', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255246, 1, 1, 0, 0, 0.0, 100.0, 0, 27, 10, 35517, 1845, 18, 32637, 1, '2015-11-30 20:55:13', '2015-11-30 20:55:13', NULL, 0.0, 0.0, 16.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255247, 9, 1, 0, 0, 0.0, 60.0, 1, 45, 30, 35532, 4835, 18, 32638, 1, '2015-11-30 20:55:13', '2015-11-30 20:55:13', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255248, 1, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 35517, 20994, 18, 32640, 1, '2015-11-30 20:55:13', '2015-11-30 20:55:13', 1, 0.0, 0.0, 0.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255249, 13, 1, 0, 0, 0.0, 40.0, 7, 11, 90, 35543, 21011, 18, 32642, 1, '2015-11-30 20:55:13', '2015-11-30 20:55:13', NULL, 0.0, 0.0, 2.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255250, 6, 1, 0, 0, 0.0, 75.0, 0, 42, 80, 35499, 21038, 18, 32643, 1, '2015-11-30 20:55:14', '2015-11-30 20:55:14', NULL, 0.0, 0.0, 6.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255251, 4, 1, 0, 0, 0.0, 85.0, 0, 37, 20, 35521, 21023, 18, 32645, 1, '2015-11-30 20:55:14', '2015-11-30 20:55:14', NULL, 0.0, 0.0, 10.0, 1592);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255252, 2, 1, 0, 0, 0.0, 95.0, 1, 18, 30, 35497, 4847, 11, 32647, 1, '2015-11-30 20:55:14', '2015-11-30 20:55:14', NULL, 0.0, 0.0, 14.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255253, 1, 1, 0, 0, 0.0, 100.0, 1, 31, 80, 35498, 882, 11, 32649, 1, '2015-11-30 20:55:14', '2015-11-30 20:55:14', NULL, 0.0, 0.0, 16.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255254, 1, 1, 0, 0, 0.0, 100.0, 1, 22, 0, 35541, 1659, 11, 32650, 1, '2015-11-30 20:55:14', '2015-11-30 20:55:14', NULL, 0.0, 0.0, 16.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255255, 2, 1, 0, 0, 0.0, 95.0, 1, 8, 90, 35502, 1657, 11, 32651, 1, '2015-11-30 20:55:14', '2015-11-30 20:55:14', NULL, 0.0, 0.0, 14.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255256, 3, 1, 0, 0, 0.0, 90.0, 1, 51, 50, 35500, 685, 11, 32652, 1, '2015-11-30 20:55:15', '2015-11-30 20:55:15', NULL, 0.0, 0.0, 12.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255257, 7, 1, 0, 0, 0.0, 70.0, 7, 10, 80, 35503, 140, 11, 32653, 1, '2015-11-30 20:55:15', '2015-11-30 20:55:15', NULL, 0.0, 0.0, 4.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255258, 2, 1, 0, 0, 0.0, 95.0, 1, 15, 60, 35523, 553, 11, 32654, 1, '2015-11-30 20:55:15', '2015-11-30 20:55:15', NULL, 0.0, 0.0, 14.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255259, 6, 1, 0, 0, 0.0, 75.0, 1, 31, 70, 35552, 228, 11, 32655, 1, '2015-11-30 20:55:15', '2015-11-30 20:55:15', NULL, 0.0, 0.0, 6.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255260, 10, 1, 0, 0, 0.0, 55.0, 1, 49, 80, 35552, 746, 11, 32656, 1, '2015-11-30 20:55:15', '2015-11-30 20:55:15', NULL, 0.0, 0.0, 2.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255261, 9, 1, 0, 0, 0.0, 60.0, 1, 39, 80, 35552, 148, 11, 32657, 1, '2015-11-30 20:55:15', '2015-11-30 20:55:15', NULL, 0.0, 0.0, 2.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255262, 1, 1, 0, 0, 0.0, 100.0, 6, 17, 60, 35562, 1244, 11, 32658, 1, '2015-11-30 20:55:15', '2015-11-30 20:55:15', NULL, 0.0, 0.0, 16.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255263, 4, 1, 0, 0, 0.0, 85.0, 2, 56, 0, 35563, 21032, 11, 32659, 1, '2015-11-30 20:55:16', '2015-11-30 20:55:16', NULL, 0.0, 0.0, 10.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255264, 2, 1, 0, 0, 0.0, 95.0, 1, 58, 30, 35563, 229, 11, 32660, 1, '2015-11-30 20:55:16', '2015-11-30 20:55:16', NULL, 0.0, 0.0, 14.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255265, 3, 1, 0, 0, 0.0, 90.0, 6, 5, 20, 35554, 114, 11, 32661, 1, '2015-11-30 20:55:16', '2015-11-30 20:55:16', NULL, 0.0, 0.0, 12.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255266, 4, 1, 0, 0, 0.0, 85.0, 0, 30, 90, 35518, 4847, 11, 32647, 1, '2015-11-30 20:55:16', '2015-11-30 20:55:16', NULL, 0.0, 0.0, 10.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255267, 5, 1, 0, 0, 0.0, 80.0, 0, 32, 60, 35512, 882, 11, 32649, 1, '2015-11-30 20:55:16', '2015-11-30 20:55:16', NULL, 0.0, 0.0, 8.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255268, 7, 1, 0, 0, 0.0, 70.0, 1, 20, 30, 35502, 1659, 11, 32650, 1, '2015-11-30 20:55:16', '2015-11-30 20:55:16', NULL, 0.0, 0.0, 4.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255269, 3, 1, 0, 0, 0.0, 90.0, 0, 27, 30, 35517, 1657, 11, 32651, 1, '2015-11-30 20:55:16', '2015-11-30 20:55:16', NULL, 0.0, 0.0, 12.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255270, 3, 1, 0, 0, 0.0, 90.0, 0, 36, 70, 35521, 685, 11, 32652, 1, '2015-11-30 20:55:17', '2015-11-30 20:55:17', NULL, 0.0, 0.0, 12.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255271, 6, 1, 0, 0, 0.0, 75.0, 2, 1, 70, 35500, 140, 11, 32653, 1, '2015-11-30 20:55:17', '2015-11-30 20:55:17', NULL, 0.0, 0.0, 6.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255272, 1, 1, 0, 0, 0.0, 100.0, 0, 29, 0, 35535, 553, 11, 32654, 1, '2015-11-30 20:55:17', '2015-11-30 20:55:17', NULL, 0.0, 0.0, 16.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255273, 12, 1, 0, 0, 0.0, 45.0, 0, 41, 20, 35546, 746, 11, 32656, 1, '2015-11-30 20:55:17', '2015-11-30 20:55:17', NULL, 0.0, 0.0, 2.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255274, 7, 1, 0, 0, 0.0, 70.0, 0, 31, 50, 35546, 148, 11, 32657, 1, '2015-11-30 20:55:17', '2015-11-30 20:55:17', NULL, 0.0, 0.0, 4.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255275, 1, 1, 0, 0, 0.0, 100.0, 1, 41, 70, 35563, 1244, 11, 32658, 1, '2015-11-30 20:55:17', '2015-11-30 20:55:17', NULL, 0.0, 0.0, 16.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255276, 2, 1, 0, 0, 0.0, 95.0, 0, 46, 60, 35549, 21032, 11, 32659, 1, '2015-11-30 20:55:17', '2015-11-30 20:55:17', NULL, 0.0, 0.0, 14.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255277, 2, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 35549, 229, 11, 32660, 1, '2015-11-30 20:55:17', '2015-11-30 20:55:17', 1, 0.0, 0.0, 0.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255278, 3, 1, 0, 0, 0.0, 90.0, 1, 30, 20, 35555, 114, 11, 32661, 1, '2015-11-30 20:55:18', '2015-11-30 20:55:18', NULL, 0.0, 0.0, 12.0, 1585);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255279, 17, 1, 0, 0, 0.0, 20.0, 0, 39, 40, 35509, 18989, 5, 32663, 1, '2015-11-30 20:55:18', '2015-11-30 20:55:18', NULL, 0.0, 0.0, 2.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255280, 4, 1, 0, 0, 0.0, 85.0, 5, 8, 60, 35505, 1403, 5, 32664, 1, '2015-11-30 20:55:18', '2015-11-30 20:55:18', NULL, 0.0, 0.0, 10.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255281, 1, 1, 0, 0, 0.0, 100.0, 1, 33, 20, 35500, 136, 5, 32665, 1, '2015-11-30 20:55:18', '2015-11-30 20:55:18', NULL, 0.0, 0.0, 16.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255282, 7, 1, 0, 0, 0.0, 70.0, 1, 22, 30, 35523, 40, 5, 32666, 1, '2015-11-30 20:55:18', '2015-11-30 20:55:18', NULL, 0.0, 0.0, 4.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255283, 4, 1, 0, 0, 0.0, 85.0, 1, 29, 50, 35552, 172, 5, 32667, 1, '2015-11-30 20:55:18', '2015-11-30 20:55:18', NULL, 0.0, 0.0, 10.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255284, 3, 1, 0, 0, 0.0, 90.0, 1, 14, 60, 35502, 162, 5, 32668, 1, '2015-11-30 20:55:18', '2015-11-30 20:55:18', NULL, 0.0, 0.0, 12.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255285, 7, 1, 0, 0, 0.0, 70.0, 6, 15, 0, 35510, 1288, 5, 32669, 1, '2015-11-30 20:55:19', '2015-11-30 20:55:19', NULL, 0.0, 0.0, 4.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255286, 5, 1, 0, 0, 0.0, 80.0, 0, 30, 70, 35535, 1160, 5, 32670, 1, '2015-11-30 20:55:19', '2015-11-30 20:55:19', NULL, 0.0, 0.0, 8.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255287, 6, 1, 0, 0, 0.0, 75.0, 5, 13, 40, 35506, 1662, 5, 32671, 1, '2015-11-30 20:55:19', '2015-11-30 20:55:19', NULL, 0.0, 0.0, 6.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255288, 6, 1, 0, 0, 0.0, 75.0, 6, 14, 20, 35510, 1554, 5, 32672, 1, '2015-11-30 20:55:19', '2015-11-30 20:55:19', NULL, 0.0, 0.0, 6.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255289, 5, 1, 0, 0, 0.0, 80.0, 1, 28, 70, 35541, 768, 5, 32673, 1, '2015-11-30 20:55:19', '2015-11-30 20:55:19', NULL, 0.0, 0.0, 8.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255290, 1, 1, 0, 0, 0.0, 100.0, 5, 52, 10, 35511, 4838, 5, 32674, 1, '2015-11-30 20:55:19', '2015-11-30 20:55:19', NULL, 0.0, 0.0, 16.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255291, 2, 1, 0, 0, 0.0, 95.0, 0, 31, 50, 35499, 1522, 5, 32675, 1, '2015-11-30 20:55:19', '2015-11-30 20:55:19', NULL, 0.0, 0.0, 14.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255292, 3, 1, 0, 0, 0.0, 90.0, 0, 27, 30, 35517, 1574, 5, 32676, 1, '2015-11-30 20:55:20', '2015-11-30 20:55:20', NULL, 0.0, 0.0, 12.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255293, 3, 1, 0, 0, 0.0, 90.0, 1, 16, 90, 35561, 1164, 5, 32677, 1, '2015-11-30 20:55:20', '2015-11-30 20:55:20', NULL, 0.0, 0.0, 12.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255294, 3, 1, 0, 0, 0.0, 90.0, 5, 21, 30, 35543, 752, 5, 32678, 1, '2015-11-30 20:55:20', '2015-11-30 20:55:20', NULL, 0.0, 0.0, 12.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255295, 2, 1, 0, 0, 0.0, 95.0, 5, 12, 90, 35543, 12, 5, 32679, 1, '2015-11-30 20:55:20', '2015-11-30 20:55:20', NULL, 0.0, 0.0, 14.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255296, 2, 1, 0, 0, 0.0, 95.0, 4, 46, 50, 35505, 4861, 5, 32680, 1, '2015-11-30 20:55:20', '2015-11-30 20:55:20', NULL, 0.0, 0.0, 14.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255297, 8, 1, 0, 0, 0.0, 65.0, 0, 32, 30, 35535, 4841, 5, 32681, 1, '2015-11-30 20:55:20', '2015-11-30 20:55:20', NULL, 0.0, 0.0, 2.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255298, 1, 1, 0, 0, 0.0, 100.0, 1, 29, 20, 35533, 1621, 5, 32682, 1, '2015-11-30 20:55:20', '2015-11-30 20:55:20', NULL, 0.0, 0.0, 16.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255299, 7, 1, 0, 0, 0.0, 70.0, 5, 42, 30, 35543, 1564, 5, 32683, 1, '2015-11-30 20:55:20', '2015-11-30 20:55:20', NULL, 0.0, 0.0, 4.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255300, 3, 1, 0, 0, 0.0, 90.0, 6, 3, 70, 35511, 966, 5, 32684, 1, '2015-11-30 20:55:21', '2015-11-30 20:55:21', NULL, 0.0, 0.0, 12.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255301, 5, 1, 0, 0, 0.0, 80.0, 1, 14, 0, 35504, 720, 5, 32685, 1, '2015-11-30 20:55:21', '2015-11-30 20:55:21', NULL, 0.0, 0.0, 8.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255302, 2, 1, 0, 0, 0.0, 95.0, 1, 23, 50, 35532, 687, 5, 32686, 1, '2015-11-30 20:55:21', '2015-11-30 20:55:21', NULL, 0.0, 0.0, 14.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255303, 4, 1, 0, 0, 0.0, 85.0, 1, 43, 20, 35498, 1432, 5, 32688, 1, '2015-11-30 20:55:21', '2015-11-30 20:55:21', NULL, 0.0, 0.0, 10.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255304, 5, 1, 0, 0, 0.0, 80.0, 6, 36, 80, 35503, 101, 5, 32689, 1, '2015-11-30 20:55:21', '2015-11-30 20:55:21', NULL, 0.0, 0.0, 8.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255305, 2, 1, 0, 0, 0.0, 95.0, 1, 23, 70, 35559, 982, 5, 32690, 1, '2015-11-30 20:55:21', '2015-11-30 20:55:21', NULL, 0.0, 0.0, 14.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255306, 12, 1, 0, 0, 0.0, 45.0, 1, 25, 40, 35504, 276, 5, 32691, 1, '2015-11-30 20:55:21', '2015-11-30 20:55:21', NULL, 0.0, 0.0, 2.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255307, 2, 1, 0, 0, 0.0, 95.0, 6, 0, 20, 35511, 92, 5, 32692, 1, '2015-11-30 20:55:22', '2015-11-30 20:55:22', NULL, 0.0, 0.0, 14.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255308, 5, 1, 0, 0, 0.0, 80.0, 5, 18, 10, 35505, 960, 5, 32693, 1, '2015-11-30 20:55:22', '2015-11-30 20:55:22', NULL, 0.0, 0.0, 8.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255309, 11, 1, 0, 0, 0.0, 50.0, 1, 21, 80, 35504, 21008, 5, 32694, 1, '2015-11-30 20:55:22', '2015-11-30 20:55:22', NULL, 0.0, 0.0, 2.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255310, 7, 1, 0, 0, 0.0, 70.0, 1, 36, 80, 35525, 18989, 5, 32663, 1, '2015-11-30 20:55:22', '2015-11-30 20:55:22', NULL, 0.0, 0.0, 4.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255311, 3, 1, 0, 0, 0.0, 90.0, 1, 9, 90, 35545, 1403, 5, 32664, 1, '2015-11-30 20:55:22', '2015-11-30 20:55:22', NULL, 0.0, 0.0, 12.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255312, 3, 1, 0, 0, 0.0, 90.0, 1, 27, 0, 35508, 136, 5, 32665, 1, '2015-11-30 20:55:22', '2015-11-30 20:55:22', NULL, 0.0, 0.0, 12.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255313, 6, 1, 0, 0, 0.0, 75.0, 0, 31, 0, 35535, 40, 5, 32666, 1, '2015-11-30 20:55:22', '2015-11-30 20:55:22', NULL, 0.0, 0.0, 6.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255314, 3, 1, 0, 0, 0.0, 90.0, 0, 28, 70, 35546, 172, 5, 32667, 1, '2015-11-30 20:55:22', '2015-11-30 20:55:22', NULL, 0.0, 0.0, 12.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255315, 6, 1, 0, 0, 0.0, 75.0, 0, 29, 20, 35517, 162, 5, 32668, 1, '2015-11-30 20:55:23', '2015-11-30 20:55:23', NULL, 0.0, 0.0, 6.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255316, 7, 1, 0, 0, 0.0, 70.0, 1, 32, 80, 35532, 1288, 5, 32669, 1, '2015-11-30 20:55:23', '2015-11-30 20:55:23', NULL, 0.0, 0.0, 4.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255317, 5, 1, 0, 0, 0.0, 80.0, 1, 17, 50, 35523, 1160, 5, 32670, 1, '2015-11-30 20:55:23', '2015-11-30 20:55:23', NULL, 0.0, 0.0, 8.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255318, 8, 1, 0, 0, 0.0, 65.0, 1, 14, 0, 35519, 1662, 5, 32671, 1, '2015-11-30 20:55:23', '2015-11-30 20:55:23', NULL, 0.0, 0.0, 2.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255319, 7, 1, 0, 0, 0.0, 70.0, 0, 34, 80, 35512, 1554, 5, 32672, 1, '2015-11-30 20:55:23', '2015-11-30 20:55:23', NULL, 0.0, 0.0, 4.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255320, 11, 1, 0, 0, 0.0, 50.0, 0, 32, 10, 35517, 768, 5, 32673, 1, '2015-11-30 20:55:23', '2015-11-30 20:55:23', NULL, 0.0, 0.0, 2.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255321, 2, 1, 0, 0, 0.0, 95.0, 0, 33, 40, 35531, 4838, 5, 32674, 1, '2015-11-30 20:55:24', '2015-11-30 20:55:24', NULL, 0.0, 0.0, 14.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255322, 3, 1, 0, 0, 0.0, 90.0, 1, 20, 30, 35528, 1522, 5, 32675, 1, '2015-11-30 20:55:24', '2015-11-30 20:55:24', NULL, 0.0, 0.0, 12.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255323, 4, 1, 0, 0, 0.0, 85.0, 0, 27, 40, 35529, 1164, 5, 32677, 1, '2015-11-30 20:55:24', '2015-11-30 20:55:24', NULL, 0.0, 0.0, 10.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255324, 4, 1, 0, 0, 0.0, 85.0, 1, 16, 50, 35523, 752, 5, 32678, 1, '2015-11-30 20:55:24', '2015-11-30 20:55:24', NULL, 0.0, 0.0, 10.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255325, 3, 1, 0, 0, 0.0, 90.0, 1, 15, 90, 35523, 12, 5, 32679, 1, '2015-11-30 20:55:24', '2015-11-30 20:55:24', NULL, 0.0, 0.0, 12.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255326, 2, 1, 0, 0, 0.0, 95.0, 1, 9, 80, 35545, 4861, 5, 32680, 1, '2015-11-30 20:55:24', '2015-11-30 20:55:24', NULL, 0.0, 0.0, 14.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255327, 4, 1, 0, 0, 0.0, 85.0, 1, 37, 0, 35539, 4841, 5, 32681, 1, '2015-11-30 20:55:24', '2015-11-30 20:55:24', NULL, 0.0, 0.0, 10.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255328, 6, 1, 0, 0, 0.0, 75.0, 0, 31, 80, 35518, 1621, 5, 32682, 1, '2015-11-30 20:55:24', '2015-11-30 20:55:24', NULL, 0.0, 0.0, 6.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255329, 3, 1, 0, 0, 0.0, 90.0, 0, 30, 20, 35535, 1564, 5, 32683, 1, '2015-11-30 20:55:25', '2015-11-30 20:55:25', NULL, 0.0, 0.0, 12.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255330, 3, 1, 0, 0, 0.0, 90.0, 0, 34, 80, 35531, 966, 5, 32684, 1, '2015-11-30 20:55:25', '2015-11-30 20:55:25', NULL, 0.0, 0.0, 12.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255331, 9, 1, 0, 0, 0.0, 60.0, 0, 28, 60, 35529, 720, 5, 32685, 1, '2015-11-30 20:55:25', '2015-11-30 20:55:25', NULL, 0.0, 0.0, 2.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255332, 4, 1, 0, 0, 0.0, 85.0, 0, 32, 20, 35512, 687, 5, 32686, 1, '2015-11-30 20:55:25', '2015-11-30 20:55:25', NULL, 0.0, 0.0, 10.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255333, 10, 1, 0, 0, 0.0, 55.0, 0, 36, 20, 35512, 1432, 5, 32688, 1, '2015-11-30 20:55:25', '2015-11-30 20:55:25', NULL, 0.0, 0.0, 2.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255334, 4, 1, 0, 0, 0.0, 85.0, 1, 37, 60, 35508, 101, 5, 32689, 1, '2015-11-30 20:55:25', '2015-11-30 20:55:25', NULL, 0.0, 0.0, 10.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255335, 4, 1, 0, 0, 0.0, 85.0, 0, 29, 0, 35551, 982, 5, 32690, 1, '2015-11-30 20:55:25', '2015-11-30 20:55:25', NULL, 0.0, 0.0, 10.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255336, 14, 1, 0, 0, 0.0, 35.0, 0, 31, 50, 35529, 276, 5, 32691, 1, '2015-11-30 20:55:26', '2015-11-30 20:55:26', NULL, 0.0, 0.0, 2.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255337, 2, 1, 0, 0, 0.0, 95.0, 1, 26, 90, 35560, 92, 5, 32692, 1, '2015-11-30 20:55:26', '2015-11-30 20:55:26', NULL, 0.0, 0.0, 14.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255338, 7, 1, 0, 0, 0.0, 70.0, 1, 16, 0, 35545, 960, 5, 32693, 1, '2015-11-30 20:55:26', '2015-11-30 20:55:26', NULL, 0.0, 0.0, 4.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255339, 6, 1, 0, 0, 0.0, 75.0, 1, 30, 10, 35561, 21008, 5, 32694, 1, '2015-11-30 20:55:26', '2015-11-30 20:55:26', NULL, 0.0, 0.0, 6.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255340, 8, 1, 0, 0, 0.0, 65.0, 0, 29, 60, 35530, 20985, 4, 32695, 1, '2015-11-30 20:55:26', '2015-11-30 20:55:26', NULL, 0.0, 0.0, 2.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255341, 2, 1, 0, 0, 0.0, 95.0, 1, 23, 90, 35541, 125, 4, 32696, 1, '2015-11-30 20:55:26', '2015-11-30 20:55:26', NULL, 0.0, 0.0, 14.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255342, 2, 1, 0, 0, 0.0, 95.0, 5, 57, 10, 35537, 712, 4, 32697, 1, '2015-11-30 20:55:26', '2015-11-30 20:55:26', NULL, 0.0, 0.0, 14.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255343, 1, 1, 0, 0, 0.0, 100.0, 1, 28, 0, 35539, 69, 4, 32698, 1, '2015-11-30 20:55:26', '2015-11-30 20:55:26', NULL, 0.0, 0.0, 16.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255344, 9, 1, 0, 0, 0.0, 60.0, 0, 30, 30, 35517, 20951, 4, 32699, 1, '2015-11-30 20:55:27', '2015-11-30 20:55:27', NULL, 0.0, 0.0, 2.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255345, 5, 1, 0, 0, 0.0, 80.0, 0, 34, 80, 35499, 120, 4, 32700, 1, '2015-11-30 20:55:27', '2015-11-30 20:55:27', NULL, 0.0, 0.0, 8.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255346, 4, 1, 0, 0, 0.0, 85.0, 0, 37, 50, 35531, 11734, 4, 32701, 1, '2015-11-30 20:55:27', '2015-11-30 20:55:27', NULL, 0.0, 0.0, 10.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255347, 17, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 35509, 4842, 4, 32703, 1, '2015-11-30 20:55:27', '2015-11-30 20:55:27', 1, 0.0, 0.0, 0.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255348, 13, 1, 0, 0, 0.0, 40.0, 0, 31, 0, 35529, 20959, 4, 32704, 1, '2015-11-30 20:55:27', '2015-11-30 20:55:27', NULL, 0.0, 0.0, 2.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255349, 14, 1, 0, 0, 0.0, 35.0, 0, 30, 60, 35509, 20967, 4, 32705, 1, '2015-11-30 20:55:27', '2015-11-30 20:55:27', NULL, 0.0, 0.0, 2.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255350, 5, 1, 0, 0, 0.0, 80.0, 0, 29, 70, 35551, 25, 4, 32706, 1, '2015-11-30 20:55:27', '2015-11-30 20:55:27', NULL, 0.0, 0.0, 8.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255351, 8, 1, 0, 0, 0.0, 65.0, 0, 28, 50, 35509, 21039, 4, 32707, 1, '2015-11-30 20:55:28', '2015-11-30 20:55:28', NULL, 0.0, 0.0, 2.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255352, 9, 1, 0, 0, 0.0, 60.0, 1, 20, 50, 35502, 125, 4, 32696, 1, '2015-11-30 20:55:28', '2015-11-30 20:55:28', NULL, 0.0, 0.0, 2.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255353, 5, 1, 0, 0, 0.0, 80.0, 1, 22, 90, 35547, 712, 4, 32697, 1, '2015-11-30 20:55:28', '2015-11-30 20:55:28', NULL, 0.0, 0.0, 8.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255354, 8, 1, 0, 0, 0.0, 65.0, 1, 23, 50, 35523, 69, 4, 32698, 1, '2015-11-30 20:55:28', '2015-11-30 20:55:28', NULL, 0.0, 0.0, 2.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255355, 8, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 35519, 4842, 4, 32703, 1, '2015-11-30 20:55:28', '2015-11-30 20:55:28', 1, 0.0, 0.0, 0.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255356, 5, 1, 0, 0, 0.0, 80.0, 1, 29, 30, 35561, 20959, 4, 32704, 1, '2015-11-30 20:55:28', '2015-11-30 20:55:28', NULL, 0.0, 0.0, 8.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255357, 1, 1, 0, 0, 0.0, 100.0, 1, 22, 70, 35559, 25, 4, 32706, 1, '2015-11-30 20:55:28', '2015-11-30 20:55:28', NULL, 0.0, 0.0, 16.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255358, 7, 1, 0, 0, 0.0, 70.0, 1, 13, 20, 35519, 21039, 4, 32707, 1, '2015-11-30 20:55:28', '2015-11-30 20:55:28', NULL, 0.0, 0.0, 4.0, 1586);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255359, 1, 1, 0, 0, 0.0, 100.0, 0, 26, 70, 35551, 803, 5, 32708, 1, '2015-11-30 20:55:29', '2015-11-30 20:55:29', NULL, 0.0, 0.0, 16.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255360, 1, 1, 0, 0, 0.0, 100.0, 1, 8, 40, 35547, 803, 5, 32708, 1, '2015-11-30 20:55:29', '2015-11-30 20:55:29', NULL, 0.0, 0.0, 16.0, 1593);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255361, 8, 1, 0, 0, 0.0, 65.0, 6, 27, 50, 35510, 11732, 35, 32709, 1, '2015-11-30 20:55:29', '2015-11-30 20:55:29', NULL, 0.0, 0.0, 2.0, 1584);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255362, 4, 1, 0, 0, 0.0, 85.0, 1, 26, 50, 35561, 1409, 35, 32710, 1, '2015-11-30 20:55:29', '2015-11-30 20:55:29', NULL, 0.0, 0.0, 10.0, 1584);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255363, 7, 1, 0, 0, 0.0, 70.0, 1, 35, 0, 35561, 1461, 35, 32711, 1, '2015-11-30 20:55:29', '2015-11-30 20:55:29', NULL, 0.0, 0.0, 4.0, 1584);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255364, 15, 1, 0, 0, 0.0, 30.0, 0, 38, 0, 35512, 11732, 35, 32709, 1, '2015-11-30 20:55:29', '2015-11-30 20:55:29', NULL, 0.0, 0.0, 2.0, 1584);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255365, 12, 1, 0, 0, 0.0, 45.0, 0, 30, 20, 35529, 1409, 35, 32710, 1, '2015-11-30 20:55:30', '2015-11-30 20:55:30', NULL, 0.0, 0.0, 2.0, 1584);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255366, 16, 1, 0, 0, 0.0, 25.0, 0, 31, 90, 35529, 1461, 35, 32711, 1, '2015-11-30 20:55:30', '2015-11-30 20:55:30', NULL, 0.0, 0.0, 2.0, 1584);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255367, 3, 1, 0, 0, 0.0, 90.0, 0, 25, 80, 35509, 1531, 32, 32712, 1, '2015-11-30 20:55:30', '2015-11-30 20:55:30', NULL, 0.0, 0.0, 12.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255368, 3, 1, 0, 0, 0.0, 90.0, 4, 48, 40, 35506, 1308, 32, 32713, 1, '2015-11-30 20:55:30', '2015-11-30 20:55:30', NULL, 0.0, 0.0, 12.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255369, 3, 1, 0, 0, 0.0, 90.0, 8, 0, 70, 35562, 1363, 32, 32714, 1, '2015-11-30 20:55:30', '2015-11-30 20:55:30', NULL, 0.0, 0.0, 12.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255370, 2, 1, 0, 0, 0.0, 95.0, 1, 48, 60, 35540, 1305, 32, 32715, 1, '2015-11-30 20:55:30', '2015-11-30 20:55:30', NULL, 0.0, 0.0, 14.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255371, 7, 1, 0, 0, 0.0, 70.0, 1, 36, 70, 35552, 1270, 32, 32716, 1, '2015-11-30 20:55:30', '2015-11-30 20:55:30', NULL, 0.0, 0.0, 4.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255372, 8, 1, 0, 0, 0.0, 65.0, 1, 37, 60, 35552, 1269, 32, 32717, 1, '2015-11-30 20:55:30', '2015-11-30 20:55:30', NULL, 0.0, 0.0, 2.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255373, 1, 1, 0, 0, 0.0, 100.0, 4, 38, 40, 35507, 1241, 32, 32718, 1, '2015-11-30 20:55:31', '2015-11-30 20:55:31', NULL, 0.0, 0.0, 16.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255374, 3, 1, 0, 0, 0.0, 90.0, 4, 51, 0, 35507, 1240, 32, 32719, 1, '2015-11-30 20:55:31', '2015-11-30 20:55:31', NULL, 0.0, 0.0, 12.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255375, 5, 1, 0, 0, 0.0, 80.0, 0, 27, 60, 35529, 1187, 32, 32720, 1, '2015-11-30 20:55:31', '2015-11-30 20:55:31', NULL, 0.0, 0.0, 8.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255376, 5, 1, 0, 0, 0.0, 80.0, 4, 52, 0, 35507, 1612, 32, 32721, 1, '2015-11-30 20:55:31', '2015-11-30 20:55:31', NULL, 0.0, 0.0, 8.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255377, 5, 1, 0, 0, 0.0, 80.0, 5, 3, 50, 35506, 1531, 32, 32712, 1, '2015-11-30 20:55:31', '2015-11-30 20:55:31', NULL, 0.0, 0.0, 8.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255378, 5, 1, 0, 0, 0.0, 80.0, 1, 11, 60, 35519, 1308, 32, 32713, 1, '2015-11-30 20:55:31', '2015-11-30 20:55:31', NULL, 0.0, 0.0, 8.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255379, 3, 1, 0, 0, 0.0, 90.0, 0, 47, 0, 35549, 1363, 32, 32714, 1, '2015-11-30 20:55:31', '2015-11-30 20:55:31', NULL, 0.0, 0.0, 12.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255380, 2, 1, 0, 0, 0.0, 95.0, 7, 15, 0, 35562, 1305, 32, 32715, 1, '2015-11-30 20:55:32', '2015-11-30 20:55:32', NULL, 0.0, 0.0, 14.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255381, 6, 1, 0, 0, 0.0, 75.0, 0, 31, 20, 35546, 1270, 32, 32716, 1, '2015-11-30 20:55:32', '2015-11-30 20:55:32', NULL, 0.0, 0.0, 6.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255382, 4, 1, 0, 0, 0.0, 85.0, 0, 29, 10, 35546, 1269, 32, 32717, 1, '2015-11-30 20:55:32', '2015-11-30 20:55:32', NULL, 0.0, 0.0, 10.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255383, 10, 1, 0, 0, 0.0, 55.0, 0, 29, 90, 35529, 1241, 32, 32718, 1, '2015-11-30 20:55:32', '2015-11-30 20:55:32', NULL, 0.0, 0.0, 2.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255384, 10, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 35529, 1240, 32, 32719, 1, '2015-11-30 20:55:32', '2015-11-30 20:55:32', 1, 0.0, 0.0, 0.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255385, 6, 1, 0, 0, 0.0, 75.0, 1, 15, 40, 35504, 1187, 32, 32720, 1, '2015-11-30 20:55:32', '2015-11-30 20:55:32', NULL, 0.0, 0.0, 6.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255386, 4, 1, 0, 0, 0.0, 85.0, 1, 13, 50, 35504, 1612, 32, 32721, 1, '2015-11-30 20:55:32', '2015-11-30 20:55:32', NULL, 0.0, 0.0, 10.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255387, 3, 1, 0, 0, 0.0, 90.0, 1, 14, 80, 35547, 18952, 17, 32724, 1, '2015-11-30 20:55:32', '2015-11-30 20:55:32', NULL, 0.0, 0.0, 12.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255388, 1, 1, 0, 0, 0.0, 100.0, 5, 7, 50, 35520, 1392, 17, 32726, 1, '2015-11-30 20:55:33', '2015-11-30 20:55:33', NULL, 0.0, 0.0, 16.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255389, 3, 1, 0, 0, 0.0, 90.0, 5, 7, 20, 35536, 1426, 17, 32727, 1, '2015-11-30 20:55:33', '2015-11-30 20:55:33', NULL, 0.0, 0.0, 12.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255390, 1, 1, 0, 0, 0.0, 100.0, 1, 25, 70, 35564, 1535, 17, 32728, 1, '2015-11-30 20:55:33', '2015-11-30 20:55:33', NULL, 0.0, 0.0, 16.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255391, 1, 1, 0, 0, 0.0, 100.0, 5, 4, 50, 35510, 11733, 17, 32729, 1, '2015-11-30 20:55:33', '2015-11-30 20:55:33', NULL, 0.0, 0.0, 16.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255392, 6, 1, 0, 0, 0.0, 75.0, 1, 31, 0, 35532, 20997, 17, 32730, 1, '2015-11-30 20:55:33', '2015-11-30 20:55:33', NULL, 0.0, 0.0, 6.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255393, 1, 1, 0, 0, 0.0, 100.0, 2, 18, 60, 35565, 1414, 17, 32731, 1, '2015-11-30 20:55:33', '2015-11-30 20:55:33', NULL, 0.0, 0.0, 16.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255394, 3, 1, 0, 0, 0.0, 90.0, 1, 32, 50, 35559, 772, 17, 32732, 1, '2015-11-30 20:55:33', '2015-11-30 20:55:33', NULL, 0.0, 0.0, 12.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255395, 5, 1, 0, 0, 0.0, 80.0, 1, 21, 70, 35497, 20983, 17, 32733, 1, '2015-11-30 20:55:33', '2015-11-30 20:55:33', NULL, 0.0, 0.0, 8.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255396, 1, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 35533, 20984, 17, 32734, 1, '2015-11-30 20:55:34', '2015-11-30 20:55:34', 1, 0.0, 0.0, 0.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255397, 4, 1, 0, 0, 0.0, 85.0, 1, 24, 80, 35525, 1813, 17, 32735, 1, '2015-11-30 20:55:34', '2015-11-30 20:55:34', NULL, 0.0, 0.0, 10.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255398, 4, 1, 0, 0, 0.0, 85.0, 6, 26, 80, 35553, 1088, 17, 32737, 1, '2015-11-30 20:55:34', '2015-11-30 20:55:34', NULL, 0.0, 0.0, 10.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255399, 1, 1, 0, 0, 0.0, 100.0, 1, 38, 10, 35522, 1455, 17, 32738, 1, '2015-11-30 20:55:34', '2015-11-30 20:55:34', NULL, 0.0, 0.0, 16.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255400, 8, 1, 0, 0, 0.0, 65.0, 5, 44, 60, 35543, 754, 17, 32739, 1, '2015-11-30 20:55:34', '2015-11-30 20:55:34', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255401, 5, 1, 0, 0, 0.0, 80.0, 5, 35, 50, 35543, 1436, 17, 32741, 1, '2015-11-30 20:55:34', '2015-11-30 20:55:34', NULL, 0.0, 0.0, 8.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255402, 4, 1, 0, 0, 0.0, 85.0, 5, 22, 40, 35543, 951, 17, 32742, 1, '2015-11-30 20:55:34', '2015-11-30 20:55:34', NULL, 0.0, 0.0, 10.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255403, 2, 1, 0, 0, 0.0, 95.0, 1, 32, 60, 35533, 20998, 17, 32743, 1, '2015-11-30 20:55:35', '2015-11-30 20:55:35', NULL, 0.0, 0.0, 14.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255404, 4, 1, 0, 0, 0.0, 85.0, 5, 51, 40, 35510, 1135, 17, 32744, 1, '2015-11-30 20:55:35', '2015-11-30 20:55:35', NULL, 0.0, 0.0, 10.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255405, 5, 1, 0, 0, 0.0, 80.0, 1, 34, 90, 35559, 1117, 17, 32745, 1, '2015-11-30 20:55:35', '2015-11-30 20:55:35', NULL, 0.0, 0.0, 8.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255406, 8, 1, 0, 0, 0.0, 65.0, 8, 6, 10, 35511, 601, 17, 32746, 1, '2015-11-30 20:55:35', '2015-11-30 20:55:35', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255407, 1, 1, 0, 0, 0.0, 100.0, 1, 16, 30, 35561, 1060, 17, 32747, 1, '2015-11-30 20:55:35', '2015-11-30 20:55:35', NULL, 0.0, 0.0, 16.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255408, 4, 1, 0, 0, 0.0, 85.0, 6, 27, 50, 35537, 590, 17, 32748, 1, '2015-11-30 20:55:35', '2015-11-30 20:55:35', NULL, 0.0, 0.0, 10.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255409, 10, 1, 0, 0, 0.0, 55.0, 1, 49, 80, 35552, 1318, 17, 32749, 1, '2015-11-30 20:55:35', '2015-11-30 20:55:35', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255410, 1, 1, 0, 0, 0.0, 100.0, 1, 2, 80, 35545, 1448, 17, 32750, 1, '2015-11-30 20:55:35', '2015-11-30 20:55:35', NULL, 0.0, 0.0, 16.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255411, 7, 1, 0, 0, 0.0, 70.0, 5, 41, 80, 35507, 867, 17, 32752, 1, '2015-11-30 20:55:36', '2015-11-30 20:55:36', NULL, 0.0, 0.0, 4.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255412, 6, 1, 0, 0, 0.0, 75.0, 6, 48, 40, 35511, 580, 17, 32754, 1, '2015-11-30 20:55:36', '2015-11-30 20:55:36', NULL, 0.0, 0.0, 6.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255413, 10, 1, 0, 0, 0.0, 55.0, 1, 27, 90, 35497, 21024, 17, 32755, 1, '2015-11-30 20:55:36', '2015-11-30 20:55:36', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255414, 11, 1, 0, 0, 0.0, 50.0, 1, 32, 20, 35497, 1639, 17, 32756, 1, '2015-11-30 20:55:36', '2015-11-30 20:55:36', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255415, 7, 1, 0, 0, 0.0, 70.0, 6, 49, 30, 35511, 602, 17, 32758, 1, '2015-11-30 20:55:36', '2015-11-30 20:55:36', NULL, 0.0, 0.0, 4.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255416, 10, 1, 0, 0, 0.0, 55.0, 1, 19, 0, 35519, 1721, 17, 32759, 1, '2015-11-30 20:55:36', '2015-11-30 20:55:36', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255417, 1, 1, 0, 0, 0.0, 100.0, 1, 16, 30, 35561, 1102, 17, 32760, 1, '2015-11-30 20:55:36', '2015-11-30 20:55:36', NULL, 0.0, 0.0, 16.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255418, 9, 1, 0, 0, 0.0, 60.0, 1, 27, 30, 35497, 21035, 17, 32761, 1, '2015-11-30 20:55:37', '2015-11-30 20:55:37', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255419, 5, 1, 0, 0, 0.0, 80.0, 1, 31, 40, 35552, 1116, 17, 32762, 1, '2015-11-30 20:55:37', '2015-11-30 20:55:37', NULL, 0.0, 0.0, 8.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255420, 10, 1, 0, 0, 0.0, 55.0, 1, 29, 60, 35523, 1766, 17, 32763, 1, '2015-11-30 20:55:37', '2015-11-30 20:55:37', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255421, 2, 1, 0, 0, 0.0, 95.0, 0, 27, 60, 35551, 18952, 17, 32724, 1, '2015-11-30 20:55:37', '2015-11-30 20:55:37', NULL, 0.0, 0.0, 14.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255422, 3, 1, 0, 0, 0.0, 90.0, 1, 24, 20, 35541, 1392, 17, 32726, 1, '2015-11-30 20:55:37', '2015-11-30 20:55:37', NULL, 0.0, 0.0, 12.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255423, 2, 1, 0, 0, 0.0, 95.0, 1, 21, 80, 35552, 1426, 17, 32727, 1, '2015-11-30 20:55:37', '2015-11-30 20:55:37', NULL, 0.0, 0.0, 14.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255424, 2, 1, 0, 0, 0.0, 95.0, 1, 18, 70, 35528, 1535, 17, 32728, 1, '2015-11-30 20:55:37', '2015-11-30 20:55:37', NULL, 0.0, 0.0, 14.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255425, 2, 1, 0, 0, 0.0, 95.0, 0, 30, 70, 35512, 11733, 17, 32729, 1, '2015-11-30 20:55:37', '2015-11-30 20:55:37', NULL, 0.0, 0.0, 14.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255426, 9, 1, 0, 0, 0.0, 60.0, 0, 36, 0, 35512, 20997, 17, 32730, 1, '2015-11-30 20:55:38', '2015-11-30 20:55:38', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255427, 1, 1, 0, 0, 0.0, 100.0, 0, 53, 60, 35566, 1414, 17, 32731, 1, '2015-11-30 20:55:38', '2015-11-30 20:55:38', NULL, 0.0, 0.0, 16.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255428, 9, 1, 0, 0, 0.0, 60.0, 0, 33, 80, 35551, 772, 17, 32732, 1, '2015-11-30 20:55:38', '2015-11-30 20:55:38', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255429, 5, 1, 0, 0, 0.0, 80.0, 0, 31, 60, 35518, 20983, 17, 32733, 1, '2015-11-30 20:55:38', '2015-11-30 20:55:38', NULL, 0.0, 0.0, 8.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255430, 15, 1, 0, 0, 0.0, 30.0, 0, 37, 40, 35518, 20984, 17, 32734, 1, '2015-11-30 20:55:38', '2015-11-30 20:55:38', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255431, 10, 1, 0, 0, 0.0, 55.0, 0, 29, 30, 35509, 1813, 17, 32735, 1, '2015-11-30 20:55:38', '2015-11-30 20:55:38', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255432, 4, 1, 0, 0, 0.0, 85.0, 1, 33, 90, 35544, 1088, 17, 32737, 1, '2015-11-30 20:55:38', '2015-11-30 20:55:38', NULL, 0.0, 0.0, 10.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255433, 7, 1, 0, 0, 0.0, 70.0, 0, 31, 70, 35535, 754, 17, 32739, 1, '2015-11-30 20:55:39', '2015-11-30 20:55:39', NULL, 0.0, 0.0, 4.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255434, 2, 1, 0, 0, 0.0, 95.0, 0, 29, 90, 35535, 1436, 17, 32741, 1, '2015-11-30 20:55:39', '2015-11-30 20:55:39', NULL, 0.0, 0.0, 14.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255435, 6, 1, 0, 0, 0.0, 75.0, 1, 18, 0, 35523, 951, 17, 32742, 1, '2015-11-30 20:55:39', '2015-11-30 20:55:39', NULL, 0.0, 0.0, 6.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255436, 9, 1, 0, 0, 0.0, 60.0, 0, 34, 30, 35518, 20998, 17, 32743, 1, '2015-11-30 20:55:39', '2015-11-30 20:55:39', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255437, 3, 1, 0, 0, 0.0, 90.0, 1, 24, 40, 35532, 1135, 17, 32744, 1, '2015-11-30 20:55:39', '2015-11-30 20:55:39', NULL, 0.0, 0.0, 12.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255438, 8, 1, 0, 0, 0.0, 65.0, 1, 30, 20, 35547, 1117, 17, 32745, 1, '2015-11-30 20:55:39', '2015-11-30 20:55:39', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255439, 7, 1, 0, 0, 0.0, 70.0, 0, 40, 50, 35531, 601, 17, 32746, 1, '2015-11-30 20:55:39', '2015-11-30 20:55:39', NULL, 0.0, 0.0, 4.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255440, 3, 1, 0, 0, 0.0, 90.0, 1, 12, 80, 35504, 1060, 17, 32747, 1, '2015-11-30 20:55:40', '2015-11-30 20:55:40', NULL, 0.0, 0.0, 12.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255441, 9, 1, 0, 0, 0.0, 60.0, 1, 30, 30, 35547, 590, 17, 32748, 1, '2015-11-30 20:55:40', '2015-11-30 20:55:40', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255442, 7, 1, 0, 0, 0.0, 70.0, 1, 41, 40, 35557, 1318, 17, 32749, 1, '2015-11-30 20:55:40', '2015-11-30 20:55:40', NULL, 0.0, 0.0, 4.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255443, 1, 1, 0, 0, 0.0, 100.0, 0, 24, 40, 35530, 1448, 17, 32750, 1, '2015-11-30 20:55:40', '2015-11-30 20:55:40', NULL, 0.0, 0.0, 16.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255444, 15, 1, 0, 0, 0.0, 30.0, 0, 31, 60, 35529, 867, 17, 32752, 1, '2015-11-30 20:55:40', '2015-11-30 20:55:40', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255445, 4, 1, 0, 0, 0.0, 85.0, 1, 38, 0, 35560, 580, 17, 32754, 1, '2015-11-30 20:55:40', '2015-11-30 20:55:40', NULL, 0.0, 0.0, 10.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255446, 10, 1, 0, 0, 0.0, 55.0, 0, 34, 40, 35518, 21024, 17, 32755, 1, '2015-11-30 20:55:40', '2015-11-30 20:55:40', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255447, 13, 1, 0, 0, 0.0, 40.0, 0, 36, 40, 35518, 1639, 17, 32756, 1, '2015-11-30 20:55:40', '2015-11-30 20:55:40', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255448, 4, 1, 0, 0, 0.0, 85.0, 0, 34, 20, 35499, 993, 17, 32757, 1, '2015-11-30 20:55:41', '2015-11-30 20:55:41', NULL, 0.0, 0.0, 10.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255449, 6, 1, 0, 0, 0.0, 75.0, 0, 39, 70, 35531, 602, 17, 32758, 1, '2015-11-30 20:55:41', '2015-11-30 20:55:41', NULL, 0.0, 0.0, 6.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255450, 13, 1, 0, 0, 0.0, 40.0, 0, 30, 50, 35509, 1721, 17, 32759, 1, '2015-11-30 20:55:41', '2015-11-30 20:55:41', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255451, 1, 1, 0, 0, 0.0, 100.0, 1, 6, 90, 35504, 1102, 17, 32760, 1, '2015-11-30 20:55:41', '2015-11-30 20:55:41', NULL, 0.0, 0.0, 16.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255452, 8, 1, 0, 0, 0.0, 65.0, 0, 33, 60, 35518, 21035, 17, 32761, 1, '2015-11-30 20:55:41', '2015-11-30 20:55:41', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255453, 4, 1, 0, 0, 0.0, 85.0, 1, 23, 60, 35557, 1116, 17, 32762, 1, '2015-11-30 20:55:41', '2015-11-30 20:55:41', NULL, 0.0, 0.0, 10.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255454, 9, 1, 0, 0, 0.0, 60.0, 0, 33, 70, 35535, 1766, 17, 32763, 1, '2015-11-30 20:55:42', '2015-11-30 20:55:42', NULL, 0.0, 0.0, 2.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255455, 3, 1, 0, 0, 0.0, 90.0, 1, 58, 50, 35540, 5879, 827, 32765, 1, '2015-11-30 20:55:42', '2015-11-30 20:55:42', NULL, 0.0, 0.0, 12.0, 1595);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255456, 3, 1, 0, 0, 0.0, 90.0, 2, 0, 40, 35563, 5879, 827, 32765, 1, '2015-11-30 20:55:42', '2015-11-30 20:55:42', NULL, 0.0, 0.0, 12.0, 1595);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255457, 16, 1, 0, 0, 0.0, 25.0, 0, 38, 30, 35512, 21046, 290, 32767, 1, '2015-11-30 20:55:42', '2015-11-30 20:55:42', NULL, 0.0, 0.0, 2.0, 1596);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255458, 13, 1, 0, 0, 0.0, 40.0, 0, 33, 10, 35530, 21047, 290, 32768, 1, '2015-11-30 20:55:42', '2015-11-30 20:55:42', NULL, 0.0, 0.0, 2.0, 1596);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255459, 1, 1, 0, 0, 0.0, 100.0, 1, 25, 50, 35526, 4853, 290, 32769, 1, '2015-11-30 20:55:42', '2015-11-30 20:55:42', NULL, 0.0, 0.0, 16.0, 1596);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255460, 1, 1, 0, 0, 0.0, 100.0, 1, 32, 20, 35513, 4853, 290, 32769, 1, '2015-11-30 20:55:42', '2015-11-30 20:55:42', NULL, 0.0, 0.0, 16.0, 1596);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255461, 11, 1, 0, 0, 0.0, 50.0, 7, 37, 30, 35510, 21046, 290, 32767, 1, '2015-11-30 20:55:42', '2015-11-30 20:55:42', NULL, 0.0, 0.0, 2.0, 1596);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255462, 7, 1, 0, 0, 0.0, 70.0, 6, 40, 10, 35505, 21047, 290, 32768, 1, '2015-11-30 20:55:43', '2015-11-30 20:55:43', NULL, 0.0, 0.0, 4.0, 1596);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255463, 5, 1, 0, 0, 0.0, 80.0, 0, 39, 80, 35521, 468, 1, 32770, 1, '2015-11-30 20:55:43', '2015-11-30 20:55:43', NULL, 0.0, 0.0, 8.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255464, 5, 1, 0, 0, 0.0, 80.0, 1, 42, 40, 35508, 468, 1, 32770, 1, '2015-11-30 20:55:43', '2015-11-30 20:55:43', NULL, 0.0, 0.0, 8.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255465, 4, 1, 0, 0, 0.0, 85.0, 1, 18, 20, 35547, 108, 1, 32771, 1, '2015-11-30 20:55:43', '2015-11-30 20:55:43', NULL, 0.0, 0.0, 10.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255466, 6, 1, 0, 0, 0.0, 75.0, 0, 29, 90, 35551, 108, 1, 32771, 1, '2015-11-30 20:55:43', '2015-11-30 20:55:43', NULL, 0.0, 0.0, 6.0, 1589);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255467, 1, 1, 0, 0, 0.0, 100.0, 1, 13, 50, 35557, 4019, 17, 32772, 1, '2015-11-30 20:55:43', '2015-11-30 20:55:43', NULL, 0.0, 0.0, 16.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255468, 1, 1, 0, 0, 0.0, 100.0, 0, 26, 80, 35546, 4019, 17, 32772, 1, '2015-11-30 20:55:43', '2015-11-30 20:55:43', NULL, 0.0, 0.0, 16.0, 1591);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255469, 1, 1, 0, 0, 0.0, 100.0, 1, 16, 50, 35555, 1495, 32, 32773, 1, '2015-11-30 20:55:44', '2015-11-30 20:55:44', NULL, 0.0, 0.0, 16.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255470, 1, 1, 0, 0, 0.0, 100.0, 0, 29, 50, 35548, 1495, 32, 32773, 1, '2015-11-30 20:55:44', '2015-11-30 20:55:44', NULL, 0.0, 0.0, 16.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255471, 1, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 35545, 1533, 32, 32774, 1, '2015-11-30 20:55:44', '2015-11-30 20:55:44', 1, 0.0, 0.0, 0.0, 1590);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (255472, 5, 1, 0, 0, 0.0, 80.0, 0, 27, 50, 35530, 1533, 32, 32774, 1, '2015-11-30 20:55:44', '2015-11-30 20:55:44', NULL, 0.0, 0.0, 8.0, 1590);


-- Meeting 15101
-- 'Results acquired' flag setting:
UPDATE meetings SET are_results_acquired = '1' WHERE id = 15101;


-- Meeting 15101
-- 'has_start_list' flag setting:
UPDATE meetings SET has_start_list = '1' WHERE id = 15101;

-- --- BeginTimeCalculator: compute_for_all( 15101 )
-- ----------------------------------------------------
-- Using RESULTS to compute heat length.

-- Event #1, M.Prg: 35497, tot. athletes: 11
-- Tot. progr. duration: 291 (sec), Heat durations: [15220, 13910] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 35497;

-- Event #1, M.Prg: 35519, tot. athletes: 13
-- Tot. progr. duration: 302 (sec), Heat durations: [17080, 13140] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:06:51 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:06' WHERE id = 35519;

-- Event #2, M.Prg: 35498, tot. athletes: 6
-- Tot. progr. duration: 168 (sec), Heat durations: [16820] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:11:53 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:11' WHERE id = 35498;

-- Event #2, M.Prg: 35558, tot. athletes: 4
-- Tot. progr. duration: 157 (sec), Heat durations: [15700] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:14:41 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:14' WHERE id = 35558;

-- Event #3, M.Prg: 35499, tot. athletes: 6
-- Tot. progr. duration: 102 (sec), Heat durations: [10280] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:17:18 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:17' WHERE id = 35499;

-- Event #3, M.Prg: 35529, tot. athletes: 19
-- Tot. progr. duration: 287 (sec), Heat durations: [11030, 8990, 8710] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:19:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:19' WHERE id = 35529;

-- Event #4, M.Prg: 35500, tot. athletes: 6
-- Tot. progr. duration: 181 (sec), Heat durations: [18170] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:23:47 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:23' WHERE id = 35500;

-- Event #4, M.Prg: 35539, tot. athletes: 5
-- Tot. progr. duration: 158 (sec), Heat durations: [15890] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:26:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:26' WHERE id = 35539;

-- Event #5, M.Prg: 35501, tot. athletes: 2
-- Tot. progr. duration: 164 (sec), Heat durations: [16420] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:29:26 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:29' WHERE id = 35501;

-- Event #5, M.Prg: 35552, tot. athletes: 11
-- Tot. progr. duration: 316 (sec), Heat durations: [16980, 14670] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:32:10 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:32' WHERE id = 35552;

-- Event #6, M.Prg: 35560, tot. athletes: 5
-- Tot. progr. duration: 158 (sec), Heat durations: [15860] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:37:26 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:37' WHERE id = 35560;

-- Event #6, M.Prg: 35502, tot. athletes: 11
-- Tot. progr. duration: 291 (sec), Heat durations: [15710, 13460] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:40:04 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:40' WHERE id = 35502;

-- Event #7, M.Prg: 35503, tot. athletes: 8
-- Tot. progr. duration: 514 (sec), Heat durations: [51490] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:44:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:44' WHERE id = 35503;

-- Event #7, M.Prg: 35543, tot. athletes: 13
-- Tot. progr. duration: 887 (sec), Heat durations: [49190, 39550] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:53:29 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:53' WHERE id = 35543;

-- Event #8, M.Prg: 35504, tot. athletes: 13
-- Tot. progr. duration: 329 (sec), Heat durations: [19560, 13400] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:08:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:08' WHERE id = 35504;

-- Event #8, M.Prg: 35528, tot. athletes: 3
-- Tot. progr. duration: 140 (sec), Heat durations: [14030] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:13:45 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:13' WHERE id = 35528;

-- Event #9, M.Prg: 35510, tot. athletes: 11
-- Tot. progr. duration: 916 (sec), Heat durations: [51730, 39870] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:16:05 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:16' WHERE id = 35510;

-- Event #9, M.Prg: 35505, tot. athletes: 7
-- Tot. progr. duration: 460 (sec), Heat durations: [46010] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:31:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:31' WHERE id = 35505;

-- Event #10, M.Prg: 35506, tot. athletes: 8
-- Tot. progr. duration: 415 (sec), Heat durations: [41560] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:39:01 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:39' WHERE id = 35506;

-- Event #10, M.Prg: 35516, tot. athletes: 4
-- Tot. progr. duration: 402 (sec), Heat durations: [40270] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:45:56 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:45' WHERE id = 35516;

-- Event #11, M.Prg: 35507, tot. athletes: 7
-- Tot. progr. duration: 401 (sec), Heat durations: [40180] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:52:38 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:52' WHERE id = 35507;

-- Event #11, M.Prg: 35542, tot. athletes: 2
-- Tot. progr. duration: 488 (sec), Heat durations: [48800] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:59:19 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:59' WHERE id = 35542;

-- Event #12, M.Prg: 35523, tot. athletes: 11
-- Tot. progr. duration: 322 (sec), Heat durations: [18680, 13590] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:07:27 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:07' WHERE id = 35523;

-- Event #12, M.Prg: 35508, tot. athletes: 6
-- Tot. progr. duration: 164 (sec), Heat durations: [16490] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:12:49 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:12' WHERE id = 35508;

-- Event #13, M.Prg: 35509, tot. athletes: 18
-- Tot. progr. duration: 272 (sec), Heat durations: [9940, 8860, 8480] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:15:33 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:15' WHERE id = 35509;

-- Event #13, M.Prg: 35518, tot. athletes: 15
-- Tot. progr. duration: 190 (sec), Heat durations: [9740, 9280] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:20:05 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:20' WHERE id = 35518;

-- Event #14, M.Prg: 35520, tot. athletes: 6
-- Tot. progr. duration: 463 (sec), Heat durations: [46380] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:23:15 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:23' WHERE id = 35520;

-- Event #14, M.Prg: 35511, tot. athletes: 9
-- Tot. progr. duration: 1142 (sec), Heat durations: [73020, 41210] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:30:58 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:30' WHERE id = 35511;

-- Event #15, M.Prg: 35530, tot. athletes: 14
-- Tot. progr. duration: 181 (sec), Heat durations: [9350, 8790] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:50:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:50' WHERE id = 35530;

-- Event #15, M.Prg: 35512, tot. athletes: 16
-- Tot. progr. duration: 193 (sec), Heat durations: [9830, 9540] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:53:01 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:53' WHERE id = 35512;

-- Event #16, M.Prg: 35513, tot. athletes: 3
-- Tot. progr. duration: 205 (sec), Heat durations: [20510] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:56:14 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:56' WHERE id = 35513;

-- Event #16, M.Prg: 35515, tot. athletes: 2
-- Tot. progr. duration: 152 (sec), Heat durations: [15200] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:59:39 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:59' WHERE id = 35515;

-- Event #17, M.Prg: 35514, tot. athletes: 6
-- Tot. progr. duration: 106 (sec), Heat durations: [10670] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:02:11 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:02' WHERE id = 35514;

-- Event #17, M.Prg: 35524, tot. athletes: 6
-- Tot. progr. duration: 113 (sec), Heat durations: [11350] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:03:57 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:03' WHERE id = 35524;

-- Event #18, M.Prg: 35517, tot. athletes: 17
-- Tot. progr. duration: 247 (sec), Heat durations: [9710, 8990, 6000] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:05:50 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:05' WHERE id = 35517;

-- Event #18, M.Prg: 35531, tot. athletes: 9
-- Tot. progr. duration: 196 (sec), Heat durations: [10560, 9080] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:09:57 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:09' WHERE id = 35531;

-- Event #19, M.Prg: 35535, tot. athletes: 13
-- Tot. progr. duration: 201 (sec), Heat durations: [11040, 9070] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:13:13 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:13' WHERE id = 35535;

-- Event #19, M.Prg: 35521, tot. athletes: 8
-- Tot. progr. duration: 161 (sec), Heat durations: [16170] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:16:34 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:16' WHERE id = 35521;

-- Event #20, M.Prg: 35541, tot. athletes: 7
-- Tot. progr. duration: 161 (sec), Heat durations: [16170] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:19:15 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:19' WHERE id = 35541;

-- Event #20, M.Prg: 35522, tot. athletes: 4
-- Tot. progr. duration: 242 (sec), Heat durations: [24230] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:21:56 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:21' WHERE id = 35522;

-- Event #21, M.Prg: 35525, tot. athletes: 8
-- Tot. progr. duration: 174 (sec), Heat durations: [17410] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:25:58 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:25' WHERE id = 35525;

-- Event #21, M.Prg: 35533, tot. athletes: 6
-- Tot. progr. duration: 193 (sec), Heat durations: [19370] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:28:52 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:28' WHERE id = 35533;

-- Event #22, M.Prg: 35534, tot. athletes: 3
-- Tot. progr. duration: 186 (sec), Heat durations: [18680] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:32:05 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:32' WHERE id = 35534;

-- Event #22, M.Prg: 35526, tot. athletes: 2
-- Tot. progr. duration: 171 (sec), Heat durations: [17140] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:35:11 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:35' WHERE id = 35526;

-- Event #23, M.Prg: 35556, tot. athletes: 1
-- Tot. progr. duration: 380 (sec), Heat durations: [38030] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:38:02 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:38' WHERE id = 35556;

-- Event #23, M.Prg: 35527, tot. athletes: 4
-- Tot. progr. duration: 494 (sec), Heat durations: [49480] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:44:22 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:44' WHERE id = 35527;

-- Event #24, M.Prg: 35532, tot. athletes: 9
-- Tot. progr. duration: 308 (sec), Heat durations: [16530, 14310] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:52:36 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:52' WHERE id = 35532;

-- Event #24, M.Prg: 35545, tot. athletes: 9
-- Tot. progr. duration: 202 (sec), Heat durations: [14230, 6000] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:57:44 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:57' WHERE id = 35545;

-- Event #25, M.Prg: 35536, tot. athletes: 8
-- Tot. progr. duration: 440 (sec), Heat durations: [44010] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:01:06 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:01' WHERE id = 35536;

-- Event #25, M.Prg: 35553, tot. athletes: 5
-- Tot. progr. duration: 463 (sec), Heat durations: [46300] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:08:26 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:08' WHERE id = 35553;

-- Event #26, M.Prg: 35562, tot. athletes: 3
-- Tot. progr. duration: 540 (sec), Heat durations: [54070] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:16:09 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:16' WHERE id = 35562;

-- Event #26, M.Prg: 35537, tot. athletes: 4
-- Tot. progr. duration: 447 (sec), Heat durations: [44750] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:25:09 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:25' WHERE id = 35537;

-- Event #27, M.Prg: 35538, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:32:36 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:32' WHERE id = 35538;

-- Event #27, M.Prg: 35565, tot. athletes: 1
-- Tot. progr. duration: 198 (sec), Heat durations: [19860] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:32:36 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:32' WHERE id = 35565;

-- Event #28, M.Prg: 35547, tot. athletes: 9
-- Tot. progr. duration: 278 (sec), Heat durations: [15030, 12840] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:35:54 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:35' WHERE id = 35547;

-- Event #28, M.Prg: 35540, tot. athletes: 3
-- Tot. progr. duration: 178 (sec), Heat durations: [17850] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:40:32 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:40' WHERE id = 35540;

-- Event #29, M.Prg: 35544, tot. athletes: 4
-- Tot. progr. duration: 153 (sec), Heat durations: [15390] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:43:30 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:43' WHERE id = 35544;

-- Event #29, M.Prg: 35557, tot. athletes: 8
-- Tot. progr. duration: 161 (sec), Heat durations: [16140] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:46:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:46' WHERE id = 35557;

-- Event #30, M.Prg: 35550, tot. athletes: 5
-- Tot. progr. duration: 101 (sec), Heat durations: [10130] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:48:44 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:48' WHERE id = 35550;

-- Event #30, M.Prg: 35546, tot. athletes: 12
-- Tot. progr. duration: 190 (sec), Heat durations: [10120, 8910] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:50:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:50' WHERE id = 35546;

-- Event #31, M.Prg: 35548, tot. athletes: 3
-- Tot. progr. duration: 131 (sec), Heat durations: [13150] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:53:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:53' WHERE id = 35548;

-- Event #31, M.Prg: 35566, tot. athletes: 1
-- Tot. progr. duration: 113 (sec), Heat durations: [11360] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:55:46 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:55' WHERE id = 35566;

-- Event #32, M.Prg: 35551, tot. athletes: 11
-- Tot. progr. duration: 191 (sec), Heat durations: [10350, 8770] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:57:39 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:57' WHERE id = 35551;

-- Event #32, M.Prg: 35549, tot. athletes: 4
-- Tot. progr. duration: 107 (sec), Heat durations: [10700] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:00:50 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:00' WHERE id = 35549;

-- Event #33, M.Prg: 35554, tot. athletes: 3
-- Tot. progr. duration: 425 (sec), Heat durations: [42520] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:02:37 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:02' WHERE id = 35554;

-- Event #34, M.Prg: 35555, tot. athletes: 3
-- Tot. progr. duration: 150 (sec), Heat durations: [15020] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:09:42 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:09' WHERE id = 35555;

-- Event #35, M.Prg: 35563, tot. athletes: 4
-- Tot. progr. duration: 236 (sec), Heat durations: [23600] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:12:12 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:12' WHERE id = 35563;

-- Event #35, M.Prg: 35559, tot. athletes: 6
-- Tot. progr. duration: 162 (sec), Heat durations: [16230] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:16:08 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:16' WHERE id = 35559;

-- Event #36, M.Prg: 35561, tot. athletes: 8
-- Tot. progr. duration: 155 (sec), Heat durations: [15520] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:18:50 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:18' WHERE id = 35561;

-- Event #36, M.Prg: 35564, tot. athletes: 1
-- Tot. progr. duration: 145 (sec), Heat durations: [14570] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:21:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:21' WHERE id = 35564;


-- Last completed phase code: 30
