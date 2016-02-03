-- Leega
-- 03/02/2016
-- Fix for MIRRI start list entry

update meeting_entries set meeting_program_id = 39413 where meeting_program_id = 39466;
delete from meeting_programs where id = 39466;
delete from meeting_events where id = 4625;

/*
select mp.meeting_event_id, mp.id, mp.category_type_id
from meeting_events me
	join meeting_sessions ms on ms.id = me.meeting_session_id
	join meeting_programs mp on mp.meeting_event_id = me.id
	join gender_types gt on gt.id = mp.gender_type_id
where ms.meeting_id = 15102 
	and me.event_order in (1, 6)
	and gt.code = 'M';
*/