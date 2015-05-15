-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

--
-- Aggiunta sessione pomeridiana 6a prova csi
-- 
INSERT INTO meeting_sessions (session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(2,'2015-05-24',14106,32,'14:30:00','15:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE());

--
-- Aggiunta 50SL fuori gara 6a prova csi
-- 
INSERT INTO meeting_events (event_order,begin_time,is_out_of_race,user_id,meeting_session_id,event_type_id,heat_type_id,lock_version,created_at,updated_at) VALUES 
(5,'00:00:00',1,2,(select t.id from meeting_sessions t where t.meeting_id = 14106 and t.session_order = 2),(select t.id from event_types t where t.code = '50SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE());

--
-- Sistemazione eventi 6a prova csi
--
update meeting_events me
set me.meeting_session_id = (select t.id from meeting_sessions t where t.meeting_id = 14106 and t.session_order = 2)
where me.meeting_session_id = (select t.id from meeting_sessions t where t.meeting_id = 14106 and t.session_order = 1) and me.event_order > 1;

commit;