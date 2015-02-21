
-- Fix for wrong swimmer name:
UPDATE swimmers SET `last_name` = 'CAMMINATA', `first_name` = 'DESY' WHERE id = 4863;


-- Clear start_list_number for wrong entries in Meeting 14102:
UPDATE meeting_entries SET start_list_number = NULL WHERE id >= 1478 AND id <= 1616;
-- (139 rows affected)


-- Remove all wrong badges in Meeting 14103:
DELETE FROM badges WHERE id >= 15485 AND id <= 15512;
-- (28 rows affected.)


-- Remove all wrong entries in Meeting 14103:
DELETE FROM meeting_entries
WHERE meeting_program_id IN (
  SELECT meeting_programs.id
    FROM meeting_programs
    INNER JOIN meeting_events ON meeting_programs.meeting_event_id = meeting_events.id 
    INNER JOIN meeting_sessions ON meeting_events.meeting_session_id = meeting_sessions.id 
    WHERE meeting_sessions.meeting_id = 14103
);
-- (395 rows affected.)


-- Remove wrong programs in Meeting 14103:
DELETE FROM meeting_programs
WHERE meeting_event_id IN (1576, 1577, 1578, 1579);
-- (8 rows affected.)
