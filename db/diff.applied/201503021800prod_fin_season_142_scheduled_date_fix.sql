
-- Fix for scheduled_date, season 142, 'verona'
UPDATE meeting_sessions SET scheduled_date = '2014-12-07' WHERE meeting_id = 14221;

-- Fix for scheduled_date, season 142, 'brescia', meeting 14217, sessions 662-663 & 664
UPDATE meeting_sessions SET scheduled_date = '2015-03-07' WHERE id = 662;
UPDATE meeting_sessions SET scheduled_date = '2015-03-07' WHERE id = 663;
UPDATE meeting_sessions SET scheduled_date = '2015-03-08' WHERE id = 664;

-- Fix for scheduled_date, season 142, 'bologna'
UPDATE meeting_sessions SET scheduled_date = '2015-03-29' WHERE meeting_id = 14208;
