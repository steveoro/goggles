-- Leega
-- 08/05/2016
-- Messina Ulysse Master Speed meetig creation

-- Update swimming pool data
UPDATE swimming_pools set name = 'Complesso Sportivo Cappuccini', nick_name = 'messinacappuccini50', address = 'Via Torrente Trapani' WHERE id = 133;

--
-- Aggiunta dati FIN 15/16 per la tabella meetings
-- 
INSERT INTO meetings (id,header_date,season_id,entry_deadline,has_warm_up_pool,is_under_25_admitted,reference_phone,reference_e_mail,reference_name,notes,code,max_individual_events,max_individual_events_per_session,configuration_file,description,edition,header_year,user_id,edition_type_id,timing_type_id,individual_score_computation_type_id,relay_score_computation_type_id,meeting_score_computation_type_id,team_score_computation_type_id,lock_version,created_at,updated_at) VALUES 
(15353,'2016-05-08',152,'0216-04-28',0,1,'','','','','messinaulyssemasterspeed',2,0,'FIN02','ULYSSE MASTER SPEED',5,'2016',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate());

--
-- Aggiunta dati FIN 15/16 per la tabella meeting_sessions
-- 
INSERT INTO meeting_sessions (id,session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(1265,1,'2016-05-08',15353,133,'08:15:00','09:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1266,2,'2016-05-08',15353,133,'14:00:00','14:45:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE());

--
-- Aggiunta dati FIN 15/16 per la tabella meeting_events
-- 
INSERT INTO meeting_events (id,event_order,begin_time,is_out_of_race,user_id,meeting_session_id,event_type_id,heat_type_id,lock_version,created_at,updated_at) VALUES 
(5464,1,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15353 and t.session_order = 1),(select t.id from event_types t where t.code = '50SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5465,2,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15353 and t.session_order = 1),(select t.id from event_types t where t.code = '100DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5466,3,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15353 and t.session_order = 1),(select t.id from event_types t where t.code = '200SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5467,4,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15353 and t.session_order = 1),(select t.id from event_types t where t.code = '50RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5468,5,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15353 and t.session_order = 1),(select t.id from event_types t where t.code = '100FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5469,6,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15353 and t.session_order = 2),(select t.id from event_types t where t.code = '400SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5470,7,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15353 and t.session_order = 2),(select t.id from event_types t where t.code = '50FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5471,8,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15353 and t.session_order = 2),(select t.id from event_types t where t.code = '100RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5472,9,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15353 and t.session_order = 3),(select t.id from event_types t where t.code = '50DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5473,10,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15353 and t.session_order = 2),(select t.id from event_types t where t.code = '100SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE());

--
-- Aggiunta dati FIN 15/16 per la tabella meeting_events (relays)
-- 
INSERT INTO meeting_events (id,event_order,begin_time,is_out_of_race,user_id,meeting_session_id,event_type_id,heat_type_id,lock_version,created_at,updated_at) VALUES 
(5474,11,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15353 and t.session_order = 2),(select t.id from event_types t where t.code = 'S4X100SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE());
