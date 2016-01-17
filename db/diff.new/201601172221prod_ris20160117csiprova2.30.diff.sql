-- *** SQL Diff file for ris20160117csiprova2.csv ***
-- Timestamp: 201601172221
INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (38721, 7, 897, 1, 1, '2016-01-17 22:23:08', '2016-01-17 22:23:08', 1, 0, '2000-01-01 15:37:00', 3873, 1, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (38110, '?', 151, 5166, 9, 897, 1, '2016-01-17 22:23:09', '2016-01-17 22:23:09', 5, 1583, NULL);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4607, '2016-01-17 22:23:09', '2016-01-17 22:23:09', NULL, NULL, NULL, NULL, 38720, 1449, 9, 1583, 38091, NULL, 1, 0, 34, 50, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4608, '2016-01-17 22:23:09', '2016-01-17 22:23:09', NULL, NULL, NULL, NULL, 38685, 1533, 32, 1590, 32774, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4609, '2016-01-17 22:23:09', '2016-01-17 22:23:09', NULL, NULL, NULL, NULL, 38685, 5166, 9, 1583, 38110, NULL, 1, 0, 32, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4610, '2016-01-17 22:23:09', '2016-01-17 22:23:09', NULL, NULL, NULL, NULL, 38721, 1533, 32, 1590, 32774, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4611, '2016-01-17 22:23:10', '2016-01-17 22:23:10', NULL, NULL, NULL, NULL, 38671, 5166, 9, 1583, 38110, NULL, 1, 2, 40, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4612, '2016-01-17 22:23:10', '2016-01-17 22:23:10', NULL, NULL, NULL, NULL, 38686, 754, 17, 1591, 32739, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4613, '2016-01-17 22:23:10', '2016-01-17 22:23:10', NULL, NULL, NULL, NULL, 38686, 21042, 9, 1583, 32549, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4614, '2016-01-17 22:23:10', '2016-01-17 22:23:10', NULL, NULL, NULL, NULL, 38672, 21042, 9, 1583, 32549, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4615, '2016-01-17 22:23:10', '2016-01-17 22:23:10', NULL, NULL, NULL, NULL, 38672, 754, 17, 1591, 32739, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269123, 1, 1, 0, 0, 0.0, 100.0, 0, 36, 10, 38681, 4810, 17, 38080, 1, '2016-01-17 22:23:10', '2016-01-17 22:23:10', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269124, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 90, 38681, 21990, 9, 38089, 1, '2016-01-17 22:23:10', '2016-01-17 22:23:10', NULL, 0.0, 0.0, 14.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269125, 1, 1, 0, 0, 0.0, 100.0, 0, 47, 40, 38707, 21990, 9, 38089, 1, '2016-01-17 22:23:11', '2016-01-17 22:23:11', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269126, 2, 1, 0, 0, 0.0, 95.0, 0, 48, 80, 38707, 4810, 17, 38080, 1, '2016-01-17 22:23:11', '2016-01-17 22:23:11', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269127, 1, 1, 0, 0, 0.0, 100.0, 0, 33, 50, 38656, 11731, 17, 38083, 1, '2016-01-17 22:23:11', '2016-01-17 22:23:11', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269128, 2, 1, 0, 0, 0.0, 95.0, 0, 35, 20, 38656, 20983, 17, 32733, 1, '2016-01-17 22:23:11', '2016-01-17 22:23:11', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269129, 3, 1, 0, 0, 0.0, 90.0, 0, 36, 20, 38656, 21041, 21, 32531, 1, '2016-01-17 22:23:11', '2016-01-17 22:23:11', NULL, 0.0, 0.0, 12.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269130, 4, 1, 0, 0, 0.0, 85.0, 0, 37, 60, 38656, 21035, 17, 32761, 1, '2016-01-17 22:23:11', '2016-01-17 22:23:11', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269131, 5, 1, 0, 0, 0.0, 80.0, 0, 39, 0, 38656, 21001, 21, 32532, 1, '2016-01-17 22:23:11', '2016-01-17 22:23:11', NULL, 0.0, 0.0, 8.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269132, 6, 1, 0, 0, 0.0, 75.0, 0, 39, 20, 38656, 21024, 17, 32755, 1, '2016-01-17 22:23:12', '2016-01-17 22:23:12', NULL, 0.0, 0.0, 6.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269133, 1, 1, 0, 0, 0.0, 100.0, 1, 20, 40, 38661, 20983, 17, 32733, 1, '2016-01-17 22:23:12', '2016-01-17 22:23:12', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269134, 2, 1, 0, 0, 0.0, 95.0, 1, 20, 70, 38661, 4847, 11, 32647, 1, '2016-01-17 22:23:12', '2016-01-17 22:23:12', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269135, 3, 1, 0, 0, 0.0, 90.0, 1, 23, 0, 38661, 21024, 17, 32755, 1, '2016-01-17 22:23:12', '2016-01-17 22:23:12', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269136, 4, 1, 0, 0, 0.0, 85.0, 1, 24, 30, 38661, 21035, 17, 32761, 1, '2016-01-17 22:23:12', '2016-01-17 22:23:12', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269137, 5, 1, 0, 0, 0.0, 80.0, 1, 25, 80, 38661, 1777, 1, 32586, 1, '2016-01-17 22:23:12', '2016-01-17 22:23:12', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269138, 6, 1, 0, 0, 0.0, 75.0, 1, 26, 70, 38661, 20998, 17, 32743, 1, '2016-01-17 22:23:12', '2016-01-17 22:23:12', NULL, 0.0, 0.0, 6.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269139, 7, 1, 0, 0, 0.0, 70.0, 1, 26, 80, 38661, 21041, 21, 32531, 1, '2016-01-17 22:23:12', '2016-01-17 22:23:12', NULL, 0.0, 0.0, 4.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269140, 8, 1, 0, 0, 0.0, 65.0, 1, 33, 60, 38661, 20984, 17, 32734, 1, '2016-01-17 22:23:13', '2016-01-17 22:23:13', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269141, 9, 1, 0, 0, 0.0, 60.0, 1, 35, 0, 38661, 1639, 17, 32756, 1, '2016-01-17 22:23:13', '2016-01-17 22:23:13', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269142, 10, 1, 0, 0, 0.0, 55.0, 1, 36, 50, 38661, 21012, 21, 32533, 1, '2016-01-17 22:23:13', '2016-01-17 22:23:13', NULL, 0.0, 0.0, 2.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269143, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 0, 38657, 1491, 1, 32576, 1, '2016-01-17 22:23:13', '2016-01-17 22:23:13', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269144, 2, 1, 0, 0, 0.0, 95.0, 0, 41, 20, 38657, 4847, 11, 32647, 1, '2016-01-17 22:23:13', '2016-01-17 22:23:13', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269145, 3, 1, 0, 0, 0.0, 90.0, 0, 42, 60, 38657, 20998, 17, 32743, 1, '2016-01-17 22:23:13', '2016-01-17 22:23:13', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269146, 4, 1, 0, 0, 0.0, 85.0, 0, 43, 90, 38657, 11731, 17, 38083, 1, '2016-01-17 22:23:13', '2016-01-17 22:23:13', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269147, 5, 1, 0, 0, 0.0, 80.0, 0, 45, 70, 38657, 1777, 1, 32586, 1, '2016-01-17 22:23:13', '2016-01-17 22:23:13', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269148, 6, 1, 0, 0, 0.0, 75.0, 0, 46, 90, 38657, 20984, 17, 32734, 1, '2016-01-17 22:23:14', '2016-01-17 22:23:14', NULL, 0.0, 0.0, 6.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269149, 7, 1, 0, 0, 0.0, 70.0, 0, 47, 60, 38657, 21001, 21, 32532, 1, '2016-01-17 22:23:14', '2016-01-17 22:23:14', NULL, 0.0, 0.0, 4.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269150, 7, 1, 0, 0, 0.0, 70.0, 0, 47, 60, 38657, 1639, 17, 32756, 1, '2016-01-17 22:23:14', '2016-01-17 22:23:14', NULL, 0.0, 0.0, 4.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269151, 8, 1, 0, 0, 0.0, 65.0, 0, 49, 90, 38657, 21012, 21, 32533, 1, '2016-01-17 22:23:14', '2016-01-17 22:23:14', NULL, 0.0, 0.0, 2.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269152, 1, 1, 0, 0, 0.0, 100.0, 0, 33, 60, 38662, 11733, 17, 32729, 1, '2016-01-17 22:23:14', '2016-01-17 22:23:14', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269153, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 70, 38662, 882, 11, 32649, 1, '2016-01-17 22:23:14', '2016-01-17 22:23:14', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269154, 3, 1, 0, 0, 0.0, 90.0, 0, 38, 20, 38662, 1843, 1, 32565, 1, '2016-01-17 22:23:14', '2016-01-17 22:23:14', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269155, 4, 1, 0, 0, 0.0, 85.0, 0, 45, 60, 38662, 1733, 21, 38071, 1, '2016-01-17 22:23:14', '2016-01-17 22:23:14', NULL, 0.0, 0.0, 10.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269156, 1, 1, 0, 0, 0.0, 100.0, 1, 27, 40, 38660, 1135, 17, 32744, 1, '2016-01-17 22:23:15', '2016-01-17 22:23:15', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269157, 1, 1, 0, 0, 0.0, 100.0, 0, 41, 50, 38655, 882, 11, 32649, 1, '2016-01-17 22:23:15', '2016-01-17 22:23:15', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269158, 2, 1, 0, 0, 0.0, 95.0, 0, 45, 40, 38655, 20997, 17, 32730, 1, '2016-01-17 22:23:15', '2016-01-17 22:23:15', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269159, 3, 1, 0, 0, 0.0, 90.0, 0, 47, 0, 38655, 1733, 21, 38071, 1, '2016-01-17 22:23:15', '2016-01-17 22:23:15', NULL, 0.0, 0.0, 12.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269160, 4, 1, 0, 0, 0.0, 85.0, 0, 47, 30, 38655, 21981, 17, 38087, 1, '2016-01-17 22:23:15', '2016-01-17 22:23:15', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269161, 1, 1, 0, 0, 0.0, 100.0, 3, 3, 0, 38683, 1843, 1, 32565, 1, '2016-01-17 22:23:15', '2016-01-17 22:23:15', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269162, 2, 1, 0, 0, 0.0, 95.0, 3, 4, 80, 38683, 1135, 17, 32744, 1, '2016-01-17 22:23:15', '2016-01-17 22:23:15', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269163, 3, 1, 0, 0, 0.0, 90.0, 3, 11, 40, 38683, 20997, 17, 32730, 1, '2016-01-17 22:23:15', '2016-01-17 22:23:15', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269164, 1, 1, 0, 0, 0.0, 100.0, 0, 32, 0, 38695, 992, 10, 32486, 1, '2016-01-17 22:23:15', '2016-01-17 22:23:15', NULL, 0.0, 0.0, 16.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269165, 2, 1, 0, 0, 0.0, 95.0, 0, 34, 0, 38695, 1535, 17, 32727, 1, '2016-01-17 22:23:16', '2016-01-17 22:23:16', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269166, 3, 1, 0, 0, 0.0, 90.0, 0, 34, 70, 38695, 961, 17, 32740, 1, '2016-01-17 22:23:16', '2016-01-17 22:23:16', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269167, 4, 1, 0, 0, 0.0, 85.0, 0, 39, 30, 38695, 1536, 17, 38086, 1, '2016-01-17 22:23:16', '2016-01-17 22:23:16', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269168, 5, 1, 0, 0, 0.0, 80.0, 0, 40, 80, 38695, 993, 17, 32757, 1, '2016-01-17 22:23:16', '2016-01-17 22:23:16', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269169, 1, 1, 0, 0, 0.0, 100.0, 1, 13, 40, 38708, 992, 10, 32486, 1, '2016-01-17 22:23:16', '2016-01-17 22:23:16', NULL, 0.0, 0.0, 16.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269170, 2, 1, 0, 0, 0.0, 95.0, 1, 24, 70, 38708, 20958, 4, 38107, 1, '2016-01-17 22:23:16', '2016-01-17 22:23:16', NULL, 0.0, 0.0, 14.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269171, 3, 1, 0, 0, 0.0, 90.0, 1, 29, 30, 38708, 993, 17, 32757, 1, '2016-01-17 22:23:16', '2016-01-17 22:23:16', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269172, 1, 1, 0, 0, 0.0, 100.0, 0, 40, 30, 38700, 1535, 17, 32727, 1, '2016-01-17 22:23:17', '2016-01-17 22:23:17', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269173, 2, 1, 0, 0, 0.0, 95.0, 0, 44, 20, 38700, 1536, 17, 38086, 1, '2016-01-17 22:23:17', '2016-01-17 22:23:17', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269174, 1, 1, 0, 0, 0.0, 100.0, 2, 56, 50, 38704, 961, 17, 32740, 1, '2016-01-17 22:23:17', '2016-01-17 22:23:17', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269175, 2, 1, 0, 0, 0.0, 95.0, 3, 17, 60, 38704, 20958, 4, 38107, 1, '2016-01-17 22:23:17', '2016-01-17 22:23:17', NULL, 0.0, 0.0, 14.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269176, 1, 1, 0, 0, 0.0, 100.0, 0, 33, 40, 38670, 578, 17, 38082, 1, '2016-01-17 22:23:17', '2016-01-17 22:23:17', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269177, 2, 1, 0, 0, 0.0, 95.0, 0, 34, 0, 38670, 1788, 1, 32579, 1, '2016-01-17 22:23:17', '2016-01-17 22:23:17', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269178, 3, 1, 0, 0, 0.0, 90.0, 0, 39, 40, 38670, 20986, 18, 32630, 1, '2016-01-17 22:23:17', '2016-01-17 22:23:17', NULL, 0.0, 0.0, 12.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269179, 4, 1, 0, 0, 0.0, 85.0, 0, 41, 60, 38670, 21985, 4, 38109, 1, '2016-01-17 22:23:17', '2016-01-17 22:23:17', NULL, 0.0, 0.0, 10.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269180, 5, 1, 0, 0, 0.0, 80.0, 0, 42, 40, 38670, 580, 17, 32754, 1, '2016-01-17 22:23:17', '2016-01-17 22:23:17', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269181, 6, 1, 0, 0, 0.0, 75.0, 0, 44, 40, 38670, 601, 17, 32746, 1, '2016-01-17 22:23:17', '2016-01-17 22:23:17', NULL, 0.0, 0.0, 6.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269182, 7, 1, 0, 0, 0.0, 70.0, 0, 44, 60, 38670, 11734, 4, 32701, 1, '2016-01-17 22:23:18', '2016-01-17 22:23:18', NULL, 0.0, 0.0, 4.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269183, 8, 1, 0, 0, 0.0, 65.0, 0, 45, 30, 38670, 550, 1, 32568, 1, '2016-01-17 22:23:18', '2016-01-17 22:23:18', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269184, 9, 1, 0, 0, 0.0, 60.0, 0, 46, 90, 38670, 602, 17, 32758, 1, '2016-01-17 22:23:18', '2016-01-17 22:23:18', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269185, 1, 1, 0, 0, 0.0, 100.0, 1, 30, 20, 38694, 1455, 17, 32738, 1, '2016-01-17 22:23:18', '2016-01-17 22:23:18', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269186, 2, 1, 0, 0, 0.0, 95.0, 1, 31, 20, 38694, 878, 17, 38085, 1, '2016-01-17 22:23:18', '2016-01-17 22:23:18', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269187, 3, 1, 0, 0, 0.0, 90.0, 1, 34, 30, 38694, 580, 17, 32754, 1, '2016-01-17 22:23:18', '2016-01-17 22:23:18', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269188, 4, 1, 0, 0, 0.0, 85.0, 1, 43, 20, 38694, 21985, 4, 38109, 1, '2016-01-17 22:23:18', '2016-01-17 22:23:18', NULL, 0.0, 0.0, 10.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269189, 5, 1, 0, 0, 0.0, 80.0, 1, 45, 70, 38694, 602, 17, 32758, 1, '2016-01-17 22:23:19', '2016-01-17 22:23:19', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269190, 6, 1, 0, 0, 0.0, 75.0, 1, 53, 30, 38694, 601, 17, 32746, 1, '2016-01-17 22:23:19', '2016-01-17 22:23:19', NULL, 0.0, 0.0, 6.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269191, 1, 1, 0, 0, 0.0, 100.0, 0, 44, 70, 38684, 550, 1, 32568, 1, '2016-01-17 22:23:19', '2016-01-17 22:23:19', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269192, 2, 1, 0, 0, 0.0, 95.0, 0, 45, 20, 38684, 578, 17, 38082, 1, '2016-01-17 22:23:19', '2016-01-17 22:23:19', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269193, 3, 1, 0, 0, 0.0, 90.0, 0, 45, 30, 38684, 1455, 17, 32738, 1, '2016-01-17 22:23:19', '2016-01-17 22:23:19', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269194, 4, 1, 0, 0, 0.0, 85.0, 0, 46, 20, 38684, 878, 17, 38085, 1, '2016-01-17 22:23:19', '2016-01-17 22:23:19', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269195, 5, 1, 0, 0, 0.0, 80.0, 0, 48, 30, 38684, 11734, 4, 32701, 1, '2016-01-17 22:23:19', '2016-01-17 22:23:19', NULL, 0.0, 0.0, 8.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269196, 1, 1, 0, 0, 0.0, 100.0, 2, 54, 70, 38689, 1788, 1, 32579, 1, '2016-01-17 22:23:19', '2016-01-17 22:23:19', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269197, 2, 1, 0, 0, 0.0, 95.0, 3, 20, 0, 38689, 20986, 18, 32630, 1, '2016-01-17 22:23:20', '2016-01-17 22:23:20', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269198, 1, 1, 0, 0, 0.0, 100.0, 0, 49, 20, 38687, 468, 1, 32770, 1, '2016-01-17 22:23:20', '2016-01-17 22:23:20', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269199, 2, 1, 0, 0, 0.0, 95.0, 0, 50, 20, 38687, 21040, 18, 32632, 1, '2016-01-17 22:23:20', '2016-01-17 22:23:20', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269200, 3, 1, 0, 0, 0.0, 90.0, 0, 50, 50, 38687, 685, 11, 32652, 1, '2016-01-17 22:23:20', '2016-01-17 22:23:20', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269201, 4, 1, 0, 0, 0.0, 85.0, 0, 57, 90, 38687, 140, 11, 32653, 1, '2016-01-17 22:23:20', '2016-01-17 22:23:20', NULL, 0.0, 0.0, 10.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269202, 1, 1, 0, 0, 0.0, 100.0, 2, 2, 20, 38691, 503, 1, 32584, 1, '2016-01-17 22:23:20', '2016-01-17 22:23:20', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269203, 1, 1, 0, 0, 0.0, 100.0, 0, 50, 60, 38673, 468, 1, 32770, 1, '2016-01-17 22:23:20', '2016-01-17 22:23:20', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269204, 2, 1, 0, 0, 0.0, 95.0, 0, 51, 70, 38673, 685, 11, 32652, 1, '2016-01-17 22:23:20', '2016-01-17 22:23:20', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269205, 3, 1, 0, 0, 0.0, 90.0, 0, 52, 40, 38673, 503, 1, 32584, 1, '2016-01-17 22:23:21', '2016-01-17 22:23:21', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269206, 4, 1, 0, 0, 0.0, 85.0, 0, 53, 70, 38673, 21040, 18, 32632, 1, '2016-01-17 22:23:21', '2016-01-17 22:23:21', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269207, 5, 1, 0, 0, 0.0, 80.0, 0, 57, 10, 38673, 140, 11, 32653, 1, '2016-01-17 22:23:21', '2016-01-17 22:23:21', NULL, 0.0, 0.0, 8.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269208, 1, 1, 0, 0, 0.0, 100.0, 0, 42, 80, 38682, 1807, 18, 32631, 1, '2016-01-17 22:23:21', '2016-01-17 22:23:21', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269209, 2, 1, 0, 0, 0.0, 95.0, 0, 43, 60, 38682, 138, 1, 32564, 1, '2016-01-17 22:23:21', '2016-01-17 22:23:21', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269210, 3, 1, 0, 0, 0.0, 90.0, 0, 44, 30, 38682, 98, 1, 32582, 1, '2016-01-17 22:23:21', '2016-01-17 22:23:21', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269211, 1, 1, 0, 0, 0.0, 100.0, 1, 31, 80, 38678, 98, 1, 32582, 1, '2016-01-17 22:23:21', '2016-01-17 22:23:21', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269212, 2, 1, 0, 0, 0.0, 95.0, 1, 33, 80, 38678, 1088, 17, 32737, 1, '2016-01-17 22:23:21', '2016-01-17 22:23:21', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269213, 1, 1, 0, 0, 0.0, 100.0, 0, 46, 20, 38669, 192, 1, 32563, 1, '2016-01-17 22:23:22', '2016-01-17 22:23:22', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269214, 2, 1, 0, 0, 0.0, 95.0, 0, 46, 70, 38669, 138, 1, 32564, 1, '2016-01-17 22:23:22', '2016-01-17 22:23:22', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269215, 1, 1, 0, 0, 0.0, 100.0, 3, 25, 70, 38703, 1088, 17, 32737, 1, '2016-01-17 22:23:22', '2016-01-17 22:23:22', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269216, 2, 1, 0, 0, 0.0, 95.0, 3, 28, 30, 38703, 1807, 18, 32631, 1, '2016-01-17 22:23:22', '2016-01-17 22:23:22', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269217, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 40, 38713, 21044, 9, 32540, 1, '2016-01-17 22:23:22', '2016-01-17 22:23:22', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269218, 2, 1, 0, 0, 0.0, 95.0, 0, 56, 30, 38713, 5879, 827, 32765, 1, '2016-01-17 22:23:22', '2016-01-17 22:23:22', NULL, 0.0, 0.0, 14.0, 1595, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269219, 1, 1, 0, 0, 0.0, 100.0, 1, 22, 50, 38716, 21044, 9, 32540, 1, '2016-01-17 22:23:22', '2016-01-17 22:23:22', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269220, 2, 1, 0, 0, 0.0, 95.0, 1, 43, 40, 38716, 229, 11, 32660, 1, '2016-01-17 22:23:22', '2016-01-17 22:23:22', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269221, 3, 1, 0, 0, 0.0, 90.0, 2, 24, 60, 38716, 21032, 11, 32659, 1, '2016-01-17 22:23:23', '2016-01-17 22:23:23', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269222, 1, 1, 0, 0, 0.0, 100.0, 0, 38, 80, 38714, 1449, 9, 38091, 1, '2016-01-17 22:23:23', '2016-01-17 22:23:23', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269223, 2, 1, 0, 0, 0.0, 95.0, 0, 46, 10, 38714, 1244, 11, 32658, 1, '2016-01-17 22:23:23', '2016-01-17 22:23:23', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269224, 3, 1, 0, 0, 0.0, 90.0, 0, 52, 60, 38714, 229, 11, 32660, 1, '2016-01-17 22:23:23', '2016-01-17 22:23:23', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269225, 4, 1, 0, 0, 0.0, 85.0, 0, 56, 70, 38714, 5879, 827, 32765, 1, '2016-01-17 22:23:23', '2016-01-17 22:23:23', NULL, 0.0, 0.0, 10.0, 1595, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269226, 5, 1, 0, 0, 0.0, 80.0, 1, 13, 70, 38714, 21032, 11, 32659, 1, '2016-01-17 22:23:23', '2016-01-17 22:23:23', NULL, 0.0, 0.0, 8.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269227, 1, 1, 0, 0, 0.0, 100.0, 2, 48, 90, 38720, 1449, 9, 38091, 1, '2016-01-17 22:23:23', '2016-01-17 22:23:23', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269228, 2, 1, 0, 0, 0.0, 95.0, 3, 32, 50, 38720, 1244, 11, 32658, 1, '2016-01-17 22:23:23', '2016-01-17 22:23:23', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269229, 1, 1, 0, 0, 0.0, 100.0, 2, 13, 0, 38712, 1414, 17, 32731, 1, '2016-01-17 22:23:24', '2016-01-17 22:23:24', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269230, 1, 1, 0, 0, 0.0, 100.0, 1, 4, 10, 38701, 1414, 17, 32731, 1, '2016-01-17 22:23:24', '2016-01-17 22:23:24', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269231, 1, 1, 0, 0, 0.0, 100.0, 0, 32, 20, 38690, 19099, 1, 32593, 1, '2016-01-17 22:23:24', '2016-01-17 22:23:24', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269232, 1, 1, 0, 0, 0.0, 100.0, 1, 13, 50, 38679, 19099, 1, 32593, 1, '2016-01-17 22:23:24', '2016-01-17 22:23:24', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269233, 1, 1, 0, 0, 0.0, 100.0, 0, 27, 80, 38653, 1824, 21, 32526, 1, '2016-01-17 22:23:24', '2016-01-17 22:23:24', NULL, 0.0, 0.0, 16.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269234, 2, 1, 0, 0, 0.0, 95.0, 0, 27, 90, 38653, 1496, 1, 32588, 1, '2016-01-17 22:23:24', '2016-01-17 22:23:24', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269235, 3, 1, 0, 0, 0.0, 90.0, 0, 28, 70, 38653, 21031, 21, 32529, 1, '2016-01-17 22:23:24', '2016-01-17 22:23:24', NULL, 0.0, 0.0, 12.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269236, 4, 1, 0, 0, 0.0, 85.0, 0, 30, 70, 38653, 1308, 32, 32713, 1, '2016-01-17 22:23:24', '2016-01-17 22:23:24', NULL, 0.0, 0.0, 10.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269237, 5, 1, 0, 0, 0.0, 80.0, 0, 30, 90, 38653, 21983, 21, 38070, 1, '2016-01-17 22:23:24', '2016-01-17 22:23:24', NULL, 0.0, 0.0, 8.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269238, 6, 1, 0, 0, 0.0, 75.0, 0, 31, 20, 38653, 4807, 21, 32528, 1, '2016-01-17 22:23:25', '2016-01-17 22:23:25', NULL, 0.0, 0.0, 6.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269239, 7, 1, 0, 0, 0.0, 70.0, 0, 31, 30, 38653, 1531, 32, 32712, 1, '2016-01-17 22:23:25', '2016-01-17 22:23:25', NULL, 0.0, 0.0, 4.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269240, 8, 1, 0, 0, 0.0, 65.0, 0, 33, 40, 38653, 11742, 1, 32587, 1, '2016-01-17 22:23:25', '2016-01-17 22:23:25', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269241, 9, 1, 0, 0, 0.0, 60.0, 0, 33, 60, 38653, 1830, 17, 38074, 1, '2016-01-17 22:23:25', '2016-01-17 22:23:25', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269242, 10, 1, 0, 0, 0.0, 55.0, 0, 34, 80, 38653, 1717, 17, 32736, 1, '2016-01-17 22:23:25', '2016-01-17 22:23:25', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269243, 11, 1, 0, 0, 0.0, 50.0, 0, 35, 30, 38653, 1721, 17, 32759, 1, '2016-01-17 22:23:25', '2016-01-17 22:23:25', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269244, 12, 1, 0, 0, 0.0, 45.0, 0, 37, 0, 38653, 1813, 17, 32735, 1, '2016-01-17 22:23:25', '2016-01-17 22:23:25', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269245, 1, 1, 0, 0, 0.0, 100.0, 1, 2, 70, 38658, 1824, 21, 32526, 1, '2016-01-17 22:23:25', '2016-01-17 22:23:25', NULL, 0.0, 0.0, 16.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269246, 2, 1, 0, 0, 0.0, 95.0, 1, 8, 10, 38658, 1496, 1, 32588, 1, '2016-01-17 22:23:26', '2016-01-17 22:23:26', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269247, 3, 1, 0, 0, 0.0, 90.0, 1, 15, 10, 38658, 11742, 1, 32587, 1, '2016-01-17 22:23:26', '2016-01-17 22:23:26', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269248, 4, 1, 0, 0, 0.0, 85.0, 1, 23, 40, 38658, 1717, 17, 32736, 1, '2016-01-17 22:23:26', '2016-01-17 22:23:26', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269249, 1, 1, 0, 0, 0.0, 100.0, 0, 31, 60, 38654, 4806, 21, 32527, 1, '2016-01-17 22:23:26', '2016-01-17 22:23:26', NULL, 0.0, 0.0, 16.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269250, 2, 1, 0, 0, 0.0, 95.0, 0, 34, 0, 38654, 21031, 21, 32529, 1, '2016-01-17 22:23:26', '2016-01-17 22:23:26', NULL, 0.0, 0.0, 14.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269251, 3, 1, 0, 0, 0.0, 90.0, 0, 36, 10, 38654, 4807, 21, 32528, 1, '2016-01-17 22:23:26', '2016-01-17 22:23:26', NULL, 0.0, 0.0, 12.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269252, 4, 1, 0, 0, 0.0, 85.0, 0, 38, 30, 38654, 1813, 17, 32735, 1, '2016-01-17 22:23:26', '2016-01-17 22:23:26', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269253, 5, 1, 0, 0, 0.0, 80.0, 0, 38, 60, 38654, 1721, 17, 32759, 1, '2016-01-17 22:23:27', '2016-01-17 22:23:27', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269254, 6, 1, 0, 0, 0.0, 75.0, 0, 39, 50, 38654, 1531, 32, 32712, 1, '2016-01-17 22:23:27', '2016-01-17 22:23:27', NULL, 0.0, 0.0, 6.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269255, 7, 1, 0, 0, 0.0, 70.0, 0, 39, 90, 38654, 1830, 17, 38074, 1, '2016-01-17 22:23:27', '2016-01-17 22:23:27', NULL, 0.0, 0.0, 4.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269256, 1, 1, 0, 0, 0.0, 100.0, 2, 15, 50, 38659, 4806, 21, 32527, 1, '2016-01-17 22:23:27', '2016-01-17 22:23:27', NULL, 0.0, 0.0, 16.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269257, 2, 1, 0, 0, 0.0, 95.0, 2, 31, 60, 38659, 1308, 32, 32713, 1, '2016-01-17 22:23:27', '2016-01-17 22:23:27', NULL, 0.0, 0.0, 14.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269258, 3, 1, 0, 0, 0.0, 90.0, 2, 40, 30, 38659, 21983, 21, 38070, 1, '2016-01-17 22:23:27', '2016-01-17 22:23:27', NULL, 0.0, 0.0, 12.0, 1588, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269259, 1, 1, 0, 0, 0.0, 100.0, 0, 26, 20, 38685, 1448, 17, 32750, 1, '2016-01-17 22:23:27', '2016-01-17 22:23:27', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269260, 2, 1, 0, 0, 0.0, 95.0, 0, 28, 90, 38685, 21980, 11, 38106, 1, '2016-01-17 22:23:27', '2016-01-17 22:23:27', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269261, 3, 1, 0, 0, 0.0, 90.0, 0, 29, 0, 38685, 21000, 4, 32702, 1, '2016-01-17 22:23:28', '2016-01-17 22:23:28', NULL, 0.0, 0.0, 12.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269262, 3, 1, 0, 0, 0.0, 90.0, 0, 29, 0, 38685, 1533, 32, 32774, 1, '2016-01-17 22:23:28', '2016-01-17 22:23:28', NULL, 0.0, 0.0, 12.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269263, 4, 1, 0, 0, 0.0, 85.0, 0, 29, 90, 38685, 1025, 1, 32585, 1, '2016-01-17 22:23:28', '2016-01-17 22:23:28', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269264, 5, 1, 0, 0, 0.0, 80.0, 0, 30, 80, 38685, 4849, 9, 32548, 1, '2016-01-17 22:23:28', '2016-01-17 22:23:28', NULL, 0.0, 0.0, 8.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269265, 6, 1, 0, 0, 0.0, 75.0, 0, 32, 70, 38685, 5166, 9, 38110, 1, '2016-01-17 22:23:28', '2016-01-17 22:23:28', NULL, 0.0, 0.0, 6.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269266, 7, 1, 0, 0, 0.0, 70.0, 0, 33, 70, 38685, 1629, 17, 38078, 1, '2016-01-17 22:23:28', '2016-01-17 22:23:28', NULL, 0.0, 0.0, 4.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269267, 8, 1, 0, 0, 0.0, 65.0, 0, 39, 90, 38685, 785, 1, 32569, 1, '2016-01-17 22:23:28', '2016-01-17 22:23:28', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269268, 1, 1, 0, 0, 0.0, 100.0, 1, 12, 60, 38721, 1533, 32, 32774, 1, '2016-01-17 22:23:28', '2016-01-17 22:23:28', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269269, 1, 1, 0, 0, 0.0, 100.0, 0, 38, 60, 38693, 1460, 17, 38073, 1, '2016-01-17 22:23:28', '2016-01-17 22:23:28', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269270, 2, 1, 0, 0, 0.0, 95.0, 0, 40, 50, 38693, 1629, 17, 38078, 1, '2016-01-17 22:23:29', '2016-01-17 22:23:29', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269271, 1, 1, 0, 0, 0.0, 100.0, 2, 20, 50, 38671, 1448, 17, 32750, 1, '2016-01-17 22:23:29', '2016-01-17 22:23:29', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269272, 2, 1, 0, 0, 0.0, 95.0, 2, 32, 60, 38671, 21000, 4, 32702, 1, '2016-01-17 22:23:29', '2016-01-17 22:23:29', NULL, 0.0, 0.0, 14.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269273, 3, 1, 0, 0, 0.0, 90.0, 2, 33, 0, 38671, 1025, 1, 32585, 1, '2016-01-17 22:23:29', '2016-01-17 22:23:29', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269274, 4, 1, 0, 0, 0.0, 85.0, 2, 46, 80, 38671, 4849, 9, 32548, 1, '2016-01-17 22:23:29', '2016-01-17 22:23:29', NULL, 0.0, 0.0, 10.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269275, 4, 1, 0, 0, 0.0, 85.0, 2, 46, 80, 38671, 5166, 9, 38110, 1, '2016-01-17 22:23:29', '2016-01-17 22:23:29', NULL, 0.0, 0.0, 10.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269276, 5, 1, 0, 0, 0.0, 80.0, 2, 53, 20, 38671, 1460, 17, 38073, 1, '2016-01-17 22:23:29', '2016-01-17 22:23:29', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269277, 6, 1, 0, 0, 0.0, 75.0, 3, 0, 40, 38671, 785, 1, 32569, 1, '2016-01-17 22:23:29', '2016-01-17 22:23:29', NULL, 0.0, 0.0, 6.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269278, 1, 1, 0, 0, 0.0, 100.0, 0, 29, 60, 38663, 1102, 17, 32760, 1, '2016-01-17 22:23:30', '2016-01-17 22:23:30', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269279, 2, 1, 0, 0, 0.0, 95.0, 0, 30, 40, 38663, 1612, 32, 32721, 1, '2016-01-17 22:23:30', '2016-01-17 22:23:30', NULL, 0.0, 0.0, 14.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269280, 3, 1, 0, 0, 0.0, 90.0, 0, 30, 60, 38663, 1097, 17, 38079, 1, '2016-01-17 22:23:30', '2016-01-17 22:23:30', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269281, 4, 1, 0, 0, 0.0, 85.0, 0, 32, 40, 38663, 1685, 9, 32534, 1, '2016-01-17 22:23:30', '2016-01-17 22:23:30', NULL, 0.0, 0.0, 10.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269282, 5, 1, 0, 0, 0.0, 80.0, 0, 34, 30, 38663, 867, 17, 32752, 1, '2016-01-17 22:23:30', '2016-01-17 22:23:30', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269283, 6, 1, 0, 0, 0.0, 75.0, 0, 35, 60, 38663, 1279, 1, 32580, 1, '2016-01-17 22:23:30', '2016-01-17 22:23:30', NULL, 0.0, 0.0, 6.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269284, 7, 1, 0, 0, 0.0, 70.0, 0, 35, 80, 38663, 1804, 9, 38090, 1, '2016-01-17 22:23:30', '2016-01-17 22:23:30', NULL, 0.0, 0.0, 4.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269285, 8, 1, 0, 0, 0.0, 65.0, 0, 48, 40, 38663, 21982, 18, 38095, 1, '2016-01-17 22:23:30', '2016-01-17 22:23:30', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269286, 9, 1, 0, 0, 0.0, 60.0, 1, 6, 10, 38663, 1197, 1, 32607, 1, '2016-01-17 22:23:31', '2016-01-17 22:23:31', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269287, 1, 1, 0, 0, 0.0, 100.0, 1, 8, 80, 38692, 1060, 17, 32747, 1, '2016-01-17 22:23:31', '2016-01-17 22:23:31', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269288, 2, 1, 0, 0, 0.0, 95.0, 1, 59, 90, 38692, 21988, 17, 38077, 1, '2016-01-17 22:23:31', '2016-01-17 22:23:31', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269289, 3, 1, 0, 0, 0.0, 90.0, 2, 22, 70, 38692, 1197, 1, 32607, 1, '2016-01-17 22:23:31', '2016-01-17 22:23:31', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269290, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 0, 38665, 1538, 17, 32725, 1, '2016-01-17 22:23:31', '2016-01-17 22:23:31', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269291, 2, 1, 0, 0, 0.0, 95.0, 0, 35, 30, 38665, 1060, 17, 32747, 1, '2016-01-17 22:23:31', '2016-01-17 22:23:31', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269292, 3, 1, 0, 0, 0.0, 90.0, 0, 37, 50, 38665, 1097, 17, 38079, 1, '2016-01-17 22:23:31', '2016-01-17 22:23:31', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269293, 4, 1, 0, 0, 0.0, 85.0, 0, 39, 20, 38665, 20959, 4, 32704, 1, '2016-01-17 22:23:32', '2016-01-17 22:23:32', NULL, 0.0, 0.0, 10.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269294, 5, 1, 0, 0, 0.0, 80.0, 0, 39, 30, 38665, 1279, 1, 32580, 1, '2016-01-17 22:23:32', '2016-01-17 22:23:32', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269295, 6, 1, 0, 0, 0.0, 75.0, 0, 39, 60, 38665, 1612, 32, 32721, 1, '2016-01-17 22:23:32', '2016-01-17 22:23:32', NULL, 0.0, 0.0, 6.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269296, 7, 1, 0, 0, 0.0, 70.0, 0, 41, 30, 38665, 1685, 9, 32534, 1, '2016-01-17 22:23:32', '2016-01-17 22:23:32', NULL, 0.0, 0.0, 4.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269297, 8, 1, 0, 0, 0.0, 65.0, 0, 42, 30, 38665, 867, 17, 32752, 1, '2016-01-17 22:23:32', '2016-01-17 22:23:32', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269298, 9, 1, 0, 0, 0.0, 60.0, 0, 46, 40, 38665, 21982, 18, 38095, 1, '2016-01-17 22:23:32', '2016-01-17 22:23:32', NULL, 0.0, 0.0, 2.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269299, 10, 1, 0, 0, 0.0, 55.0, 0, 51, 40, 38665, 21988, 17, 38077, 1, '2016-01-17 22:23:32', '2016-01-17 22:23:32', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269300, 1, 1, 0, 0, 0.0, 100.0, 2, 23, 80, 38709, 1102, 17, 32760, 1, '2016-01-17 22:23:32', '2016-01-17 22:23:32', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269301, 2, 1, 0, 0, 0.0, 95.0, 2, 38, 20, 38709, 1538, 17, 32725, 1, '2016-01-17 22:23:32', '2016-01-17 22:23:32', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269302, 3, 1, 0, 0, 0.0, 90.0, 3, 0, 40, 38709, 1804, 9, 38090, 1, '2016-01-17 22:23:33', '2016-01-17 22:23:33', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269303, 1, 1, 0, 0, 0.0, 100.0, 0, 29, 50, 38697, 1456, 17, 38081, 1, '2016-01-17 22:23:33', '2016-01-17 22:23:33', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269304, 2, 1, 0, 0, 0.0, 95.0, 0, 30, 10, 38697, 1657, 11, 32651, 1, '2016-01-17 22:23:33', '2016-01-17 22:23:33', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269305, 3, 1, 0, 0, 0.0, 90.0, 0, 31, 60, 38697, 95, 9, 32550, 1, '2016-01-17 22:23:33', '2016-01-17 22:23:33', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269306, 1, 1, 0, 0, 0.0, 100.0, 1, 9, 30, 38710, 1456, 17, 38081, 1, '2016-01-17 22:23:33', '2016-01-17 22:23:33', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269307, 2, 1, 0, 0, 0.0, 95.0, 1, 13, 10, 38710, 1657, 11, 32651, 1, '2016-01-17 22:23:33', '2016-01-17 22:23:33', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269308, 3, 1, 0, 0, 0.0, 90.0, 1, 13, 90, 38710, 95, 9, 32550, 1, '2016-01-17 22:23:33', '2016-01-17 22:23:33', NULL, 0.0, 0.0, 12.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269309, 1, 1, 0, 0, 0.0, 100.0, 0, 36, 60, 38699, 1659, 11, 32650, 1, '2016-01-17 22:23:33', '2016-01-17 22:23:33', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269310, 2, 1, 0, 0, 0.0, 95.0, 0, 38, 90, 38699, 1392, 17, 32726, 1, '2016-01-17 22:23:34', '2016-01-17 22:23:34', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269311, 3, 1, 0, 0, 0.0, 90.0, 0, 40, 90, 38699, 20951, 4, 32699, 1, '2016-01-17 22:23:34', '2016-01-17 22:23:34', NULL, 0.0, 0.0, 12.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269312, 1, 1, 0, 0, 0.0, 100.0, 2, 45, 50, 38711, 1392, 17, 32726, 1, '2016-01-17 22:23:34', '2016-01-17 22:23:34', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269313, 2, 1, 0, 0, 0.0, 95.0, 2, 58, 50, 38711, 1659, 11, 32650, 1, '2016-01-17 22:23:34', '2016-01-17 22:23:34', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269314, 1, 1, 0, 0, 0.0, 100.0, 0, 29, 60, 38686, 1541, 1, 32581, 1, '2016-01-17 22:23:34', '2016-01-17 22:23:34', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269315, 2, 1, 0, 0, 0.0, 95.0, 0, 31, 40, 38686, 1292, 17, 32753, 1, '2016-01-17 22:23:34', '2016-01-17 22:23:34', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269316, 3, 1, 0, 0, 0.0, 90.0, 0, 32, 50, 38686, 585, 17, 38076, 1, '2016-01-17 22:23:34', '2016-01-17 22:23:34', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269317, 4, 1, 0, 0, 0.0, 85.0, 0, 33, 70, 38686, 1436, 17, 32741, 1, '2016-01-17 22:23:34', '2016-01-17 22:23:34', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269318, 5, 1, 0, 0, 0.0, 80.0, 0, 34, 10, 38686, 951, 17, 32742, 1, '2016-01-17 22:23:35', '2016-01-17 22:23:35', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269319, 6, 1, 0, 0, 0.0, 75.0, 0, 37, 10, 38686, 69, 4, 32698, 1, '2016-01-17 22:23:35', '2016-01-17 22:23:35', NULL, 0.0, 0.0, 6.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269320, 7, 1, 0, 0, 0.0, 70.0, 0, 38, 0, 38686, 1766, 17, 32763, 1, '2016-01-17 22:23:35', '2016-01-17 22:23:35', NULL, 0.0, 0.0, 4.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269321, 8, 1, 0, 0, 0.0, 65.0, 0, 38, 50, 38686, 1680, 9, 32546, 1, '2016-01-17 22:23:35', '2016-01-17 22:23:35', NULL, 0.0, 0.0, 2.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269322, 9, 1, 0, 0, 0.0, 60.0, 0, 40, 0, 38686, 1016, 1, 32570, 1, '2016-01-17 22:23:35', '2016-01-17 22:23:35', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269323, 10, 1, 0, 0, 0.0, 55.0, 0, 40, 90, 38686, 754, 17, 32739, 1, '2016-01-17 22:23:35', '2016-01-17 22:23:35', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269324, 11, 1, 0, 0, 0.0, 50.0, 0, 49, 90, 38686, 21042, 9, 32549, 1, '2016-01-17 22:23:35', '2016-01-17 22:23:35', NULL, 0.0, 0.0, 2.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269325, 1, 1, 0, 0, 0.0, 100.0, 1, 11, 60, 38717, 553, 11, 32654, 1, '2016-01-17 22:23:36', '2016-01-17 22:23:36', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269326, 2, 1, 0, 0, 0.0, 95.0, 1, 22, 50, 38717, 1475, 18, 38094, 1, '2016-01-17 22:23:36', '2016-01-17 22:23:36', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269327, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 20, 38672, 1541, 1, 32581, 1, '2016-01-17 22:23:36', '2016-01-17 22:23:36', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269328, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 90, 38672, 553, 11, 32654, 1, '2016-01-17 22:23:36', '2016-01-17 22:23:36', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269329, 7, 1, 0, 0, 0.0, 70.0, 0, 43, 50, 38672, 21042, 9, 32549, 1, '2016-01-17 22:23:36', '2016-01-17 22:23:36', NULL, 0.0, 0.0, 4.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269330, 3, 1, 0, 0, 0.0, 90.0, 0, 40, 30, 38672, 1436, 17, 32741, 1, '2016-01-17 22:23:36', '2016-01-17 22:23:36', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269331, 4, 1, 0, 0, 0.0, 85.0, 0, 40, 50, 38672, 69, 4, 32698, 1, '2016-01-17 22:23:36', '2016-01-17 22:23:36', NULL, 0.0, 0.0, 10.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269332, 5, 1, 0, 0, 0.0, 80.0, 0, 42, 20, 38672, 754, 17, 32739, 1, '2016-01-17 22:23:37', '2016-01-17 22:23:37', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269333, 6, 1, 0, 0, 0.0, 75.0, 0, 42, 50, 38672, 1016, 1, 32570, 1, '2016-01-17 22:23:37', '2016-01-17 22:23:37', NULL, 0.0, 0.0, 6.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269334, 8, 1, 0, 0, 0.0, 65.0, 0, 43, 80, 38672, 1766, 17, 32763, 1, '2016-01-17 22:23:37', '2016-01-17 22:23:37', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269335, 9, 1, 0, 0, 0.0, 60.0, 0, 44, 0, 38672, 1680, 9, 32546, 1, '2016-01-17 22:23:37', '2016-01-17 22:23:37', NULL, 0.0, 0.0, 2.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269336, 1, 1, 0, 0, 0.0, 100.0, 2, 36, 30, 38705, 585, 17, 38076, 1, '2016-01-17 22:23:37', '2016-01-17 22:23:37', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269337, 2, 1, 0, 0, 0.0, 95.0, 2, 40, 80, 38705, 1292, 17, 32753, 1, '2016-01-17 22:23:37', '2016-01-17 22:23:37', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269338, 3, 1, 0, 0, 0.0, 90.0, 2, 51, 90, 38705, 951, 17, 32742, 1, '2016-01-17 22:23:37', '2016-01-17 22:23:37', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269339, 4, 1, 0, 0, 0.0, 85.0, 2, 59, 80, 38705, 1475, 18, 38094, 1, '2016-01-17 22:23:37', '2016-01-17 22:23:37', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269340, 1, 1, 0, 0, 0.0, 100.0, 0, 32, 0, 38664, 4019, 17, 32772, 1, '2016-01-17 22:23:38', '2016-01-17 22:23:38', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269341, 2, 1, 0, 0, 0.0, 95.0, 0, 32, 30, 38664, 23, 1, 32573, 1, '2016-01-17 22:23:38', '2016-01-17 22:23:38', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269342, 3, 1, 0, 0, 0.0, 90.0, 0, 32, 60, 38664, 142, 1, 32559, 1, '2016-01-17 22:23:38', '2016-01-17 22:23:38', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269343, 4, 1, 0, 0, 0.0, 85.0, 0, 34, 10, 38664, 1227, 1, 32562, 1, '2016-01-17 22:23:38', '2016-01-17 22:23:38', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269344, 5, 1, 0, 0, 0.0, 80.0, 0, 35, 20, 38664, 1269, 32, 32717, 1, '2016-01-17 22:23:39', '2016-01-17 22:23:39', NULL, 0.0, 0.0, 8.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269345, 6, 1, 0, 0, 0.0, 75.0, 0, 35, 60, 38664, 1679, 9, 32535, 1, '2016-01-17 22:23:39', '2016-01-17 22:23:39', NULL, 0.0, 0.0, 6.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269346, 7, 1, 0, 0, 0.0, 70.0, 0, 36, 20, 38664, 1116, 17, 32762, 1, '2016-01-17 22:23:39', '2016-01-17 22:23:39', NULL, 0.0, 0.0, 4.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269347, 8, 1, 0, 0, 0.0, 65.0, 0, 36, 80, 38664, 228, 11, 32655, 1, '2016-01-17 22:23:39', '2016-01-17 22:23:39', NULL, 0.0, 0.0, 2.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269348, 9, 1, 0, 0, 0.0, 60.0, 0, 42, 80, 38664, 148, 11, 32657, 1, '2016-01-17 22:23:39', '2016-01-17 22:23:39', NULL, 0.0, 0.0, 2.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269349, 10, 1, 0, 0, 0.0, 55.0, 0, 44, 40, 38664, 1318, 17, 32749, 1, '2016-01-17 22:23:39', '2016-01-17 22:23:39', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269350, 11, 1, 0, 0, 0.0, 50.0, 0, 56, 10, 38664, 746, 11, 32656, 1, '2016-01-17 22:23:40', '2016-01-17 22:23:40', NULL, 0.0, 0.0, 2.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269351, 1, 1, 0, 0, 0.0, 100.0, 1, 4, 70, 38698, 2546, 17, 38084, 1, '2016-01-17 22:23:40', '2016-01-17 22:23:40', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269352, 2, 1, 0, 0, 0.0, 95.0, 1, 26, 70, 38698, 1679, 9, 32535, 1, '2016-01-17 22:23:41', '2016-01-17 22:23:41', NULL, 0.0, 0.0, 14.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269353, 3, 1, 0, 0, 0.0, 90.0, 1, 29, 60, 38698, 228, 11, 32655, 1, '2016-01-17 22:23:41', '2016-01-17 22:23:41', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269354, 1, 1, 0, 0, 0.0, 100.0, 0, 36, 20, 38666, 142, 1, 32559, 1, '2016-01-17 22:23:41', '2016-01-17 22:23:41', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269355, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 20, 38666, 1426, 17, 32727, 1, '2016-01-17 22:23:41', '2016-01-17 22:23:41', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269356, 3, 1, 0, 0, 0.0, 90.0, 0, 39, 50, 38666, 1227, 1, 32562, 1, '2016-01-17 22:23:41', '2016-01-17 22:23:41', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269357, 4, 1, 0, 0, 0.0, 85.0, 0, 39, 60, 38666, 1116, 17, 32762, 1, '2016-01-17 22:23:41', '2016-01-17 22:23:41', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269358, 5, 1, 0, 0, 0.0, 80.0, 0, 42, 70, 38666, 1269, 32, 32717, 1, '2016-01-17 22:23:42', '2016-01-17 22:23:42', NULL, 0.0, 0.0, 8.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269359, 5, 1, 0, 0, 0.0, 80.0, 0, 42, 70, 38666, 148, 11, 32657, 1, '2016-01-17 22:23:42', '2016-01-17 22:23:42', NULL, 0.0, 0.0, 8.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269360, 6, 1, 0, 0, 0.0, 75.0, 0, 50, 20, 38666, 746, 11, 32656, 1, '2016-01-17 22:23:42', '2016-01-17 22:23:42', NULL, 0.0, 0.0, 6.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269361, 7, 1, 0, 0, 0.0, 70.0, 0, 50, 30, 38666, 1318, 17, 32749, 1, '2016-01-17 22:23:42', '2016-01-17 22:23:42', NULL, 0.0, 0.0, 4.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269362, 1, 1, 0, 0, 0.0, 100.0, 2, 23, 30, 38674, 2546, 17, 38084, 1, '2016-01-17 22:23:42', '2016-01-17 22:23:42', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269363, 2, 1, 0, 0, 0.0, 95.0, 2, 42, 0, 38674, 23, 1, 32573, 1, '2016-01-17 22:23:42', '2016-01-17 22:23:42', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269364, 3, 1, 0, 0, 0.0, 90.0, 2, 46, 40, 38674, 4019, 17, 32772, 1, '2016-01-17 22:23:42', '2016-01-17 22:23:42', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269365, 4, 1, 0, 0, 0.0, 85.0, 2, 50, 90, 38674, 1426, 17, 32727, 1, '2016-01-17 22:23:42', '2016-01-17 22:23:42', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269366, 1, 1, 0, 0, 0.0, 100.0, 0, 27, 60, 38680, 803, 5, 32708, 1, '2016-01-17 22:23:43', '2016-01-17 22:23:43', NULL, 0.0, 0.0, 16.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269367, 2, 1, 0, 0, 0.0, 95.0, 0, 38, 40, 38680, 590, 17, 32748, 1, '2016-01-17 22:23:43', '2016-01-17 22:23:43', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269368, 3, 1, 0, 0, 0.0, 90.0, 0, 39, 50, 38680, 51, 1, 32560, 1, '2016-01-17 22:23:43', '2016-01-17 22:23:43', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269369, 4, 1, 0, 0, 0.0, 85.0, 0, 43, 30, 38680, 772, 17, 32732, 1, '2016-01-17 22:23:43', '2016-01-17 22:23:43', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269370, 1, 1, 0, 0, 0.0, 100.0, 1, 11, 0, 38667, 803, 5, 32708, 1, '2016-01-17 22:23:43', '2016-01-17 22:23:43', NULL, 0.0, 0.0, 16.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269371, 2, 1, 0, 0, 0.0, 95.0, 1, 32, 90, 38667, 51, 1, 32560, 1, '2016-01-17 22:23:43', '2016-01-17 22:23:43', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269372, 3, 1, 0, 0, 0.0, 90.0, 1, 33, 40, 38667, 1117, 17, 32745, 1, '2016-01-17 22:23:43', '2016-01-17 22:23:43', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269373, 1, 1, 0, 0, 0.0, 100.0, 0, 40, 60, 38702, 772, 17, 32732, 1, '2016-01-17 22:23:43', '2016-01-17 22:23:43', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269374, 2, 1, 0, 0, 0.0, 95.0, 0, 42, 20, 38702, 590, 17, 32748, 1, '2016-01-17 22:23:44', '2016-01-17 22:23:44', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269375, 1, 1, 0, 0, 0.0, 100.0, 3, 14, 80, 38706, 1117, 17, 32745, 1, '2016-01-17 22:23:44', '2016-01-17 22:23:44', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269376, 1, 1, 0, 0, 0.0, 100.0, 0, 37, 20, 38688, 64, 1, 32577, 1, '2016-01-17 22:23:44', '2016-01-17 22:23:44', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269377, 2, 1, 0, 0, 0.0, 95.0, 0, 44, 50, 38688, 773, 1, 32574, 1, '2016-01-17 22:23:44', '2016-01-17 22:23:44', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269378, 3, 1, 0, 0, 0.0, 90.0, 0, 45, 50, 38688, 230, 4, 38108, 1, '2016-01-17 22:23:44', '2016-01-17 22:23:44', NULL, 0.0, 0.0, 12.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269379, 1, 1, 0, 0, 0.0, 100.0, 1, 38, 40, 38675, 773, 1, 32574, 1, '2016-01-17 22:23:44', '2016-01-17 22:23:44', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269380, 1, 1, 0, 0, 0.0, 100.0, 0, 41, 90, 38715, 1450, 9, 32538, 1, '2016-01-17 22:23:44', '2016-01-17 22:23:44', NULL, 0.0, 0.0, 16.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269381, 2, 1, 0, 0, 0.0, 95.0, 0, 44, 20, 38715, 230, 4, 38108, 1, '2016-01-17 22:23:44', '2016-01-17 22:23:44', NULL, 0.0, 0.0, 14.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269382, 3, 1, 0, 0, 0.0, 90.0, 0, 44, 70, 38715, 114, 11, 32661, 1, '2016-01-17 22:23:45', '2016-01-17 22:23:45', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269383, 1, 1, 0, 0, 0.0, 100.0, 3, 9, 90, 38676, 64, 1, 32577, 1, '2016-01-17 22:23:45', '2016-01-17 22:23:45', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269384, 2, 1, 0, 0, 0.0, 95.0, 3, 14, 70, 38676, 1450, 9, 32538, 1, '2016-01-17 22:23:45', '2016-01-17 22:23:45', NULL, 0.0, 0.0, 14.0, 1583, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (269385, 3, 1, 0, 0, 0.0, 90.0, 3, 20, 70, 38676, 114, 11, 32661, 1, '2016-01-17 22:23:45', '2016-01-17 22:23:45', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);


-- Meeting 15103
-- 'Results acquired' flag setting:
UPDATE meetings SET are_results_acquired = '1' WHERE id = 15103;


-- Meeting 15103
-- 'has_start_list' flag setting:
UPDATE meetings SET has_start_list = '1' WHERE id = 15103;

-- --- BeginTimeCalculator: compute_for_all( 15103 )
-- ----------------------------------------------------
-- Using RESULTS to compute heat length.

-- Event #1, M.Prg: 38653, tot. athletes: 12
-- Tot. progr. duration: 188 (sec), Heat durations: [9700, 9120] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 38653;

-- Event #1, M.Prg: 38656, tot. athletes: 6
-- Tot. progr. duration: 99 (sec), Heat durations: [9920] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:05:08 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:05' WHERE id = 38656;

-- Event #2, M.Prg: 38657, tot. athletes: 9
-- Tot. progr. duration: 212 (sec), Heat durations: [10990, 10260] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:06:47 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:06' WHERE id = 38657;

-- Event #2, M.Prg: 38654, tot. athletes: 7
-- Tot. progr. duration: 191 (sec), Heat durations: [9990, 9160] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:10:19 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:10' WHERE id = 38654;

-- Event #3, M.Prg: 38655, tot. athletes: 4
-- Tot. progr. duration: 107 (sec), Heat durations: [10730] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:13:30 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:13' WHERE id = 38655;

-- Event #3, M.Prg: 38693, tot. athletes: 2
-- Tot. progr. duration: 100 (sec), Heat durations: [10050] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:15:17 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:15' WHERE id = 38693;

-- Event #4, M.Prg: 38658, tot. athletes: 4
-- Tot. progr. duration: 143 (sec), Heat durations: [14340] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:16:57 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:16' WHERE id = 38658;

-- Event #4, M.Prg: 38661, tot. athletes: 10
-- Tot. progr. duration: 300 (sec), Heat durations: [15650, 14430] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:19:20 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:19' WHERE id = 38661;

-- Event #5, M.Prg: 38659, tot. athletes: 3
-- Tot. progr. duration: 220 (sec), Heat durations: [22030] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:24:20 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:24' WHERE id = 38659;

-- Event #5, M.Prg: 38677, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:28:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:28' WHERE id = 38677;

-- Event #6, M.Prg: 38660, tot. athletes: 1
-- Tot. progr. duration: 147 (sec), Heat durations: [14740] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:28:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:28' WHERE id = 38660;

-- Event #7, M.Prg: 38685, tot. athletes: 9
-- Tot. progr. duration: 188 (sec), Heat durations: [9990, 8900] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:30:27 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:30' WHERE id = 38685;

-- Event #7, M.Prg: 38662, tot. athletes: 4
-- Tot. progr. duration: 105 (sec), Heat durations: [10560] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:33:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:33' WHERE id = 38662;

-- Event #7, M.Prg: 38721, tot. athletes: 1
-- Tot. progr. duration: 132 (sec), Heat durations: [13260] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:35:20 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:35' WHERE id = 38721;

-- Event #8, M.Prg: 38695, tot. athletes: 5
-- Tot. progr. duration: 100 (sec), Heat durations: [10080] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:37:32 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:37' WHERE id = 38695;

-- Event #8, M.Prg: 38663, tot. athletes: 9
-- Tot. progr. duration: 216 (sec), Heat durations: [12610, 9060] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:39:12 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:39' WHERE id = 38663;

-- Event #9, M.Prg: 38664, tot. athletes: 11
-- Tot. progr. duration: 211 (sec), Heat durations: [11610, 9520] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:42:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:42' WHERE id = 38664;

-- Event #9, M.Prg: 38682, tot. athletes: 3
-- Tot. progr. duration: 104 (sec), Heat durations: [10430] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:46:19 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:46' WHERE id = 38682;

-- Event #10, M.Prg: 38665, tot. athletes: 10
-- Tot. progr. duration: 210 (sec), Heat durations: [11140, 9920] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:48:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:48' WHERE id = 38665;

-- Event #10, M.Prg: 38700, tot. athletes: 2
-- Tot. progr. duration: 104 (sec), Heat durations: [10420] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:51:33 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:51' WHERE id = 38700;

-- Event #11, M.Prg: 38669, tot. athletes: 2
-- Tot. progr. duration: 106 (sec), Heat durations: [10670] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:53:17 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:53' WHERE id = 38669;

-- Event #11, M.Prg: 38666, tot. athletes: 8
-- Tot. progr. duration: 207 (sec), Heat durations: [11030, 9720] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:55:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:55' WHERE id = 38666;

-- Event #12, M.Prg: 38667, tot. athletes: 3
-- Tot. progr. duration: 153 (sec), Heat durations: [15340] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:58:30 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:58' WHERE id = 38667;

-- Event #12, M.Prg: 38716, tot. athletes: 3
-- Tot. progr. duration: 204 (sec), Heat durations: [20460] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:01:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:01' WHERE id = 38716;

-- Event #13, M.Prg: 38668, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:04:27 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:04' WHERE id = 38668;

-- Event #13, M.Prg: 38719, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:04:27 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:04' WHERE id = 38719;

-- Event #14, M.Prg: 38670, tot. athletes: 9
-- Tot. progr. duration: 206 (sec), Heat durations: [10690, 9940] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:04:27 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:04' WHERE id = 38670;

-- Event #14, M.Prg: 38697, tot. athletes: 3
-- Tot. progr. duration: 91 (sec), Heat durations: [9160] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:07:53 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:07' WHERE id = 38697;

-- Event #15, M.Prg: 38671, tot. athletes: 7
-- Tot. progr. duration: 440 (sec), Heat durations: [24040, 20050] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:09:24 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:09' WHERE id = 38671;

-- Event #15, M.Prg: 38683, tot. athletes: 3
-- Tot. progr. duration: 251 (sec), Heat durations: [25140] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:16:44 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:16' WHERE id = 38683;

-- Event #16, M.Prg: 38672, tot. athletes: 9
-- Tot. progr. duration: 204 (sec), Heat durations: [10400, 10030] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:20:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:20' WHERE id = 38672;

-- Event #16, M.Prg: 38673, tot. athletes: 5
-- Tot. progr. duration: 117 (sec), Heat durations: [11710] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:24:19 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:24' WHERE id = 38673;

-- Event #17, M.Prg: 38674, tot. athletes: 4
-- Tot. progr. duration: 230 (sec), Heat durations: [23090] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:26:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:26' WHERE id = 38674;

-- Event #17, M.Prg: 38703, tot. athletes: 2
-- Tot. progr. duration: 268 (sec), Heat durations: [26830] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:30:06 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:30' WHERE id = 38703;

-- Event #18, M.Prg: 38675, tot. athletes: 1
-- Tot. progr. duration: 158 (sec), Heat durations: [15840] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:34:34 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:34' WHERE id = 38675;

-- Event #18, M.Prg: 38712, tot. athletes: 1
-- Tot. progr. duration: 193 (sec), Heat durations: [19300] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:37:12 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:37' WHERE id = 38712;

-- Event #19, M.Prg: 38676, tot. athletes: 3
-- Tot. progr. duration: 260 (sec), Heat durations: [26070] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:40:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:40' WHERE id = 38676;

-- Event #20, M.Prg: 38698, tot. athletes: 3
-- Tot. progr. duration: 149 (sec), Heat durations: [14960] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:44:45 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:44' WHERE id = 38698;

-- Event #20, M.Prg: 38678, tot. athletes: 2
-- Tot. progr. duration: 153 (sec), Heat durations: [15380] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:47:14 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:47' WHERE id = 38678;

-- Event #21, M.Prg: 38679, tot. athletes: 1
-- Tot. progr. duration: 133 (sec), Heat durations: [13350] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:49:47 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:49' WHERE id = 38679;

-- Event #21, M.Prg: 38696, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:52:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:52' WHERE id = 38696;

-- Event #22, M.Prg: 38713, tot. athletes: 2
-- Tot. progr. duration: 116 (sec), Heat durations: [11630] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:52:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:52' WHERE id = 38713;

-- Event #22, M.Prg: 38680, tot. athletes: 4
-- Tot. progr. duration: 103 (sec), Heat durations: [10330] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:53:56 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:53' WHERE id = 38680;

-- Event #23, M.Prg: 38690, tot. athletes: 1
-- Tot. progr. duration: 92 (sec), Heat durations: [9220] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:55:39 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:55' WHERE id = 38690;

-- Event #23, M.Prg: 38681, tot. athletes: 2
-- Tot. progr. duration: 97 (sec), Heat durations: [9790] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:57:11 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:57' WHERE id = 38681;

-- Event #24, M.Prg: 38699, tot. athletes: 3
-- Tot. progr. duration: 100 (sec), Heat durations: [10090] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:58:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:58' WHERE id = 38699;

-- Event #24, M.Prg: 38684, tot. athletes: 5
-- Tot. progr. duration: 108 (sec), Heat durations: [10830] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:00:28 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:00' WHERE id = 38684;

-- Event #25, M.Prg: 38686, tot. athletes: 11
-- Tot. progr. duration: 204 (sec), Heat durations: [10990, 9410] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:02:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:02' WHERE id = 38686;

-- Event #25, M.Prg: 38687, tot. athletes: 4
-- Tot. progr. duration: 117 (sec), Heat durations: [11790] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:05:40 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:05' WHERE id = 38687;

-- Event #26, M.Prg: 38688, tot. athletes: 3
-- Tot. progr. duration: 105 (sec), Heat durations: [10550] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:07:37 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:07' WHERE id = 38688;

-- Event #27, M.Prg: 38689, tot. athletes: 2
-- Tot. progr. duration: 260 (sec), Heat durations: [26000] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:09:22 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:09' WHERE id = 38689;

-- Event #27, M.Prg: 38711, tot. athletes: 2
-- Tot. progr. duration: 238 (sec), Heat durations: [23850] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:13:42 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:13' WHERE id = 38711;

-- Event #28, M.Prg: 38691, tot. athletes: 1
-- Tot. progr. duration: 182 (sec), Heat durations: [18220] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:17:40 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:17' WHERE id = 38691;

-- Event #28, M.Prg: 38717, tot. athletes: 2
-- Tot. progr. duration: 142 (sec), Heat durations: [14250] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:20:42 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:20' WHERE id = 38717;

-- Event #29, M.Prg: 38692, tot. athletes: 3
-- Tot. progr. duration: 202 (sec), Heat durations: [20270] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:23:04 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:23' WHERE id = 38692;

-- Event #29, M.Prg: 38708, tot. athletes: 3
-- Tot. progr. duration: 149 (sec), Heat durations: [14930] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:26:26 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:26' WHERE id = 38708;

-- Event #30, M.Prg: 38694, tot. athletes: 6
-- Tot. progr. duration: 173 (sec), Heat durations: [17330] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:28:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:28' WHERE id = 38694;

-- Event #30, M.Prg: 38710, tot. athletes: 3
-- Tot. progr. duration: 133 (sec), Heat durations: [13390] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:31:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:31' WHERE id = 38710;

-- Event #31, M.Prg: 38701, tot. athletes: 1
-- Tot. progr. duration: 124 (sec), Heat durations: [12410] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:34:01 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:34' WHERE id = 38701;

-- Event #31, M.Prg: 38715, tot. athletes: 3
-- Tot. progr. duration: 104 (sec), Heat durations: [10470] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:36:05 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:36' WHERE id = 38715;

-- Event #32, M.Prg: 38702, tot. athletes: 2
-- Tot. progr. duration: 102 (sec), Heat durations: [10220] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:37:49 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:37' WHERE id = 38702;

-- Event #32, M.Prg: 38714, tot. athletes: 5
-- Tot. progr. duration: 133 (sec), Heat durations: [13370] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:39:31 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:39' WHERE id = 38714;

-- Event #33, M.Prg: 38709, tot. athletes: 3
-- Tot. progr. duration: 240 (sec), Heat durations: [24040] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:41:44 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:41' WHERE id = 38709;

-- Event #33, M.Prg: 38704, tot. athletes: 2
-- Tot. progr. duration: 257 (sec), Heat durations: [25760] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:45:44 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:45' WHERE id = 38704;

-- Event #34, M.Prg: 38705, tot. athletes: 4
-- Tot. progr. duration: 239 (sec), Heat durations: [23980] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:50:01 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:50' WHERE id = 38705;

-- Event #35, M.Prg: 38706, tot. athletes: 1
-- Tot. progr. duration: 254 (sec), Heat durations: [25480] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:54:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:54' WHERE id = 38706;

-- Event #35, M.Prg: 38720, tot. athletes: 2
-- Tot. progr. duration: 272 (sec), Heat durations: [27250] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:58:14 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:58' WHERE id = 38720;

-- Event #36, M.Prg: 38718, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:02:46 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:02' WHERE id = 38718;

-- Event #36, M.Prg: 38707, tot. athletes: 2
-- Tot. progr. duration: 108 (sec), Heat durations: [10880] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:02:46 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:02' WHERE id = 38707;


-- Last completed phase code: 30
