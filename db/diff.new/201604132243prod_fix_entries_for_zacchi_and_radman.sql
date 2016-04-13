-- Leega
-- 13/04/2016
-- Fix entries

-- Remove RADMAN
delete from meeting_entries where swimmer_id = 24858;

-- Add ZACCHI
INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (5833, '2016-04-13 22:22:18', '2016-04-13 22:22:18', NULL, NULL, NULL, NULL, 48876, 108, 1, 1589, 32771, NULL, 1, 1, 22, 0, 0);

INSERT INTO `meeting_entries` (`id`, `created_at`, `updated_at`, `start_list_number`, `lane_number`, `heat_number`, `heat_arrival_order`, `meeting_program_id`, `swimmer_id`, `team_id`, `team_affiliation_id`, `badge_id`, `entry_time_type_id`, `user_id`, `minutes`, `seconds`, `hundreds`, `is_no_time`)
  VALUES (5834, '2016-04-13 22:22:18', '2016-04-13 22:22:18', NULL, NULL, NULL, NULL, 48866, 108, 1, 1589, 32771, NULL, 1, 0, 30, 0, 0);
