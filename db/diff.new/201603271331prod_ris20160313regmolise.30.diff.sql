-- *** SQL Diff file for ris20160313regmolise.txt ***
-- Timestamp: 201603271331
INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4883, '2016-03-27 14:14:27', '2016-03-27 14:14:27', 1, '2000-01-01 08:02:00', 0, 1, NULL, 1132, 16, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43916, 1, 910, 2, 1, '2016-03-27 14:14:28', '2016-03-27 14:14:28', 1, 0, '2000-01-01 08:02:00', 4883, 1, 4545);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43917, 2, 915, 2, 1, '2016-03-27 14:14:28', '2016-03-27 14:14:28', 1, 0, '2000-01-01 08:04:00', 4883, 1, 4635);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43918, 3, 911, 1, 1, '2016-03-27 14:14:29', '2016-03-27 14:14:29', 1, 0, '2000-01-01 08:06:00', 4883, 1, 5092);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43919, 4, 912, 1, 1, '2016-03-27 14:14:29', '2016-03-27 14:14:29', 1, 0, '2000-01-01 08:08:00', 4883, 1, 5110);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4884, '2016-03-27 14:14:29', '2016-03-27 14:14:29', 2, '2000-01-01 08:10:00', 0, 1, NULL, 1132, 12, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43920, 5, 908, 1, 1, '2016-03-27 14:14:30', '2016-03-27 14:14:30', 1, 0, '2000-01-01 08:10:00', 4884, 1, 5039);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43921, 6, 910, 1, 1, '2016-03-27 14:14:30', '2016-03-27 14:14:30', 1, 0, '2000-01-01 08:12:00', 4884, 1, 5075);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43922, 7, 917, 1, 1, '2016-03-27 14:14:31', '2016-03-27 14:14:31', 1, 0, '2000-01-01 08:14:00', 4884, 1, 5201);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4885, '2016-03-27 14:14:31', '2016-03-27 14:14:31', 3, '2000-01-01 08:16:00', 0, 1, NULL, 1132, 22, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43923, 8, 910, 2, 1, '2016-03-27 14:14:31', '2016-03-27 14:14:31', 1, 0, '2000-01-01 08:16:00', 4885, 1, 4547);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43924, 9, 908, 1, 1, '2016-03-27 14:14:32', '2016-03-27 14:14:32', 1, 0, '2000-01-01 08:18:00', 4885, 1, 5040);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43925, 10, 909, 1, 1, '2016-03-27 14:14:32', '2016-03-27 14:14:32', 1, 0, '2000-01-01 08:20:00', 4885, 1, 5058);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43926, 11, 912, 1, 1, '2016-03-27 14:14:33', '2016-03-27 14:14:33', 1, 0, '2000-01-01 08:22:00', 4885, 1, 5112);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4886, '2016-03-27 14:14:33', '2016-03-27 14:14:33', 4, '2000-01-01 08:24:00', 0, 1, NULL, 1132, 20, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43927, 12, 910, 1, 1, '2016-03-27 14:14:34', '2016-03-27 14:14:34', 1, 0, '2000-01-01 08:24:00', 4886, 1, 5077);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43928, 13, 911, 1, 1, '2016-03-27 14:14:34', '2016-03-27 14:14:34', 1, 0, '2000-01-01 08:26:00', 4886, 1, 5095);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43929, 14, 914, 1, 1, '2016-03-27 14:14:35', '2016-03-27 14:14:35', 1, 0, '2000-01-01 08:28:00', 4886, 1, 5149);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4887, '2016-03-27 14:14:35', '2016-03-27 14:14:35', 5, '2000-01-01 08:30:00', 0, 1, NULL, 1132, 3, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43930, 15, 908, 2, 1, '2016-03-27 14:14:35', '2016-03-27 14:14:35', 1, 0, '2000-01-01 08:30:00', 4887, 1, 4513);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43931, 16, 908, 1, 1, '2016-03-27 14:14:36', '2016-03-27 14:14:36', 1, 0, '2000-01-01 08:32:00', 4887, 1, 5042);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43932, 17, 909, 1, 1, '2016-03-27 14:14:36', '2016-03-27 14:14:36', 1, 0, '2000-01-01 08:34:00', 4887, 1, 5060);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43933, 18, 910, 1, 1, '2016-03-27 14:14:37', '2016-03-27 14:14:37', 1, 0, '2000-01-01 08:36:00', 4887, 1, 5078);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43934, 19, 911, 1, 1, '2016-03-27 14:14:37', '2016-03-27 14:14:37', 1, 0, '2000-01-01 08:38:00', 4887, 1, 5096);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43935, 20, 912, 1, 1, '2016-03-27 14:14:38', '2016-03-27 14:14:38', 1, 0, '2000-01-01 08:40:00', 4887, 1, 5114);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43936, 21, 913, 1, 1, '2016-03-27 14:14:38', '2016-03-27 14:14:38', 1, 0, '2000-01-01 08:42:00', 4887, 1, 5132);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43937, 22, 914, 1, 1, '2016-03-27 14:14:39', '2016-03-27 14:14:39', 1, 0, '2000-01-01 08:44:00', 4887, 1, 5150);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43938, 23, 916, 1, 1, '2016-03-27 14:14:39', '2016-03-27 14:14:39', 1, 0, '2000-01-01 08:46:00', 4887, 1, 5186);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4888, '2016-03-27 14:14:39', '2016-03-27 14:14:39', 6, '2000-01-01 08:48:00', 0, 1, NULL, 1132, 7, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43939, 24, 913, 2, 1, '2016-03-27 14:14:40', '2016-03-27 14:14:40', 1, 0, '2000-01-01 08:48:00', 4888, 1, 4604);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43940, 25, 911, 1, 1, '2016-03-27 14:14:40', '2016-03-27 14:14:40', 1, 0, '2000-01-01 08:50:00', 4888, 1, 5097);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43941, 26, 913, 1, 1, '2016-03-27 14:14:41', '2016-03-27 14:14:41', 1, 0, '2000-01-01 08:52:00', 4888, 1, 5133);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43942, 27, 915, 1, 1, '2016-03-27 14:14:41', '2016-03-27 14:14:41', 1, 0, '2000-01-01 08:54:00', 4888, 1, 5169);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43943, 28, 917, 1, 1, '2016-03-27 14:14:41', '2016-03-27 14:14:41', 1, 0, '2000-01-01 08:56:00', 4888, 1, 5205);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4889, '2016-03-27 14:14:42', '2016-03-27 14:14:42', 7, '2000-01-01 08:58:00', 0, 1, NULL, 1132, 17, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43944, 29, 910, 2, 1, '2016-03-27 14:14:42', '2016-03-27 14:14:42', 1, 0, '2000-01-01 08:58:00', 4889, 1, 4551);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43945, 30, 908, 1, 1, '2016-03-27 14:14:43', '2016-03-27 14:14:43', 1, 0, '2000-01-01 09:00:00', 4889, 1, 5044);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43946, 31, 912, 1, 1, '2016-03-27 14:14:43', '2016-03-27 14:14:43', 1, 0, '2000-01-01 09:02:00', 4889, 1, 5116);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4890, '2016-03-27 14:14:44', '2016-03-27 14:14:44', 8, '2000-01-01 09:04:00', 0, 1, NULL, 1132, 13, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43947, 32, 909, 1, 1, '2016-03-27 14:14:44', '2016-03-27 14:14:44', 1, 0, '2000-01-01 09:04:00', 4890, 1, 5063);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4891, '2016-03-27 14:14:44', '2016-03-27 14:14:44', 9, '2000-01-01 09:06:00', 0, 1, NULL, 1132, 23, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43948, 33, 910, 2, 1, '2016-03-27 14:14:44', '2016-03-27 14:14:44', 1, 0, '2000-01-01 09:06:00', 4891, 1, 4553);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43949, 34, 908, 1, 1, '2016-03-27 14:14:45', '2016-03-27 14:14:45', 1, 0, '2000-01-01 09:08:00', 4891, 1, 5046);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43950, 35, 912, 1, 1, '2016-03-27 14:14:46', '2016-03-27 14:14:46', 1, 0, '2000-01-01 09:10:00', 4891, 1, 5118);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43951, 36, 913, 1, 1, '2016-03-27 14:14:46', '2016-03-27 14:14:46', 1, 0, '2000-01-01 09:12:00', 4891, 1, 5136);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4892, '2016-03-27 14:14:46', '2016-03-27 14:14:46', 10, '2000-01-01 09:14:00', 0, 1, NULL, 1132, 21, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43952, 37, 908, 1, 1, '2016-03-27 14:14:47', '2016-03-27 14:14:47', 1, 0, '2000-01-01 09:14:00', 4892, 1, 5047);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43953, 38, 911, 1, 1, '2016-03-27 14:14:47', '2016-03-27 14:14:47', 1, 0, '2000-01-01 09:16:00', 4892, 1, 5101);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43954, 39, 913, 1, 1, '2016-03-27 14:14:48', '2016-03-27 14:14:48', 1, 0, '2000-01-01 09:18:00', 4892, 1, 5137);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43955, 40, 914, 1, 1, '2016-03-27 14:14:48', '2016-03-27 14:14:48', 1, 0, '2000-01-01 09:20:00', 4892, 1, 5155);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4893, '2016-03-27 14:14:48', '2016-03-27 14:14:48', 11, '2000-01-01 09:22:00', 0, 1, NULL, 1132, 4, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43956, 41, 911, 2, 1, '2016-03-27 14:14:49', '2016-03-27 14:14:49', 1, 0, '2000-01-01 09:22:00', 4893, 1, 4573);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43957, 42, 912, 2, 1, '2016-03-27 14:14:49', '2016-03-27 14:14:49', 1, 0, '2000-01-01 09:24:00', 4893, 1, 4591);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43958, 43, 908, 1, 1, '2016-03-27 14:14:50', '2016-03-27 14:14:50', 1, 0, '2000-01-01 09:26:00', 4893, 1, 5048);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43959, 44, 910, 1, 1, '2016-03-27 14:14:50', '2016-03-27 14:14:50', 1, 0, '2000-01-01 09:28:00', 4893, 1, 5084);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43960, 45, 911, 1, 1, '2016-03-27 14:14:51', '2016-03-27 14:14:51', 1, 0, '2000-01-01 09:30:00', 4893, 1, 5102);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43961, 46, 912, 1, 1, '2016-03-27 14:14:51', '2016-03-27 14:14:51', 1, 0, '2000-01-01 09:32:00', 4893, 1, 5120);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43962, 47, 913, 1, 1, '2016-03-27 14:14:52', '2016-03-27 14:14:52', 1, 0, '2000-01-01 09:34:00', 4893, 1, 5138);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43963, 48, 915, 1, 1, '2016-03-27 14:14:52', '2016-03-27 14:14:52', 1, 0, '2000-01-01 09:36:00', 4893, 1, 5174);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4894, '2016-03-27 14:14:53', '2016-03-27 14:14:53', 12, '2000-01-01 09:38:00', 0, 1, NULL, 1132, 24, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43964, 49, 909, 2, 1, '2016-03-27 14:14:53', '2016-03-27 14:14:53', 1, 0, '2000-01-01 09:38:00', 4894, 1, 4538);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43965, 50, 911, 2, 1, '2016-03-27 14:14:53', '2016-03-27 14:14:53', 1, 0, '2000-01-01 09:40:00', 4894, 1, 4574);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43966, 51, 911, 1, 1, '2016-03-27 14:14:54', '2016-03-27 14:14:54', 1, 0, '2000-01-01 09:42:00', 4894, 1, 5103);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43967, 52, 914, 1, 1, '2016-03-27 14:14:54', '2016-03-27 14:14:54', 1, 0, '2000-01-01 09:44:00', 4894, 1, 5157);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4895, '2016-03-27 14:14:55', '2016-03-27 14:14:55', 13, '2000-01-01 09:46:00', 0, 1, NULL, 1132, 5, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43968, 53, 910, 1, 1, '2016-03-27 14:14:55', '2016-03-27 14:14:55', 1, 0, '2000-01-01 09:46:00', 4895, 1, 5086);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43969, 54, 911, 1, 1, '2016-03-27 14:14:55', '2016-03-27 14:14:55', 1, 0, '2000-01-01 09:48:00', 4895, 1, 5104);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43970, 55, 912, 1, 1, '2016-03-27 14:14:56', '2016-03-27 14:14:56', 1, 0, '2000-01-01 09:50:00', 4895, 1, 5122);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4896, '2016-03-27 14:14:56', '2016-03-27 14:14:56', 14, '2000-01-01 09:52:00', 0, 1, NULL, 1132, 15, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43971, 56, 911, 2, 1, '2016-03-27 14:14:56', '2016-03-27 14:14:56', 1, 0, '2000-01-01 09:52:00', 4896, 1, 4576);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43972, 57, 912, 2, 1, '2016-03-27 14:14:57', '2016-03-27 14:14:57', 1, 0, '2000-01-01 09:54:00', 4896, 1, 4594);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43973, 58, 913, 1, 1, '2016-03-27 14:14:57', '2016-03-27 14:14:57', 1, 0, '2000-01-01 09:56:00', 4896, 1, 5141);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43974, 59, 917, 1, 1, '2016-03-27 14:14:58', '2016-03-27 14:14:58', 1, 0, '2000-01-01 09:58:00', 4896, 1, 5213);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4897, '2016-03-27 14:14:58', '2016-03-27 14:14:58', 15, '2000-01-01 10:00:00', 0, 1, NULL, 1132, 11, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43975, 60, 910, 2, 1, '2016-03-27 14:14:59', '2016-03-27 14:14:59', 1, 0, '2000-01-01 10:00:00', 4897, 1, 4559);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43976, 61, 911, 2, 1, '2016-03-27 14:14:59', '2016-03-27 14:14:59', 1, 0, '2000-01-01 10:02:00', 4897, 1, 4577);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43977, 62, 908, 1, 1, '2016-03-27 14:15:00', '2016-03-27 14:15:00', 1, 0, '2000-01-01 10:04:00', 4897, 1, 5052);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43978, 63, 909, 1, 1, '2016-03-27 14:15:00', '2016-03-27 14:15:00', 1, 0, '2000-01-01 10:06:00', 4897, 1, 5070);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43979, 64, 911, 1, 1, '2016-03-27 14:15:01', '2016-03-27 14:15:01', 1, 0, '2000-01-01 10:08:00', 4897, 1, 5106);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43980, 65, 912, 1, 1, '2016-03-27 14:15:01', '2016-03-27 14:15:01', 1, 0, '2000-01-01 10:10:00', 4897, 1, 5124);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4898, '2016-03-27 14:15:01', '2016-03-27 14:15:01', 16, '2000-01-01 10:12:00', 0, 1, NULL, 1132, 19, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43981, 66, 909, 2, 1, '2016-03-27 14:15:02', '2016-03-27 14:15:02', 1, 0, '2000-01-01 10:12:00', 4898, 1, 4542);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43982, 67, 911, 2, 1, '2016-03-27 14:15:03', '2016-03-27 14:15:03', 1, 0, '2000-01-01 10:14:00', 4898, 1, 4578);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43983, 68, 912, 2, 1, '2016-03-27 14:15:03', '2016-03-27 14:15:03', 1, 0, '2000-01-01 10:16:00', 4898, 1, 4596);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43984, 69, 908, 1, 1, '2016-03-27 14:15:04', '2016-03-27 14:15:04', 1, 0, '2000-01-01 10:18:00', 4898, 1, 5053);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43985, 70, 909, 1, 1, '2016-03-27 14:15:04', '2016-03-27 14:15:04', 1, 0, '2000-01-01 10:20:00', 4898, 1, 5071);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43986, 71, 910, 1, 1, '2016-03-27 14:15:04', '2016-03-27 14:15:04', 1, 0, '2000-01-01 10:22:00', 4898, 1, 5089);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43987, 72, 912, 1, 1, '2016-03-27 14:15:05', '2016-03-27 14:15:05', 1, 0, '2000-01-01 10:24:00', 4898, 1, 5125);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43988, 73, 914, 1, 1, '2016-03-27 14:15:05', '2016-03-27 14:15:05', 1, 0, '2000-01-01 10:26:00', 4898, 1, 5161);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4899, '2016-03-27 14:15:06', '2016-03-27 14:15:06', 17, '2000-01-01 10:28:00', 0, 1, NULL, 1132, 2, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43989, 74, 909, 2, 1, '2016-03-27 14:15:06', '2016-03-27 14:15:06', 1, 0, '2000-01-01 10:28:00', 4899, 1, 4543);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43990, 75, 911, 2, 1, '2016-03-27 14:15:07', '2016-03-27 14:15:07', 1, 0, '2000-01-01 10:30:00', 4899, 1, 4579);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43991, 76, 915, 2, 1, '2016-03-27 14:15:07', '2016-03-27 14:15:07', 1, 0, '2000-01-01 10:32:00', 4899, 1, 4651);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43992, 77, 908, 1, 1, '2016-03-27 14:15:08', '2016-03-27 14:15:08', 1, 0, '2000-01-01 10:34:00', 4899, 1, 5054);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43993, 78, 909, 1, 1, '2016-03-27 14:15:08', '2016-03-27 14:15:08', 1, 0, '2000-01-01 10:36:00', 4899, 1, 5072);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43994, 79, 910, 1, 1, '2016-03-27 14:15:09', '2016-03-27 14:15:09', 1, 0, '2000-01-01 10:38:00', 4899, 1, 5090);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43995, 80, 911, 1, 1, '2016-03-27 14:15:09', '2016-03-27 14:15:09', 1, 0, '2000-01-01 10:40:00', 4899, 1, 5108);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43996, 81, 912, 1, 1, '2016-03-27 14:15:10', '2016-03-27 14:15:10', 1, 0, '2000-01-01 10:42:00', 4899, 1, 5126);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43997, 82, 913, 1, 1, '2016-03-27 14:15:10', '2016-03-27 14:15:10', 1, 0, '2000-01-01 10:44:00', 4899, 1, 5144);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43998, 83, 914, 1, 1, '2016-03-27 14:15:11', '2016-03-27 14:15:11', 1, 0, '2000-01-01 10:46:00', 4899, 1, 5162);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (43999, 84, 915, 1, 1, '2016-03-27 14:15:11', '2016-03-27 14:15:11', 1, 0, '2000-01-01 10:48:00', 4899, 1, 5180);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44000, 85, 916, 1, 1, '2016-03-27 14:15:12', '2016-03-27 14:15:12', 1, 0, '2000-01-01 10:50:00', 4899, 1, 5198);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44001, 86, 917, 1, 1, '2016-03-27 14:15:13', '2016-03-27 14:15:13', 1, 0, '2000-01-01 10:52:00', 4899, 1, 5216);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4900, '2016-03-27 14:15:13', '2016-03-27 14:15:13', 18, '2000-01-01 10:54:00', 0, 1, NULL, 1132, 6, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44002, 87, 908, 2, 1, '2016-03-27 14:15:13', '2016-03-27 14:15:13', 1, 0, '2000-01-01 10:54:00', 4900, 1, 4526);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44003, 88, 909, 2, 1, '2016-03-27 14:15:14', '2016-03-27 14:15:14', 1, 0, '2000-01-01 10:56:00', 4900, 1, 4544);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44004, 89, 909, 1, 1, '2016-03-27 14:15:14', '2016-03-27 14:15:14', 1, 0, '2000-01-01 10:58:00', 4900, 1, 5073);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44005, 90, 911, 1, 1, '2016-03-27 14:15:15', '2016-03-27 14:15:15', 1, 0, '2000-01-01 11:00:00', 4900, 1, 5109);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44006, 91, 915, 1, 1, '2016-03-27 14:15:15', '2016-03-27 14:15:15', 1, 0, '2000-01-01 11:02:00', 4900, 1, 5181);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4901, '2016-03-27 14:15:15', '2016-03-27 14:15:15', 19, '2000-01-01 11:12:22', 0, 1, NULL, 1132, 33, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44007, 1, 927, 2, 1, '2016-03-27 14:15:16', '2016-03-27 14:15:16', 1, 0, '2000-01-01 11:12:22', 4901, 1, 6339);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44008, 2, 928, 2, 1, '2016-03-27 14:15:16', '2016-03-27 14:15:16', 1, 0, '2000-01-01 11:22:22', 4901, 1, 6340);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44009, 3, 927, 1, 1, '2016-03-27 14:15:17', '2016-03-27 14:15:17', 1, 0, '2000-01-01 11:32:00', 4901, 1, 6341);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44010, 4, 928, 1, 1, '2016-03-27 14:15:17', '2016-03-27 14:15:17', 1, 0, '2000-01-01 11:41:38', 4901, 1, 6342);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44011, 5, 929, 1, 1, '2016-03-27 14:15:18', '2016-03-27 14:15:18', 1, 0, '2000-01-01 11:31:22', 4901, 1, 6343);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44012, 6, 928, 3, 1, '2016-03-27 14:15:18', '2016-03-27 14:15:18', 1, 0, '2000-01-01 11:20:44', 4901, 1, 5573);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44013, 7, 929, 3, 1, '2016-03-27 14:15:19', '2016-03-27 14:15:19', 1, 0, '2000-01-01 11:30:38', 4901, 1, 5574);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4902, '2016-03-27 14:15:19', '2016-03-27 14:15:19', 20, '2000-01-01 11:20:06', 0, 1, NULL, 1132, 32, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44014, 8, 927, 2, 1, '2016-03-27 14:15:19', '2016-03-27 14:15:19', 1, 0, '2000-01-01 11:20:06', 4902, 1, 6344);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44015, 9, 928, 2, 1, '2016-03-27 14:15:20', '2016-03-27 14:15:20', 1, 0, '2000-01-01 11:09:28', 4902, 1, 6345);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44016, 10, 927, 1, 1, '2016-03-27 14:15:20', '2016-03-27 14:15:20', 1, 0, '2000-01-01 11:19:38', 4902, 1, 6346);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44017, 11, 928, 1, 1, '2016-03-27 14:15:21', '2016-03-27 14:15:21', 1, 0, '2000-01-01 11:08:50', 4902, 1, 6347);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44018, 12, 929, 1, 1, '2016-03-27 14:15:21', '2016-03-27 14:15:21', 1, 0, '2000-01-01 10:57:12', 4902, 1, 6348);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44019, 13, 927, 3, 1, '2016-03-27 14:15:22', '2016-03-27 14:15:22', 1, 0, '2000-01-01 11:08:38', 4902, 1, 5621);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44020, 14, 928, 3, 1, '2016-03-27 14:15:22', '2016-03-27 14:15:22', 1, 0, '2000-01-01 10:56:34', 4902, 1, 5622);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44021, 15, 929, 3, 1, '2016-03-27 14:15:23', '2016-03-27 14:15:23', 1, 0, '2000-01-01 10:43:56', 4902, 1, 5623);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4903, '2016-03-27 14:15:23', '2016-03-27 14:15:23', 21, '2000-01-01 10:55:38', 0, 1, NULL, 1132, 26, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44022, 16, 927, 2, 1, '2016-03-27 14:15:23', '2016-03-27 14:15:23', 1, 0, '2000-01-01 10:55:38', 4903, 1, 5614);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44023, 17, 928, 2, 1, '2016-03-27 14:15:24', '2016-03-27 14:15:24', 1, 0, '2000-01-01 10:43:18', 4903, 1, 5627);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44024, 18, 927, 1, 1, '2016-03-27 14:15:24', '2016-03-27 14:15:24', 1, 0, '2000-01-01 10:30:40', 4903, 1, 5617);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44025, 19, 928, 1, 1, '2016-03-27 14:15:25', '2016-03-27 14:15:25', 1, 0, '2000-01-01 10:42:38', 4903, 1, 5618);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44026, 20, 929, 1, 1, '2016-03-27 14:15:25', '2016-03-27 14:15:25', 1, 0, '2000-01-01 10:30:02', 4903, 1, 5619);

INSERT INTO `meeting_events` (`id`, `created_at`, `updated_at`, `event_order`, `begin_time`, `is_out_of_race`, `is_autofilled`, `notes`, `meeting_session_id`, `event_type_id`, `heat_type_id`, `user_id`, `has_separate_gender_start_list`, `has_separate_category_start_list`)
  VALUES (4904, '2016-03-27 14:15:26', '2016-03-27 14:15:26', 22, '2000-01-01 10:17:24', 0, 1, NULL, 1132, 25, 3, 1, 1, 0);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44027, 21, 927, 2, 1, '2016-03-27 14:15:26', '2016-03-27 14:15:26', 1, 0, '2000-01-01 10:17:24', 4904, 1, 5605);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44028, 22, 928, 2, 1, '2016-03-27 14:15:26', '2016-03-27 14:15:26', 1, 0, '2000-01-01 10:29:38', 4904, 1, 5606);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44029, 23, 927, 1, 1, '2016-03-27 14:15:27', '2016-03-27 14:15:27', 1, 0, '2000-01-01 10:16:46', 4904, 1, 5609);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44030, 24, 928, 1, 1, '2016-03-27 14:15:27', '2016-03-27 14:15:27', 1, 0, '2000-01-01 10:03:08', 4904, 1, 5610);

INSERT INTO `meeting_programs` (`id`, `event_order`, `category_type_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`, `is_out_of_race`, `begin_time`, `meeting_event_id`, `pool_type_id`, `time_standard_id`)
  VALUES (44031, 25, 929, 1, 1, '2016-03-27 14:15:28', '2016-03-27 14:15:28', 1, 0, '2000-01-01 10:16:38', 4904, 1, 5611);

INSERT INTO `teams` (`id`, `name`, `editable_name`, `address`, `zip`, `phone_mobile`, `phone_number`, `fax_number`, `e_mail`, `contact_name`, `notes`, `name_variations`, `city_id`, `user_id`, `created_at`, `updated_at`, `home_page_url`)
  VALUES (921, 'Hidro Sport ssd arl', 'Hidro Sport ssd arl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Hidro Sport ssd arl', NULL, 1, '2016-03-27 14:15:28', '2016-03-27 14:15:28', NULL);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2119, NULL, 'Hidro Sport ssd arl', 0, 921, 152, 1, '2016-03-27 14:15:28', '2016-03-27 14:15:28', 1);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (23836, NULL, NULL, 1983, NULL, NULL, NULL, '', NULL, 1, 1, '2016-03-27 14:15:29', '2016-03-27 14:15:29', 'AMICONE NUNZIO FLORIANO', 0);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (23837, 'D\'ALESSANDRO', 'ENNIO', 1971, NULL, NULL, NULL, '', NULL, 1, 1, '2016-03-27 14:15:29', '2016-03-27 14:15:29', 'D\'ALESSANDRO ENNIO', 0);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (23838, 'DAMIANO', 'CRISTINA', 1978, NULL, NULL, NULL, '', NULL, 2, 1, '2016-03-27 14:15:29', '2016-03-27 14:15:29', 'DAMIANO CRISTINA', 0);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (23839, NULL, NULL, 1975, NULL, NULL, NULL, '', NULL, 1, 1, '2016-03-27 14:15:29', '2016-03-27 14:15:29', 'DI FEBO RENATO', 0);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (23840, NULL, NULL, 1980, NULL, NULL, NULL, '', NULL, 1, 1, '2016-03-27 14:15:29', '2016-03-27 14:15:29', 'DI SANTO ANTONIO', 0);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (23841, 'LUONGO', 'GENNARO', 1956, NULL, NULL, NULL, '', NULL, 1, 1, '2016-03-27 14:15:29', '2016-03-27 14:15:29', 'LUONGO GENNARO', 0);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (23842, 'RICCI', 'ERIKA', 1986, NULL, NULL, NULL, '', NULL, 2, 1, '2016-03-27 14:15:29', '2016-03-27 14:15:29', 'RICCI ERIKA', 0);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (23843, 'ROBERTI', 'GIUSEPPE', 1975, NULL, NULL, NULL, '', NULL, 1, 1, '2016-03-27 14:15:29', '2016-03-27 14:15:29', 'ROBERTI GIUSEPPE', 0);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (23844, 'SPEDALIERI', 'ALDO', 1971, NULL, NULL, NULL, '', NULL, 1, 1, '2016-03-27 14:15:30', '2016-03-27 14:15:30', 'SPEDALIERI ALDO', 0);

INSERT INTO `swimmers` (`id`, `last_name`, `first_name`, `year_of_birth`, `phone_mobile`, `phone_number`, `e_mail`, `nickname`, `associated_user_id`, `gender_type_id`, `user_id`, `created_at`, `updated_at`, `complete_name`, `is_year_guessed`)
  VALUES (23845, NULL, NULL, 1979, NULL, NULL, NULL, '', NULL, 1, 1, '2016-03-27 14:15:30', '2016-03-27 14:15:30', 'STERLICCHIO GIUSEPPE PIER', 0);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43611, '?', 152, 9162, 185, 910, 1, '2016-03-27 14:15:30', '2016-03-27 14:15:30', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43612, '?', 152, 17138, 496, 912, 1, '2016-03-27 14:15:30', '2016-03-27 14:15:30', 5, 2118, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43613, '?', 152, 12423, 185, 910, 1, '2016-03-27 14:15:31', '2016-03-27 14:15:31', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43614, '?', 152, 12413, 185, 912, 1, '2016-03-27 14:15:31', '2016-03-27 14:15:31', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43615, '?', 152, 23840, 921, 910, 1, '2016-03-27 14:15:31', '2016-03-27 14:15:31', 5, 2119, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43616, '?', 152, 17156, 496, 909, 1, '2016-03-27 14:15:32', '2016-03-27 14:15:32', 5, 2118, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43617, '?', 152, 12446, 185, 910, 1, '2016-03-27 14:15:32', '2016-03-27 14:15:32', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43618, '?', 152, 23843, 921, 911, 1, '2016-03-27 14:15:33', '2016-03-27 14:15:33', 5, 2119, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43619, '?', 152, 6902, 383, 911, 1, '2016-03-27 14:15:33', '2016-03-27 14:15:33', 5, 2117, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43620, '?', 152, 12460, 185, 912, 1, '2016-03-27 14:15:34', '2016-03-27 14:15:34', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43621, '?', 152, 23837, 921, 912, 1, '2016-03-27 14:15:34', '2016-03-27 14:15:34', 5, 2119, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43622, '?', 152, 12469, 185, 912, 1, '2016-03-27 14:15:34', '2016-03-27 14:15:34', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43623, '?', 152, 15655, 383, 914, 1, '2016-03-27 14:15:35', '2016-03-27 14:15:35', 5, 2117, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43624, '?', 152, 9195, 185, 916, 1, '2016-03-27 14:15:35', '2016-03-27 14:15:35', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43625, '?', 152, 2961, 54, 913, 1, '2016-03-27 14:15:35', '2016-03-27 14:15:35', 5, 1572, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43626, '?', 152, 23839, 920, 911, 1, '2016-03-27 14:15:36', '2016-03-27 14:15:36', 5, 2116, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43627, '?', 152, 23838, 185, 910, 1, '2016-03-27 14:15:36', '2016-03-27 14:15:36', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43628, '?', 152, 17161, 185, 912, 1, '2016-03-27 14:15:36', '2016-03-27 14:15:36', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43629, '?', 152, 12451, 185, 912, 1, '2016-03-27 14:15:37', '2016-03-27 14:15:37', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43630, '?', 152, 12427, 185, 908, 1, '2016-03-27 14:15:37', '2016-03-27 14:15:37', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43631, '?', 152, 17148, 439, 912, 1, '2016-03-27 14:15:37', '2016-03-27 14:15:37', 5, 1902, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43632, '?', 152, 23844, 921, 912, 1, '2016-03-27 14:15:38', '2016-03-27 14:15:38', 5, 2119, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43633, '?', 152, 23841, 185, 915, 1, '2016-03-27 14:15:38', '2016-03-27 14:15:38', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43634, '?', 152, 17154, 185, 911, 1, '2016-03-27 14:15:38', '2016-03-27 14:15:38', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43635, '?', 152, 17160, 185, 912, 1, '2016-03-27 14:15:39', '2016-03-27 14:15:39', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43636, '?', 152, 23842, 496, 909, 1, '2016-03-27 14:15:39', '2016-03-27 14:15:39', 5, 2118, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43637, '?', 152, 12468, 185, 911, 1, '2016-03-27 14:15:39', '2016-03-27 14:15:39', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43638, '?', 152, 12456, 185, 908, 1, '2016-03-27 14:15:40', '2016-03-27 14:15:40', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43639, '?', 152, 17167, 496, 909, 1, '2016-03-27 14:15:40', '2016-03-27 14:15:40', 5, 2118, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43640, '?', 152, 12439, 185, 910, 1, '2016-03-27 14:15:40', '2016-03-27 14:15:40', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43641, '?', 152, 23845, 496, 910, 1, '2016-03-27 14:15:40', '2016-03-27 14:15:40', 5, 2118, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43642, '?', 152, 12434, 185, 912, 1, '2016-03-27 14:15:41', '2016-03-27 14:15:41', 5, 1791, NULL);

INSERT INTO `badges` (`id`, `number`, `season_id`, `swimmer_id`, `team_id`, `category_type_id`, `user_id`, `created_at`, `updated_at`, `entry_time_type_id`, `team_affiliation_id`, `final_rank`)
  VALUES (43643, '?', 152, 23836, 439, 909, 1, '2016-03-27 14:15:41', '2016-03-27 14:15:41', 5, 1902, NULL);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295106, 1, 1, 0, 0, 758.29, 758.29, 1, 24, 48, 43916, 9162, 185, 43611, 1, '2016-03-27 14:15:42', '2016-03-27 14:15:42', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295107, 1, 1, 0, 0, 452.82, 452.82, 2, 56, 1, 43917, 12404, 185, 35530, 1, '2016-03-27 14:15:43', '2016-03-27 14:15:43', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295108, 1, 1, 0, 0, 826.55, 826.55, 1, 10, 5, 43918, 17158, 443, 39933, 1, '2016-03-27 14:15:43', '2016-03-27 14:15:43', NULL, 0.0, 0.0, 0.0, 1806, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295109, 1, 1, 0, 0, 492.41, 492.41, 1, 59, 90, 43919, 17138, 496, 43612, 1, '2016-03-27 14:15:44', '2016-03-27 14:15:44', NULL, 0.0, 0.0, 0.0, 2118, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295110, 1, 1, 0, 0, 802.22, 802.22, 1, 6, 64, 43920, 19338, 321, 32796, 1, '2016-03-27 14:15:45', '2016-03-27 14:15:45', NULL, 0.0, 0.0, 0.0, 1652, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295111, 1, 1, 0, 0, 803.83, 803.83, 1, 8, 46, 43921, 13407, 616, 40848, 1, '2016-03-27 14:15:45', '2016-03-27 14:15:45', NULL, 0.0, 0.0, 0.0, 2001, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295112, 1, 1, 0, 0, 503.87, 503.87, 2, 31, 5, 43922, 3344, 837, 35323, 1, '2016-03-27 14:15:46', '2016-03-27 14:15:46', NULL, 0.0, 0.0, 0.0, 1757, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295113, 1, 1, 0, 0, 853.4, 853.4, 1, 17, 42, 43923, 12423, 185, 43613, 1, '2016-03-27 14:15:47', '2016-03-27 14:15:47', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295114, 1, 1, 0, 0, 651.53, 651.53, 1, 25, 43, 43924, 19817, 795, 37735, 1, '2016-03-27 14:15:47', '2016-03-27 14:15:47', NULL, 0.0, 0.0, 0.0, 1813, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295115, 1, 1, 0, 0, 753.9, 753.9, 1, 14, 28, 43925, 2582, 115, 32800, 1, '2016-03-27 14:15:48', '2016-03-27 14:15:48', NULL, 0.0, 0.0, 0.0, 1598, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295116, 1, 1, 0, 0, 865.31, 865.31, 1, 9, 64, 43926, 12413, 185, 43614, 1, '2016-03-27 14:15:48', '2016-03-27 14:15:48', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295117, 2, 1, 0, 0, 793.42, 793.42, 1, 15, 95, 43926, 8333, 439, 37671, 1, '2016-03-27 14:15:49', '2016-03-27 14:15:49', NULL, 0.0, 0.0, 0.0, 1902, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295118, 1, 1, 0, 0, 623.3, 623.3, 1, 40, 53, 43927, 23840, 921, 43615, 1, '2016-03-27 14:15:50', '2016-03-27 14:15:50', NULL, 0.0, 0.0, 0.0, 2119, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295119, 1, 1, 0, 0, 713.79, 713.79, 1, 29, 13, 43928, 8132, 439, 38046, 1, '2016-03-27 14:15:50', '2016-03-27 14:15:50', NULL, 0.0, 0.0, 0.0, 1902, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295120, 1, 1, 0, 0, 596.22, 596.22, 2, 0, 14, 43929, 3334, 837, 34532, 1, '2016-03-27 14:15:51', '2016-03-27 14:15:51', NULL, 0.0, 0.0, 0.0, 1757, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295121, 1, 1, 0, 0, 735.19, 735.19, 1, 16, 47, 43930, 9280, 185, 35525, 1, '2016-03-27 14:15:51', '2016-03-27 14:15:51', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295122, 1, 1, 0, 0, 780.2, 780.2, 1, 3, 24, 43931, 12407, 115, 33472, 1, '2016-03-27 14:15:52', '2016-03-27 14:15:52', NULL, 0.0, 0.0, 0.0, 1598, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295123, 1, 1, 0, 0, 776.84, 776.84, 1, 4, 8, 43932, 17156, 496, 43616, 1, '2016-03-27 14:15:53', '2016-03-27 14:15:53', NULL, 0.0, 0.0, 0.0, 2118, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295124, 1, 1, 0, 0, 626.35, 626.35, 1, 21, 36, 43933, 12446, 185, 43617, 1, '2016-03-27 14:15:54', '2016-03-27 14:15:54', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295125, 1, 1, 0, 0, 605.09, 605.09, 1, 25, 64, 43934, 23843, 921, 43618, 1, '2016-03-27 14:15:54', '2016-03-27 14:15:54', NULL, 0.0, 0.0, 0.0, 2119, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295126, 2, 1, 0, 0, 592.16, 592.16, 1, 27, 51, 43934, 6902, 383, 43619, 1, '2016-03-27 14:15:55', '2016-03-27 14:15:55', NULL, 0.0, 0.0, 0.0, 2117, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295127, 1, 1, 0, 0, 897.56, 897.56, 0, 59, 6, 43935, 8002, 203, 35294, 1, '2016-03-27 14:15:55', '2016-03-27 14:15:55', NULL, 0.0, 0.0, 0.0, 1618, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295128, 2, 1, 0, 0, 766.82, 766.82, 1, 9, 13, 43935, 12460, 185, 43620, 1, '2016-03-27 14:15:56', '2016-03-27 14:15:56', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295129, 3, 1, 0, 0, 660.4, 660.4, 1, 20, 27, 43935, 23837, 921, 43621, 1, '2016-03-27 14:15:57', '2016-03-27 14:15:57', NULL, 0.0, 0.0, 0.0, 2119, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295130, 4, 1, 0, 0, 631.07, 631.07, 1, 24, 0, 43935, 12469, 185, 43622, 1, '2016-03-27 14:15:57', '2016-03-27 14:15:57', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295131, 1, 1, 0, 0, 600.07, 600.07, 1, 31, 4, 43936, 12470, 185, 35371, 1, '2016-03-27 14:15:58', '2016-03-27 14:15:58', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295132, 1, 1, 0, 0, 535.92, 535.92, 1, 45, 65, 43937, 15655, 383, 43623, 1, '2016-03-27 14:15:59', '2016-03-27 14:15:59', NULL, 0.0, 0.0, 0.0, 2117, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295133, 1, 1, 0, 0, 405.05, 405.05, 2, 30, 50, 43938, 9195, 185, 43624, 1, '2016-03-27 14:15:59', '2016-03-27 14:15:59', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295134, 1, 1, 0, 0, 913.09, 913.09, 20, 41, 6, 43939, 2961, 54, 43625, 1, '2016-03-27 14:16:00', '2016-03-27 14:16:00', NULL, 0.0, 0.0, 0.0, 1572, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295135, 1, 1, 0, 0, 860.94, 860.94, 19, 5, 98, 43940, 6873, 54, 33381, 1, '2016-03-27 14:16:00', '2016-03-27 14:16:00', NULL, 0.0, 0.0, 0.0, 1572, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295136, 2, 1, 0, 0, 782.19, 782.19, 21, 1, 36, 43940, 23814, 920, 43570, 1, '2016-03-27 14:16:01', '2016-03-27 14:16:01', NULL, 0.0, 0.0, 0.0, 2116, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295137, 3, 1, 0, 0, 766.31, 766.31, 21, 27, 50, 43940, 14586, 206, 33224, 1, '2016-03-27 14:16:02', '2016-03-27 14:16:02', NULL, 0.0, 0.0, 0.0, 1625, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295138, 4, 1, 0, 0, 716.25, 716.25, 22, 57, 48, 43940, 23839, 920, 43626, 1, '2016-03-27 14:16:03', '2016-03-27 14:16:03', NULL, 0.0, 0.0, 0.0, 2116, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295139, 1, 1, 0, 0, 615.48, 615.48, 28, 5, 99, 43941, 2509, 135, 32343, 1, '2016-03-27 14:16:03', '2016-03-27 14:16:03', NULL, 0.0, 0.0, 0.0, 1544, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295140, 1, 1, 0, 0, 896.36, 896.36, 21, 6, 35, 43942, 12425, 920, 43594, 1, '2016-03-27 14:16:04', '2016-03-27 14:16:04', NULL, 0.0, 0.0, 0.0, 2116, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295141, 1, 1, 0, 0, 718.08, 718.08, 30, 26, 4, 43943, 3340, 837, 35510, 1, '2016-03-27 14:16:04', '2016-03-27 14:16:04', NULL, 0.0, 0.0, 0.0, 1757, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295142, 1, 1, 0, 0, 772.71, 772.71, 3, 1, 18, 43944, 23838, 185, 43627, 1, '2016-03-27 14:16:05', '2016-03-27 14:16:05', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295143, 1, 1, 0, 0, 843.98, 843.98, 2, 24, 79, 43945, 19326, 321, 33211, 1, '2016-03-27 14:16:06', '2016-03-27 14:16:06', NULL, 0.0, 0.0, 0.0, 1652, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295144, 1, 1, 0, 0, 879.78, 879.78, 2, 29, 72, 43946, 8002, 203, 35294, 1, '2016-03-27 14:16:06', '2016-03-27 14:16:06', NULL, 0.0, 0.0, 0.0, 1618, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295145, 1, 1, 0, 0, 809.53, 809.53, 2, 32, 57, 43947, 3520, 790, 35388, 1, '2016-03-27 14:16:07', '2016-03-27 14:16:07', NULL, 0.0, 0.0, 0.0, 1801, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295146, 2, 1, 0, 0, 691.82, 691.82, 2, 58, 53, 43947, 2582, 115, 32800, 1, '2016-03-27 14:16:08', '2016-03-27 14:16:08', NULL, 0.0, 0.0, 0.0, 1598, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295147, 1, 1, 0, 0, 821.76, 821.76, 2, 54, 71, 43948, 12423, 185, 43613, 1, '2016-03-27 14:16:08', '2016-03-27 14:16:08', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295148, 2, 1, 0, 0, 743.12, 743.12, 3, 13, 20, 43948, 9162, 185, 43611, 1, '2016-03-27 14:16:09', '2016-03-27 14:16:09', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295149, 1, 1, 0, 0, 849.92, 849.92, 2, 24, 46, 43949, 13495, 616, 40380, 1, '2016-03-27 14:16:09', '2016-03-27 14:16:09', NULL, 0.0, 0.0, 0.0, 2001, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295150, 1, 1, 0, 0, 647.99, 647.99, 3, 23, 80, 43950, 17161, 185, 43628, 1, '2016-03-27 14:16:10', '2016-03-27 14:16:10', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295151, 1, 1, 0, 0, 910.79, 910.79, 2, 29, 76, 43951, 12455, 920, 43562, 1, '2016-03-27 14:16:11', '2016-03-27 14:16:11', NULL, 0.0, 0.0, 0.0, 2116, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295152, 1, 1, 0, 0, 679.18, 679.18, 3, 20, 89, 43952, 12407, 115, 33472, 1, '2016-03-27 14:16:12', '2016-03-27 14:16:12', NULL, 0.0, 0.0, 0.0, 1598, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295153, 1, 1, 0, 0, 733.2, 733.2, 3, 13, 18, 43953, 8132, 439, 38046, 1, '2016-03-27 14:16:12', '2016-03-27 14:16:12', NULL, 0.0, 0.0, 0.0, 1902, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295154, 1, 1, 0, 0, 681.03, 681.03, 3, 45, 13, 43954, 13686, 439, 37896, 1, '2016-03-27 14:16:13', '2016-03-27 14:16:13', NULL, 0.0, 0.0, 0.0, 1902, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295155, 1, 1, 0, 0, 613.09, 613.09, 4, 18, 82, 43955, 13680, 795, 37960, 1, '2016-03-27 14:16:13', '2016-03-27 14:16:13', NULL, 0.0, 0.0, 0.0, 1813, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295156, 1, 1, 0, 0, 502.86, 502.86, 4, 15, 64, 43956, 3287, 837, 34465, 1, '2016-03-27 14:16:14', '2016-03-27 14:16:14', NULL, 0.0, 0.0, 0.0, 1757, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295157, 1, 1, 0, 0, 697.92, 697.92, 3, 8, 49, 43957, 12451, 185, 43629, 1, '2016-03-27 14:16:15', '2016-03-27 14:16:15', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295158, 1, 1, 0, 0, 780.98, 780.98, 2, 20, 81, 43958, 12427, 185, 43630, 1, '2016-03-27 14:16:15', '2016-03-27 14:16:15', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295159, 1, 1, 0, 0, 767.83, 767.83, 2, 27, 39, 43959, 3308, 185, 35355, 1, '2016-03-27 14:16:16', '2016-03-27 14:16:16', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295160, 1, 1, 0, 0, 811.48, 811.48, 2, 21, 52, 43960, 23814, 920, 43570, 1, '2016-03-27 14:16:16', '2016-03-27 14:16:16', NULL, 0.0, 0.0, 0.0, 2116, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295161, 1, 1, 0, 0, 809.49, 809.49, 2, 24, 9, 43961, 17148, 439, 43631, 1, '2016-03-27 14:16:17', '2016-03-27 14:16:17', NULL, 0.0, 0.0, 0.0, 1902, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295162, 2, 1, 0, 0, 627.03, 627.03, 3, 6, 2, 43961, 12469, 185, 43622, 1, '2016-03-27 14:16:18', '2016-03-27 14:16:18', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295163, 3, 1, 0, 0, 552.82, 552.82, 3, 30, 99, 43961, 23844, 921, 43632, 1, '2016-03-27 14:16:18', '2016-03-27 14:16:18', NULL, 0.0, 0.0, 0.0, 2119, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295164, 1, 1, 0, 0, 916.53, 916.53, 2, 11, 30, 43962, 12455, 920, 43562, 1, '2016-03-27 14:16:19', '2016-03-27 14:16:19', NULL, 0.0, 0.0, 0.0, 2116, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295165, 2, 1, 0, 0, 647.55, 647.55, 3, 5, 84, 43962, 13686, 439, 37896, 1, '2016-03-27 14:16:20', '2016-03-27 14:16:20', NULL, 0.0, 0.0, 0.0, 1902, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295166, 1, 1, 0, 0, 574.58, 574.58, 3, 48, 62, 43963, 23841, 185, 43633, 1, '2016-03-27 14:16:20', '2016-03-27 14:16:20', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295167, 1, 1, 0, 0, 783.49, 783.49, 6, 21, 96, 43964, 8212, 844, 35331, 1, '2016-03-27 14:16:21', '2016-03-27 14:16:21', NULL, 0.0, 0.0, 0.0, 1819, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295168, 1, 1, 0, 0, 865.83, 865.83, 6, 0, 97, 43965, 10850, 920, 43555, 1, '2016-03-27 14:16:22', '2016-03-27 14:16:22', NULL, 0.0, 0.0, 0.0, 2116, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295169, 2, 1, 0, 0, 536.38, 536.38, 9, 42, 68, 43965, 3287, 837, 34465, 1, '2016-03-27 14:16:22', '2016-03-27 14:16:22', NULL, 0.0, 0.0, 0.0, 1757, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295170, 1, 1, 0, 0, 741.56, 741.56, 6, 12, 46, 43966, 12472, 185, 37949, 1, '2016-03-27 14:16:23', '2016-03-27 14:16:23', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295171, 1, 1, 0, 0, 640.65, 640.65, 8, 4, 74, 43967, 3334, 837, 34532, 1, '2016-03-27 14:16:23', '2016-03-27 14:16:23', NULL, 0.0, 0.0, 0.0, 1757, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295172, 1, 1, 0, 0, 742.12, 742.12, 5, 27, 13, 43968, 3308, 185, 35355, 1, '2016-03-27 14:16:24', '2016-03-27 14:16:24', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295173, 1, 1, 0, 0, 755.91, 755.91, 5, 23, 73, 43969, 14586, 206, 33224, 1, '2016-03-27 14:16:25', '2016-03-27 14:16:25', NULL, 0.0, 0.0, 0.0, 1625, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295174, 1, 1, 0, 0, 648.53, 648.53, 6, 27, 40, 43970, 17161, 185, 43628, 1, '2016-03-27 14:16:25', '2016-03-27 14:16:25', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295175, 2, 1, 0, 0, 557.04, 557.04, 7, 31, 3, 43970, 23844, 921, 43632, 1, '2016-03-27 14:16:26', '2016-03-27 14:16:26', NULL, 0.0, 0.0, 0.0, 2119, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295176, 1, 1, 0, 0, 670.84, 670.84, 0, 45, 54, 43971, 17154, 185, 43634, 1, '2016-03-27 14:16:27', '2016-03-27 14:16:27', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295177, 1, 1, 0, 0, 622.28, 622.28, 0, 50, 1, 43972, 17160, 185, 43635, 1, '2016-03-27 14:16:27', '2016-03-27 14:16:27', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295178, 1, 1, 0, 0, 697.47, 697.47, 0, 40, 79, 43973, 3330, 185, 35369, 1, '2016-03-27 14:16:28', '2016-03-27 14:16:28', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295179, 1, 1, 0, 0, 671.12, 671.12, 0, 52, 36, 43974, 3340, 837, 35510, 1, '2016-03-27 14:16:28', '2016-03-27 14:16:28', NULL, 0.0, 0.0, 0.0, 1757, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295180, 1, 1, 0, 0, 746.8, 746.8, 0, 38, 23, 43975, 23838, 185, 43627, 1, '2016-03-27 14:16:29', '2016-03-27 14:16:29', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295181, 1, 1, 0, 0, 864.56, 864.56, 0, 33, 52, 43976, 10850, 920, 43555, 1, '2016-03-27 14:16:30', '2016-03-27 14:16:30', NULL, 0.0, 0.0, 0.0, 2116, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295182, 2, 1, 0, 0, 826.58, 826.58, 0, 35, 6, 43976, 12414, 185, 35340, 1, '2016-03-27 14:16:31', '2016-03-27 14:16:31', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295183, 1, 1, 0, 0, 817.81, 817.81, 0, 29, 31, 43977, 12427, 185, 43630, 1, '2016-03-27 14:16:31', '2016-03-27 14:16:31', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295184, 2, 1, 0, 0, 639.71, 639.71, 0, 37, 47, 43977, 21947, 795, 37736, 1, '2016-03-27 14:16:32', '2016-03-27 14:16:32', NULL, 0.0, 0.0, 0.0, 1813, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295185, 1, 1, 0, 0, 758.32, 758.32, 0, 32, 15, 43978, 17156, 496, 43616, 1, '2016-03-27 14:16:32', '2016-03-27 14:16:32', NULL, 0.0, 0.0, 0.0, 2118, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295186, 2, 1, 0, 0, 757.38, 757.38, 0, 32, 19, 43978, 12152, 372, 36058, 1, '2016-03-27 14:16:33', '2016-03-27 14:16:33', NULL, 0.0, 0.0, 0.0, 1600, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295187, 1, 1, 0, 0, 824.93, 824.93, 0, 30, 56, 43979, 17158, 443, 39933, 1, '2016-03-27 14:16:34', '2016-03-27 14:16:34', NULL, 0.0, 0.0, 0.0, 1806, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295188, 1, 1, 0, 0, 866.67, 866.67, 0, 29, 85, 43980, 12413, 185, 43614, 1, '2016-03-27 14:16:34', '2016-03-27 14:16:34', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295189, 2, 1, 0, 0, 842.12, 842.12, 0, 30, 72, 43980, 8333, 439, 37671, 1, '2016-03-27 14:16:35', '2016-03-27 14:16:35', NULL, 0.0, 0.0, 0.0, 1902, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295190, 3, 1, 0, 0, 801.92, 801.92, 0, 32, 26, 43980, 17148, 439, 43631, 1, '2016-03-27 14:16:35', '2016-03-27 14:16:35', NULL, 0.0, 0.0, 0.0, 1902, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295191, 1, 1, 0, 0, 547.09, 547.09, 0, 59, 35, 43981, 23842, 496, 43636, 1, '2016-03-27 14:16:36', '2016-03-27 14:16:36', NULL, 0.0, 0.0, 0.0, 2118, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295192, 1, 1, 0, 0, 753.69, 753.69, 0, 44, 74, 43982, 17154, 185, 43634, 1, '2016-03-27 14:16:37', '2016-03-27 14:16:37', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295193, 2, 1, 0, 0, 667.99, 667.99, 0, 50, 48, 43982, 12468, 185, 43637, 1, '2016-03-27 14:16:37', '2016-03-27 14:16:37', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295194, 1, 1, 0, 0, 688.4, 688.4, 0, 49, 84, 43983, 12451, 185, 43629, 1, '2016-03-27 14:16:38', '2016-03-27 14:16:38', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295195, 2, 1, 0, 0, 629.89, 629.89, 0, 54, 47, 43983, 17160, 185, 43635, 1, '2016-03-27 14:16:39', '2016-03-27 14:16:39', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295196, 1, 1, 0, 0, 709.47, 709.47, 0, 39, 17, 43984, 12456, 185, 43638, 1, '2016-03-27 14:16:39', '2016-03-27 14:16:39', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295197, 2, 1, 0, 0, 678.8, 678.8, 0, 40, 94, 43984, 19817, 795, 37735, 1, '2016-03-27 14:16:40', '2016-03-27 14:16:40', NULL, 0.0, 0.0, 0.0, 1813, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295198, 3, 1, 0, 0, 628.59, 628.59, 0, 44, 21, 43984, 21947, 795, 37736, 1, '2016-03-27 14:16:41', '2016-03-27 14:16:41', NULL, 0.0, 0.0, 0.0, 1813, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295199, 1, 1, 0, 0, 848.46, 848.46, 0, 33, 6, 43985, 12152, 372, 36058, 1, '2016-03-27 14:16:41', '2016-03-27 14:16:41', NULL, 0.0, 0.0, 0.0, 1600, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295200, 2, 1, 0, 0, 738.55, 738.55, 0, 37, 98, 43985, 17167, 496, 43639, 1, '2016-03-27 14:16:42', '2016-03-27 14:16:42', NULL, 0.0, 0.0, 0.0, 2118, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295201, 1, 1, 0, 0, 710.05, 710.05, 0, 40, 49, 43986, 12439, 185, 43640, 1, '2016-03-27 14:16:43', '2016-03-27 14:16:43', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295202, 2, 1, 0, 0, 645.78, 645.78, 0, 44, 52, 43986, 12446, 185, 43617, 1, '2016-03-27 14:16:43', '2016-03-27 14:16:43', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295203, 3, 1, 0, 0, 634.8, 634.8, 0, 45, 29, 43986, 23840, 921, 43615, 1, '2016-03-27 14:16:44', '2016-03-27 14:16:44', NULL, 0.0, 0.0, 0.0, 2119, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295204, 4, 1, 0, 0, 550.87, 550.87, 0, 52, 19, 43986, 23845, 496, 43641, 1, '2016-03-27 14:16:44', '2016-03-27 14:16:44', NULL, 0.0, 0.0, 0.0, 2118, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295205, 1, 1, 0, 0, 723.46, 723.46, 0, 41, 26, 43987, 12434, 185, 43642, 1, '2016-03-27 14:16:45', '2016-03-27 14:16:45', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295206, 2, 1, 0, 0, 602.42, 602.42, 0, 49, 55, 43987, 17138, 496, 43612, 1, '2016-03-27 14:16:46', '2016-03-27 14:16:46', NULL, 0.0, 0.0, 0.0, 2118, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295207, 1, 1, 0, 0, 657.11, 657.11, 0, 48, 85, 43988, 13680, 795, 37960, 1, '2016-03-27 14:16:46', '2016-03-27 14:16:46', NULL, 0.0, 0.0, 0.0, 1813, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295208, 1, 1, 0, 0, 611.53, 611.53, 0, 42, 14, 43989, 23842, 496, 43636, 1, '2016-03-27 14:16:47', '2016-03-27 14:16:47', NULL, 0.0, 0.0, 0.0, 2118, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295209, 1, 1, 0, 0, 821.67, 821.67, 0, 32, 58, 43990, 12414, 185, 35340, 1, '2016-03-27 14:16:47', '2016-03-27 14:16:47', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295210, 2, 1, 0, 0, 722.93, 722.93, 0, 37, 3, 43990, 12468, 185, 43637, 1, '2016-03-27 14:16:48', '2016-03-27 14:16:48', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295211, 1, 1, 0, 0, 450.77, 450.77, 1, 7, 84, 43991, 12404, 185, 35530, 1, '2016-03-27 14:16:49', '2016-03-27 14:16:49', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295212, 1, 1, 0, 0, 873.68, 873.68, 0, 25, 49, 43992, 13495, 616, 40380, 1, '2016-03-27 14:16:50', '2016-03-27 14:16:50', NULL, 0.0, 0.0, 0.0, 2001, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295213, 2, 1, 0, 0, 849.68, 849.68, 0, 26, 21, 43992, 19338, 321, 32796, 1, '2016-03-27 14:16:50', '2016-03-27 14:16:50', NULL, 0.0, 0.0, 0.0, 1652, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295214, 1, 1, 0, 0, 808.8, 808.8, 0, 27, 72, 43993, 17167, 496, 43639, 1, '2016-03-27 14:16:51', '2016-03-27 14:16:51', NULL, 0.0, 0.0, 0.0, 2118, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295215, 2, 1, 0, 0, 529.9, 529.9, 0, 42, 31, 43993, 23836, 439, 43643, 1, '2016-03-27 14:16:51', '2016-03-27 14:16:51', NULL, 0.0, 0.0, 0.0, 1902, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295216, 1, 1, 0, 0, 691.42, 691.42, 0, 32, 99, 43994, 12439, 185, 43640, 1, '2016-03-27 14:16:52', '2016-03-27 14:16:52', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295217, 2, 1, 0, 0, 594.01, 594.01, 0, 38, 40, 43994, 23845, 496, 43641, 1, '2016-03-27 14:16:53', '2016-03-27 14:16:53', NULL, 0.0, 0.0, 0.0, 2118, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295218, 1, 1, 0, 0, 652.92, 652.92, 0, 35, 90, 43995, 23843, 921, 43618, 1, '2016-03-27 14:16:53', '2016-03-27 14:16:53', NULL, 0.0, 0.0, 0.0, 2119, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295219, 2, 1, 0, 0, 624.4, 624.4, 0, 37, 54, 43995, 6902, 383, 43619, 1, '2016-03-27 14:16:54', '2016-03-27 14:16:54', NULL, 0.0, 0.0, 0.0, 2117, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295220, 1, 1, 0, 0, 785.48, 785.48, 0, 30, 44, 43996, 12460, 185, 43620, 1, '2016-03-27 14:16:55', '2016-03-27 14:16:55', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295221, 2, 1, 0, 0, 701.38, 701.38, 0, 34, 9, 43996, 23837, 921, 43621, 1, '2016-03-27 14:16:55', '2016-03-27 14:16:55', NULL, 0.0, 0.0, 0.0, 2119, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295222, 3, 1, 0, 0, 684.51, 684.51, 0, 34, 93, 43996, 12434, 185, 43642, 1, '2016-03-27 14:16:56', '2016-03-27 14:16:56', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295223, 4, 1, 0, 0, 622.17, 622.17, 0, 38, 43, 43996, 23834, 920, 43573, 1, '2016-03-27 14:16:56', '2016-03-27 14:16:56', NULL, 0.0, 0.0, 0.0, 2116, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295224, 1, 1, 0, 0, 801.04, 801.04, 0, 30, 76, 43997, 3330, 185, 35369, 1, '2016-03-27 14:16:57', '2016-03-27 14:16:57', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295225, 2, 1, 0, 0, 650.3, 650.3, 0, 37, 89, 43997, 12470, 185, 35371, 1, '2016-03-27 14:16:58', '2016-03-27 14:16:58', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295226, 1, 1, 0, 0, 539.38, 539.38, 0, 46, 85, 43998, 15655, 383, 43623, 1, '2016-03-27 14:16:59', '2016-03-27 14:16:59', NULL, 0.0, 0.0, 0.0, 2117, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295227, 1, 1, 0, 0, 637.77, 637.77, 0, 40, 72, 43999, 23841, 185, 43633, 1, '2016-03-27 14:16:59', '2016-03-27 14:16:59', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295228, 1, 1, 0, 0, 415.17, 415.17, 1, 5, 13, 44000, 9195, 185, 43624, 1, '2016-03-27 14:17:00', '2016-03-27 14:17:00', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295229, 1, 1, 0, 0, 635.31, 635.31, 0, 45, 8, 44001, 3344, 837, 35323, 1, '2016-03-27 14:17:00', '2016-03-27 14:17:00', NULL, 0.0, 0.0, 0.0, 1757, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295230, 1, 1, 0, 0, 714.04, 714.04, 12, 44, 84, 44002, 9280, 185, 35525, 1, '2016-03-27 14:17:01', '2016-03-27 14:17:01', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295231, 1, 1, 0, 0, 779.52, 779.52, 11, 41, 43, 44003, 8212, 844, 35331, 1, '2016-03-27 14:17:02', '2016-03-27 14:17:02', NULL, 0.0, 0.0, 0.0, 1819, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295232, 1, 1, 0, 0, 883.99, 883.99, 9, 31, 15, 44004, 3520, 790, 35388, 1, '2016-03-27 14:17:02', '2016-03-27 14:17:02', NULL, 0.0, 0.0, 0.0, 1801, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295233, 1, 1, 0, 0, 759.46, 759.46, 11, 11, 79, 44005, 12472, 185, 37949, 1, '2016-03-27 14:17:03', '2016-03-27 14:17:03', NULL, 0.0, 0.0, 0.0, 1791, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (295234, 1, 1, 0, 0, 897.81, 897.81, 11, 0, 35, 44006, 12425, 920, 43594, 1, '2016-03-27 14:17:03', '2016-03-27 14:17:03', NULL, 0.0, 0.0, 0.0, 2116, 0, 0);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14000, '2016-03-27 14:17:04', '2016-03-27 14:17:04', 1, 1, 0, 0, 799.56, 799.56, 2, 33, 96, 185, 1, 44007, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14001, '2016-03-27 14:17:04', '2016-03-27 14:17:04', 1, 1, 0, 0, 741.84, 741.84, 2, 51, 29, 185, 1, 44008, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14002, '2016-03-27 14:17:05', '2016-03-27 14:17:05', 1, 1, 0, 0, 670.42, 670.42, 2, 35, 38, 185, 1, 44009, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14003, '2016-03-27 14:17:05', '2016-03-27 14:17:05', 1, 1, 0, 0, 738.52, 738.52, 2, 26, 51, 185, 1, 44010, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14004, '2016-03-27 14:17:06', '2016-03-27 14:17:06', 1, 1, 0, 0, 640.53, 640.53, 2, 58, 68, 185, 1, 44011, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14005, '2016-03-27 14:17:06', '2016-03-27 14:17:06', 1, 1, 0, 0, 822.65, 822.65, 2, 21, 47, 185, 1, 44012, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14006, '2016-03-27 14:17:06', '2016-03-27 14:17:06', 1, 1, 0, 0, 693.46, 693.46, 2, 56, 32, 185, 1, 44013, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14007, '2016-03-27 14:17:07', '2016-03-27 14:17:07', 1, 1, 0, 0, 808.8, 808.8, 2, 17, 29, 185, 1, 44014, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14008, '2016-03-27 14:17:07', '2016-03-27 14:17:07', 1, 1, 0, 0, 754.74, 754.74, 2, 29, 72, 185, 1, 44015, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14009, '2016-03-27 14:17:08', '2016-03-27 14:17:08', 1, 1, 0, 0, 726.28, 726.28, 2, 10, 68, 185, 1, 44016, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14010, '2016-03-27 14:17:08', '2016-03-27 14:17:08', 1, 1, 0, 0, 801.04, 801.04, 2, 1, 8, 185, 1, 44017, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14011, '2016-03-27 14:17:09', '2016-03-27 14:17:09', 1, 1, 0, 0, 682.93, 682.93, 2, 29, 62, 185, 1, 44018, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14012, '2016-03-27 14:17:09', '2016-03-27 14:17:09', 1, 1, 0, 0, 747.47, 747.47, 2, 16, 34, 185, 1, 44019, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14013, '2016-03-27 14:17:09', '2016-03-27 14:17:09', 1, 1, 0, 0, 790.85, 790.85, 2, 11, 10, 185, 1, 44020, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14014, '2016-03-27 14:17:10', '2016-03-27 14:17:10', 1, 1, 0, 0, 670.58, 670.58, 2, 44, 29, 185, 1, 44021, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14015, '2016-03-27 14:17:10', '2016-03-27 14:17:10', 1, 1, 0, 0, 799.56, 799.56, 2, 33, 96, 185, 1, 44022, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14016, '2016-03-27 14:17:11', '2016-03-27 14:17:11', 1, 1, 0, 0, 741.84, 741.84, 2, 51, 29, 185, 1, 44023, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14017, '2016-03-27 14:17:11', '2016-03-27 14:17:11', 1, 1, 0, 0, 670.42, 670.42, 2, 35, 38, 185, 1, 44024, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14018, '2016-03-27 14:17:11', '2016-03-27 14:17:11', 1, 1, 0, 0, 738.52, 738.52, 2, 26, 51, 185, 1, 44025, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14019, '2016-03-27 14:17:12', '2016-03-27 14:17:12', 1, 1, 0, 0, 640.53, 640.53, 2, 58, 68, 185, 1, 44026, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14020, '2016-03-27 14:17:12', '2016-03-27 14:17:12', 1, 1, 0, 0, 808.8, 808.8, 2, 17, 29, 185, 1, 44027, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14021, '2016-03-27 14:17:13', '2016-03-27 14:17:13', 1, 1, 0, 0, 754.74, 754.74, 2, 29, 72, 185, 1, 44028, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14022, '2016-03-27 14:17:13', '2016-03-27 14:17:13', 1, 1, 0, 0, 726.28, 726.28, 2, 10, 68, 185, 1, 44029, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14023, '2016-03-27 14:17:13', '2016-03-27 14:17:13', 1, 1, 0, 0, 801.04, 801.04, 2, 1, 8, 185, 1, 44030, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);

INSERT INTO `meeting_relay_results` (`id`, `created_at`, `updated_at`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_points`, `minutes`, `seconds`, `hundreds`, `team_id`, `user_id`, `meeting_program_id`, `disqualification_code_type_id`, `relay_header`, `reaction_time`, `entry_minutes`, `entry_seconds`, `entry_hundreds`, `team_affiliation_id`, `entry_time_type_id`)
  VALUES (14024, '2016-03-27 14:17:14', '2016-03-27 14:17:14', 1, 1, 0, 0, 682.93, 682.93, 2, 29, 62, 185, 1, 44031, NULL, 'Emmedue ssd - A', 0.0, NULL, NULL, NULL, 1791, NULL);


-- Meeting 15287
-- 'Results acquired' flag setting:
UPDATE meetings SET are_results_acquired = '1' WHERE id = 15287;

-- --- BeginTimeCalculator: compute_for_all( 15287 )
-- ----------------------------------------------------
-- Using RESULTS to compute heat length.

-- Event #1, M.Prg: 43916, tot. athletes: 1
-- Tot. progr. duration: 144 (sec), Heat durations: [14448] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:32:00 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:32' WHERE id = 43916;

-- Event #1, M.Prg: 44007, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:34:24 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:34' WHERE id = 44007;

-- Event #2, M.Prg: 44008, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:34:24 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:34' WHERE id = 44008;

-- Event #2, M.Prg: 43917, tot. athletes: 1
-- Tot. progr. duration: 236 (sec), Heat durations: [23601] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:34:24 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:34' WHERE id = 43917;

-- Event #3, M.Prg: 44009, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:38:20 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:38' WHERE id = 44009;

-- Event #3, M.Prg: 43918, tot. athletes: 1
-- Tot. progr. duration: 130 (sec), Heat durations: [13005] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:38:20 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:38' WHERE id = 43918;

-- Event #4, M.Prg: 44010, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:40:30 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:40' WHERE id = 44010;

-- Event #4, M.Prg: 43919, tot. athletes: 1
-- Tot. progr. duration: 179 (sec), Heat durations: [17990] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:40:30 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:40' WHERE id = 43919;

-- Event #5, M.Prg: 44011, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:43:29 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:43' WHERE id = 44011;

-- Event #5, M.Prg: 43920, tot. athletes: 1
-- Tot. progr. duration: 126 (sec), Heat durations: [12664] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:43:29 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:43' WHERE id = 43920;

-- Event #6, M.Prg: 44012, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:45:35 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:45' WHERE id = 44012;

-- Event #6, M.Prg: 43921, tot. athletes: 1
-- Tot. progr. duration: 128 (sec), Heat durations: [12846] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:45:35 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:45' WHERE id = 43921;

-- Event #7, M.Prg: 44013, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:47:43 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:47' WHERE id = 44013;

-- Event #7, M.Prg: 43922, tot. athletes: 1
-- Tot. progr. duration: 211 (sec), Heat durations: [21105] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:47:43 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:47' WHERE id = 43922;

-- Event #8, M.Prg: 44014, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:51:14 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:51' WHERE id = 44014;

-- Event #8, M.Prg: 43923, tot. athletes: 1
-- Tot. progr. duration: 137 (sec), Heat durations: [13742] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:51:14 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:51' WHERE id = 43923;

-- Event #9, M.Prg: 44015, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:53:31 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:53' WHERE id = 44015;

-- Event #9, M.Prg: 43924, tot. athletes: 1
-- Tot. progr. duration: 145 (sec), Heat durations: [14543] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:53:31 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:53' WHERE id = 43924;

-- Event #10, M.Prg: 43925, tot. athletes: 1
-- Tot. progr. duration: 134 (sec), Heat durations: [13428] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:55:56 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:55' WHERE id = 43925;

-- Event #10, M.Prg: 44016, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:58:10 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:58' WHERE id = 44016;

-- Event #11, M.Prg: 44017, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:58:10 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:58' WHERE id = 44017;

-- Event #11, M.Prg: 43926, tot. athletes: 2
-- Tot. progr. duration: 135 (sec), Heat durations: [13595] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 08:58:10 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 08:58' WHERE id = 43926;

-- Event #12, M.Prg: 44018, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:00:25 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:00' WHERE id = 44018;

-- Event #12, M.Prg: 43927, tot. athletes: 1
-- Tot. progr. duration: 160 (sec), Heat durations: [16053] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:00:25 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:00' WHERE id = 43927;

-- Event #13, M.Prg: 44019, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:03:05 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:03' WHERE id = 44019;

-- Event #13, M.Prg: 43928, tot. athletes: 1
-- Tot. progr. duration: 149 (sec), Heat durations: [14913] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:03:05 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:03' WHERE id = 43928;

-- Event #14, M.Prg: 44020, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:05:34 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:05' WHERE id = 44020;

-- Event #14, M.Prg: 43929, tot. athletes: 1
-- Tot. progr. duration: 180 (sec), Heat durations: [18014] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:05:34 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:05' WHERE id = 43929;

-- Event #15, M.Prg: 44021, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:08:34 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:08' WHERE id = 44021;

-- Event #15, M.Prg: 43930, tot. athletes: 1
-- Tot. progr. duration: 136 (sec), Heat durations: [13647] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:08:34 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:08' WHERE id = 43930;

-- Event #16, M.Prg: 44022, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:10:50 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:10' WHERE id = 44022;

-- Event #16, M.Prg: 43931, tot. athletes: 1
-- Tot. progr. duration: 123 (sec), Heat durations: [12324] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:10:50 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:10' WHERE id = 43931;

-- Event #17, M.Prg: 44023, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:12:53 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:12' WHERE id = 44023;

-- Event #17, M.Prg: 43932, tot. athletes: 1
-- Tot. progr. duration: 124 (sec), Heat durations: [12408] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:12:53 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:12' WHERE id = 43932;

-- Event #18, M.Prg: 44024, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:14:57 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:14' WHERE id = 44024;

-- Event #18, M.Prg: 43933, tot. athletes: 1
-- Tot. progr. duration: 141 (sec), Heat durations: [14136] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:14:57 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:14' WHERE id = 43933;

-- Event #19, M.Prg: 44025, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:17:18 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:17' WHERE id = 44025;

-- Event #19, M.Prg: 43934, tot. athletes: 2
-- Tot. progr. duration: 147 (sec), Heat durations: [14751] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:17:18 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:17' WHERE id = 43934;

-- Event #20, M.Prg: 44026, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:19:45 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:19' WHERE id = 44026;

-- Event #20, M.Prg: 43935, tot. athletes: 4
-- Tot. progr. duration: 144 (sec), Heat durations: [14400] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:19:45 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:19' WHERE id = 43935;

-- Event #21, M.Prg: 44027, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:22:09 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:22' WHERE id = 44027;

-- Event #21, M.Prg: 43936, tot. athletes: 1
-- Tot. progr. duration: 151 (sec), Heat durations: [15104] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:22:09 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:22' WHERE id = 43936;

-- Event #22, M.Prg: 44028, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:24:40 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:24' WHERE id = 44028;

-- Event #22, M.Prg: 43937, tot. athletes: 1
-- Tot. progr. duration: 165 (sec), Heat durations: [16565] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:24:40 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:24' WHERE id = 43937;

-- Event #23, M.Prg: 44029, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:27:25 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:27' WHERE id = 44029;

-- Event #23, M.Prg: 43938, tot. athletes: 1
-- Tot. progr. duration: 210 (sec), Heat durations: [21050] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:27:25 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:27' WHERE id = 43938;

-- Event #24, M.Prg: 43939, tot. athletes: 1
-- Tot. progr. duration: 1301 (sec), Heat durations: [130106] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:30:55 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:30' WHERE id = 43939;

-- Event #24, M.Prg: 44030, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:52:36 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:52' WHERE id = 44030;

-- Event #25, M.Prg: 44031, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:52:36 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:52' WHERE id = 44031;

-- Event #25, M.Prg: 43940, tot. athletes: 4
-- Tot. progr. duration: 1437 (sec), Heat durations: [143748] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 09:52:36 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 09:52' WHERE id = 43940;

-- Event #26, M.Prg: 43941, tot. athletes: 1
-- Tot. progr. duration: 1745 (sec), Heat durations: [174599] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 10:16:33 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 10:16' WHERE id = 43941;

-- Event #27, M.Prg: 43942, tot. athletes: 1
-- Tot. progr. duration: 1326 (sec), Heat durations: [132635] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 10:45:38 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 10:45' WHERE id = 43942;

-- Event #28, M.Prg: 43943, tot. athletes: 1
-- Tot. progr. duration: 1886 (sec), Heat durations: [188604] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 11:07:44 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 11:07' WHERE id = 43943;

-- Event #29, M.Prg: 43944, tot. athletes: 1
-- Tot. progr. duration: 241 (sec), Heat durations: [24118] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 11:39:10 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 11:39' WHERE id = 43944;

-- Event #30, M.Prg: 43945, tot. athletes: 1
-- Tot. progr. duration: 204 (sec), Heat durations: [20479] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 11:43:11 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 11:43' WHERE id = 43945;

-- Event #31, M.Prg: 43946, tot. athletes: 1
-- Tot. progr. duration: 209 (sec), Heat durations: [20972] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 11:46:35 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 11:46' WHERE id = 43946;

-- Event #32, M.Prg: 43947, tot. athletes: 2
-- Tot. progr. duration: 238 (sec), Heat durations: [23853] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 11:50:04 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 11:50' WHERE id = 43947;

-- Event #33, M.Prg: 43948, tot. athletes: 2
-- Tot. progr. duration: 253 (sec), Heat durations: [25320] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 11:54:02 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 11:54' WHERE id = 43948;

-- Event #34, M.Prg: 43949, tot. athletes: 1
-- Tot. progr. duration: 204 (sec), Heat durations: [20446] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 11:58:15 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 11:58' WHERE id = 43949;

-- Event #35, M.Prg: 43950, tot. athletes: 1
-- Tot. progr. duration: 263 (sec), Heat durations: [26380] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 12:01:39 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 12:01' WHERE id = 43950;

-- Event #36, M.Prg: 43951, tot. athletes: 1
-- Tot. progr. duration: 209 (sec), Heat durations: [20976] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 12:06:02 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 12:06' WHERE id = 43951;

-- Event #37, M.Prg: 43952, tot. athletes: 1
-- Tot. progr. duration: 260 (sec), Heat durations: [26089] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 12:09:31 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 12:09' WHERE id = 43952;

-- Event #38, M.Prg: 43953, tot. athletes: 1
-- Tot. progr. duration: 253 (sec), Heat durations: [25318] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 12:13:51 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 12:13' WHERE id = 43953;

-- Event #39, M.Prg: 43954, tot. athletes: 1
-- Tot. progr. duration: 285 (sec), Heat durations: [28513] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 12:18:04 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 12:18' WHERE id = 43954;

-- Event #40, M.Prg: 43955, tot. athletes: 1
-- Tot. progr. duration: 318 (sec), Heat durations: [31882] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 12:22:49 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 12:22' WHERE id = 43955;

-- Event #41, M.Prg: 43956, tot. athletes: 1
-- Tot. progr. duration: 315 (sec), Heat durations: [31564] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 12:28:07 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 12:28' WHERE id = 43956;

-- Event #42, M.Prg: 43957, tot. athletes: 1
-- Tot. progr. duration: 248 (sec), Heat durations: [24849] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 12:33:22 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 12:33' WHERE id = 43957;

-- Event #43, M.Prg: 43958, tot. athletes: 1
-- Tot. progr. duration: 200 (sec), Heat durations: [20081] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 12:37:30 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 12:37' WHERE id = 43958;

-- Event #44, M.Prg: 43959, tot. athletes: 1
-- Tot. progr. duration: 207 (sec), Heat durations: [20739] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 12:40:50 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 12:40' WHERE id = 43959;

-- Event #45, M.Prg: 43960, tot. athletes: 1
-- Tot. progr. duration: 201 (sec), Heat durations: [20152] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 12:44:17 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 12:44' WHERE id = 43960;

-- Event #46, M.Prg: 43961, tot. athletes: 3
-- Tot. progr. duration: 270 (sec), Heat durations: [27099] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 12:47:38 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 12:47' WHERE id = 43961;

-- Event #47, M.Prg: 43962, tot. athletes: 2
-- Tot. progr. duration: 245 (sec), Heat durations: [24584] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 12:52:08 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 12:52' WHERE id = 43962;

-- Event #48, M.Prg: 43963, tot. athletes: 1
-- Tot. progr. duration: 288 (sec), Heat durations: [28862] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 12:56:13 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 12:56' WHERE id = 43963;

-- Event #49, M.Prg: 43964, tot. athletes: 1
-- Tot. progr. duration: 441 (sec), Heat durations: [44196] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 13:01:01 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 13:01' WHERE id = 43964;

-- Event #50, M.Prg: 43965, tot. athletes: 2
-- Tot. progr. duration: 642 (sec), Heat durations: [64268] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 13:08:22 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 13:08' WHERE id = 43965;

-- Event #51, M.Prg: 43966, tot. athletes: 1
-- Tot. progr. duration: 432 (sec), Heat durations: [43246] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 13:19:04 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 13:19' WHERE id = 43966;

-- Event #52, M.Prg: 43967, tot. athletes: 1
-- Tot. progr. duration: 544 (sec), Heat durations: [54474] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 13:26:16 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 13:26' WHERE id = 43967;

-- Event #53, M.Prg: 43968, tot. athletes: 1
-- Tot. progr. duration: 387 (sec), Heat durations: [38713] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 13:35:20 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 13:35' WHERE id = 43968;

-- Event #54, M.Prg: 43969, tot. athletes: 1
-- Tot. progr. duration: 383 (sec), Heat durations: [38373] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 13:41:47 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 13:41' WHERE id = 43969;

-- Event #55, M.Prg: 43970, tot. athletes: 2
-- Tot. progr. duration: 511 (sec), Heat durations: [51103] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 13:48:10 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 13:48' WHERE id = 43970;

-- Event #56, M.Prg: 43971, tot. athletes: 1
-- Tot. progr. duration: 105 (sec), Heat durations: [10554] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 13:56:41 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 13:56' WHERE id = 43971;

-- Event #57, M.Prg: 43972, tot. athletes: 1
-- Tot. progr. duration: 110 (sec), Heat durations: [11001] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 13:58:26 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 13:58' WHERE id = 43972;

-- Event #58, M.Prg: 43973, tot. athletes: 1
-- Tot. progr. duration: 100 (sec), Heat durations: [10079] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:00:16 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:00' WHERE id = 43973;

-- Event #59, M.Prg: 43974, tot. athletes: 1
-- Tot. progr. duration: 112 (sec), Heat durations: [11236] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:01:56 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:01' WHERE id = 43974;

-- Event #60, M.Prg: 43975, tot. athletes: 1
-- Tot. progr. duration: 98 (sec), Heat durations: [9823] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:03:48 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:03' WHERE id = 43975;

-- Event #61, M.Prg: 43976, tot. athletes: 2
-- Tot. progr. duration: 95 (sec), Heat durations: [9506] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:05:26 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:05' WHERE id = 43976;

-- Event #62, M.Prg: 43977, tot. athletes: 2
-- Tot. progr. duration: 97 (sec), Heat durations: [9747] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:07:01 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:07' WHERE id = 43977;

-- Event #63, M.Prg: 43978, tot. athletes: 2
-- Tot. progr. duration: 92 (sec), Heat durations: [9219] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:08:38 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:08' WHERE id = 43978;

-- Event #64, M.Prg: 43979, tot. athletes: 1
-- Tot. progr. duration: 90 (sec), Heat durations: [9056] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:10:10 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:10' WHERE id = 43979;

-- Event #65, M.Prg: 43980, tot. athletes: 3
-- Tot. progr. duration: 92 (sec), Heat durations: [9226] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:11:40 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:11' WHERE id = 43980;

-- Event #66, M.Prg: 43981, tot. athletes: 1
-- Tot. progr. duration: 119 (sec), Heat durations: [11935] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:13:12 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:13' WHERE id = 43981;

-- Event #67, M.Prg: 43982, tot. athletes: 2
-- Tot. progr. duration: 110 (sec), Heat durations: [11048] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:15:11 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:15' WHERE id = 43982;

-- Event #68, M.Prg: 43983, tot. athletes: 2
-- Tot. progr. duration: 114 (sec), Heat durations: [11447] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:17:01 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:17' WHERE id = 43983;

-- Event #69, M.Prg: 43984, tot. athletes: 3
-- Tot. progr. duration: 104 (sec), Heat durations: [10421] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:18:55 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:18' WHERE id = 43984;

-- Event #70, M.Prg: 43985, tot. athletes: 2
-- Tot. progr. duration: 97 (sec), Heat durations: [9798] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:20:39 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:20' WHERE id = 43985;

-- Event #71, M.Prg: 43986, tot. athletes: 4
-- Tot. progr. duration: 112 (sec), Heat durations: [11219] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:22:16 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:22' WHERE id = 43986;

-- Event #72, M.Prg: 43987, tot. athletes: 2
-- Tot. progr. duration: 109 (sec), Heat durations: [10955] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:24:08 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:24' WHERE id = 43987;

-- Event #73, M.Prg: 43988, tot. athletes: 1
-- Tot. progr. duration: 108 (sec), Heat durations: [10885] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:25:57 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:25' WHERE id = 43988;

-- Event #74, M.Prg: 43989, tot. athletes: 1
-- Tot. progr. duration: 102 (sec), Heat durations: [10214] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:27:45 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:27' WHERE id = 43989;

-- Event #75, M.Prg: 43990, tot. athletes: 2
-- Tot. progr. duration: 97 (sec), Heat durations: [9703] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:29:27 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:29' WHERE id = 43990;

-- Event #76, M.Prg: 43991, tot. athletes: 1
-- Tot. progr. duration: 127 (sec), Heat durations: [12784] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:31:04 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:31' WHERE id = 43991;

-- Event #77, M.Prg: 43992, tot. athletes: 2
-- Tot. progr. duration: 86 (sec), Heat durations: [8621] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:33:11 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:33' WHERE id = 43992;

-- Event #78, M.Prg: 43993, tot. athletes: 2
-- Tot. progr. duration: 102 (sec), Heat durations: [10231] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:34:37 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:34' WHERE id = 43993;

-- Event #79, M.Prg: 43994, tot. athletes: 2
-- Tot. progr. duration: 98 (sec), Heat durations: [9840] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:36:19 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:36' WHERE id = 43994;

-- Event #80, M.Prg: 43995, tot. athletes: 2
-- Tot. progr. duration: 97 (sec), Heat durations: [9754] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:37:57 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:37' WHERE id = 43995;

-- Event #81, M.Prg: 43996, tot. athletes: 4
-- Tot. progr. duration: 98 (sec), Heat durations: [9843] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:39:34 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:39' WHERE id = 43996;

-- Event #82, M.Prg: 43997, tot. athletes: 2
-- Tot. progr. duration: 97 (sec), Heat durations: [9789] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:41:12 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:41' WHERE id = 43997;

-- Event #83, M.Prg: 43998, tot. athletes: 1
-- Tot. progr. duration: 106 (sec), Heat durations: [10685] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:42:49 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:42' WHERE id = 43998;

-- Event #84, M.Prg: 43999, tot. athletes: 1
-- Tot. progr. duration: 100 (sec), Heat durations: [10072] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:44:35 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:44' WHERE id = 43999;

-- Event #85, M.Prg: 44000, tot. athletes: 1
-- Tot. progr. duration: 125 (sec), Heat durations: [12513] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:46:15 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:46' WHERE id = 44000;

-- Event #86, M.Prg: 44001, tot. athletes: 1
-- Tot. progr. duration: 105 (sec), Heat durations: [10508] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:48:20 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:48' WHERE id = 44001;

-- Event #87, M.Prg: 44002, tot. athletes: 1
-- Tot. progr. duration: 824 (sec), Heat durations: [82484] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 14:50:05 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 14:50' WHERE id = 44002;

-- Event #88, M.Prg: 44003, tot. athletes: 1
-- Tot. progr. duration: 761 (sec), Heat durations: [76143] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 15:03:49 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 15:03' WHERE id = 44003;

-- Event #89, M.Prg: 44004, tot. athletes: 1
-- Tot. progr. duration: 631 (sec), Heat durations: [63115] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 15:16:30 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 15:16' WHERE id = 44004;

-- Event #90, M.Prg: 44005, tot. athletes: 1
-- Tot. progr. duration: 731 (sec), Heat durations: [73179] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 15:27:01 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 15:27' WHERE id = 44005;

-- Event #91, M.Prg: 44006, tot. athletes: 1
-- Tot. progr. duration: 720 (sec), Heat durations: [72035] (hds)
-- Session begin time: 2016-03-13 08:30:00 +0100, Computed begin time: 2016-03-13 15:39:12 +0100
UPDATE meeting_programs SET begin_time = '2016-03-13 15:39' WHERE id = 44006;


-- Last completed phase code: 30
