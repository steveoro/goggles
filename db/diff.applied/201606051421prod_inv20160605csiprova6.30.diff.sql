-- *** SQL Diff file for inv20160605csiprova6.csv ***
-- Timestamp: 201606051421
INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (27347, 'ASPIDOVA', 'LARISSA', 1967, NULL, NULL, NULL, '', NULL, 2, 1, '2016-06-05 14:22:46', '2016-06-05 14:22:46', 'ASPIDOVA LARISSA', 0);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (55486, '?', 151, 27347, 32, 901, 1, '2016-06-05 14:22:46', '2016-06-05 14:22:46', 5, 1590, NULL);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6120, '2016-06-05 14:22:47', '2016-06-05 14:22:47', NULL, NULL, NULL, NULL, 73799, 1088, 17, 1591, 32737, NULL, 1, 1, 33, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (6121, '2016-06-05 14:22:47', '2016-06-05 14:22:47', NULL, NULL, NULL, NULL, 73799, 27347, 32, 1590, 55486, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436777, 7, 1, 0, 0, 0.0, 70.0, 0, 49, 60, 73770, 1254, 10, 41528, 1, '2016-06-05 14:22:47', '2016-06-05 14:22:47', NULL, 0.0, 0.0, 4.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436778, 6, 1, 0, 0, 0.0, 75.0, 0, 51, 20, 73771, 21017, 10, 32500, 1, '2016-06-05 14:22:47', '2016-06-05 14:22:47', NULL, 0.0, 0.0, 6.0, 1587, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436779, 2, 1, 0, 0, 0.0, 95.0, 1, 9, 30, 73774, 1533, 32, 32774, 1, '2016-06-05 14:22:47', '2016-06-05 14:22:47', NULL, 0.0, 0.0, 14.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436780, 3, 1, 0, 0, 0.0, 90.0, 1, 2, 80, 73775, 1363, 32, 32714, 1, '2016-06-05 14:22:47', '2016-06-05 14:22:47', NULL, 0.0, 0.0, 12.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436781, 5, 1, 0, 0, 0.0, 80.0, 1, 14, 40, 73776, 1531, 32, 32712, 1, '2016-06-05 14:22:47', '2016-06-05 14:22:47', NULL, 0.0, 0.0, 8.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436782, 5, 1, 0, 0, 0.0, 80.0, 0, 52, 30, 73778, 1528, 32, 32723, 1, '2016-06-05 14:22:47', '2016-06-05 14:22:47', NULL, 0.0, 0.0, 8.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436783, 3, 1, 0, 0, 0.0, 90.0, 1, 17, 20, 73781, 1218, 32, 38726, 1, '2016-06-05 14:22:47', '2016-06-05 14:22:47', NULL, 0.0, 0.0, 12.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436784, 1, 1, 0, 0, 0.0, 100.0, 1, 4, 70, 73782, 1533, 32, 32774, 1, '2016-06-05 14:22:47', '2016-06-05 14:22:47', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436785, 1, 1, 0, 0, 0.0, 100.0, 1, 7, 90, 73776, 1308, 32, 32713, 1, '2016-06-05 14:22:48', '2016-06-05 14:22:48', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436786, 1, 1, 0, 0, 0.0, 100.0, 1, 5, 20, 73785, 1612, 32, 32721, 1, '2016-06-05 14:22:48', '2016-06-05 14:22:48', NULL, 0.0, 0.0, 16.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436787, 3, 1, 0, 0, 0.0, 90.0, 0, 38, 80, 73786, 1218, 32, 38726, 1, '2016-06-05 14:22:48', '2016-06-05 14:22:48', NULL, 0.0, 0.0, 12.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436788, 1, 1, 0, 0, 0.0, 100.0, 1, 9, 0, 73787, 803, 5, 32708, 1, '2016-06-05 14:22:48', '2016-06-05 14:22:48', NULL, 0.0, 0.0, 16.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436789, 3, 1, 0, 0, 0.0, 90.0, 1, 17, 80, 73788, 1160, 5, 32670, 1, '2016-06-05 14:22:48', '2016-06-05 14:22:48', NULL, 0.0, 0.0, 12.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436790, 1, 1, 0, 0, 0.0, 100.0, 0, 36, 60, 73789, 803, 5, 32708, 1, '2016-06-05 14:22:48', '2016-06-05 14:22:48', NULL, 0.0, 0.0, 16.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436791, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 50, 73790, 1160, 5, 32670, 1, '2016-06-05 14:22:48', '2016-06-05 14:22:48', NULL, 0.0, 0.0, 14.0, 1593, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436792, 2, 1, 0, 0, 0.0, 95.0, 0, 36, 40, 73786, 1409, 35, 32710, 1, '2016-06-05 14:22:48', '2016-06-05 14:22:48', NULL, 0.0, 0.0, 14.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436793, 2, 1, 0, 0, 0.0, 95.0, 1, 5, 90, 73782, 1452, 35, 55420, 1, '2016-06-05 14:22:48', '2016-06-05 14:22:48', NULL, 0.0, 0.0, 14.0, 1584, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436794, 2, 1, 0, 0, 0.0, 95.0, 1, 26, 0, 73795, 20986, 18, 32630, 1, '2016-06-05 14:22:48', '2016-06-05 14:22:48', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436795, 4, 1, 0, 0, 0.0, 85.0, 1, 30, 40, 73796, 20994, 18, 32640, 1, '2016-06-05 14:22:49', '2016-06-05 14:22:49', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436796, 1, 1, 0, 0, 0.0, 100.0, 0, 55, 0, 73772, 21038, 18, 32643, 1, '2016-06-05 14:22:49', '2016-06-05 14:22:49', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436797, 1, 1, 0, 0, 0.0, 100.0, 1, 28, 20, 73799, 1807, 18, 32631, 1, '2016-06-05 14:22:49', '2016-06-05 14:22:49', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436798, 5, 1, 0, 0, 0.0, 80.0, 0, 40, 70, 73790, 18886, 18, 32644, 1, '2016-06-05 14:22:49', '2016-06-05 14:22:49', NULL, 0.0, 0.0, 8.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436799, 2, 1, 0, 0, 0.0, 95.0, 1, 28, 50, 73802, 20986, 18, 32630, 1, '2016-06-05 14:22:49', '2016-06-05 14:22:49', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436800, 4, 1, 0, 0, 0.0, 85.0, 0, 43, 40, 73803, 20994, 18, 32640, 1, '2016-06-05 14:22:49', '2016-06-05 14:22:49', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436801, 4, 1, 0, 0, 0.0, 85.0, 0, 40, 40, 73790, 1475, 18, 38094, 1, '2016-06-05 14:22:49', '2016-06-05 14:22:49', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436802, 1, 1, 0, 0, 0.0, 100.0, 1, 39, 70, 73805, 1807, 18, 32631, 1, '2016-06-05 14:22:49', '2016-06-05 14:22:49', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436803, 6, 1, 0, 0, 0.0, 75.0, 0, 44, 80, 73770, 22158, 18, 38735, 1, '2016-06-05 14:22:49', '2016-06-05 14:22:49', NULL, 0.0, 0.0, 6.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436804, 1, 1, 0, 0, 0.0, 100.0, 1, 18, 90, 73806, 18886, 18, 32644, 1, '2016-06-05 14:22:49', '2016-06-05 14:22:49', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436805, 7, 1, 0, 0, 0.0, 70.0, 1, 25, 60, 73807, 1476, 18, 32615, 1, '2016-06-05 14:22:49', '2016-06-05 14:22:49', NULL, 0.0, 0.0, 4.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436806, 1, 1, 0, 0, 0.0, 100.0, 0, 39, 0, 73778, 4847, 11, 32647, 1, '2016-06-05 14:22:50', '2016-06-05 14:22:50', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436807, 3, 1, 0, 0, 0.0, 90.0, 1, 19, 20, 73807, 1776, 11, 32648, 1, '2016-06-05 14:22:50', '2016-06-05 14:22:50', NULL, 0.0, 0.0, 12.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436808, 2, 1, 0, 0, 0.0, 95.0, 0, 40, 60, 73778, 23055, 11, 41526, 1, '2016-06-05 14:22:50', '2016-06-05 14:22:50', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436809, 2, 1, 0, 0, 0.0, 95.0, 0, 41, 70, 73771, 882, 11, 32649, 1, '2016-06-05 14:22:50', '2016-06-05 14:22:50', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436810, 1, 1, 0, 0, 0.0, 100.0, 0, 39, 40, 73771, 984, 11, 38746, 1, '2016-06-05 14:22:50', '2016-06-05 14:22:50', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436811, 1, 1, 0, 0, 0.0, 100.0, 0, 37, 20, 73803, 1659, 11, 32650, 1, '2016-06-05 14:22:50', '2016-06-05 14:22:50', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436812, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 30, 73803, 1658, 11, 46553, 1, '2016-06-05 14:22:50', '2016-06-05 14:22:50', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436813, 2, 1, 0, 0, 0.0, 95.0, 1, 13, 70, 73808, 87, 11, 38747, 1, '2016-06-05 14:22:50', '2016-06-05 14:22:50', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436814, 1, 1, 0, 0, 0.0, 100.0, 0, 37, 40, 73790, 553, 11, 32654, 1, '2016-06-05 14:22:50', '2016-06-05 14:22:50', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436815, 5, 1, 0, 0, 0.0, 80.0, 0, 40, 70, 73790, 22159, 11, 38748, 1, '2016-06-05 14:22:50', '2016-06-05 14:22:50', NULL, 0.0, 0.0, 8.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436816, 5, 1, 0, 0, 0.0, 80.0, 0, 44, 0, 73770, 148, 11, 32657, 1, '2016-06-05 14:22:51', '2016-06-05 14:22:51', NULL, 0.0, 0.0, 8.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436817, 2, 1, 0, 0, 0.0, 95.0, 0, 52, 90, 73775, 229, 11, 32660, 1, '2016-06-05 14:22:51', '2016-06-05 14:22:51', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436818, 1, 1, 0, 0, 0.0, 100.0, 1, 13, 90, 73807, 4847, 11, 32647, 1, '2016-06-05 14:22:51', '2016-06-05 14:22:51', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436819, 1, 1, 0, 0, 0.0, 100.0, 1, 15, 50, 73813, 1776, 11, 32648, 1, '2016-06-05 14:22:51', '2016-06-05 14:22:51', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436820, 2, 1, 0, 0, 0.0, 95.0, 1, 18, 90, 73807, 23055, 11, 41526, 1, '2016-06-05 14:22:51', '2016-06-05 14:22:51', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436821, 2, 1, 0, 0, 0.0, 95.0, 1, 23, 80, 73797, 882, 11, 32649, 1, '2016-06-05 14:22:51', '2016-06-05 14:22:51', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436822, 1, 1, 0, 0, 0.0, 100.0, 1, 21, 60, 73797, 984, 11, 38746, 1, '2016-06-05 14:22:51', '2016-06-05 14:22:51', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436823, 2, 1, 0, 0, 0.0, 95.0, 1, 20, 30, 73796, 1659, 11, 32650, 1, '2016-06-05 14:22:51', '2016-06-05 14:22:51', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436824, 1, 1, 0, 0, 0.0, 100.0, 1, 15, 60, 73796, 1658, 11, 46553, 1, '2016-06-05 14:22:51', '2016-06-05 14:22:51', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436825, 5, 1, 0, 0, 0.0, 80.0, 0, 58, 10, 73814, 140, 11, 32653, 1, '2016-06-05 14:22:51', '2016-06-05 14:22:51', NULL, 0.0, 0.0, 8.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436826, 2, 1, 0, 0, 0.0, 95.0, 1, 14, 10, 73788, 553, 11, 32654, 1, '2016-06-05 14:22:52', '2016-06-05 14:22:52', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436827, 2, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 73788, 22159, 11, 38748, 1, '2016-06-05 14:22:52', '2016-06-05 14:22:52', 1, 0.0, 0.0, 0.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436828, 6, 1, 0, 0, 0.0, 75.0, 1, 33, 10, 73815, 148, 11, 32657, 1, '2016-06-05 14:22:52', '2016-06-05 14:22:52', NULL, 0.0, 0.0, 6.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436829, 4, 1, 0, 0, 0.0, 85.0, 1, 23, 10, 73815, 228, 11, 32655, 1, '2016-06-05 14:22:52', '2016-06-05 14:22:52', NULL, 0.0, 0.0, 10.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436830, 1, 1, 0, 0, 0.0, 100.0, 0, 46, 70, 73775, 1244, 11, 32658, 1, '2016-06-05 14:22:52', '2016-06-05 14:22:52', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436831, 4, 1, 0, 0, 0.0, 85.0, 1, 8, 90, 73775, 21032, 11, 32659, 1, '2016-06-05 14:22:52', '2016-06-05 14:22:52', NULL, 0.0, 0.0, 10.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436832, 1, 1, 0, 0, 0.0, 100.0, 1, 47, 50, 73817, 229, 11, 32660, 1, '2016-06-05 14:22:52', '2016-06-05 14:22:52', NULL, 0.0, 0.0, 16.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436833, 2, 1, 0, 0, 0.0, 95.0, 1, 30, 70, 73818, 114, 11, 32661, 1, '2016-06-05 14:22:52', '2016-06-05 14:22:52', NULL, 0.0, 0.0, 14.0, 1585, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436834, 5, 1, 0, 0, 0.0, 80.0, 0, 39, 50, 73786, 20959, 4, 32704, 1, '2016-06-05 14:22:52', '2016-06-05 14:22:52', NULL, 0.0, 0.0, 8.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436835, 3, 1, 0, 0, 0.0, 90.0, 1, 23, 80, 73796, 20951, 4, 32699, 1, '2016-06-05 14:22:52', '2016-06-05 14:22:52', NULL, 0.0, 0.0, 12.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436836, 3, 1, 0, 0, 0.0, 90.0, 1, 34, 20, 73818, 900, 4, 55421, 1, '2016-06-05 14:22:52', '2016-06-05 14:22:52', NULL, 0.0, 0.0, 12.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436837, 2, 1, 0, 0, 0.0, 95.0, 1, 13, 60, 73787, 25, 4, 32706, 1, '2016-06-05 14:22:53', '2016-06-05 14:22:53', NULL, 0.0, 0.0, 14.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436838, 4, 1, 0, 0, 0.0, 85.0, 1, 37, 40, 73795, 11734, 4, 32701, 1, '2016-06-05 14:22:53', '2016-06-05 14:22:53', NULL, 0.0, 0.0, 10.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436839, 3, 1, 0, 0, 0.0, 90.0, 0, 40, 90, 73803, 20951, 4, 32699, 1, '2016-06-05 14:22:53', '2016-06-05 14:22:53', NULL, 0.0, 0.0, 12.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436840, 1, 1, 0, 0, 0.0, 100.0, 0, 45, 20, 73820, 230, 4, 38108, 1, '2016-06-05 14:22:53', '2016-06-05 14:22:53', NULL, 0.0, 0.0, 16.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436841, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 50, 73821, 20967, 4, 32705, 1, '2016-06-05 14:22:53', '2016-06-05 14:22:53', NULL, 0.0, 0.0, 14.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436842, 2, 1, 0, 0, 0.0, 95.0, 0, 36, 80, 73789, 25, 4, 32706, 1, '2016-06-05 14:22:53', '2016-06-05 14:22:53', NULL, 0.0, 0.0, 14.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436843, 3, 1, 0, 0, 0.0, 90.0, 0, 49, 60, 73822, 11734, 4, 32701, 1, '2016-06-05 14:22:53', '2016-06-05 14:22:53', NULL, 0.0, 0.0, 12.0, 1586, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436844, 1, 1, 0, 0, 0.0, 100.0, 1, 8, 80, 73774, 27324, 826, 55422, 1, '2016-06-05 14:22:53', '2016-06-05 14:22:53', NULL, 0.0, 0.0, 16.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436845, 7, 1, 0, 0, 0.0, 70.0, 0, 49, 50, 73789, 22149, 826, 38754, 1, '2016-06-05 14:22:53', '2016-06-05 14:22:53', NULL, 0.0, 0.0, 4.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436846, 2, 1, 0, 0, 0.0, 95.0, 0, 49, 80, 73825, 21021, 826, 32553, 1, '2016-06-05 14:22:53', '2016-06-05 14:22:53', NULL, 0.0, 0.0, 14.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436847, 2, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 73787, 22149, 826, 38754, 1, '2016-06-05 14:22:54', '2016-06-05 14:22:54', 1, 0.0, 0.0, 0.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436848, 3, 1, 0, 0, 0.0, 90.0, 1, 42, 60, 73785, 22151, 826, 38753, 1, '2016-06-05 14:22:54', '2016-06-05 14:22:54', NULL, 0.0, 0.0, 12.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436849, 6, 1, 0, 0, 0.0, 75.0, 0, 49, 0, 73789, 21020, 826, 32555, 1, '2016-06-05 14:22:54', '2016-06-05 14:22:54', NULL, 0.0, 0.0, 6.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436850, 1, 1, 0, 1, 0.0, 0.0, 0, 0, 0, 73827, 21021, 826, 32553, 1, '2016-06-05 14:22:54', '2016-06-05 14:22:54', 1, 0.0, 0.0, 0.0, 1594, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436851, 4, 1, 0, 0, 0.0, 85.0, 1, 23, 80, 73774, 1863, 18, 32617, 1, '2016-06-05 14:22:54', '2016-06-05 14:22:54', NULL, 0.0, 0.0, 10.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436852, 2, 1, 0, 0, 0.0, 95.0, 0, 36, 60, 73828, 1863, 18, 32617, 1, '2016-06-05 14:22:54', '2016-06-05 14:22:54', NULL, 0.0, 0.0, 14.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436853, 1, 1, 0, 0, 0.0, 100.0, 0, 36, 10, 73770, 142, 1, 32559, 1, '2016-06-05 14:22:54', '2016-06-05 14:22:54', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436854, 5, 1, 0, 0, 0.0, 80.0, 2, 14, 60, 73781, 1197, 1, 32607, 1, '2016-06-05 14:22:54', '2016-06-05 14:22:54', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436855, 8, 1, 0, 0, 0.0, 65.0, 0, 44, 20, 73790, 97, 1, 46556, 1, '2016-06-05 14:22:54', '2016-06-05 14:22:54', NULL, 0.0, 0.0, 2.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436856, 1, 1, 0, 0, 0.0, 100.0, 0, 45, 50, 73829, 192, 1, 32563, 1, '2016-06-05 14:22:54', '2016-06-05 14:22:54', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436857, 2, 1, 0, 0, 0.0, 95.0, 0, 51, 80, 73831, 25136, 1, 47211, 1, '2016-06-05 14:22:55', '2016-06-05 14:22:55', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436858, 3, 1, 0, 0, 0.0, 90.0, 1, 25, 0, 73797, 1843, 1, 32565, 1, '2016-06-05 14:22:55', '2016-06-05 14:22:55', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436859, 1, 1, 0, 0, 0.0, 100.0, 0, 51, 70, 73831, 25137, 1, 47213, 1, '2016-06-05 14:22:55', '2016-06-05 14:22:55', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436860, 4, 1, 0, 0, 0.0, 85.0, 0, 40, 80, 73789, 456, 1, 32566, 1, '2016-06-05 14:22:55', '2016-06-05 14:22:55', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436861, 4, 1, 0, 0, 0.0, 85.0, 0, 48, 0, 73771, 1483, 1, 32567, 1, '2016-06-05 14:22:55', '2016-06-05 14:22:55', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436862, 2, 1, 0, 0, 0.0, 95.0, 0, 44, 70, 73822, 550, 1, 32568, 1, '2016-06-05 14:22:55', '2016-06-05 14:22:55', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436863, 2, 1, 0, 0, 0.0, 95.0, 1, 41, 50, 73832, 468, 1, 32770, 1, '2016-06-05 14:22:55', '2016-06-05 14:22:55', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436864, 1, 1, 0, 0, 0.0, 100.0, 0, 46, 60, 73814, 728, 1, 32572, 1, '2016-06-05 14:22:55', '2016-06-05 14:22:55', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436865, 5, 1, 0, 0, 0.0, 80.0, 0, 48, 50, 73771, 21016, 1, 32575, 1, '2016-06-05 14:22:55', '2016-06-05 14:22:55', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436866, 4, 1, 0, 0, 0.0, 85.0, 0, 53, 90, 73814, 503, 1, 32584, 1, '2016-06-05 14:22:55', '2016-06-05 14:22:55', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436867, 5, 1, 0, 0, 0.0, 80.0, 1, 21, 90, 73807, 1777, 1, 32586, 1, '2016-06-05 14:22:56', '2016-06-05 14:22:56', NULL, 0.0, 0.0, 8.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436868, 1, 1, 0, 0, 0.0, 100.0, 1, 2, 80, 73834, 1496, 1, 32588, 1, '2016-06-05 14:22:56', '2016-06-05 14:22:56', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436869, 2, 1, 0, 0, 0.0, 95.0, 1, 15, 0, 73815, 1227, 1, 32562, 1, '2016-06-05 14:22:56', '2016-06-05 14:22:56', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436870, 3, 1, 0, 0, 0.0, 90.0, 0, 40, 50, 73789, 108, 1, 32771, 1, '2016-06-05 14:22:56', '2016-06-05 14:22:56', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436871, 1, 1, 0, 0, 0.0, 100.0, 1, 15, 50, 73795, 1788, 1, 32579, 1, '2016-06-05 14:22:56', '2016-06-05 14:22:56', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436872, 4, 1, 0, 0, 0.0, 85.0, 1, 18, 70, 73781, 1279, 1, 32580, 1, '2016-06-05 14:22:56', '2016-06-05 14:22:56', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436873, 3, 1, 0, 0, 0.0, 90.0, 0, 40, 60, 73828, 785, 1, 32569, 1, '2016-06-05 14:22:56', '2016-06-05 14:22:56', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436874, 1, 1, 0, 0, 0.0, 100.0, 0, 36, 30, 73828, 1405, 1, 38732, 1, '2016-06-05 14:22:56', '2016-06-05 14:22:56', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436875, 1, 1, 0, 0, 0.0, 100.0, 1, 14, 50, 73815, 142, 1, 32559, 1, '2016-06-05 14:22:56', '2016-06-05 14:22:56', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436876, 4, 1, 0, 0, 0.0, 85.0, 1, 20, 40, 73788, 97, 1, 46556, 1, '2016-06-05 14:22:56', '2016-06-05 14:22:56', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436877, 2, 1, 0, 0, 0.0, 95.0, 0, 45, 70, 73829, 138, 1, 32564, 1, '2016-06-05 14:22:56', '2016-06-05 14:22:56', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436878, 1, 1, 0, 0, 0.0, 100.0, 1, 45, 40, 73836, 25136, 1, 47211, 1, '2016-06-05 14:22:57', '2016-06-05 14:22:57', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436879, 3, 1, 0, 0, 0.0, 90.0, 0, 47, 40, 73771, 1843, 1, 32565, 1, '2016-06-05 14:22:57', '2016-06-05 14:22:57', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436880, 3, 1, 0, 0, 0.0, 90.0, 1, 13, 90, 73774, 1405, 1, 38732, 1, '2016-06-05 14:22:57', '2016-06-05 14:22:57', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436881, 3, 1, 0, 0, 0.0, 90.0, 1, 45, 0, 73802, 550, 1, 32568, 1, '2016-06-05 14:22:57', '2016-06-05 14:22:57', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436882, 4, 1, 0, 0, 0.0, 85.0, 1, 33, 60, 73782, 785, 1, 32569, 1, '2016-06-05 14:22:57', '2016-06-05 14:22:57', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436883, 7, 1, 0, 0, 0.0, 70.0, 0, 41, 50, 73790, 1016, 1, 32570, 1, '2016-06-05 14:22:57', '2016-06-05 14:22:57', NULL, 0.0, 0.0, 4.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436884, 3, 1, 0, 0, 0.0, 90.0, 0, 50, 70, 73814, 468, 1, 32770, 1, '2016-06-05 14:22:57', '2016-06-05 14:22:57', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436885, 1, 1, 0, 0, 0.0, 100.0, 1, 38, 60, 73832, 728, 1, 32572, 1, '2016-06-05 14:22:57', '2016-06-05 14:22:57', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436886, 1, 1, 0, 0, 0.0, 100.0, 1, 10, 80, 73816, 23, 1, 32573, 1, '2016-06-05 14:22:57', '2016-06-05 14:22:57', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436887, 4, 1, 0, 0, 0.0, 85.0, 1, 39, 50, 73797, 21016, 1, 32575, 1, '2016-06-05 14:22:57', '2016-06-05 14:22:57', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436888, 1, 1, 0, 0, 0.0, 100.0, 1, 15, 60, 73802, 1788, 1, 32579, 1, '2016-06-05 14:22:57', '2016-06-05 14:22:57', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436889, 4, 1, 0, 0, 0.0, 85.0, 0, 39, 10, 73786, 1279, 1, 32580, 1, '2016-06-05 14:22:58', '2016-06-05 14:22:58', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436890, 2, 1, 0, 0, 0.0, 95.0, 1, 42, 60, 73805, 98, 1, 32582, 1, '2016-06-05 14:22:58', '2016-06-05 14:22:58', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436891, 2, 1, 0, 0, 0.0, 95.0, 0, 50, 30, 73814, 1474, 1, 46561, 1, '2016-06-05 14:22:58', '2016-06-05 14:22:58', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436892, 3, 1, 0, 0, 0.0, 90.0, 1, 47, 56, 73832, 503, 1, 32584, 1, '2016-06-05 14:22:58', '2016-06-05 14:22:58', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436893, 3, 1, 0, 0, 0.0, 90.0, 1, 6, 30, 73782, 1025, 1, 32585, 1, '2016-06-05 14:22:58', '2016-06-05 14:22:58', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436894, 4, 1, 0, 0, 0.0, 85.0, 0, 44, 10, 73778, 1777, 1, 32586, 1, '2016-06-05 14:22:58', '2016-06-05 14:22:58', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436895, 4, 1, 0, 0, 0.0, 85.0, 1, 21, 60, 73787, 108, 1, 32771, 1, '2016-06-05 14:22:58', '2016-06-05 14:22:58', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436896, 2, 1, 0, 0, 0.0, 95.0, 1, 8, 60, 73776, 1496, 1, 32588, 1, '2016-06-05 14:22:58', '2016-06-05 14:22:58', NULL, 0.0, 0.0, 14.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436897, 1, 1, 0, 0, 0.0, 100.0, 1, 29, 50, 73818, 773, 1, 32574, 1, '2016-06-05 14:22:58', '2016-06-05 14:22:58', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436898, 1, 1, 0, 0, 0.0, 100.0, 1, 6, 50, 73837, 1414, 17, 32724, 1, '2016-06-05 14:22:58', '2016-06-05 14:22:58', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436899, 4, 1, 0, 0, 0.0, 85.0, 1, 20, 90, 73807, 20983, 17, 32733, 1, '2016-06-05 14:22:59', '2016-06-05 14:22:59', NULL, 0.0, 0.0, 10.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436900, 6, 1, 0, 0, 0.0, 75.0, 1, 17, 80, 73776, 1813, 17, 32735, 1, '2016-06-05 14:22:59', '2016-06-05 14:22:59', NULL, 0.0, 0.0, 6.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436901, 8, 1, 0, 0, 0.0, 65.0, 1, 22, 40, 73776, 1717, 17, 32736, 1, '2016-06-05 14:22:59', '2016-06-05 14:22:59', NULL, 0.0, 0.0, 2.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436902, 3, 1, 0, 0, 0.0, 90.0, 1, 28, 10, 73795, 1455, 17, 32738, 1, '2016-06-05 14:22:59', '2016-06-05 14:22:59', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436903, 6, 1, 0, 0, 0.0, 75.0, 1, 23, 30, 73807, 20998, 17, 32743, 1, '2016-06-05 14:22:59', '2016-06-05 14:22:59', NULL, 0.0, 0.0, 6.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436904, 5, 1, 0, 0, 0.0, 80.0, 1, 29, 80, 73787, 1117, 17, 32745, 1, '2016-06-05 14:22:59', '2016-06-05 14:22:59', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436905, 2, 1, 0, 0, 0.0, 95.0, 1, 38, 40, 73827, 21986, 17, 38075, 1, '2016-06-05 14:22:59', '2016-06-05 14:22:59', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436906, 2, 1, 0, 0, 0.0, 95.0, 1, 9, 60, 73781, 1060, 17, 32747, 1, '2016-06-05 14:22:59', '2016-06-05 14:22:59', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436907, 1, 1, 0, 0, 0.0, 100.0, 1, 13, 40, 73788, 1292, 17, 32753, 1, '2016-06-05 14:22:59', '2016-06-05 14:22:59', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436908, 6, 1, 0, 0, 0.0, 75.0, 1, 17, 80, 73776, 1721, 17, 32759, 1, '2016-06-05 14:22:59', '2016-06-05 14:22:59', NULL, 0.0, 0.0, 6.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436909, 1, 1, 0, 0, 0.0, 100.0, 1, 5, 50, 73781, 1102, 17, 32760, 1, '2016-06-05 14:22:59', '2016-06-05 14:22:59', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436910, 3, 1, 0, 0, 0.0, 90.0, 1, 22, 90, 73815, 1116, 17, 32762, 1, '2016-06-05 14:23:00', '2016-06-05 14:23:00', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436911, 1, 1, 0, 0, 0.0, 100.0, 1, 9, 90, 73808, 1456, 17, 38081, 1, '2016-06-05 14:23:00', '2016-06-05 14:23:00', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436912, 3, 1, 0, 0, 0.0, 90.0, 1, 15, 40, 73787, 18952, 17, 32731, 1, '2016-06-05 14:23:00', '2016-06-05 14:23:00', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436913, 1, 1, 0, 0, 0.0, 100.0, 2, 13, 70, 73842, 1414, 17, 32724, 1, '2016-06-05 14:23:00', '2016-06-05 14:23:00', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436914, 2, 1, 0, 0, 0.0, 95.0, 1, 22, 70, 73813, 20983, 17, 32733, 1, '2016-06-05 14:23:00', '2016-06-05 14:23:00', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436915, 3, 1, 0, 0, 0.0, 90.0, 0, 37, 60, 73821, 1813, 17, 32735, 1, '2016-06-05 14:23:00', '2016-06-05 14:23:00', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436916, 2, 1, 0, 0, 0.0, 95.0, 1, 23, 0, 73834, 1717, 17, 32736, 1, '2016-06-05 14:23:00', '2016-06-05 14:23:00', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436917, 2, 1, 0, 0, 0.0, 95.0, 1, 31, 10, 73799, 1088, 17, 32737, 1, '2016-06-05 14:23:00', '2016-06-05 14:23:00', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436918, 1, 1, 0, 0, 0.0, 100.0, 0, 44, 30, 73822, 1455, 17, 32738, 1, '2016-06-05 14:23:00', '2016-06-05 14:23:00', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436919, 7, 1, 0, 0, 0.0, 70.0, 0, 40, 80, 73821, 1830, 17, 38074, 1, '2016-06-05 14:23:00', '2016-06-05 14:23:00', NULL, 0.0, 0.0, 4.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436920, 3, 1, 0, 0, 0.0, 90.0, 0, 41, 40, 73778, 20998, 17, 32743, 1, '2016-06-05 14:23:00', '2016-06-05 14:23:00', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436921, 1, 1, 0, 0, 0.0, 100.0, 1, 29, 70, 73843, 1135, 17, 32744, 1, '2016-06-05 14:23:01', '2016-06-05 14:23:01', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436922, 1, 1, 0, 0, 0.0, 100.0, 1, 44, 90, 73844, 1117, 17, 32745, 1, '2016-06-05 14:23:01', '2016-06-05 14:23:01', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436923, 1, 1, 0, 0, 0.0, 100.0, 0, 49, 70, 73825, 21986, 17, 38075, 1, '2016-06-05 14:23:01', '2016-06-05 14:23:01', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436924, 1, 1, 0, 0, 0.0, 100.0, 0, 36, 20, 73786, 1060, 17, 32747, 1, '2016-06-05 14:23:01', '2016-06-05 14:23:01', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436925, 5, 1, 0, 0, 0.0, 80.0, 0, 42, 40, 73789, 590, 17, 32748, 1, '2016-06-05 14:23:01', '2016-06-05 14:23:01', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436926, 3, 1, 0, 0, 0.0, 90.0, 0, 38, 10, 73790, 1292, 17, 32753, 1, '2016-06-05 14:23:01', '2016-06-05 14:23:01', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436927, 2, 1, 0, 0, 0.0, 95.0, 1, 30, 90, 73769, 993, 17, 32757, 1, '2016-06-05 14:23:01', '2016-06-05 14:23:01', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436928, 5, 1, 0, 0, 0.0, 80.0, 1, 43, 90, 73795, 602, 17, 32758, 1, '2016-06-05 14:23:01', '2016-06-05 14:23:01', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436929, 1, 1, 0, 0, 0.0, 100.0, 1, 27, 30, 73827, 4810, 17, 38080, 1, '2016-06-05 14:23:01', '2016-06-05 14:23:01', NULL, 0.0, 0.0, 16.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436930, 5, 1, 0, 0, 0.0, 80.0, 0, 39, 10, 73821, 1721, 17, 32759, 1, '2016-06-05 14:23:01', '2016-06-05 14:23:01', NULL, 0.0, 0.0, 8.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436931, 2, 1, 0, 0, 0.0, 95.0, 1, 6, 30, 73785, 1102, 17, 32760, 1, '2016-06-05 14:23:02', '2016-06-05 14:23:02', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436932, 3, 1, 0, 0, 0.0, 90.0, 1, 24, 10, 73813, 21035, 17, 32761, 1, '2016-06-05 14:23:02', '2016-06-05 14:23:02', NULL, 0.0, 0.0, 12.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436933, 2, 1, 0, 0, 0.0, 95.0, 0, 41, 20, 73770, 1116, 17, 32762, 1, '2016-06-05 14:23:02', '2016-06-05 14:23:02', NULL, 0.0, 0.0, 14.0, 1591, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436934, 3, 1, 0, 0, 0.0, 90.0, 1, 9, 90, 73776, 24839, 1, 46564, 1, '2016-06-05 14:23:02', '2016-06-05 14:23:02', NULL, 0.0, 0.0, 12.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436935, 6, 1, 0, 0, 0.0, 75.0, 0, 39, 20, 73821, 24839, 1, 46564, 1, '2016-06-05 14:23:02', '2016-06-05 14:23:02', NULL, 0.0, 0.0, 6.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436936, 4, 1, 0, 0, 0.0, 85.0, 1, 14, 10, 73776, 1529, 1, 46565, 1, '2016-06-05 14:23:02', '2016-06-05 14:23:02', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436937, 1, 1, 0, 0, 0.0, 100.0, 0, 37, 30, 73821, 1529, 1, 46565, 1, '2016-06-05 14:23:02', '2016-06-05 14:23:02', NULL, 0.0, 0.0, 16.0, 1589, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436938, 1, 1, 0, 0, 0.0, 100.0, 1, 49, 60, 74015, 21040, 18, 32632, 1, '2016-06-05 14:23:02', '2016-06-05 14:23:02', NULL, 0.0, 0.0, 16.0, 1592, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436939, 3, 1, 0, 0, 0.0, 90.0, 1, 46, 20, 73799, 27347, 32, 55486, 1, '2016-06-05 14:23:02', '2016-06-05 14:23:02', NULL, 0.0, 0.0, 12.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436940, 4, 1, 0, 0, 0.0, 85.0, 0, 43, 60, 73770, 1270, 32, 32716, 1, '2016-06-05 14:23:02', '2016-06-05 14:23:02', NULL, 0.0, 0.0, 10.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436941, 3, 1, 0, 0, 0.0, 90.0, 0, 41, 30, 73770, 27346, 32, 55484, 1, '2016-06-05 14:23:03', '2016-06-05 14:23:03', NULL, 0.0, 0.0, 12.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436942, 5, 1, 0, 0, 0.0, 80.0, 1, 24, 90, 73815, 27346, 32, 55484, 1, '2016-06-05 14:23:03', '2016-06-05 14:23:03', NULL, 0.0, 0.0, 8.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (436943, 4, 1, 0, 0, 0.0, 85.0, 0, 38, 20, 73821, 27345, 1, 55485, 1, '2016-06-05 14:23:03', '2016-06-05 14:23:03', NULL, 0.0, 0.0, 10.0, 1589, 0, 0);


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

-- Event #4, M.Prg: 73786, tot. athletes: 5
-- Tot. progr. duration: 99 (sec), Heat durations: [9950] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:16:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:16' WHERE id = 73786;

-- Event #4, M.Prg: 73772, tot. athletes: 1
-- Tot. progr. duration: 115 (sec), Heat durations: [11500] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:18:04 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:18' WHERE id = 73772;

-- Event #5, M.Prg: 73773, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:19:59 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:19' WHERE id = 73773;

-- Event #6, M.Prg: 73797, tot. athletes: 4
-- Tot. progr. duration: 159 (sec), Heat durations: [15950] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:19:59 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:19' WHERE id = 73797;

-- Event #6, M.Prg: 73774, tot. athletes: 4
-- Tot. progr. duration: 143 (sec), Heat durations: [14380] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:22:38 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:22' WHERE id = 73774;

-- Event #7, M.Prg: 73789, tot. athletes: 7
-- Tot. progr. duration: 206 (sec), Heat durations: [10950, 9660] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:25:01 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:25' WHERE id = 73789;

-- Event #7, M.Prg: 73775, tot. athletes: 4
-- Tot. progr. duration: 128 (sec), Heat durations: [12890] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:28:27 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:28' WHERE id = 73775;

-- Event #8, M.Prg: 73807, tot. athletes: 7
-- Tot. progr. duration: 279 (sec), Heat durations: [14560, 13390] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:30:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:30' WHERE id = 73807;

-- Event #8, M.Prg: 73776, tot. athletes: 8
-- Tot. progr. duration: 271 (sec), Heat durations: [14240, 12860] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:35:14 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:35' WHERE id = 73776;

-- Event #9, M.Prg: 73777, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:39:45 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:39' WHERE id = 73777;

-- Event #9, M.Prg: 73804, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:39:45 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:39' WHERE id = 73804;

-- Event #10, M.Prg: 73778, tot. athletes: 5
-- Tot. progr. duration: 112 (sec), Heat durations: [11230] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:39:45 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:39' WHERE id = 73778;

-- Event #10, M.Prg: 73821, tot. athletes: 7
-- Tot. progr. duration: 198 (sec), Heat durations: [10080, 9730] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:41:37 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:41' WHERE id = 73821;

-- Event #11, M.Prg: 73779, tot. athletes: 2
-- Tot. progr. duration: 708 (sec), Heat durations: [70820] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 15:44:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:44' WHERE id = 73779;

-- Event #11, M.Prg: 73801, tot. athletes: 2
-- Tot. progr. duration: 786 (sec), Heat durations: [78670] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 15:56:43 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:56' WHERE id = 73801;

-- Event #12, M.Prg: 73780, tot. athletes: 2
-- Tot. progr. duration: 775 (sec), Heat durations: [77590] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 16:09:49 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:09' WHERE id = 73780;

-- Event #12, M.Prg: 73839, tot. athletes: 1
-- Tot. progr. duration: 872 (sec), Heat durations: [87280] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 16:22:44 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:22' WHERE id = 73839;

-- Event #13, M.Prg: 73843, tot. athletes: 1
-- Tot. progr. duration: 149 (sec), Heat durations: [14970] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:37:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:37' WHERE id = 73843;

-- Event #13, M.Prg: 73782, tot. athletes: 4
-- Tot. progr. duration: 153 (sec), Heat durations: [15360] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:39:45 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:39' WHERE id = 73782;

-- Event #14, M.Prg: 73783, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:42:18 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:42' WHERE id = 73783;

-- Event #14, M.Prg: 73823, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:42:18 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:42' WHERE id = 73823;

-- Event #15, M.Prg: 73812, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:42:18 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:42' WHERE id = 73812;

-- Event #15, M.Prg: 73784, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:42:18 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:42' WHERE id = 73784;

-- Event #16, M.Prg: 73785, tot. athletes: 3
-- Tot. progr. duration: 162 (sec), Heat durations: [16260] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:42:18 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:42' WHERE id = 73785;

-- Event #17, M.Prg: 73787, tot. athletes: 6
-- Tot. progr. duration: 149 (sec), Heat durations: [14980] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:45:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:45' WHERE id = 73787;

-- Event #17, M.Prg: 73817, tot. athletes: 1
-- Tot. progr. duration: 167 (sec), Heat durations: [16750] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:47:29 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:47' WHERE id = 73817;

-- Event #18, M.Prg: 73788, tot. athletes: 5
-- Tot. progr. duration: 140 (sec), Heat durations: [14040] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:50:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:50' WHERE id = 73788;

-- Event #18, M.Prg: 73832, tot. athletes: 3
-- Tot. progr. duration: 167 (sec), Heat durations: [16756] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:52:36 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:52' WHERE id = 73832;

-- Event #19, M.Prg: 73814, tot. athletes: 5
-- Tot. progr. duration: 118 (sec), Heat durations: [11810] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:55:23 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:55' WHERE id = 73814;

-- Event #19, M.Prg: 73790, tot. athletes: 8
-- Tot. progr. duration: 201 (sec), Heat durations: [10420, 9750] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:57:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:57' WHERE id = 73790;

-- Event #20, M.Prg: 73791, tot. athletes: 3
-- Tot. progr. duration: 842 (sec), Heat durations: [84280] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:00:42 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:00' WHERE id = 73791;

-- Event #20, M.Prg: 73792, tot. athletes: 2
-- Tot. progr. duration: 658 (sec), Heat durations: [65870] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:14:44 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:14' WHERE id = 73792;

-- Event #21, M.Prg: 73826, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:25:42 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:25' WHERE id = 73826;

-- Event #21, M.Prg: 73793, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:25:42 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:25' WHERE id = 73793;

-- Event #22, M.Prg: 73794, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:25:42 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:25' WHERE id = 73794;

-- Event #23, M.Prg: 73795, tot. athletes: 5
-- Tot. progr. duration: 163 (sec), Heat durations: [16390] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:25:42 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:25' WHERE id = 73795;

-- Event #23, M.Prg: 73796, tot. athletes: 4
-- Tot. progr. duration: 150 (sec), Heat durations: [15040] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:28:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:28' WHERE id = 73796;

-- Event #24, M.Prg: 73809, tot. athletes: 3
-- Tot. progr. duration: 1086 (sec), Heat durations: [108640] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:30:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:30' WHERE id = 73809;

-- Event #24, M.Prg: 73798, tot. athletes: 4
-- Tot. progr. duration: 800 (sec), Heat durations: [80020] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:49:01 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:49' WHERE id = 73798;

-- Event #25, M.Prg: 73799, tot. athletes: 3
-- Tot. progr. duration: 166 (sec), Heat durations: [16620] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:02:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:02' WHERE id = 73799;

-- Event #25, M.Prg: 73815, tot. athletes: 6
-- Tot. progr. duration: 153 (sec), Heat durations: [15310] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:05:07 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:05' WHERE id = 73815;

-- Event #26, M.Prg: 73800, tot. athletes: 4
-- Tot. progr. duration: 835 (sec), Heat durations: [83520] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 18:07:40 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 73800;

-- Event #26, M.Prg: 73830, tot. athletes: 3
-- Tot. progr. duration: 846 (sec), Heat durations: [84670] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 18:21:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:21' WHERE id = 73830;

-- Event #27, M.Prg: 73808, tot. athletes: 2
-- Tot. progr. duration: 133 (sec), Heat durations: [13370] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:35:41 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:35' WHERE id = 73808;

-- Event #27, M.Prg: 73802, tot. athletes: 3
-- Tot. progr. duration: 165 (sec), Heat durations: [16500] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:37:54 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:37' WHERE id = 73802;

-- Event #28, M.Prg: 73803, tot. athletes: 4
-- Tot. progr. duration: 103 (sec), Heat durations: [10340] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:40:39 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:40' WHERE id = 73803;

-- Event #28, M.Prg: 73822, tot. athletes: 3
-- Tot. progr. duration: 109 (sec), Heat durations: [10960] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:42:22 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:42' WHERE id = 73822;

-- Event #29, M.Prg: 74015, tot. athletes: 1
-- Tot. progr. duration: 169 (sec), Heat durations: [16960] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:44:11 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:44' WHERE id = 74015;

-- Event #29, M.Prg: 73816, tot. athletes: 1
-- Tot. progr. duration: 130 (sec), Heat durations: [13080] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:47:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:47' WHERE id = 73816;

-- Event #29, M.Prg: 73805, tot. athletes: 2
-- Tot. progr. duration: 162 (sec), Heat durations: [16260] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:49:10 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:49' WHERE id = 73805;

-- Event #30, M.Prg: 73806, tot. athletes: 1
-- Tot. progr. duration: 138 (sec), Heat durations: [13890] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:51:52 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:51' WHERE id = 73806;

-- Event #31, M.Prg: 73838, tot. athletes: 1
-- Tot. progr. duration: 893 (sec), Heat durations: [89390] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 18:54:10 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:54' WHERE id = 73838;

-- Event #31, M.Prg: 73810, tot. athletes: 2
-- Tot. progr. duration: 1034 (sec), Heat durations: [103400] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 19:09:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:09' WHERE id = 73810;

-- Event #32, M.Prg: 73811, tot. athletes: 3
-- Tot. progr. duration: 968 (sec), Heat durations: [96820] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 19:26:17 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:26' WHERE id = 73811;

-- Event #33, M.Prg: 73813, tot. athletes: 3
-- Tot. progr. duration: 144 (sec), Heat durations: [14410] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:42:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:42' WHERE id = 73813;

-- Event #33, M.Prg: 73834, tot. athletes: 2
-- Tot. progr. duration: 143 (sec), Heat durations: [14300] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:44:49 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:44' WHERE id = 73834;

-- Event #34, M.Prg: 73842, tot. athletes: 1
-- Tot. progr. duration: 193 (sec), Heat durations: [19370] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:47:12 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:47' WHERE id = 73842;

-- Event #34, M.Prg: 73818, tot. athletes: 3
-- Tot. progr. duration: 154 (sec), Heat durations: [15420] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:50:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:50' WHERE id = 73818;

-- Event #35, M.Prg: 73819, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:52:59 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:52' WHERE id = 73819;

-- Event #36, M.Prg: 73820, tot. athletes: 1
-- Tot. progr. duration: 105 (sec), Heat durations: [10520] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:52:59 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:52' WHERE id = 73820;

-- Event #36, M.Prg: 73837, tot. athletes: 1
-- Tot. progr. duration: 126 (sec), Heat durations: [12650] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:54:44 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:54' WHERE id = 73837;

-- Event #37, M.Prg: 73824, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:56:50 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:56' WHERE id = 73824;

-- Event #37, M.Prg: 73835, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:56:50 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:56' WHERE id = 73835;

-- Event #38, M.Prg: 73825, tot. athletes: 2
-- Tot. progr. duration: 109 (sec), Heat durations: [10980] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:56:50 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:56' WHERE id = 73825;

-- Event #38, M.Prg: 73831, tot. athletes: 2
-- Tot. progr. duration: 111 (sec), Heat durations: [11180] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:58:39 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:58' WHERE id = 73831;

-- Event #39, M.Prg: 73827, tot. athletes: 3
-- Tot. progr. duration: 158 (sec), Heat durations: [15840] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:00:30 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:00' WHERE id = 73827;

-- Event #39, M.Prg: 73836, tot. athletes: 1
-- Tot. progr. duration: 165 (sec), Heat durations: [16540] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:03:08 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:03' WHERE id = 73836;

-- Event #40, M.Prg: 73833, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:05:53 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:05' WHERE id = 73833;

-- Event #41, M.Prg: 73840, tot. athletes: 1
-- Tot. progr. duration: 908 (sec), Heat durations: [90840] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 20:05:53 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:05' WHERE id = 73840;

-- Event #42, M.Prg: 73841, tot. athletes: 1
-- Tot. progr. duration: 808 (sec), Heat durations: [80820] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 20:21:01 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:21' WHERE id = 73841;

-- Event #43, M.Prg: 73844, tot. athletes: 1
-- Tot. progr. duration: 164 (sec), Heat durations: [16490] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:34:29 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:34' WHERE id = 73844;


-- Last completed phase code: 30
