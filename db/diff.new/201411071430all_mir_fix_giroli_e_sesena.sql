-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

update meeting_individual_results mir set mir.meeting_program_id = (select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50SL' and ms.meeting_id = 11202 and gt.code = 'F' and ct.code = 'M35') where mir.id = 102754;
update meeting_individual_results mir set mir.meeting_program_id = (select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 11202 and gt.code = 'F' and ct.code = 'M35') where mir.id = 102788;
update meeting_individual_results mir set mir.meeting_program_id = (select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50SL' and ms.meeting_id = 11207 and gt.code = 'F' and ct.code = 'M25') where mir.id = 102806;
update meeting_individual_results mir set mir.meeting_program_id = (select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '100MI' and ms.meeting_id = 11207 and gt.code = 'F' and ct.code = 'M25') where mir.id = 102807;
update meeting_individual_results mir set mir.meeting_program_id = (select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50SL' and ms.meeting_id = 11212 and gt.code = 'F' and ct.code = 'M25') where mir.id = 103126;

COMMIT;
-- Fine script