-- Leega
-- Cavallo Montreal fix for mir without mp
-- Begin script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

update meeting_individual_results mir set mir.meeting_program_id = 7067 where mir.meeting_program_id is null and mir.id = 110909;  -- 200FA
update meeting_individual_results mir set mir.meeting_program_id = 7068 where mir.meeting_program_id is null and mir.id = 110910;  -- 200MI
update meeting_individual_results mir set mir.meeting_program_id = 7069 where mir.meeting_program_id is null and mir.id = 110911;  -- 100FA

COMMIT;
-- End script

/*
select *
from meeting_individual_results mir
where mir.meeting_program_id is null;

select mp.id, et.code
from meeting_programs mp
	join meeting_events me1 on me1.id = mp.meeting_event_id
	join event_types et on et.id = me1.event_type_id
where mp.meeting_event_id in (
	select me.id
	from meeting_events me
	where me.meeting_session_id in (
		select ms.id
		from meeting_sessions ms
		where ms.meeting_id = 13401
	)
);
*/