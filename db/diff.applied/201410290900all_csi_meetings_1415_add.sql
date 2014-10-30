-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

--
-- Dump dei dati per la tabella meetings
-- 
INSERT INTO meetings (id,header_date,season_id,has_warm_up_pool,is_under_25_admitted,code,has_invitation,has_start_list,are_results_acquired,max_individual_events,max_individual_events_per_session,configuration_file,description,edition,header_year,user_id,edition_type_id,timing_type_id,individual_score_computation_type_id,relay_score_computation_type_id,meeting_score_computation_type_id,team_score_computation_type_id,lock_version,created_at,updated_at) VALUES 
(14101,'2014-11-30',141,0,1,'csiprova1',0,0,0,2,0,'0','1A PROVA REGIONALE CSI',0,'2014/2015',2,(select t.id from edition_types t where t.code = 'S'),(select t.id from timing_types t where t.code = 'S'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14102,'2015-02-01',141,0,1,'csiprova2',0,0,0,2,0,'0','2A PROVA REGIONALE CSI',0,'2014/2015',2,(select t.id from edition_types t where t.code = 'S'),(select t.id from timing_types t where t.code = 'S'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14103,'2015-02-22',141,0,1,'csiprova3',0,0,0,2,0,'0','3A PROVA REGIONALE CSI',0,'2014/2015',2,(select t.id from edition_types t where t.code = 'S'),(select t.id from timing_types t where t.code = 'S'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14104,'2015-03-29',141,0,1,'csiprova4',0,0,0,2,0,'0','4A PROVA REGIONALE CSI',0,'2014/2015',2,(select t.id from edition_types t where t.code = 'S'),(select t.id from timing_types t where t.code = 'S'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14105,'2015-04-26',141,0,1,'csiprova5',0,0,0,2,0,'0','5A PROVA REGIONALE CSI',0,'2014/2015',2,(select t.id from edition_types t where t.code = 'S'),(select t.id from timing_types t where t.code = 'S'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14106,'2015-05-24',141,0,1,'csiprova6',0,0,0,2,0,'0','6A PROVA REGIONALE CSI',0,'2014/2015',2,(select t.id from edition_types t where t.code = 'S'),(select t.id from timing_types t where t.code = 'S'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate());

--
-- Dump dei dati per la tabella meeting_sessions
-- 
INSERT INTO meeting_sessions (meeting_id,session_order,scheduled_date,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(14101,1,'2014-11-30',3,'14:15:00','15:00:00','0','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(14102,1,'2015-02-01',20,null,null,'0','FINALI',2,(select t.id from day_part_types t where t.code = '0'),0,CURDATE(),CURDATE()),
(14103,1,'2015-02-22',33,null,null,'0','FINALI',2,(select t.id from day_part_types t where t.code = '0'),0,CURDATE(),CURDATE()),
(14104,1,'2015-03-29',6,null,null,'0','FINALI',2,(select t.id from day_part_types t where t.code = '0'),0,CURDATE(),CURDATE()),
(14105,1,'2015-04-19',2,null,null,'0','FINALI',2,(select t.id from day_part_types t where t.code = '0'),0,CURDATE(),CURDATE()),
(14106,1,'2015-05-24',32,null,null,'0','FINALI',2,(select t.id from day_part_types t where t.code = '0'),0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella meeting_events
-- 
INSERT INTO meeting_events (event_order,begin_time,is_out_of_race,user_id,meeting_session_id,event_type_id,heat_type_id,lock_version,created_at,updated_at) VALUES 
(1,'15:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14101 and t.session_order = 1),(select t.id from event_types t where t.code = '400SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(2,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14101 and t.session_order = 1),(select t.id from event_types t where t.code = '100RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(3,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14101 and t.session_order = 1),(select t.id from event_types t where t.code = '100MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(4,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14101 and t.session_order = 1),(select t.id from event_types t where t.code = '50FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(1,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14102 and t.session_order = 1),(select t.id from event_types t where t.code = '100SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(2,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14102 and t.session_order = 1),(select t.id from event_types t where t.code = '50DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(3,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14102 and t.session_order = 1),(select t.id from event_types t where t.code = '200SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(4,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14102 and t.session_order = 1),(select t.id from event_types t where t.code = '100MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(1,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14103 and t.session_order = 1),(select t.id from event_types t where t.code = '50FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(2,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14103 and t.session_order = 1),(select t.id from event_types t where t.code = '100DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(3,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14103 and t.session_order = 1),(select t.id from event_types t where t.code = '50RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(4,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14103 and t.session_order = 1),(select t.id from event_types t where t.code = '200MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(1,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14104 and t.session_order = 1),(select t.id from event_types t where t.code = '200SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(2,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14104 and t.session_order = 1),(select t.id from event_types t where t.code = '50DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(3,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14104 and t.session_order = 1),(select t.id from event_types t where t.code = '200MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(4,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14104 and t.session_order = 1),(select t.id from event_types t where t.code = '100SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(1,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14105 and t.session_order = 1),(select t.id from event_types t where t.code = '400SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(2,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14105 and t.session_order = 1),(select t.id from event_types t where t.code = '100DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(3,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14105 and t.session_order = 1),(select t.id from event_types t where t.code = '50SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(4,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14105 and t.session_order = 1),(select t.id from event_types t where t.code = '100RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(1,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14106 and t.session_order = 1),(select t.id from event_types t where t.code = '800SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(2,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14106 and t.session_order = 1),(select t.id from event_types t where t.code = '100MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(3,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14106 and t.session_order = 1),(select t.id from event_types t where t.code = '50RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(4,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14106 and t.session_order = 1),(select t.id from event_types t where t.code = '100FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella meeting_events (relays)
-- 
INSERT INTO meeting_events (event_order,begin_time,is_out_of_race,user_id,meeting_session_id,event_type_id,heat_type_id,lock_version,created_at,updated_at) VALUES 
(5,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14101 and t.session_order = 1),(select t.id from event_types t where t.code = 'S4X50MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14102 and t.session_order = 1),(select t.id from event_types t where t.code = 'S8X25SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14103 and t.session_order = 1),(select t.id from event_types t where t.code = 'M4X50MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14104 and t.session_order = 1),(select t.id from event_types t where t.code = 'M4X50SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 14105 and t.session_order = 1),(select t.id from event_types t where t.code = 'S4X50SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE());

COMMIT;
-- Fine script
