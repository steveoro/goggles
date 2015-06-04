-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

--
-- Aggiunta dati FIN 14/15 per la tabella meetings
-- 
INSERT INTO meetings (id,header_date,season_id,entry_deadline,has_warm_up_pool,is_under_25_admitted,reference_phone,reference_e_mail,reference_name,notes,code,max_individual_events,max_individual_events_per_session,configuration_file,description,edition,header_year,user_id,edition_type_id,timing_type_id,individual_score_computation_type_id,relay_score_computation_type_id,meeting_score_computation_type_id,team_score_computation_type_id,lock_version,created_at,updated_at) VALUES 
(14224,'2015-05-02',142,'2015-04-20',1,1,'346 0313242','','Luca Carlassare','','mysport',2,0,'FIN04','TROFEO MY SPORT',3,'',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate());

--
-- Aggiunta dati FIN 14/15 per la tabella meeting_sessions
-- 
INSERT INTO meeting_sessions (session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(1,'2015-05-02',14224,54,'14:00:00','14:30:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-05-03',14224,54,'08:30:00','09:30:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(3,'2015-05-03',14224,54,'08:30:00','09:30:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE());

--
-- Aggiunta dati FIN 14/15 per la tabella meeting_events
-- 
INSERT INTO meeting_events (event_order,begin_time,is_out_of_race,user_id,meeting_session_id,event_type_id,heat_type_id,lock_version,created_at,updated_at) VALUES 
(1,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 1),(select t.id from event_types t where t.code = '1500SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(2,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 1),(select t.id from event_types t where t.code = '800SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(3,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 2),(select t.id from event_types t where t.code = '200DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(4,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 2),(select t.id from event_types t where t.code = '200FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(6,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 2),(select t.id from event_types t where t.code = '200RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(7,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 2),(select t.id from event_types t where t.code = '400MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(8,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 2),(select t.id from event_types t where t.code = '200SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(9,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 3),(select t.id from event_types t where t.code = '100RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(10,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 3),(select t.id from event_types t where t.code = '100FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(11,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 3),(select t.id from event_types t where t.code = '100DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(12,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 3),(select t.id from event_types t where t.code = '100SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(13,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 3),(select t.id from event_types t where t.code = '50FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(14,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 3),(select t.id from event_types t where t.code = '50DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(15,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 3),(select t.id from event_types t where t.code = '50RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(16,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14224 and t.session_order = 3),(select t.id from event_types t where t.code = '50SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE());

-- Fix by Steve: ziocan Leega!
UPDATE meetings SET header_year = '2014/2015' WHERE id = 14223;
UPDATE meetings SET header_year = '2014/2015' WHERE id = 14224;

commit;
