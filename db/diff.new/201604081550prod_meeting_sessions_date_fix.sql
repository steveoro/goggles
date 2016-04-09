-- Leega
-- 08/04/216
-- Fix first meeting_sessions not aligned with meeting header dates

update meeting_sessions
set scheduled_date = (select m.header_date from meetings m where m.id = meeting_id)
where id > 0
	and session_order = 1
	and scheduled_date <> (select m.header_date from meetings m where m.id = meeting_id);