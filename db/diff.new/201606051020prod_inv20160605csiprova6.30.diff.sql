-- *** SQL Diff file for inv20160605csiprova6.csv ***
-- Timestamp: 201606051020
INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (74015, 29, 900, 2, 1, '2016-06-05 10:23:24', '2016-06-05 10:23:24', 1, 0, '2000-01-01 15:56:38', 3890, 1, NULL);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (27345, 'BIANCHI', 'RICCARDO', 1994, NULL, NULL, NULL, '', NULL, 1, 1, '2016-06-05 10:23:25', '2016-06-05 10:23:25', 'BIANCHI RICCARDO', 0);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (27346, 'SILVESTRI', 'RAFFAELE', 1968, NULL, NULL, NULL, '', NULL, 1, 1, '2016-06-05 10:23:25', '2016-06-05 10:23:25', 'SILVESTRI RAFFAELE', 0);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (55484, '?', 151, 27346, 32, 901, 1, '2016-06-05 10:23:25', '2016-06-05 10:23:25', 5, 1590, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (55485, '?', 151, 27345, 1, 896, 1, '2016-06-05 10:23:25', '2016-06-05 10:23:25', 5, 1589, NULL);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6110, '2016-06-05 10:23:25', '2016-06-05 10:23:25', NULL, NULL, NULL, NULL, 73815, 228, 11, 1585, 32655, NULL, 1, 1, 28, 90, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6111, '2016-06-05 10:23:25', '2016-06-05 10:23:25', NULL, NULL, NULL, NULL, 73784, 1604, 18, 1592, 32634, NULL, 1, 0, 28, 50, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6112, '2016-06-05 10:23:25', '2016-06-05 10:23:25', NULL, NULL, NULL, NULL, 74015, 21040, 18, 1592, 32632, NULL, 1, 2, 0, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6113, '2016-06-05 10:23:25', '2016-06-05 10:23:25', NULL, NULL, NULL, NULL, 73773, 1270, 32, 1590, 32716, NULL, 1, 0, 35, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6114, '2016-06-05 10:23:25', '2016-06-05 10:23:25', NULL, NULL, NULL, NULL, 73770, 1270, 32, 1590, 32716, NULL, 1, 0, 45, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6115, '2016-06-05 10:23:25', '2016-06-05 10:23:25', NULL, NULL, NULL, NULL, 73770, 27346, 32, 1590, 55484, NULL, 1, 0, 40, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6116, '2016-06-05 10:23:25', '2016-06-05 10:23:25', NULL, NULL, NULL, NULL, 73815, 27346, 32, 1590, 55484, NULL, 1, 1, 30, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6117, '2016-06-05 10:23:25', '2016-06-05 10:23:25', NULL, NULL, NULL, NULL, 73784, 27345, 1, 1589, 55485, NULL, 1, 0, 32, 50, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6118, '2016-06-05 10:23:26', '2016-06-05 10:23:26', NULL, NULL, NULL, NULL, 73821, 27345, 1, 1589, 55485, NULL, 1, 0, 40, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6119, '2016-06-05 10:23:26', '2016-06-05 10:23:26', NULL, NULL, NULL, NULL, 73812, 1777, 1, 1589, 32586, NULL, 1, 0, 32, 50, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436759, 1, 1, 0, 0, 0.0, 100.0, 9, 41, 80, 73779, 1308, 32, 32713, 1, '2016-06-05 10:23:26', '2016-06-05 10:23:26', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436760, 1, 1, 0, 0, 0.0, 100.0, 9, 48, 90, 73780, 1612, 32, 32721, 1, '2016-06-05 10:23:26', '2016-06-05 10:23:26', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436761, 3, 1, 0, 0, 0.0, 90.0, 13, 2, 80, 73791, 11732, 35, 32709, 1, '2016-06-05 10:23:26', '2016-06-05 10:23:26', NULL, 0.0, 0.0, 12.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436762, 2, 1, 0, 0, 0.0, 95.0, 11, 55, 90, 73780, 1409, 35, 32710, 1, '2016-06-05 10:23:26', '2016-06-05 10:23:26', NULL, 0.0, 0.0, 14.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436763, 1, 1, 0, 0, 0.0, 100.0, 9, 52, 0, 73792, 1452, 35, 55420, 1, '2016-06-05 10:23:26', '2016-06-05 10:23:26', NULL, 0.0, 0.0, 16.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436764, 3, 1, 0, 0, 0.0, 90.0, 11, 36, 40, 73798, 1475, 18, 38094, 1, '2016-06-05 10:23:26', '2016-06-05 10:23:26', NULL, 0.0, 0.0, 12.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436765, 4, 1, 0, 0, 0.0, 85.0, 12, 55, 20, 73800, 22158, 18, 38735, 1, '2016-06-05 10:23:26', '2016-06-05 10:23:26', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436766, 3, 1, 0, 0, 0.0, 90.0, 12, 51, 10, 73800, 228, 11, 32655, 1, '2016-06-05 10:23:26', '2016-06-05 10:23:26', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436767, 1, 1, 0, 0, 0.0, 100.0, 12, 32, 10, 73811, 114, 11, 32661, 1, '2016-06-05 10:23:27', '2016-06-05 10:23:27', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436768, 3, 1, 0, 0, 0.0, 90.0, 15, 8, 20, 73811, 230, 4, 38108, 1, '2016-06-05 10:23:27', '2016-06-05 10:23:27', NULL, 0.0, 0.0, 12.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436769, 2, 1, 0, 0, 0.0, 95.0, 10, 40, 90, 73800, 1227, 1, 32562, 1, '2016-06-05 10:23:27', '2016-06-05 10:23:27', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436770, 2, 1, 0, 0, 0.0, 95.0, 10, 48, 20, 73779, 1430, 1, 41519, 1, '2016-06-05 10:23:27', '2016-06-05 10:23:27', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436771, 4, 1, 0, 0, 0.0, 85.0, 12, 20, 20, 73798, 1016, 1, 32570, 1, '2016-06-05 10:23:27', '2016-06-05 10:23:27', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436772, 2, 1, 0, 0, 0.0, 95.0, 12, 49, 70, 73811, 773, 1, 32574, 1, '2016-06-05 10:23:27', '2016-06-05 10:23:27', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436773, 2, 1, 0, 0, 0.0, 95.0, 9, 58, 70, 73792, 1025, 1, 32585, 1, '2016-06-05 10:23:27', '2016-06-05 10:23:27', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436774, 1, 1, 0, 0, 0.0, 100.0, 10, 38, 30, 73800, 23, 1, 32573, 1, '2016-06-05 10:23:27', '2016-06-05 10:23:27', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436775, 2, 1, 0, 0, 0.0, 95.0, 11, 32, 70, 73798, 1436, 17, 32741, 1, '2016-06-05 10:23:27', '2016-06-05 10:23:27', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436776, 1, 1, 0, 0, 0.0, 100.0, 13, 53, 90, 73838, 590, 17, 32748, 1, '2016-06-05 10:23:28', '2016-06-05 10:23:28', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);


-- Meeting 15106
-- 'Results acquired' flag setting:
UPDATE meetings SET are_results_acquired = '1' WHERE id = 15106;


-- Meeting 15106
-- 'has_start_list' flag setting:
UPDATE meetings SET has_start_list = '1' WHERE id = 15106;

-- --- BeginTimeCalculator: compute_for_all( 15106 )
-- ----------------------------------------------------
-- Using RESULTS to compute heat length.

-- Event #1, M.Prg: 73769, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73769;

-- Event #1, M.Prg: 73781, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73781;

-- Event #2, M.Prg: 73770, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73770;

-- Event #2, M.Prg: 73829, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73829;

-- Event #3, M.Prg: 73828, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73828;

-- Event #3, M.Prg: 73771, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73771;

-- Event #4, M.Prg: 73786, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73786;

-- Event #4, M.Prg: 73772, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73772;

-- Event #5, M.Prg: 73773, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73773;

-- Event #6, M.Prg: 73797, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73797;

-- Event #6, M.Prg: 73774, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73774;

-- Event #7, M.Prg: 73789, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73789;

-- Event #7, M.Prg: 73775, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73775;

-- Event #8, M.Prg: 73807, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73807;

-- Event #8, M.Prg: 73776, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73776;

-- Event #9, M.Prg: 73777, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73777;

-- Event #9, M.Prg: 73804, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73804;

-- Event #10, M.Prg: 73778, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73778;

-- Event #10, M.Prg: 73821, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73821;

-- Event #11, M.Prg: 73779, tot. athletes: 2
-- Tot. progr. duration: 708 (sec), Heat durations: [70820] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 73779;

-- Event #11, M.Prg: 73801, tot. athletes: 2
-- Tot. progr. duration: 786 (sec), Heat durations: [78670] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 15:13:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:13' WHERE id = 73801;

-- Event #12, M.Prg: 73780, tot. athletes: 2
-- Tot. progr. duration: 775 (sec), Heat durations: [77590] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 15:26:54 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:26' WHERE id = 73780;

-- Event #12, M.Prg: 73839, tot. athletes: 1
-- Tot. progr. duration: 872 (sec), Heat durations: [87280] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 15:39:49 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:39' WHERE id = 73839;

-- Event #13, M.Prg: 73843, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:54:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 73843;

-- Event #13, M.Prg: 73782, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:54:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 73782;

-- Event #14, M.Prg: 73783, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:54:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 73783;

-- Event #14, M.Prg: 73823, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:54:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 73823;

-- Event #15, M.Prg: 73812, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:54:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 73812;

-- Event #15, M.Prg: 73784, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:54:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 73784;

-- Event #16, M.Prg: 73785, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:54:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 73785;

-- Event #17, M.Prg: 73787, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:54:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 73787;

-- Event #17, M.Prg: 73817, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:54:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 73817;

-- Event #18, M.Prg: 73788, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:54:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 73788;

-- Event #18, M.Prg: 73832, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:54:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 73832;

-- Event #19, M.Prg: 73814, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:54:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 73814;

-- Event #19, M.Prg: 73790, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:54:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 73790;

-- Event #20, M.Prg: 73791, tot. athletes: 3
-- Tot. progr. duration: 842 (sec), Heat durations: [84280] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 15:54:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:54' WHERE id = 73791;

-- Event #20, M.Prg: 73792, tot. athletes: 2
-- Tot. progr. duration: 658 (sec), Heat durations: [65870] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 16:08:23 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:08' WHERE id = 73792;

-- Event #21, M.Prg: 73826, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:19:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:19' WHERE id = 73826;

-- Event #21, M.Prg: 73793, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:19:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:19' WHERE id = 73793;

-- Event #22, M.Prg: 73794, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:19:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:19' WHERE id = 73794;

-- Event #23, M.Prg: 73795, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:19:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:19' WHERE id = 73795;

-- Event #23, M.Prg: 73796, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:19:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:19' WHERE id = 73796;

-- Event #24, M.Prg: 73809, tot. athletes: 3
-- Tot. progr. duration: 1086 (sec), Heat durations: [108640] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 16:19:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:19' WHERE id = 73809;

-- Event #24, M.Prg: 73798, tot. athletes: 4
-- Tot. progr. duration: 800 (sec), Heat durations: [80020] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 16:37:27 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:37' WHERE id = 73798;

-- Event #25, M.Prg: 73799, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:50:47 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:50' WHERE id = 73799;

-- Event #25, M.Prg: 73815, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:50:47 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:50' WHERE id = 73815;

-- Event #26, M.Prg: 73800, tot. athletes: 4
-- Tot. progr. duration: 835 (sec), Heat durations: [83520] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 16:50:47 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:50' WHERE id = 73800;

-- Event #26, M.Prg: 73830, tot. athletes: 3
-- Tot. progr. duration: 846 (sec), Heat durations: [84670] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:04:42 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:04' WHERE id = 73830;

-- Event #27, M.Prg: 73808, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:18:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:18' WHERE id = 73808;

-- Event #27, M.Prg: 73802, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:18:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:18' WHERE id = 73802;

-- Event #28, M.Prg: 73803, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:18:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:18' WHERE id = 73803;

-- Event #28, M.Prg: 73822, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:18:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:18' WHERE id = 73822;

-- Event #29, M.Prg: 74015, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:18:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:18' WHERE id = 74015;

-- Event #29, M.Prg: 73816, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:18:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:18' WHERE id = 73816;

-- Event #29, M.Prg: 73805, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:18:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:18' WHERE id = 73805;

-- Event #30, M.Prg: 73806, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:18:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:18' WHERE id = 73806;

-- Event #31, M.Prg: 73838, tot. athletes: 1
-- Tot. progr. duration: 893 (sec), Heat durations: [89390] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:18:48 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:18' WHERE id = 73838;

-- Event #31, M.Prg: 73810, tot. athletes: 2
-- Tot. progr. duration: 1034 (sec), Heat durations: [103400] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:33:41 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:33' WHERE id = 73810;

-- Event #32, M.Prg: 73811, tot. athletes: 3
-- Tot. progr. duration: 968 (sec), Heat durations: [96820] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:50:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:50' WHERE id = 73811;

-- Event #33, M.Prg: 73813, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73813;

-- Event #33, M.Prg: 73834, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73834;

-- Event #34, M.Prg: 73842, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73842;

-- Event #34, M.Prg: 73818, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73818;

-- Event #35, M.Prg: 73819, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73819;

-- Event #36, M.Prg: 73820, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73820;

-- Event #36, M.Prg: 73837, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73837;

-- Event #37, M.Prg: 73824, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73824;

-- Event #37, M.Prg: 73835, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73835;

-- Event #38, M.Prg: 73825, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73825;

-- Event #38, M.Prg: 73831, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73831;

-- Event #39, M.Prg: 73827, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73827;

-- Event #39, M.Prg: 73836, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73836;

-- Event #40, M.Prg: 73833, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73833;

-- Event #41, M.Prg: 73840, tot. athletes: 1
-- Tot. progr. duration: 908 (sec), Heat durations: [90840] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 18:07:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73840;

-- Event #42, M.Prg: 73841, tot. athletes: 1
-- Tot. progr. duration: 808 (sec), Heat durations: [80820] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 18:22:11 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:22' WHERE id = 73841;

-- Event #43, M.Prg: 73844, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:35:39 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:35' WHERE id = 73844;


-- Last completed phase code: 30
