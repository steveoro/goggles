-- *** SQL Diff file for inv20160605csiprova6.csv ***
-- Timestamp: 201606051516
INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (74016, 3, 901, 2, 1, '2016-06-05 15:17:05', '2016-06-05 15:17:05', 1, 0, '2000-01-01 18:43:16', 3891, 1, NULL);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (27348, 'MANFREDOTTI', 'FADIO', 1982, NULL, NULL, NULL, '', NULL, 1, 1, '2016-06-05 15:17:05', '2016-06-05 15:17:05', 'MANFREDOTTI FADIO', 0);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (55487, '?', 151, 27348, 826, 898, 1, '2016-06-05 15:17:05', '2016-06-05 15:17:05', 5, 1594, NULL);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6122, '2016-06-05 15:17:06', '2016-06-05 15:17:06', NULL, NULL, NULL, NULL, 74016, 27347, 32, 1590, 55486, NULL, 1, 0, 55, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6123, '2016-06-05 15:17:06', '2016-06-05 15:17:06', NULL, NULL, NULL, NULL, 73777, 27348, 826, 1594, 55487, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6124, '2016-06-05 15:17:06', '2016-06-05 15:17:06', NULL, NULL, NULL, NULL, 73784, 24839, 1, 1589, 46564, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6125, '2016-06-05 15:17:06', '2016-06-05 15:17:06', NULL, NULL, NULL, NULL, 73784, 1529, 1, 1589, 46565, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6126, '2016-06-05 15:17:06', '2016-06-05 15:17:06', NULL, NULL, NULL, NULL, 73826, 1533, 32, 1590, 32774, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436944, 4, 1, 0, 0, 0.0, 0.0, 0, 35, 90, 73773, 1254, 10, 41528, 1, '2016-06-05 15:17:06', '2016-06-05 15:17:06', NULL, 0.0, 0.0, 0.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436945, 1, 1, 0, 0, 0.0, 0.0, 0, 26, 90, 73777, 1187, 32, 32720, 1, '2016-06-05 15:17:06', '2016-06-05 15:17:06', NULL, 0.0, 0.0, 0.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436946, 1, 1, 0, 0, 0.0, 0.0, 0, 48, 20, 73783, 1363, 32, 32714, 1, '2016-06-05 15:17:06', '2016-06-05 15:17:06', NULL, 0.0, 0.0, 0.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436947, 1, 1, 0, 0, 0.0, 0.0, 0, 25, 60, 73784, 1531, 32, 32712, 1, '2016-06-05 15:17:06', '2016-06-05 15:17:06', NULL, 0.0, 0.0, 0.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436948, 1, 1, 0, 0, 0.0, 0.0, 0, 37, 10, 73793, 11732, 35, 32709, 1, '2016-06-05 15:17:06', '2016-06-05 15:17:06', NULL, 0.0, 0.0, 0.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436949, 1, 1, 0, 0, 0.0, 0.0, 0, 30, 30, 73794, 1838, 18, 32622, 1, '2016-06-05 15:17:06', '2016-06-05 15:17:06', NULL, 0.0, 0.0, 0.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436950, 2, 1, 0, 0, 0.0, 0.0, 0, 30, 90, 73794, 1475, 18, 38094, 1, '2016-06-05 15:17:07', '2016-06-05 15:17:07', NULL, 0.0, 0.0, 0.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436951, 1, 1, 0, 0, 0.0, 0.0, 0, 42, 90, 73804, 21038, 18, 32643, 1, '2016-06-05 15:17:07', '2016-06-05 15:17:07', NULL, 0.0, 0.0, 0.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436952, 1, 1, 0, 0, 0.0, 0.0, 0, 29, 60, 73812, 4847, 11, 32647, 1, '2016-06-05 15:17:07', '2016-06-05 15:17:07', NULL, 0.0, 0.0, 0.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436953, 5, 1, 0, 0, 0.0, 0.0, 0, 30, 0, 73784, 20967, 4, 32705, 1, '2016-06-05 15:17:07', '2016-06-05 15:17:07', NULL, 0.0, 0.0, 0.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436954, 1, 1, 0, 0, 0.0, 0.0, 0, 38, 0, 73819, 230, 4, 38108, 1, '2016-06-05 15:17:07', '2016-06-05 15:17:07', NULL, 0.0, 0.0, 0.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436955, 3, 1, 0, 0, 0.0, 0.0, 0, 30, 80, 73777, 20959, 4, 32704, 1, '2016-06-05 15:17:07', '2016-06-05 15:17:07', NULL, 0.0, 0.0, 0.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436956, 4, 1, 0, 0, 0.0, 0.0, 0, 40, 20, 73823, 24842, 826, 46548, 1, '2016-06-05 15:17:07', '2016-06-05 15:17:07', NULL, 0.0, 0.0, 0.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436957, 1, 1, 0, 0, 0.0, 0.0, 0, 33, 60, 73824, 22147, 826, 38756, 1, '2016-06-05 15:17:07', '2016-06-05 15:17:07', NULL, 0.0, 0.0, 0.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436958, 3, 1, 0, 0, 0.0, 0.0, 0, 33, 20, 73812, 22148, 826, 38755, 1, '2016-06-05 15:17:07', '2016-06-05 15:17:07', NULL, 0.0, 0.0, 0.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436959, 4, 1, 0, 0, 0.0, 0.0, 0, 33, 20, 73777, 22151, 826, 38753, 1, '2016-06-05 15:17:07', '2016-06-05 15:17:07', NULL, 0.0, 0.0, 0.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436960, 5, 1, 0, 0, 0.0, 0.0, 0, 43, 60, 73823, 21020, 826, 32555, 1, '2016-06-05 15:17:08', '2016-06-05 15:17:08', NULL, 0.0, 0.0, 0.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436961, 2, 1, 0, 0, 0.0, 0.0, 1, 8, 90, 73819, 24838, 826, 46547, 1, '2016-06-05 15:17:08', '2016-06-05 15:17:08', NULL, 0.0, 0.0, 0.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436962, 1, 1, 0, 0, 0.0, 0.0, 0, 27, 60, 73826, 27324, 826, 55422, 1, '2016-06-05 15:17:08', '2016-06-05 15:17:08', NULL, 0.0, 0.0, 0.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436963, 4, 1, 0, 0, 0.0, 0.0, 0, 29, 50, 73826, 1405, 1, 38732, 1, '2016-06-05 15:17:08', '2016-06-05 15:17:08', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436964, 5, 1, 0, 0, 0.0, 0.0, 0, 31, 0, 73826, 785, 1, 32569, 1, '2016-06-05 15:17:08', '2016-06-05 15:17:08', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436965, 2, 1, 0, 0, 0.0, 0.0, 0, 29, 50, 73773, 23, 1, 32573, 1, '2016-06-05 15:17:08', '2016-06-05 15:17:08', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436966, 1, 1, 0, 0, 0.0, 0.0, 0, 30, 40, 73833, 1788, 1, 32579, 1, '2016-06-05 15:17:08', '2016-06-05 15:17:08', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436967, 2, 1, 0, 0, 0.0, 0.0, 0, 28, 30, 73777, 1279, 1, 32580, 1, '2016-06-05 15:17:08', '2016-06-05 15:17:08', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436968, 2, 1, 0, 0, 0.0, 0.0, 0, 28, 0, 73826, 1025, 1, 32585, 1, '2016-06-05 15:17:08', '2016-06-05 15:17:08', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436969, 2, 1, 0, 0, 0.0, 0.0, 0, 31, 40, 73823, 108, 1, 32771, 1, '2016-06-05 15:17:08', '2016-06-05 15:17:08', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436970, 1, 1, 0, 0, 0.0, 0.0, 0, 38, 60, 73835, 25136, 1, 47211, 1, '2016-06-05 15:17:09', '2016-06-05 15:17:09', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436971, 6, 1, 0, 0, 0.0, 0.0, 0, 49, 70, 73777, 1197, 1, 32607, 1, '2016-06-05 15:17:09', '2016-06-05 15:17:09', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436972, 1, 1, 0, 0, 0.0, 0.0, 0, 28, 70, 73773, 1227, 1, 32562, 1, '2016-06-05 15:17:09', '2016-06-05 15:17:09', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436973, 2, 1, 0, 0, 0.0, 0.0, 0, 42, 0, 73835, 25137, 1, 47213, 1, '2016-06-05 15:17:09', '2016-06-05 15:17:09', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436974, 3, 1, 0, 0, 0.0, 0.0, 0, 32, 80, 73823, 456, 1, 32566, 1, '2016-06-05 15:17:09', '2016-06-05 15:17:09', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436975, 1, 1, 0, 0, 0.0, 0.0, 0, 28, 30, 73823, 18952, 17, 32731, 1, '2016-06-05 15:17:09', '2016-06-05 15:17:09', NULL, 0.0, 0.0, 0.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436976, 4, 1, 0, 0, 0.0, 0.0, 0, 28, 10, 73784, 1604, 18, 32634, 1, '2016-06-05 15:17:09', '2016-06-05 15:17:09', NULL, 0.0, 0.0, 0.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436977, 1, 1, 0, 0, 0.0, 100.0, 0, 42, 80, 74016, 27347, 32, 55486, 1, '2016-06-05 15:17:09', '2016-06-05 15:17:09', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436978, 3, 1, 0, 0, 0.0, 0.0, 0, 31, 30, 73773, 1270, 32, 32716, 1, '2016-06-05 15:17:09', '2016-06-05 15:17:09', NULL, 0.0, 0.0, 0.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436979, 6, 1, 0, 0, 0.0, 0.0, 0, 30, 20, 73784, 27345, 1, 55485, 1, '2016-06-05 15:17:09', '2016-06-05 15:17:09', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436980, 2, 1, 0, 0, 0.0, 0.0, 0, 33, 10, 73812, 1777, 1, 32586, 1, '2016-06-05 15:17:10', '2016-06-05 15:17:10', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436981, 4, 1, 0, 0, 0.0, 0.0, 0, 33, 20, 73777, 27348, 826, 55487, 1, '2016-06-05 15:17:10', '2016-06-05 15:17:10', NULL, 0.0, 0.0, 0.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436982, 2, 1, 0, 0, 0.0, 0.0, 0, 27, 44, 73784, 24839, 1, 46564, 1, '2016-06-05 15:17:10', '2016-06-05 15:17:10', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436983, 3, 1, 0, 0, 0.0, 0.0, 0, 27, 73, 73784, 1529, 1, 46565, 1, '2016-06-05 15:17:10', '2016-06-05 15:17:10', NULL, 0.0, 0.0, 0.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436984, 3, 1, 0, 0, 0.0, 0.0, 0, 28, 5, 73826, 1533, 32, 32774, 1, '2016-06-05 15:17:10', '2016-06-05 15:17:10', NULL, 0.0, 0.0, 0.0, 1590, 0, 0);


-- Meeting 15106
-- 'Results acquired' flag setting:
UPDATE meetings SET are_results_acquired = '1' WHERE id = 15106;


-- Meeting 15106
-- 'has_start_list' flag setting:
UPDATE meetings SET has_start_list = '1' WHERE id = 15106;

-- --- BeginTimeCalculator: compute_for_all( 15106 )
-- ----------------------------------------------------
-- Using RESULTS to compute heat length.

-- Event #1, M.Prg: 73769, tot. athletes: 1
-- Tot. progr. duration: 150 (sec), Heat durations: [15090] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73769;

-- Event #1, M.Prg: 73781, tot. athletes: 5
-- Tot. progr. duration: 194 (sec), Heat durations: [19460] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:04:30 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:04' WHERE id = 73781;

-- Event #2, M.Prg: 73770, tot. athletes: 7
-- Tot. progr. duration: 205 (sec), Heat durations: [10960, 9610] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:07:44 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:07' WHERE id = 73770;

-- Event #2, M.Prg: 73829, tot. athletes: 2
-- Tot. progr. duration: 105 (sec), Heat durations: [10570] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:11:09 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:11' WHERE id = 73829;

-- Event #3, M.Prg: 73828, tot. athletes: 3
-- Tot. progr. duration: 100 (sec), Heat durations: [10060] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:12:54 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:12' WHERE id = 73828;

-- Event #3, M.Prg: 73771, tot. athletes: 6
-- Tot. progr. duration: 111 (sec), Heat durations: [11120] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:14:34 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:14' WHERE id = 73771;

-- Event #3, M.Prg: 74016, tot. athletes: 1
-- Tot. progr. duration: 102 (sec), Heat durations: [10280] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:16:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:16' WHERE id = 74016;

-- Event #4, M.Prg: 73786, tot. athletes: 5
-- Tot. progr. duration: 99 (sec), Heat durations: [9950] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:18:07 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:18' WHERE id = 73786;

-- Event #4, M.Prg: 73772, tot. athletes: 1
-- Tot. progr. duration: 115 (sec), Heat durations: [11500] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:19:46 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:19' WHERE id = 73772;

-- Event #5, M.Prg: 73773, tot. athletes: 4
-- Tot. progr. duration: 95 (sec), Heat durations: [9590] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:21:41 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:21' WHERE id = 73773;

-- Event #6, M.Prg: 73797, tot. athletes: 4
-- Tot. progr. duration: 159 (sec), Heat durations: [15950] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:23:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:23' WHERE id = 73797;

-- Event #6, M.Prg: 73774, tot. athletes: 4
-- Tot. progr. duration: 143 (sec), Heat durations: [14380] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:25:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:25' WHERE id = 73774;

-- Event #7, M.Prg: 73789, tot. athletes: 7
-- Tot. progr. duration: 206 (sec), Heat durations: [10950, 9660] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:28:18 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:28' WHERE id = 73789;

-- Event #7, M.Prg: 73775, tot. athletes: 4
-- Tot. progr. duration: 128 (sec), Heat durations: [12890] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:31:44 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:31' WHERE id = 73775;

-- Event #8, M.Prg: 73807, tot. athletes: 7
-- Tot. progr. duration: 279 (sec), Heat durations: [14560, 13390] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:33:52 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:33' WHERE id = 73807;

-- Event #8, M.Prg: 73776, tot. athletes: 8
-- Tot. progr. duration: 271 (sec), Heat durations: [14240, 12860] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:38:31 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:38' WHERE id = 73776;

-- Event #9, M.Prg: 73777, tot. athletes: 6
-- Tot. progr. duration: 109 (sec), Heat durations: [10970] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:43:02 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:43' WHERE id = 73777;

-- Event #9, M.Prg: 73804, tot. athletes: 1
-- Tot. progr. duration: 102 (sec), Heat durations: [10290] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:44:51 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:44' WHERE id = 73804;

-- Event #10, M.Prg: 73778, tot. athletes: 5
-- Tot. progr. duration: 112 (sec), Heat durations: [11230] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:46:33 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:46' WHERE id = 73778;

-- Event #10, M.Prg: 73821, tot. athletes: 7
-- Tot. progr. duration: 198 (sec), Heat durations: [10080, 9730] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:48:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:48' WHERE id = 73821;

-- Event #11, M.Prg: 73779, tot. athletes: 2
-- Tot. progr. duration: 708 (sec), Heat durations: [70820] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 15:51:43 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:51' WHERE id = 73779;

-- Event #11, M.Prg: 73801, tot. athletes: 2
-- Tot. progr. duration: 786 (sec), Heat durations: [78670] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 16:03:31 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:03' WHERE id = 73801;

-- Event #12, M.Prg: 73780, tot. athletes: 2
-- Tot. progr. duration: 775 (sec), Heat durations: [77590] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 16:16:37 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:16' WHERE id = 73780;

-- Event #12, M.Prg: 73839, tot. athletes: 1
-- Tot. progr. duration: 872 (sec), Heat durations: [87280] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 16:29:32 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:29' WHERE id = 73839;

-- Event #13, M.Prg: 73843, tot. athletes: 1
-- Tot. progr. duration: 149 (sec), Heat durations: [14970] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:44:04 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:44' WHERE id = 73843;

-- Event #13, M.Prg: 73782, tot. athletes: 4
-- Tot. progr. duration: 153 (sec), Heat durations: [15360] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:46:33 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:46' WHERE id = 73782;

-- Event #14, M.Prg: 73783, tot. athletes: 1
-- Tot. progr. duration: 108 (sec), Heat durations: [10820] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:49:06 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:49' WHERE id = 73783;

-- Event #14, M.Prg: 73823, tot. athletes: 5
-- Tot. progr. duration: 103 (sec), Heat durations: [10360] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:50:54 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:50' WHERE id = 73823;

-- Event #15, M.Prg: 73812, tot. athletes: 3
-- Tot. progr. duration: 93 (sec), Heat durations: [9320] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:52:37 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:52' WHERE id = 73812;

-- Event #15, M.Prg: 73784, tot. athletes: 6
-- Tot. progr. duration: 90 (sec), Heat durations: [9020] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:54:10 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:54' WHERE id = 73784;

-- Event #16, M.Prg: 73785, tot. athletes: 3
-- Tot. progr. duration: 162 (sec), Heat durations: [16260] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:55:40 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:55' WHERE id = 73785;

-- Event #17, M.Prg: 73787, tot. athletes: 6
-- Tot. progr. duration: 149 (sec), Heat durations: [14980] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:58:22 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:58' WHERE id = 73787;

-- Event #17, M.Prg: 73817, tot. athletes: 1
-- Tot. progr. duration: 167 (sec), Heat durations: [16750] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:00:51 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:00' WHERE id = 73817;

-- Event #18, M.Prg: 73788, tot. athletes: 5
-- Tot. progr. duration: 140 (sec), Heat durations: [14040] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:03:38 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:03' WHERE id = 73788;

-- Event #18, M.Prg: 73832, tot. athletes: 3
-- Tot. progr. duration: 167 (sec), Heat durations: [16756] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:05:58 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:05' WHERE id = 73832;

-- Event #19, M.Prg: 73814, tot. athletes: 5
-- Tot. progr. duration: 118 (sec), Heat durations: [11810] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:08:45 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:08' WHERE id = 73814;

-- Event #19, M.Prg: 73790, tot. athletes: 8
-- Tot. progr. duration: 201 (sec), Heat durations: [10420, 9750] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:10:43 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:10' WHERE id = 73790;

-- Event #20, M.Prg: 73791, tot. athletes: 3
-- Tot. progr. duration: 842 (sec), Heat durations: [84280] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:14:04 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:14' WHERE id = 73791;

-- Event #20, M.Prg: 73792, tot. athletes: 2
-- Tot. progr. duration: 658 (sec), Heat durations: [65870] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:28:06 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:28' WHERE id = 73792;

-- Event #21, M.Prg: 73826, tot. athletes: 5
-- Tot. progr. duration: 91 (sec), Heat durations: [9100] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:39:04 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:39' WHERE id = 73826;

-- Event #21, M.Prg: 73793, tot. athletes: 1
-- Tot. progr. duration: 97 (sec), Heat durations: [9710] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:40:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:40' WHERE id = 73793;

-- Event #22, M.Prg: 73794, tot. athletes: 2
-- Tot. progr. duration: 90 (sec), Heat durations: [9090] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:42:12 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:42' WHERE id = 73794;

-- Event #23, M.Prg: 73795, tot. athletes: 5
-- Tot. progr. duration: 163 (sec), Heat durations: [16390] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:43:42 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:43' WHERE id = 73795;

-- Event #23, M.Prg: 73796, tot. athletes: 4
-- Tot. progr. duration: 150 (sec), Heat durations: [15040] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:46:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:46' WHERE id = 73796;

-- Event #24, M.Prg: 73809, tot. athletes: 3
-- Tot. progr. duration: 1086 (sec), Heat durations: [108640] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:48:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:48' WHERE id = 73809;

-- Event #24, M.Prg: 73798, tot. athletes: 4
-- Tot. progr. duration: 800 (sec), Heat durations: [80020] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 18:07:01 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73798;

-- Event #25, M.Prg: 73799, tot. athletes: 3
-- Tot. progr. duration: 166 (sec), Heat durations: [16620] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:20:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:20' WHERE id = 73799;

-- Event #25, M.Prg: 73815, tot. athletes: 6
-- Tot. progr. duration: 153 (sec), Heat durations: [15310] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:23:07 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:23' WHERE id = 73815;

-- Event #26, M.Prg: 73800, tot. athletes: 4
-- Tot. progr. duration: 835 (sec), Heat durations: [83520] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 18:25:40 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:25' WHERE id = 73800;

-- Event #26, M.Prg: 73830, tot. athletes: 3
-- Tot. progr. duration: 846 (sec), Heat durations: [84670] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 18:39:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:39' WHERE id = 73830;

-- Event #27, M.Prg: 73808, tot. athletes: 2
-- Tot. progr. duration: 133 (sec), Heat durations: [13370] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:53:41 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:53' WHERE id = 73808;

-- Event #27, M.Prg: 73802, tot. athletes: 3
-- Tot. progr. duration: 165 (sec), Heat durations: [16500] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:55:54 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:55' WHERE id = 73802;

-- Event #28, M.Prg: 73803, tot. athletes: 4
-- Tot. progr. duration: 103 (sec), Heat durations: [10340] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:58:39 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:58' WHERE id = 73803;

-- Event #28, M.Prg: 73822, tot. athletes: 3
-- Tot. progr. duration: 109 (sec), Heat durations: [10960] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:00:22 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:00' WHERE id = 73822;

-- Event #29, M.Prg: 74015, tot. athletes: 1
-- Tot. progr. duration: 169 (sec), Heat durations: [16960] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:02:11 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:02' WHERE id = 74015;

-- Event #29, M.Prg: 73816, tot. athletes: 1
-- Tot. progr. duration: 130 (sec), Heat durations: [13080] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:05:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:05' WHERE id = 73816;

-- Event #29, M.Prg: 73805, tot. athletes: 2
-- Tot. progr. duration: 162 (sec), Heat durations: [16260] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:07:10 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:07' WHERE id = 73805;

-- Event #30, M.Prg: 73806, tot. athletes: 1
-- Tot. progr. duration: 138 (sec), Heat durations: [13890] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:09:52 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:09' WHERE id = 73806;

-- Event #31, M.Prg: 73838, tot. athletes: 1
-- Tot. progr. duration: 893 (sec), Heat durations: [89390] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 19:12:10 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:12' WHERE id = 73838;

-- Event #31, M.Prg: 73810, tot. athletes: 2
-- Tot. progr. duration: 1034 (sec), Heat durations: [103400] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 19:27:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:27' WHERE id = 73810;

-- Event #32, M.Prg: 73811, tot. athletes: 3
-- Tot. progr. duration: 968 (sec), Heat durations: [96820] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 19:44:17 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:44' WHERE id = 73811;

-- Event #33, M.Prg: 73813, tot. athletes: 3
-- Tot. progr. duration: 144 (sec), Heat durations: [14410] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:00:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:00' WHERE id = 73813;

-- Event #33, M.Prg: 73834, tot. athletes: 2
-- Tot. progr. duration: 143 (sec), Heat durations: [14300] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:02:49 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:02' WHERE id = 73834;

-- Event #34, M.Prg: 73842, tot. athletes: 1
-- Tot. progr. duration: 193 (sec), Heat durations: [19370] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:05:12 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:05' WHERE id = 73842;

-- Event #34, M.Prg: 73818, tot. athletes: 3
-- Tot. progr. duration: 154 (sec), Heat durations: [15420] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:08:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:08' WHERE id = 73818;

-- Event #35, M.Prg: 73819, tot. athletes: 2
-- Tot. progr. duration: 128 (sec), Heat durations: [12890] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:10:59 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:10' WHERE id = 73819;

-- Event #36, M.Prg: 73820, tot. athletes: 1
-- Tot. progr. duration: 105 (sec), Heat durations: [10520] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:13:07 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:13' WHERE id = 73820;

-- Event #36, M.Prg: 73837, tot. athletes: 1
-- Tot. progr. duration: 126 (sec), Heat durations: [12650] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:14:52 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:14' WHERE id = 73837;

-- Event #37, M.Prg: 73824, tot. athletes: 1
-- Tot. progr. duration: 93 (sec), Heat durations: [9360] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:16:58 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:16' WHERE id = 73824;

-- Event #37, M.Prg: 73835, tot. athletes: 2
-- Tot. progr. duration: 102 (sec), Heat durations: [10200] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:18:31 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:18' WHERE id = 73835;

-- Event #38, M.Prg: 73825, tot. athletes: 2
-- Tot. progr. duration: 109 (sec), Heat durations: [10980] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:20:13 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:20' WHERE id = 73825;

-- Event #38, M.Prg: 73831, tot. athletes: 2
-- Tot. progr. duration: 111 (sec), Heat durations: [11180] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:22:02 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:22' WHERE id = 73831;

-- Event #39, M.Prg: 73827, tot. athletes: 3
-- Tot. progr. duration: 158 (sec), Heat durations: [15840] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:23:53 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:23' WHERE id = 73827;

-- Event #39, M.Prg: 73836, tot. athletes: 1
-- Tot. progr. duration: 165 (sec), Heat durations: [16540] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:26:31 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:26' WHERE id = 73836;

-- Event #40, M.Prg: 73833, tot. athletes: 1
-- Tot. progr. duration: 90 (sec), Heat durations: [9040] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:29:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:29' WHERE id = 73833;

-- Event #41, M.Prg: 73840, tot. athletes: 1
-- Tot. progr. duration: 908 (sec), Heat durations: [90840] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 20:30:46 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:30' WHERE id = 73840;

-- Event #42, M.Prg: 73841, tot. athletes: 1
-- Tot. progr. duration: 808 (sec), Heat durations: [80820] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 20:45:54 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:45' WHERE id = 73841;

-- Event #43, M.Prg: 73844, tot. athletes: 1
-- Tot. progr. duration: 164 (sec), Heat durations: [16490] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:59:22 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:59' WHERE id = 73844;


-- Last completed phase code: 30
