-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;
SET AUTOCOMMIT=0;
START TRANSACTION;

-- Fix 2a prova CSI event types
update meeting_events set event_type_id = (select et.id from event_types et where et.code = '50FA') where id = 1575;

-- Fix 3a prova CSI swimming pool
update meeting_sessions set swimming_pool_id = 8 where id = 614;

-- Fix meeting programs
update meeting_programs set meeting_event_id = 
(
	select me.id
	from meeting_events me
		join meeting_sessions ms on ms.id = me.meeting_session_id
		join event_types et on et.id = me.event_type_id
	where ms.meeting_id = 14102
		and et.code = '50FA'
)
where meeting_event_id is null;

-- Fix meeting individual results
update meeting_individual_results mir
set mir.meeting_program_id = (
	select mp.id
	from meeting_programs mp
		join meeting_events me on me.id = mp.meeting_event_id
		join meeting_sessions ms on ms.id = me.meeting_session_id
		join event_types et on et.id = me.event_type_id
	where ms.meeting_id = 14102
		and et.code = '50FA'
		and mp.gender_type_id = (select s.gender_type_id from swimmers s where s.id = mir.swimmer_id)
		and mp.category_type_id = (select b.category_type_id from badges b where b.id = mir.badge_id)
)
where mir.meeting_program_id is null;

COMMIT;
-- Fine script
