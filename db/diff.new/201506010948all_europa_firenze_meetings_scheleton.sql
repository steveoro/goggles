-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

--
-- Dump dei dati per la tabella swimming_pools
-- 
INSERT INTO swimming_pools (id,name,phone_number,lanes_number,address,nick_name,maps_uri,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES 
(153,'P.Costoli','055 6236027',10,'Viale Paoli','firenzecostoli','',1,1,1,1,1,1,'','','','','',2,(select t.id from cities t where t.name = 'FIRENZE'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());

--
-- Aggiunta dati FIN 14/15 per la tabella meetings
-- 
INSERT INTO meetings (id,header_date,season_id,entry_deadline,has_warm_up_pool,is_under_25_admitted,reference_phone,reference_e_mail,reference_name,notes,code,max_individual_events,max_individual_events_per_session,configuration_file,description,edition,header_year,user_id,edition_type_id,timing_type_id,individual_score_computation_type_id,relay_score_computation_type_id,meeting_score_computation_type_id,team_score_computation_type_id,lock_version,created_at,updated_at) VALUES 
(14222,'2015-05-30',142,'2015-05-26',0,1,'347 5087019','andreaprayer@tiscalinet.it','Andrea Prayer','','firenze',2,0,'FIN02','FIRENZE INTERNATIONAL MEETING',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14223,'2015-05-16',142,'2015-05-11',1,1,'347 5779700','team@europasportingclub.com','Diego Marini','','europa',2,0,'FIN04','TROFEO EUROPA SC',2,'',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate());

--
-- Aggiunta dati FIN 14/15 per la tabella meeting_sessions
-- 
INSERT INTO meeting_sessions (session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(1,'2015-05-30',14222,153,'13:30:00','14:30:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-05-31',14222,153,'08:30:00','09:30:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-05-16',14223,36,'14:00:00','15:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-05-17',14223,36,'08:30:00','09:30:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(3,'2015-05-17',14223,36,'14:00:00','15:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE());

--
-- Aggiunta dati FIN 14/15 per la tabella meeting_events
-- 
INSERT INTO meeting_events (event_order,begin_time,is_out_of_race,user_id,meeting_session_id,event_type_id,heat_type_id,lock_version,created_at,updated_at) VALUES 
(1,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14222 and t.session_order = 1),(select t.id from event_types t where t.code = '200SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(2,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14222 and t.session_order = 1),(select t.id from event_types t where t.code = '200DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(3,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14222 and t.session_order = 1),(select t.id from event_types t where t.code = '100FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(4,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14222 and t.session_order = 1),(select t.id from event_types t where t.code = '50RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(6,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14222 and t.session_order = 2),(select t.id from event_types t where t.code = '200RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(7,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14222 and t.session_order = 2),(select t.id from event_types t where t.code = '200FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(8,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14222 and t.session_order = 2),(select t.id from event_types t where t.code = '200MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(9,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14222 and t.session_order = 2),(select t.id from event_types t where t.code = '50DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(10,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14222 and t.session_order = 2),(select t.id from event_types t where t.code = '50FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(1,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14223 and t.session_order = 1),(select t.id from event_types t where t.code = '100DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(2,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14223 and t.session_order = 1),(select t.id from event_types t where t.code = '400SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(3,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14223 and t.session_order = 1),(select t.id from event_types t where t.code = '100RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14223 and t.session_order = 2),(select t.id from event_types t where t.code = '200SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(6,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14223 and t.session_order = 2),(select t.id from event_types t where t.code = '200MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(7,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14223 and t.session_order = 2),(select t.id from event_types t where t.code = '100SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(8,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14223 and t.session_order = 2),(select t.id from event_types t where t.code = '100FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(9,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14223 and t.session_order = 2),(select t.id from event_types t where t.code = '200DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(10,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14223 and t.session_order = 3),(select t.id from event_types t where t.code = '50DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(11,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14223 and t.session_order = 3),(select t.id from event_types t where t.code = '50FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(12,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14223 and t.session_order = 3),(select t.id from event_types t where t.code = '50RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(13,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14223 and t.session_order = 3),(select t.id from event_types t where t.code = '50SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE());

--
-- Aggiunta dati FIN 14/15 per la tabella meeting_events
-- 
INSERT INTO meeting_events (event_order,begin_time,is_out_of_race,user_id,meeting_session_id,event_type_id,heat_type_id,lock_version,created_at,updated_at) VALUES 
(12,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14222 and t.session_order = 1),(select t.id from event_types t where t.code = 'M4X50MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(4,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14223 and t.session_order = 1),(select t.id from event_types t where t.code = 'S4X100SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(14,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14223 and t.session_order = 3),(select t.id from event_types t where t.code = 'S4X50MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE());

--
-- Fix Piacenza meeting data
--
update meetings m
set m.description = 'TROFEO MASTER VITTORINO DA FELTRE',
	m.edition = 1,
    m.reference_name = 'Sandro Rizzoli',
	m.reference_phone = '348 2560152',
	m.reference_e_mail = 'sandrorizzoli@gmail.com'
where m.id = 14210;

commit;