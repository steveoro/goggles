-- *** SQL Diff file for ris20150524csiprova6.csv ***
-- Timestamp: 201505241444
INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`)
  VALUES (26511, '?', 141, 1767, 32, 828, 1, '2015-05-24 14:51:10', '2015-05-24 14:51:10', 5, 495);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (3742, '2015-05-24 14:51:10', '2015-05-24 14:51:10', NULL, NULL, NULL, NULL, 30062, 1596, 39, 498, 8155, NULL, 1, 1, 5, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (3743, '2015-05-24 14:51:11', '2015-05-24 14:51:11', NULL, NULL, NULL, NULL, 30052, 1765, 32, 495, 8216, NULL, 1, 1, 15, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (3744, '2015-05-24 14:51:11', '2015-05-24 14:51:11', NULL, NULL, NULL, NULL, 30006, 1305, 32, 495, 8252, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (3745, '2015-05-24 14:51:11', '2015-05-24 14:51:11', NULL, NULL, NULL, NULL, 30052, 580, 17, 493, 8215, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (3746, '2015-05-24 14:51:11', '2015-05-24 14:51:11', NULL, NULL, NULL, NULL, 30051, 1528, 32, 495, 26510, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (3747, '2015-05-24 14:51:11', '2015-05-24 14:51:11', NULL, NULL, NULL, NULL, 30060, 1767, 32, 495, 26511, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232912, 2, 1, 0, 0, 0.0, 95.0, 1, 2, 60, 30006, 1699, 35, 8391, 1, '2015-05-24 14:51:11', '2015-05-24 14:51:11', NULL, 0.0, 0.0, 14.0, 496);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232913, 6, 1, 0, 0, 0.0, 75.0, 0, 47, 60, 30009, 1537, 35, 8199, 1, '2015-05-24 14:51:11', '2015-05-24 14:51:11', NULL, 0.0, 0.0, 6.0, 496);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232914, 1, 1, 0, 0, 0.0, 100.0, 1, 26, 10, 30012, 64, 35, 8377, 1, '2015-05-24 14:51:11', '2015-05-24 14:51:11', NULL, 0.0, 0.0, 16.0, 496);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232915, 2, 1, 0, 0, 0.0, 95.0, 1, 28, 70, 30013, 1532, 35, 8176, 1, '2015-05-24 14:51:11', '2015-05-24 14:51:11', NULL, 0.0, 0.0, 14.0, 496);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232916, 5, 1, 0, 0, 0.0, 80.0, 0, 48, 50, 30017, 1807, 18, 8243, 1, '2015-05-24 14:51:11', '2015-05-24 14:51:11', NULL, 0.0, 0.0, 8.0, 494);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232917, 3, 1, 0, 0, 0.0, 90.0, 0, 38, 70, 30023, 1662, 5, 8275, 1, '2015-05-24 14:51:11', '2015-05-24 14:51:11', NULL, 0.0, 0.0, 12.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232918, 1, 1, 0, 0, 0.0, 100.0, 1, 5, 0, 30033, 467, 5, 8206, 1, '2015-05-24 14:51:12', '2015-05-24 14:51:12', NULL, 0.0, 0.0, 16.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232919, 3, 1, 0, 0, 0.0, 90.0, 0, 46, 0, 30036, 843, 5, 8420, 1, '2015-05-24 14:51:12', '2015-05-24 14:51:12', NULL, 0.0, 0.0, 12.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232920, 1, 1, 0, 0, 0.0, 100.0, 1, 24, 60, 30013, 822, 5, 8179, 1, '2015-05-24 14:51:12', '2015-05-24 14:51:12', NULL, 0.0, 0.0, 16.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232921, 2, 1, 0, 0, 0.0, 95.0, 1, 39, 60, 30034, 966, 5, 8356, 1, '2015-05-24 14:51:12', '2015-05-24 14:51:12', NULL, 0.0, 0.0, 14.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232922, 4, 1, 0, 0, 0.0, 85.0, 0, 46, 10, 30030, 40, 5, 8236, 1, '2015-05-24 14:51:12', '2015-05-24 14:51:12', NULL, 0.0, 0.0, 10.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232923, 3, 1, 0, 0, 0.0, 90.0, 1, 13, 60, 30037, 1662, 5, 8275, 1, '2015-05-24 14:51:12', '2015-05-24 14:51:12', NULL, 0.0, 0.0, 12.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232924, 4, 1, 0, 0, 0.0, 85.0, 1, 26, 10, 30038, 4871, 5, 8422, 1, '2015-05-24 14:51:12', '2015-05-24 14:51:12', NULL, 0.0, 0.0, 10.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232925, 4, 1, 0, 0, 0.0, 85.0, 0, 37, 30, 30039, 982, 5, 8370, 1, '2015-05-24 14:51:12', '2015-05-24 14:51:12', NULL, 0.0, 0.0, 10.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232926, 9, 1, 0, 0, 0.0, 60.0, 0, 44, 60, 30041, 691, 5, 8202, 1, '2015-05-24 14:51:12', '2015-05-24 14:51:12', NULL, 0.0, 0.0, 2.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232927, 5, 1, 0, 0, 0.0, 80.0, 1, 14, 80, 30042, 960, 5, 8192, 1, '2015-05-24 14:51:12', '2015-05-24 14:51:12', NULL, 0.0, 0.0, 8.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232928, 6, 1, 0, 0, 0.0, 75.0, 0, 45, 30, 30023, 18989, 5, 25162, 1, '2015-05-24 14:51:12', '2015-05-24 14:51:12', NULL, 0.0, 0.0, 6.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232929, 3, 1, 0, 0, 0.0, 90.0, 1, 17, 20, 30038, 697, 5, 8363, 1, '2015-05-24 14:51:13', '2015-05-24 14:51:13', NULL, 0.0, 0.0, 12.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232930, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 30, 30030, 1160, 5, 8310, 1, '2015-05-24 14:51:13', '2015-05-24 14:51:13', NULL, 0.0, 0.0, 14.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232931, 2, 1, 0, 0, 0.0, 95.0, 0, 40, 50, 30043, 1750, 5, 17309, 1, '2015-05-24 14:51:13', '2015-05-24 14:51:13', NULL, 0.0, 0.0, 14.0, 489);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232932, 4, 1, 0, 0, 0.0, 85.0, 0, 48, 40, 30051, 1483, 1, 8117, 1, '2015-05-24 14:51:13', '2015-05-24 14:51:13', NULL, 0.0, 0.0, 10.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232933, 4, 1, 0, 0, 0.0, 85.0, 0, 45, 20, 30052, 550, 1, 8131, 1, '2015-05-24 14:51:13', '2015-05-24 14:51:13', NULL, 0.0, 0.0, 10.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232934, 1, 1, 0, 0, 0.0, 100.0, 0, 40, 40, 30043, 785, 1, 8102, 1, '2015-05-24 14:51:13', '2015-05-24 14:51:13', NULL, 0.0, 0.0, 16.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232935, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 40, 30023, 4856, 1, 8135, 1, '2015-05-24 14:51:13', '2015-05-24 14:51:13', NULL, 0.0, 0.0, 14.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232936, 3, 1, 0, 0, 0.0, 90.0, 0, 41, 40, 30060, 456, 1, 8096, 1, '2015-05-24 14:51:13', '2015-05-24 14:51:13', NULL, 0.0, 0.0, 12.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232937, 3, 1, 0, 0, 0.0, 90.0, 0, 46, 40, 30017, 138, 1, 8088, 1, '2015-05-24 14:51:13', '2015-05-24 14:51:13', NULL, 0.0, 0.0, 12.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232938, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 90, 30023, 1405, 1, 8108, 1, '2015-05-24 14:51:13', '2015-05-24 14:51:13', NULL, 0.0, 0.0, 16.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232939, 9, 1, 0, 0, 0.0, 60.0, 1, 2, 50, 30063, 19091, 1, 25494, 1, '2015-05-24 14:51:13', '2015-05-24 14:51:13', NULL, 0.0, 0.0, 2.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232940, 1, 1, 0, 0, 0.0, 100.0, 1, 11, 50, 30065, 23, 1, 8099, 1, '2015-05-24 14:51:13', '2015-05-24 14:51:13', NULL, 0.0, 0.0, 16.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232941, 1, 1, 0, 0, 0.0, 100.0, 0, 34, 40, 30051, 1491, 1, 8113, 1, '2015-05-24 14:51:14', '2015-05-24 14:51:14', NULL, 0.0, 0.0, 16.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232942, 3, 1, 0, 0, 0.0, 90.0, 0, 43, 60, 30009, 1788, 1, 8123, 1, '2015-05-24 14:51:14', '2015-05-24 14:51:14', NULL, 0.0, 0.0, 12.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232943, 7, 1, 0, 0, 0.0, 70.0, 0, 39, 80, 30041, 1279, 1, 8109, 1, '2015-05-24 14:51:14', '2015-05-24 14:51:14', NULL, 0.0, 0.0, 4.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232944, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 0, 30030, 1541, 1, 8424, 1, '2015-05-24 14:51:14', '2015-05-24 14:51:14', NULL, 0.0, 0.0, 16.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232945, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 80, 30040, 500, 1, 8133, 1, '2015-05-24 14:51:14', '2015-05-24 14:51:14', NULL, 0.0, 0.0, 14.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232946, 10, 1, 0, 0, 0.0, 55.0, 1, 5, 50, 30063, 19097, 1, 25500, 1, '2015-05-24 14:51:14', '2015-05-24 14:51:14', NULL, 0.0, 0.0, 2.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232947, 3, 1, 0, 0, 0.0, 90.0, 0, 41, 30, 30043, 1868, 1, 8128, 1, '2015-05-24 14:51:14', '2015-05-24 14:51:14', NULL, 0.0, 0.0, 12.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232948, 3, 1, 0, 0, 0.0, 90.0, 1, 5, 60, 30042, 1025, 1, 8105, 1, '2015-05-24 14:51:14', '2015-05-24 14:51:14', NULL, 0.0, 0.0, 12.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232949, 4, 1, 0, 0, 0.0, 85.0, 1, 20, 40, 30037, 11742, 1, 17323, 1, '2015-05-24 14:51:14', '2015-05-24 14:51:14', NULL, 0.0, 0.0, 10.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232950, 1, 1, 0, 0, 0.0, 100.0, 0, 58, 70, 30037, 1496, 1, 8114, 1, '2015-05-24 14:51:14', '2015-05-24 14:51:14', NULL, 0.0, 0.0, 16.0, 488);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232951, 7, 1, 0, 0, 0.0, 70.0, 0, 43, 10, 30039, 228, 11, 8248, 1, '2015-05-24 14:51:14', '2015-05-24 14:51:14', NULL, 0.0, 0.0, 4.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232952, 6, 1, 0, 0, 0.0, 75.0, 0, 51, 50, 30052, 685, 11, 8357, 1, '2015-05-24 14:51:15', '2015-05-24 14:51:15', NULL, 0.0, 0.0, 6.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232953, 8, 1, 0, 0, 0.0, 65.0, 0, 43, 80, 30041, 1731, 11, 8299, 1, '2015-05-24 14:51:15', '2015-05-24 14:51:15', NULL, 0.0, 0.0, 2.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232954, 2, 1, 0, 0, 0.0, 95.0, 1, 30, 40, 30069, 1679, 11, 8373, 1, '2015-05-24 14:51:15', '2015-05-24 14:51:15', NULL, 0.0, 0.0, 14.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232955, 1, 1, 0, 0, 0.0, 100.0, 1, 13, 50, 30071, 1776, 11, 8141, 1, '2015-05-24 14:51:15', '2015-05-24 14:51:15', NULL, 0.0, 0.0, 16.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232956, 4, 1, 0, 0, 0.0, 85.0, 0, 37, 10, 30041, 1659, 11, 8294, 1, '2015-05-24 14:51:15', '2015-05-24 14:51:15', NULL, 0.0, 0.0, 10.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232957, 11, 1, 0, 0, 0.0, 50.0, 0, 45, 20, 30039, 148, 11, 8322, 1, '2015-05-24 14:51:15', '2015-05-24 14:51:15', NULL, 0.0, 0.0, 2.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232958, 4, 1, 0, 0, 0.0, 85.0, 0, 39, 20, 30040, 4848, 11, 8361, 1, '2015-05-24 14:51:15', '2015-05-24 14:51:15', NULL, 0.0, 0.0, 10.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232959, 1, 1, 0, 0, 0.0, 100.0, 0, 42, 20, 30036, 882, 11, 8180, 1, '2015-05-24 14:51:15', '2015-05-24 14:51:15', NULL, 0.0, 0.0, 16.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232960, 2, 1, 0, 0, 0.0, 95.0, 1, 12, 50, 30038, 87, 11, 8226, 1, '2015-05-24 14:51:15', '2015-05-24 14:51:15', NULL, 0.0, 0.0, 14.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232961, 4, 1, 0, 0, 0.0, 85.0, 0, 50, 10, 30036, 1556, 11, 8174, 1, '2015-05-24 14:51:15', '2015-05-24 14:51:15', NULL, 0.0, 0.0, 10.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232962, 5, 1, 0, 0, 0.0, 80.0, 0, 39, 40, 30040, 1030, 11, 8302, 1, '2015-05-24 14:51:15', '2015-05-24 14:51:15', NULL, 0.0, 0.0, 8.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232963, 3, 1, 0, 0, 0.0, 90.0, 0, 38, 0, 30030, 553, 11, 8233, 1, '2015-05-24 14:51:15', '2015-05-24 14:51:15', NULL, 0.0, 0.0, 12.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232964, 5, 1, 0, 0, 0.0, 80.0, 0, 45, 50, 30009, 1677, 11, 8200, 1, '2015-05-24 14:51:16', '2015-05-24 14:51:16', NULL, 0.0, 0.0, 8.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232965, 4, 1, 0, 0, 0.0, 85.0, 0, 47, 0, 30017, 1244, 11, 8314, 1, '2015-05-24 14:51:16', '2015-05-24 14:51:16', NULL, 0.0, 0.0, 10.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232966, 2, 1, 0, 0, 0.0, 95.0, 1, 25, 80, 30065, 1680, 11, 8313, 1, '2015-05-24 14:51:16', '2015-05-24 14:51:16', NULL, 0.0, 0.0, 14.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232967, 2, 1, 0, 0, 0.0, 95.0, 0, 45, 30, 30017, 1457, 11, 8242, 1, '2015-05-24 14:51:16', '2015-05-24 14:51:16', NULL, 0.0, 0.0, 14.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232968, 1, 1, 0, 0, 0.0, 100.0, 0, 39, 0, 30017, 1449, 11, 8239, 1, '2015-05-24 14:51:16', '2015-05-24 14:51:16', NULL, 0.0, 0.0, 16.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232969, 7, 1, 0, 0, 0.0, 70.0, 1, 19, 0, 30042, 4849, 11, 8191, 1, '2015-05-24 14:51:16', '2015-05-24 14:51:16', NULL, 0.0, 0.0, 4.0, 491);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232970, 5, 1, 0, 0, 0.0, 80.0, 0, 47, 40, 30052, 11734, 4, 17325, 1, '2015-05-24 14:51:16', '2015-05-24 14:51:16', NULL, 0.0, 0.0, 8.0, 487);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232971, 3, 1, 0, 0, 0.0, 90.0, 0, 36, 90, 30039, 25, 4, 8316, 1, '2015-05-24 14:51:16', '2015-05-24 14:51:16', NULL, 0.0, 0.0, 12.0, 487);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232972, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 10, 30040, 582, 17, 8225, 1, '2015-05-24 14:51:16', '2015-05-24 14:51:16', NULL, 0.0, 0.0, 16.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232973, 5, 1, 0, 0, 0.0, 80.0, 0, 42, 0, 30060, 590, 17, 8254, 1, '2015-05-24 14:51:16', '2015-05-24 14:51:16', NULL, 0.0, 0.0, 8.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232974, 3, 1, 0, 0, 0.0, 90.0, 0, 41, 40, 30060, 772, 17, 17311, 1, '2015-05-24 14:51:16', '2015-05-24 14:51:16', NULL, 0.0, 0.0, 12.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232975, 3, 1, 0, 0, 0.0, 90.0, 0, 35, 50, 30041, 1454, 17, 8205, 1, '2015-05-24 14:51:17', '2015-05-24 14:51:17', NULL, 0.0, 0.0, 12.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232976, 1, 1, 0, 0, 0.0, 100.0, 0, 58, 20, 30042, 1710, 17, 8186, 1, '2015-05-24 14:51:17', '2015-05-24 14:51:17', NULL, 0.0, 0.0, 16.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232977, 1, 1, 0, 0, 0.0, 100.0, 1, 52, 0, 30075, 1088, 17, 8241, 1, '2015-05-24 14:51:17', '2015-05-24 14:51:17', NULL, 0.0, 0.0, 16.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232978, 3, 1, 0, 0, 0.0, 90.0, 0, 44, 90, 30052, 1455, 17, 8217, 1, '2015-05-24 14:51:17', '2015-05-24 14:51:17', NULL, 0.0, 0.0, 12.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232979, 5, 1, 0, 0, 0.0, 80.0, 0, 41, 30, 30023, 1830, 17, 8172, 1, '2015-05-24 14:51:17', '2015-05-24 14:51:17', NULL, 0.0, 0.0, 8.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232980, 1, 1, 0, 0, 0.0, 100.0, 0, 42, 20, 30036, 1135, 17, 8178, 1, '2015-05-24 14:51:17', '2015-05-24 14:51:17', NULL, 0.0, 0.0, 16.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232981, 6, 1, 0, 0, 0.0, 75.0, 0, 41, 80, 30039, 1117, 17, 8247, 1, '2015-05-24 14:51:17', '2015-05-24 14:51:17', NULL, 0.0, 0.0, 6.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232982, 2, 1, 0, 0, 0.0, 95.0, 0, 35, 30, 30041, 1060, 17, 8291, 1, '2015-05-24 14:51:17', '2015-05-24 14:51:17', NULL, 0.0, 0.0, 14.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232983, 1, 1, 0, 0, 0.0, 100.0, 1, 11, 90, 30038, 582, 17, 8225, 1, '2015-05-24 14:51:17', '2015-05-24 14:51:17', NULL, 0.0, 0.0, 16.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232984, 1, 1, 0, 0, 0.0, 100.0, 1, 50, 10, 30076, 590, 17, 8254, 1, '2015-05-24 14:51:17', '2015-05-24 14:51:17', NULL, 0.0, 0.0, 16.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232985, 2, 1, 0, 0, 0.0, 95.0, 1, 1, 70, 30042, 1448, 17, 8187, 1, '2015-05-24 14:51:17', '2015-05-24 14:51:17', NULL, 0.0, 0.0, 14.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232986, 3, 1, 0, 0, 0.0, 90.0, 0, 37, 90, 30040, 1292, 17, 8223, 1, '2015-05-24 14:51:17', '2015-05-24 14:51:17', NULL, 0.0, 0.0, 12.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232987, 1, 1, 0, 0, 0.0, 100.0, 1, 15, 50, 30069, 4019, 17, 8246, 1, '2015-05-24 14:51:17', '2015-05-24 14:51:17', NULL, 0.0, 0.0, 16.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232988, 7, 1, 0, 0, 0.0, 70.0, 0, 46, 0, 30040, 1766, 17, 8304, 1, '2015-05-24 14:51:18', '2015-05-24 14:51:18', NULL, 0.0, 0.0, 4.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232989, 3, 1, 0, 0, 0.0, 90.0, 0, 47, 90, 30051, 1639, 17, 8432, 1, '2015-05-24 14:51:18', '2015-05-24 14:51:18', NULL, 0.0, 0.0, 12.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232990, 5, 1, 0, 0, 0.0, 80.0, 0, 37, 30, 30041, 1097, 17, 8292, 1, '2015-05-24 14:51:18', '2015-05-24 14:51:18', NULL, 0.0, 0.0, 8.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232991, 7, 1, 0, 0, 0.0, 70.0, 0, 47, 80, 30009, 993, 17, 8197, 1, '2015-05-24 14:51:18', '2015-05-24 14:51:18', NULL, 0.0, 0.0, 4.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232992, 4, 1, 0, 0, 0.0, 85.0, 0, 41, 10, 30023, 1721, 17, 8160, 1, '2015-05-24 14:51:18', '2015-05-24 14:51:18', NULL, 0.0, 0.0, 10.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232993, 3, 1, 0, 0, 0.0, 90.0, 1, 6, 70, 30033, 1102, 17, 8203, 1, '2015-05-24 14:51:18', '2015-05-24 14:51:18', NULL, 0.0, 0.0, 12.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232994, 2, 1, 0, 0, 0.0, 95.0, 0, 45, 80, 30051, 1760, 17, 8433, 1, '2015-05-24 14:51:18', '2015-05-24 14:51:18', NULL, 0.0, 0.0, 14.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232995, 5, 1, 0, 0, 0.0, 80.0, 0, 40, 90, 30039, 1116, 17, 8317, 1, '2015-05-24 14:51:18', '2015-05-24 14:51:18', NULL, 0.0, 0.0, 8.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232996, 1, 1, 0, 0, 0.0, 100.0, 0, 40, 60, 30009, 1535, 17, 17317, 1, '2015-05-24 14:51:18', '2015-05-24 14:51:18', NULL, 0.0, 0.0, 16.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232997, 1, 1, 0, 0, 0.0, 100.0, 0, 34, 70, 30041, 1538, 17, 17318, 1, '2015-05-24 14:51:18', '2015-05-24 14:51:18', NULL, 0.0, 0.0, 16.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232998, 1, 1, 0, 0, 0.0, 100.0, 1, 11, 40, 30078, 1414, 17, 25019, 1, '2015-05-24 14:51:19', '2015-05-24 14:51:19', NULL, 0.0, 0.0, 16.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (232999, 2, 1, 0, 0, 0.0, 95.0, 0, 43, 10, 30009, 1536, 17, 25022, 1, '2015-05-24 14:51:19', '2015-05-24 14:51:19', NULL, 0.0, 0.0, 14.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233000, 6, 1, 0, 0, 0.0, 75.0, 0, 40, 0, 30040, 1392, 17, 17313, 1, '2015-05-24 14:51:19', '2015-05-24 14:51:19', NULL, 0.0, 0.0, 6.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233001, 2, 1, 0, 0, 0.0, 95.0, 0, 36, 60, 30039, 1426, 17, 17315, 1, '2015-05-24 14:51:19', '2015-05-24 14:51:19', NULL, 0.0, 0.0, 14.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233002, 2, 1, 0, 0, 0.0, 95.0, 0, 44, 80, 30052, 878, 17, 17319, 1, '2015-05-24 14:51:19', '2015-05-24 14:51:19', NULL, 0.0, 0.0, 14.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233003, 6, 1, 0, 0, 0.0, 75.0, 0, 44, 0, 30060, 1138, 17, 17320, 1, '2015-05-24 14:51:19', '2015-05-24 14:51:19', NULL, 0.0, 0.0, 6.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233004, 2, 1, 0, 0, 0.0, 95.0, 1, 15, 80, 30071, 19340, 17, 26508, 1, '2015-05-24 14:51:19', '2015-05-24 14:51:19', NULL, 0.0, 0.0, 14.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233005, 1, 1, 0, 0, 0.0, 100.0, 1, 2, 0, 30059, 1818, 39, 8307, 1, '2015-05-24 14:51:19', '2015-05-24 14:51:19', NULL, 0.0, 0.0, 16.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233006, 4, 1, 0, 0, 0.0, 85.0, 1, 40, 90, 30071, 1547, 39, 8151, 1, '2015-05-24 14:51:19', '2015-05-24 14:51:19', NULL, 0.0, 0.0, 10.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233007, 2, 1, 0, 0, 0.0, 95.0, 1, 24, 10, 30081, 1583, 39, 8169, 1, '2015-05-24 14:51:19', '2015-05-24 14:51:19', NULL, 0.0, 0.0, 14.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233008, 2, 1, 0, 0, 0.0, 95.0, 0, 51, 90, 30063, 1840, 39, 8327, 1, '2015-05-24 14:51:19', '2015-05-24 14:51:19', NULL, 0.0, 0.0, 14.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233009, 6, 1, 0, 0, 0.0, 75.0, 0, 56, 0, 30063, 4817, 39, 8329, 1, '2015-05-24 14:51:19', '2015-05-24 14:51:19', NULL, 0.0, 0.0, 6.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233010, 4, 1, 0, 0, 0.0, 85.0, 0, 53, 10, 30063, 1607, 39, 8445, 1, '2015-05-24 14:51:19', '2015-05-24 14:51:19', NULL, 0.0, 0.0, 10.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233011, 4, 1, 0, 0, 0.0, 85.0, 0, 45, 40, 30009, 1723, 39, 8198, 1, '2015-05-24 14:51:20', '2015-05-24 14:51:20', NULL, 0.0, 0.0, 10.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233012, 8, 1, 0, 0, 0.0, 65.0, 0, 43, 80, 30039, 1820, 39, 8318, 1, '2015-05-24 14:51:20', '2015-05-24 14:51:20', NULL, 0.0, 0.0, 2.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233013, 7, 1, 0, 0, 0.0, 70.0, 0, 56, 50, 30063, 4818, 39, 8328, 1, '2015-05-24 14:51:20', '2015-05-24 14:51:20', NULL, 0.0, 0.0, 4.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233014, 4, 1, 0, 0, 0.0, 85.0, 1, 13, 30, 30042, 3988, 39, 8344, 1, '2015-05-24 14:51:20', '2015-05-24 14:51:20', NULL, 0.0, 0.0, 10.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233015, 3, 1, 0, 0, 0.0, 90.0, 0, 37, 50, 30062, 1623, 39, 8279, 1, '2015-05-24 14:51:20', '2015-05-24 14:51:20', NULL, 0.0, 0.0, 12.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233016, 3, 1, 0, 0, 0.0, 90.0, 1, 31, 60, 30069, 4820, 39, 8320, 1, '2015-05-24 14:51:20', '2015-05-24 14:51:20', NULL, 0.0, 0.0, 12.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233017, 6, 1, 0, 0, 0.0, 75.0, 1, 16, 0, 30042, 1749, 39, 25029, 1, '2015-05-24 14:51:20', '2015-05-24 14:51:20', NULL, 0.0, 0.0, 6.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233018, 1, 1, 0, 0, 0.0, 100.0, 0, 34, 70, 30062, 4868, 39, 8444, 1, '2015-05-24 14:51:20', '2015-05-24 14:51:20', NULL, 0.0, 0.0, 16.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233019, 2, 1, 0, 0, 0.0, 95.0, 1, 5, 90, 30033, 1656, 39, 8204, 1, '2015-05-24 14:51:20', '2015-05-24 14:51:20', NULL, 0.0, 0.0, 14.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233020, 1, 1, 0, 0, 0.0, 100.0, 1, 24, 50, 30082, 4823, 39, 8259, 1, '2015-05-24 14:51:20', '2015-05-24 14:51:20', NULL, 0.0, 0.0, 16.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233021, 8, 1, 0, 0, 0.0, 65.0, 0, 58, 40, 30063, 11736, 39, 17332, 1, '2015-05-24 14:51:20', '2015-05-24 14:51:20', NULL, 0.0, 0.0, 2.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233022, 1, 1, 0, 0, 0.0, 100.0, 0, 41, 0, 30063, 4828, 39, 8145, 1, '2015-05-24 14:51:21', '2015-05-24 14:51:21', NULL, 0.0, 0.0, 16.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233023, 5, 1, 0, 0, 0.0, 80.0, 0, 49, 10, 30051, 1568, 39, 8267, 1, '2015-05-24 14:51:21', '2015-05-24 14:51:21', NULL, 0.0, 0.0, 8.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233024, 5, 1, 0, 0, 0.0, 80.0, 0, 55, 50, 30063, 4869, 39, 8449, 1, '2015-05-24 14:51:21', '2015-05-24 14:51:21', NULL, 0.0, 0.0, 8.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233025, 10, 1, 0, 0, 0.0, 55.0, 0, 44, 30, 30039, 1819, 39, 8319, 1, '2015-05-24 14:51:21', '2015-05-24 14:51:21', NULL, 0.0, 0.0, 2.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233026, 5, 1, 0, 0, 0.0, 80.0, 0, 40, 40, 30062, 4827, 39, 8164, 1, '2015-05-24 14:51:21', '2015-05-24 14:51:21', NULL, 0.0, 0.0, 8.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233027, 3, 1, 0, 0, 0.0, 90.0, 1, 24, 70, 30071, 1544, 39, 8447, 1, '2015-05-24 14:51:21', '2015-05-24 14:51:21', NULL, 0.0, 0.0, 12.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233028, 4, 1, 0, 0, 0.0, 85.0, 0, 38, 90, 30062, 4870, 39, 8452, 1, '2015-05-24 14:51:21', '2015-05-24 14:51:21', NULL, 0.0, 0.0, 10.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233029, 3, 1, 0, 0, 0.0, 90.0, 0, 52, 90, 30063, 11740, 39, 17334, 1, '2015-05-24 14:51:21', '2015-05-24 14:51:21', NULL, 0.0, 0.0, 12.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233030, 7, 1, 0, 0, 0.0, 70.0, 0, 46, 70, 30023, 11741, 39, 17335, 1, '2015-05-24 14:51:21', '2015-05-24 14:51:21', NULL, 0.0, 0.0, 4.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233031, 2, 1, 0, 0, 0.0, 95.0, 0, 37, 10, 30062, 1596, 39, 8155, 1, '2015-05-24 14:51:21', '2015-05-24 14:51:21', NULL, 0.0, 0.0, 14.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233032, 1, 1, 0, 0, 0.0, 100.0, 1, 18, 50, 30081, 4826, 39, 8264, 1, '2015-05-24 14:51:21', '2015-05-24 14:51:21', NULL, 0.0, 0.0, 16.0, 498);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233033, 3, 1, 0, 0, 0.0, 90.0, 1, 4, 0, 30006, 1363, 32, 8253, 1, '2015-05-24 14:51:21', '2015-05-24 14:51:21', NULL, 0.0, 0.0, 12.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233034, 2, 1, 0, 0, 0.0, 95.0, 0, 40, 10, 30060, 1543, 32, 8324, 1, '2015-05-24 14:51:22', '2015-05-24 14:51:22', NULL, 0.0, 0.0, 14.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233035, 2, 1, 0, 0, 0.0, 95.0, 1, 6, 70, 30037, 1308, 32, 8156, 1, '2015-05-24 14:51:22', '2015-05-24 14:51:22', NULL, 0.0, 0.0, 14.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233036, 9, 1, 0, 0, 0.0, 60.0, 0, 44, 20, 30039, 1270, 32, 8371, 1, '2015-05-24 14:51:22', '2015-05-24 14:51:22', NULL, 0.0, 0.0, 2.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233037, 4, 1, 0, 0, 0.0, 85.0, 1, 8, 20, 30033, 1612, 32, 8209, 1, '2015-05-24 14:51:22', '2015-05-24 14:51:22', NULL, 0.0, 0.0, 10.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233038, 6, 1, 0, 0, 0.0, 75.0, 0, 37, 60, 30041, 1218, 32, 8293, 1, '2015-05-24 14:51:22', '2015-05-24 14:51:22', NULL, 0.0, 0.0, 6.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233039, 1, 1, 0, 0, 0.0, 100.0, 0, 39, 40, 30052, 1765, 32, 8216, 1, '2015-05-24 14:51:22', '2015-05-24 14:51:22', NULL, 0.0, 0.0, 16.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233040, 1, 1, 0, 0, 0.0, 100.0, 0, 55, 50, 30006, 1305, 32, 8252, 1, '2015-05-24 14:51:22', '2015-05-24 14:51:22', NULL, 0.0, 0.0, 16.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233041, 7, 1, 0, 0, 0.0, 70.0, 0, 54, 50, 30052, 580, 17, 8215, 1, '2015-05-24 14:51:22', '2015-05-24 14:51:22', NULL, 0.0, 0.0, 4.0, 493);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233042, 6, 1, 0, 0, 0.0, 75.0, 0, 50, 20, 30051, 1528, 32, 26510, 1, '2015-05-24 14:51:22', '2015-05-24 14:51:22', NULL, 0.0, 0.0, 6.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233043, 1, 1, 0, 0, 0.0, 100.0, 0, 39, 40, 30060, 1767, 32, 26511, 1, '2015-05-24 14:51:22', '2015-05-24 14:51:22', NULL, 0.0, 0.0, 16.0, 495);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`)
  VALUES (233044, 1, 1, 0, 0, 0.0, 100.0, 0, 35, 60, 30039, 142, 1, 8091, 1, '2015-05-24 14:51:22', '2015-05-24 14:51:22', NULL, 0.0, 0.0, 16.0, 488);


-- Meeting 14106
-- 'Results acquired' flag setting:
UPDATE meetings SET are_results_acquired = '1' WHERE id = 14106;


-- Meeting 14106
-- 'has_start_list' flag setting:
UPDATE meetings SET has_start_list = '1' WHERE id = 14106;

-- --- BeginTimeCalculator: compute_for_all( 14106 )
-- ----------------------------------------------------
-- Using RESULTS to compute heat length.

-- Event #1, M.Prg: 30004, tot. athletes: 6
-- Tot. progr. duration: 197 (sec), Heat durations: [19780] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:02:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:02' WHERE id = 30004;

-- Event #1, M.Prg: 30010, tot. athletes: 13
-- Tot. progr. duration: 408 (sec), Heat durations: [14750, 13640, 12410] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:05:17 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:05' WHERE id = 30010;

-- Event #2, M.Prg: 30005, tot. athletes: 6
-- Tot. progr. duration: 772 (sec), Heat durations: [77230] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 15:12:05 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:12' WHERE id = 30005;

-- Event #2, M.Prg: 30068, tot. athletes: 4
-- Tot. progr. duration: 1134 (sec), Heat durations: [113400] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 15:24:57 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:24' WHERE id = 30068;

-- Event #3, M.Prg: 30060, tot. athletes: 6
-- Tot. progr. duration: 104 (sec), Heat durations: [10400] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:43:51 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:43' WHERE id = 30060;

-- Event #3, M.Prg: 30006, tot. athletes: 3
-- Tot. progr. duration: 124 (sec), Heat durations: [12400] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 15:45:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:45' WHERE id = 30006;

-- Event #4, M.Prg: 30007, tot. athletes: 2
-- Tot. progr. duration: 838 (sec), Heat durations: [83870] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 15:47:39 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:47' WHERE id = 30007;

-- Event #5, M.Prg: 30028, tot. athletes: 9
-- Tot. progr. duration: 271 (sec), Heat durations: [14190, 12950] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:01:37 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:01' WHERE id = 30028;

-- Event #5, M.Prg: 30008, tot. athletes: 5
-- Tot. progr. duration: 156 (sec), Heat durations: [15660] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:06:08 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:06' WHERE id = 30008;

-- Event #6, M.Prg: 30009, tot. athletes: 7
-- Tot. progr. duration: 208 (sec), Heat durations: [10780, 10060] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:08:44 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:08' WHERE id = 30009;

-- Event #6, M.Prg: 30041, tot. athletes: 9
-- Tot. progr. duration: 200 (sec), Heat durations: [10460, 9550] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:12:12 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:12' WHERE id = 30041;

-- Event #7, M.Prg: 30011, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:15:32 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:15' WHERE id = 30011;

-- Event #7, M.Prg: 30045, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:15:32 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:15' WHERE id = 30045;

-- Event #8, M.Prg: 30012, tot. athletes: 1
-- Tot. progr. duration: 146 (sec), Heat durations: [14610] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:15:32 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:15' WHERE id = 30012;

-- Event #9, M.Prg: 30013, tot. athletes: 2
-- Tot. progr. duration: 148 (sec), Heat durations: [14870] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:17:58 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:17' WHERE id = 30013;

-- Event #9, M.Prg: 30042, tot. athletes: 7
-- Tot. progr. duration: 257 (sec), Heat durations: [13900, 11820] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:20:26 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:20' WHERE id = 30042;

-- Event #10, M.Prg: 30014, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:24:43 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:24' WHERE id = 30014;

-- Event #10, M.Prg: 30054, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:24:43 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:24' WHERE id = 30054;

-- Event #11, M.Prg: 30015, tot. athletes: 4
-- Tot. progr. duration: 177 (sec), Heat durations: [17750] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:24:43 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:24' WHERE id = 30015;

-- Event #11, M.Prg: 30025, tot. athletes: 11
-- Tot. progr. duration: 295 (sec), Heat durations: [16020, 13570] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:27:40 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:27' WHERE id = 30025;

-- Event #12, M.Prg: 30016, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:32:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:32' WHERE id = 30016;

-- Event #12, M.Prg: 30044, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:32:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:32' WHERE id = 30044;

-- Event #13, M.Prg: 30017, tot. athletes: 5
-- Tot. progr. duration: 108 (sec), Heat durations: [10850] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:32:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:32' WHERE id = 30017;

-- Event #13, M.Prg: 30039, tot. athletes: 11
-- Tot. progr. duration: 206 (sec), Heat durations: [10520, 10090] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 16:34:23 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:34' WHERE id = 30039;

-- Event #14, M.Prg: 30024, tot. athletes: 4
-- Tot. progr. duration: 784 (sec), Heat durations: [78480] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 16:37:49 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:37' WHERE id = 30024;

-- Event #14, M.Prg: 30018, tot. athletes: 3
-- Tot. progr. duration: 920 (sec), Heat durations: [92000] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 16:50:53 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:50' WHERE id = 30018;

-- Event #15, M.Prg: 30019, tot. athletes: 3
-- Tot. progr. duration: 890 (sec), Heat durations: [89020] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:06:13 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:06' WHERE id = 30019;

-- Event #15, M.Prg: 30053, tot. athletes: 6
-- Tot. progr. duration: 793 (sec), Heat durations: [79330] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:21:03 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:21' WHERE id = 30053;

-- Event #16, M.Prg: 30020, tot. athletes: 3
-- Tot. progr. duration: 876 (sec), Heat durations: [87630] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:34:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:34' WHERE id = 30020;

-- Event #16, M.Prg: 30032, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 17:48:52 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:48' WHERE id = 30032;

-- Event #17, M.Prg: 30021, tot. athletes: 5
-- Tot. progr. duration: 150 (sec), Heat durations: [15030] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:48:52 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:48' WHERE id = 30021;

-- Event #17, M.Prg: 30035, tot. athletes: 4
-- Tot. progr. duration: 201 (sec), Heat durations: [20150] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:51:22 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:51' WHERE id = 30035;

-- Event #18, M.Prg: 30022, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:54:43 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:54' WHERE id = 30022;

-- Event #19, M.Prg: 30051, tot. athletes: 6
-- Tot. progr. duration: 110 (sec), Heat durations: [11020] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:54:43 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:54' WHERE id = 30051;

-- Event #19, M.Prg: 30023, tot. athletes: 7
-- Tot. progr. duration: 202 (sec), Heat durations: [10670, 9590] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:56:33 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:56' WHERE id = 30023;

-- Event #20, M.Prg: 30064, tot. athletes: 6
-- Tot. progr. duration: 164 (sec), Heat durations: [16450] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 17:59:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:59' WHERE id = 30064;

-- Event #20, M.Prg: 30026, tot. athletes: 6
-- Tot. progr. duration: 150 (sec), Heat durations: [15080] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:02:39 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:02' WHERE id = 30026;

-- Event #21, M.Prg: 30027, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:05:09 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:05' WHERE id = 30027;

-- Event #21, M.Prg: 30072, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:05:09 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:05' WHERE id = 30072;

-- Event #22, M.Prg: 30029, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:05:09 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:05' WHERE id = 30029;

-- Event #23, M.Prg: 30030, tot. athletes: 4
-- Tot. progr. duration: 106 (sec), Heat durations: [10610] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:05:09 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:05' WHERE id = 30030;

-- Event #23, M.Prg: 30059, tot. athletes: 1
-- Tot. progr. duration: 122 (sec), Heat durations: [12200] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:06:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:06' WHERE id = 30059;

-- Event #24, M.Prg: 30031, tot. athletes: 9
-- Tot. progr. duration: 292 (sec), Heat durations: [15740, 13460] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:08:57 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:08' WHERE id = 30031;

-- Event #24, M.Prg: 30066, tot. athletes: 8
-- Tot. progr. duration: 297 (sec), Heat durations: [15909, 13860] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:13:49 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:13' WHERE id = 30066;

-- Event #25, M.Prg: 30033, tot. athletes: 4
-- Tot. progr. duration: 128 (sec), Heat durations: [12820] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:18:46 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:18' WHERE id = 30033;

-- Event #25, M.Prg: 30083, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:20:54 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:20' WHERE id = 30083;

-- Event #26, M.Prg: 30034, tot. athletes: 2
-- Tot. progr. duration: 159 (sec), Heat durations: [15960] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:20:54 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:20' WHERE id = 30034;

-- Event #26, M.Prg: 30038, tot. athletes: 4
-- Tot. progr. duration: 146 (sec), Heat durations: [14610] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:23:33 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:23' WHERE id = 30038;

-- Event #27, M.Prg: 30036, tot. athletes: 4
-- Tot. progr. duration: 110 (sec), Heat durations: [11010] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:25:59 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:25' WHERE id = 30036;

-- Event #27, M.Prg: 30043, tot. athletes: 3
-- Tot. progr. duration: 101 (sec), Heat durations: [10130] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:27:49 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:27' WHERE id = 30043;

-- Event #28, M.Prg: 30037, tot. athletes: 4
-- Tot. progr. duration: 140 (sec), Heat durations: [14040] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:29:30 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:29' WHERE id = 30037;

-- Event #28, M.Prg: 30071, tot. athletes: 4
-- Tot. progr. duration: 160 (sec), Heat durations: [16090] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:31:50 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:31' WHERE id = 30071;

-- Event #29, M.Prg: 30040, tot. athletes: 7
-- Tot. progr. duration: 201 (sec), Heat durations: [10600, 9510] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:34:30 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:34' WHERE id = 30040;

-- Event #29, M.Prg: 30052, tot. athletes: 7
-- Tot. progr. duration: 213 (sec), Heat durations: [11450, 9940] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 18:37:51 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:37' WHERE id = 30052;

-- Event #30, M.Prg: 30046, tot. athletes: 4
-- Tot. progr. duration: 784 (sec), Heat durations: [78400] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 18:41:24 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:41' WHERE id = 30046;

-- Event #30, M.Prg: 30047, tot. athletes: 4
-- Tot. progr. duration: 881 (sec), Heat durations: [88150] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 18:54:28 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:54' WHERE id = 30047;

-- Event #31, M.Prg: 30055, tot. athletes: 4
-- Tot. progr. duration: 904 (sec), Heat durations: [90420] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 19:09:09 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:09' WHERE id = 30055;

-- Event #31, M.Prg: 30048, tot. athletes: 3
-- Tot. progr. duration: 742 (sec), Heat durations: [74280] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 19:24:13 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:24' WHERE id = 30048;

-- Event #32, M.Prg: 30049, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:36:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:36' WHERE id = 30049;

-- Event #32, M.Prg: 30050, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:36:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:36' WHERE id = 30050;

-- Event #33, M.Prg: 30057, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:36:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:36' WHERE id = 30057;

-- Event #33, M.Prg: 30056, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:36:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:36' WHERE id = 30056;

-- Event #34, M.Prg: 30058, tot. athletes: 4
-- Tot. progr. duration: 958 (sec), Heat durations: [95860] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 19:36:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:36' WHERE id = 30058;

-- Event #35, M.Prg: 30084, tot. athletes: 2
-- Tot. progr. duration: 182 (sec), Heat durations: [18230] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:52:33 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:52' WHERE id = 30084;

-- Event #35, M.Prg: 30061, tot. athletes: 7
-- Tot. progr. duration: 299 (sec), Heat durations: [16460, 13520] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 19:55:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 19:55' WHERE id = 30061;

-- Event #36, M.Prg: 30062, tot. athletes: 5
-- Tot. progr. duration: 100 (sec), Heat durations: [10040] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:00:34 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:00' WHERE id = 30062;

-- Event #36, M.Prg: 30063, tot. athletes: 10
-- Tot. progr. duration: 238 (sec), Heat durations: [12550, 11310] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:02:14 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:02' WHERE id = 30063;

-- Event #37, M.Prg: 30065, tot. athletes: 2
-- Tot. progr. duration: 145 (sec), Heat durations: [14580] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:06:12 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:06' WHERE id = 30065;

-- Event #38, M.Prg: 30067, tot. athletes: 1
-- Tot. progr. duration: 165 (sec), Heat durations: [16580] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:08:37 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:08' WHERE id = 30067;

-- Event #38, M.Prg: 30074, tot. athletes: 1
-- Tot. progr. duration: 195 (sec), Heat durations: [19540] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:11:22 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:11' WHERE id = 30074;

-- Event #39, M.Prg: 30069, tot. athletes: 3
-- Tot. progr. duration: 151 (sec), Heat durations: [15160] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:14:37 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:14' WHERE id = 30069;

-- Event #39, M.Prg: 30075, tot. athletes: 1
-- Tot. progr. duration: 172 (sec), Heat durations: [17200] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:17:08 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:17' WHERE id = 30075;

-- Event #40, M.Prg: 30078, tot. athletes: 1
-- Tot. progr. duration: 131 (sec), Heat durations: [13140] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:20:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:20' WHERE id = 30078;

-- Event #40, M.Prg: 30070, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:22:11 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:22' WHERE id = 30070;

-- Event #41, M.Prg: 30080, tot. athletes: 2
-- Tot. progr. duration: 884 (sec), Heat durations: [88440] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 20:22:11 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:22' WHERE id = 30080;

-- Event #41, M.Prg: 30073, tot. athletes: 2
-- Tot. progr. duration: 940 (sec), Heat durations: [94010] (hds)
-- Session begin time: 2000-01-01 10:30:00 UTC, Computed begin time: 2000-01-01 20:36:55 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:36' WHERE id = 30073;

-- Event #42, M.Prg: 30076, tot. athletes: 1
-- Tot. progr. duration: 170 (sec), Heat durations: [17010] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:52:35 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:52' WHERE id = 30076;

-- Event #43, M.Prg: 30077, tot. athletes: 5
-- Tot. progr. duration: 170 (sec), Heat durations: [17040] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:55:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:55' WHERE id = 30077;

-- Event #43, M.Prg: 30079, tot. athletes: 6
-- Tot. progr. duration: 150 (sec), Heat durations: [15050] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 20:58:15 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 20:58' WHERE id = 30079;

-- Event #44, M.Prg: 30081, tot. athletes: 2
-- Tot. progr. duration: 144 (sec), Heat durations: [14410] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 21:00:45 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 21:00' WHERE id = 30081;

-- Event #44, M.Prg: 30082, tot. athletes: 1
-- Tot. progr. duration: 144 (sec), Heat durations: [14450] (hds)
-- Session begin time: 2000-01-01 15:00:00 UTC, Computed begin time: 2000-01-01 21:03:09 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 21:03' WHERE id = 30082;


-- Last completed phase code: 30
