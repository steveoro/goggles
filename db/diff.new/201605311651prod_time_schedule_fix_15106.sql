-- Leega
-- 31/05/2016
-- Fix wrong time schedule for csi prova 6
update meeting_sessions set warm_up_time = '10:00:00', begin_time = '10:30:00', notes = '', day_part_type_id = 1 where id > 0 and meeting_id = 15106 and session_order = 1;