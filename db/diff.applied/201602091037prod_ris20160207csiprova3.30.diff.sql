-- *** SQL Diff file for ris20160207csiprova3.csv ***
-- Timestamp: 201602091037
INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (4952, '2016-02-09 10:44:31', '2016-02-09 10:44:31', NULL, NULL, NULL, NULL, 39417, 1030, 9, 1583, 32543, NULL, 1, 0, 0, 0, 1);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273244, 2, 1, 0, 0, 0.0, 95.0, 0, 59, 30, 39400, 1308, 32, 32713, 1, '2016-02-09 10:44:32', '2016-02-09 10:44:32', NULL, 0.0, 0.0, 14.0, 1590, 0, 0);

INSERT INTO `meeting_individual_results` (`id`, `rank`, `is_play_off`, `is_out_of_race`, `is_disqualified`, `standard_points`, `meeting_individual_points`, `minutes`, `seconds`, `hundreds`, `meeting_program_id`, `swimmer_id`, `team_id`, `badge_id`, `user_id`, `created_at`, `updated_at`, `disqualification_code_type_id`, `goggle_cup_points`, `reaction_time`, `team_points`, `team_affiliation_id`, `is_personal_best`, `is_season_type_best`)
  VALUES (273245, 6, 1, 0, 0, 0.0, 75.0, 1, 12, 80, 39417, 1030, 9, 32543, 1, '2016-02-09 10:44:33', '2016-02-09 10:44:33', NULL, 0.0, 0.0, 6.0, 1583, 0, 0);


-- Meeting 15102
-- 'Results acquired' flag setting:
UPDATE meetings SET are_results_acquired = '1' WHERE id = 15102;


-- Meeting 15102
-- 'has_start_list' flag setting:
UPDATE meetings SET has_start_list = '1' WHERE id = 15102;

-- --- BeginTimeCalculator: compute_for_all( 15102 )
-- ----------------------------------------------------
-- Using RESULTS to compute heat length.

-- Event #1, M.Prg: 39400, tot. athletes: 4
-- Tot. progr. duration: 128 (sec), Heat durations: [12870] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 14:52:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 14:52' WHERE id = 39400;

-- Event #1, M.Prg: 39441, tot. athletes: 5
-- Tot. progr. duration: 136 (sec), Heat durations: [13640] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 14:54:08 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 14:54' WHERE id = 39441;

-- Event #1, M.Prg: 39471, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 14:56:24 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 14:56' WHERE id = 39471;

-- Event #2, M.Prg: 39469, tot. athletes: 1
-- Tot. progr. duration: 101 (sec), Heat durations: [10140] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 14:56:24 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 14:56' WHERE id = 39469;

-- Event #2, M.Prg: 39472, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 14:58:05 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 14:58' WHERE id = 39472;

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

-- Event #3, M.Prg: 39473, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:06:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:06' WHERE id = 39473;

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

-- Event #6, M.Prg: 39474, tot. athletes: 6
-- Tot. progr. duration: 108 (sec), Heat durations: [10850] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:18:33 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:18' WHERE id = 39474;

-- Event #6, M.Prg: 39442, tot. athletes: 3
-- Tot. progr. duration: 224 (sec), Heat durations: [22440] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:20:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:20' WHERE id = 39442;

-- Event #6, M.Prg: 39475, tot. athletes: 6
-- Tot. progr. duration: 101 (sec), Heat durations: [10140] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:24:05 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:24' WHERE id = 39475;

-- Event #6, M.Prg: 39405, tot. athletes: 2
-- Tot. progr. duration: 218 (sec), Heat durations: [21810] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:25:46 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:25' WHERE id = 39405;

-- Event #7, M.Prg: 39452, tot. athletes: 6
-- Tot. progr. duration: 103 (sec), Heat durations: [10380] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:29:24 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:29' WHERE id = 39452;

-- Event #7, M.Prg: 39406, tot. athletes: 3
-- Tot. progr. duration: 97 (sec), Heat durations: [9730] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:31:07 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:31' WHERE id = 39406;

-- Event #8, M.Prg: 39407, tot. athletes: 13
-- Tot. progr. duration: 356 (sec), Heat durations: [17030, 12660, 6000] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:32:44 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:32' WHERE id = 39407;

-- Event #8, M.Prg: 39455, tot. athletes: 4
-- Tot. progr. duration: 153 (sec), Heat durations: [15370] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:38:40 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:38' WHERE id = 39455;

-- Event #9, M.Prg: 39408, tot. athletes: 4
-- Tot. progr. duration: 122 (sec), Heat durations: [12200] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:41:13 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:41' WHERE id = 39408;

-- Event #9, M.Prg: 39420, tot. athletes: 5
-- Tot. progr. duration: 106 (sec), Heat durations: [10650] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:43:15 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:43' WHERE id = 39420;

-- Event #10, M.Prg: 39409, tot. athletes: 6
-- Tot. progr. duration: 275 (sec), Heat durations: [27560] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:45:01 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:45' WHERE id = 39409;

-- Event #10, M.Prg: 39437, tot. athletes: 2
-- Tot. progr. duration: 256 (sec), Heat durations: [25660] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:49:36 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:49' WHERE id = 39437;

-- Event #11, M.Prg: 39410, tot. athletes: 2
-- Tot. progr. duration: 118 (sec), Heat durations: [11800] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:53:52 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:53' WHERE id = 39410;

-- Event #11, M.Prg: 39413, tot. athletes: 4
-- Tot. progr. duration: 103 (sec), Heat durations: [10310] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:55:50 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:55' WHERE id = 39413;

-- Event #12, M.Prg: 39411, tot. athletes: 3
-- Tot. progr. duration: 295 (sec), Heat durations: [29590] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 15:57:33 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 15:57' WHERE id = 39411;

-- Event #12, M.Prg: 39435, tot. athletes: 3
-- Tot. progr. duration: 270 (sec), Heat durations: [27040] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:02:28 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:02' WHERE id = 39435;

-- Event #13, M.Prg: 39444, tot. athletes: 3
-- Tot. progr. duration: 106 (sec), Heat durations: [10640] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:06:58 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:06' WHERE id = 39444;

-- Event #13, M.Prg: 39412, tot. athletes: 3
-- Tot. progr. duration: 100 (sec), Heat durations: [10020] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:08:44 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:08' WHERE id = 39412;

-- Event #14, M.Prg: 39414, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:10:24 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:10' WHERE id = 39414;

-- Event #14, M.Prg: 39470, tot. athletes: 1
-- Tot. progr. duration: 119 (sec), Heat durations: [11970] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:10:24 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:10' WHERE id = 39470;

-- Event #15, M.Prg: 39467, tot. athletes: 1
-- Tot. progr. duration: 171 (sec), Heat durations: [17100] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:12:23 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:12' WHERE id = 39467;

-- Event #15, M.Prg: 39415, tot. athletes: 3
-- Tot. progr. duration: 147 (sec), Heat durations: [14740] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:15:14 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:15' WHERE id = 39415;

-- Event #16, M.Prg: 39418, tot. athletes: 4
-- Tot. progr. duration: 108 (sec), Heat durations: [10860] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:17:41 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:17' WHERE id = 39418;

-- Event #16, M.Prg: 39416, tot. athletes: 5
-- Tot. progr. duration: 101 (sec), Heat durations: [10110] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:19:29 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:19' WHERE id = 39416;

-- Event #17, M.Prg: 39417, tot. athletes: 8
-- Tot. progr. duration: 261 (sec), Heat durations: [13600, 12570] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:21:10 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:21' WHERE id = 39417;

-- Event #17, M.Prg: 39453, tot. athletes: 4
-- Tot. progr. duration: 163 (sec), Heat durations: [16360] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:25:31 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:25' WHERE id = 39453;

-- Event #18, M.Prg: 39419, tot. athletes: 6
-- Tot. progr. duration: 99 (sec), Heat durations: [9900] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:28:14 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:28' WHERE id = 39419;

-- Event #18, M.Prg: 39439, tot. athletes: 7
-- Tot. progr. duration: 199 (sec), Heat durations: [10520, 9380] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:29:53 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:29' WHERE id = 39439;

-- Event #19, M.Prg: 39457, tot. athletes: 2
-- Tot. progr. duration: 116 (sec), Heat durations: [11600] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:33:12 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:33' WHERE id = 39457;

-- Event #19, M.Prg: 39421, tot. athletes: 4
-- Tot. progr. duration: 103 (sec), Heat durations: [10360] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:35:08 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:35' WHERE id = 39421;

-- Event #20, M.Prg: 39461, tot. athletes: 3
-- Tot. progr. duration: 129 (sec), Heat durations: [12990] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:36:51 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:36' WHERE id = 39461;

-- Event #20, M.Prg: 39422, tot. athletes: 5
-- Tot. progr. duration: 109 (sec), Heat durations: [10930] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:39:00 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:39' WHERE id = 39422;

-- Event #21, M.Prg: 39423, tot. athletes: 3
-- Tot. progr. duration: 103 (sec), Heat durations: [10340] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:40:49 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:40' WHERE id = 39423;

-- Event #21, M.Prg: 39436, tot. athletes: 4
-- Tot. progr. duration: 102 (sec), Heat durations: [10220] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:42:32 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:42' WHERE id = 39436;

-- Event #22, M.Prg: 39448, tot. athletes: 2
-- Tot. progr. duration: 98 (sec), Heat durations: [9820] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:44:14 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:44' WHERE id = 39448;

-- Event #22, M.Prg: 39424, tot. athletes: 9
-- Tot. progr. duration: 190 (sec), Heat durations: [10060, 8970] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:45:52 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:45' WHERE id = 39424;

-- Event #23, M.Prg: 39426, tot. athletes: 5
-- Tot. progr. duration: 101 (sec), Heat durations: [10160] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:49:02 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:49' WHERE id = 39426;

-- Event #23, M.Prg: 39450, tot. athletes: 3
-- Tot. progr. duration: 117 (sec), Heat durations: [11730] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:50:43 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:50' WHERE id = 39450;

-- Event #24, M.Prg: 39462, tot. athletes: 2
-- Tot. progr. duration: 262 (sec), Heat durations: [26210] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:52:40 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:52' WHERE id = 39462;

-- Event #24, M.Prg: 39427, tot. athletes: 5
-- Tot. progr. duration: 259 (sec), Heat durations: [25990] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 16:57:02 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 16:57' WHERE id = 39427;

-- Event #25, M.Prg: 39428, tot. athletes: 3
-- Tot. progr. duration: 245 (sec), Heat durations: [24540] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:01:21 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:01' WHERE id = 39428;

-- Event #26, M.Prg: 39429, tot. athletes: 5
-- Tot. progr. duration: 239 (sec), Heat durations: [23910] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:05:26 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:05' WHERE id = 39429;

-- Event #26, M.Prg: 39443, tot. athletes: 5
-- Tot. progr. duration: 256 (sec), Heat durations: [25630] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:09:25 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:09' WHERE id = 39443;

-- Event #27, M.Prg: 39449, tot. athletes: 5
-- Tot. progr. duration: 137 (sec), Heat durations: [13740] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:13:41 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:13' WHERE id = 39449;

-- Event #27, M.Prg: 39430, tot. athletes: 8
-- Tot. progr. duration: 283 (sec), Heat durations: [15190, 13190] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:15:58 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:15' WHERE id = 39430;

-- Event #28, M.Prg: 39431, tot. athletes: 4
-- Tot. progr. duration: 256 (sec), Heat durations: [25620] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:20:41 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:20' WHERE id = 39431;

-- Event #28, M.Prg: 39445, tot. athletes: 6
-- Tot. progr. duration: 270 (sec), Heat durations: [27070] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:24:57 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:24' WHERE id = 39445;

-- Event #29, M.Prg: 39464, tot. athletes: 4
-- Tot. progr. duration: 125 (sec), Heat durations: [12570] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:29:27 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:29' WHERE id = 39464;

-- Event #29, M.Prg: 39432, tot. athletes: 8
-- Tot. progr. duration: 223 (sec), Heat durations: [12120, 10270] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:31:32 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:31' WHERE id = 39432;

-- Event #30, M.Prg: 39434, tot. athletes: 9
-- Tot. progr. duration: 279 (sec), Heat durations: [15090, 12810] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:35:15 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:35' WHERE id = 39434;

-- Event #30, M.Prg: 39456, tot. athletes: 2
-- Tot. progr. duration: 142 (sec), Heat durations: [14280] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:39:54 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:39' WHERE id = 39456;

-- Event #31, M.Prg: 39446, tot. athletes: 3
-- Tot. progr. duration: 204 (sec), Heat durations: [20460] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:42:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:42' WHERE id = 39446;

-- Event #31, M.Prg: 39438, tot. athletes: 5
-- Tot. progr. duration: 276 (sec), Heat durations: [27690] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:45:40 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:45' WHERE id = 39438;

-- Event #32, M.Prg: 39465, tot. athletes: 5
-- Tot. progr. duration: 103 (sec), Heat durations: [10340] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:50:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:50' WHERE id = 39465;

-- Event #32, M.Prg: 39440, tot. athletes: 3
-- Tot. progr. duration: 113 (sec), Heat durations: [11320] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:51:59 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:51' WHERE id = 39440;

-- Event #33, M.Prg: 39447, tot. athletes: 1
-- Tot. progr. duration: 91 (sec), Heat durations: [9100] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:53:52 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:53' WHERE id = 39447;

-- Event #33, M.Prg: 39454, tot. athletes: 6
-- Tot. progr. duration: 103 (sec), Heat durations: [10310] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:55:23 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:55' WHERE id = 39454;

-- Event #34, M.Prg: 39451, tot. athletes: 2
-- Tot. progr. duration: 105 (sec), Heat durations: [10530] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:57:06 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:57' WHERE id = 39451;

-- Event #35, M.Prg: 39463, tot. athletes: 1
-- Tot. progr. duration: 205 (sec), Heat durations: [20520] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 17:58:51 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 17:58' WHERE id = 39463;

-- Event #35, M.Prg: 39458, tot. athletes: 0
-- Tot. progr. duration: 0 (sec), Heat durations: [] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:02:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:02' WHERE id = 39458;

-- Event #36, M.Prg: 39459, tot. athletes: 10
-- Tot. progr. duration: 306 (sec), Heat durations: [16190, 14460] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:02:16 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:02' WHERE id = 39459;

-- Event #36, M.Prg: 39460, tot. athletes: 4
-- Tot. progr. duration: 138 (sec), Heat durations: [13850] (hds)
-- Session begin time: 2000-01-01 14:50:00 UTC, Computed begin time: 2000-01-01 18:07:22 UTC
UPDATE meeting_programs SET begin_time = '2000-01-01 18:07' WHERE id = 39460;


-- Last completed phase code: 30
