-- Leega
-- 27/05/2016
-- Remove duplicated Cavallo entries for Montreal

-- Cavallo -> 1025
-- Montreal -> 13401

update meetings set description = 'MONDIALI MASTER FINA' where id > 0 and description = 'MONDIALI MASTER';

delete from meeting_individual_results where id in (110908, 110909, 110910, 110911);

/*
select * from meeting_sessions ms where ms.meeting_id = 13401;
select * 
from meeting_events me 
	join meeting_sessions ms on ms.id = me.meeting_session_id
where ms.meeting_id = 13401;
select * 
from meeting_programs mp
	join meeting_events me on me.id = mp.meeting_event_id
	join meeting_sessions ms on ms.id = me.meeting_session_id
where ms.meeting_id = 13401;
select * 
from meeting_individual_results mir
	join meeting_programs mp on mp.id = mir.meeting_program_id
	join meeting_events me on me.id = mp.meeting_event_id
	join meeting_sessions ms on ms.id = me.meeting_session_id
where ms.meeting_id = 13401;
select *
from badges b where b.season_id = 134;


select * from badges where id = 5040;
select * from meeting_individual_results mir where mir.badge_id = 5040;
select * from meeting_individual_results mir where mir.badge_id = 8419;

select * 
from passages p
	join meeting_individual_results mir on mir.id = p.meeting_individual_result_id
where mir.badge_id = 8419;
*/