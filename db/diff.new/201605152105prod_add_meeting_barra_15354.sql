-- Leega
-- 15/05/2016
-- Centro Ester Meeting

--
-- Dump dei dati per la tabella swimming_pools
-- 
INSERT INTO swimming_pools (id,name,phone_number,lanes_number,address,nick_name,maps_uri,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES 
(195,'Centro Ester','',6,'Via Giambattista Vela 91','barracentroester25','',0,0,0,0,0,0,'','','','','',2,(select t.id from cities t where t.name = 'BARRA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());

--
-- Aggiunta dati FIN 15/16 per la tabella meetings
-- 
INSERT INTO meetings (id,header_date,season_id,entry_deadline,has_warm_up_pool,is_under_25_admitted,reference_phone,reference_e_mail,reference_name,notes,code,max_individual_events,max_individual_events_per_session,configuration_file,description,edition,header_year,user_id,edition_type_id,timing_type_id,individual_score_computation_type_id,relay_score_computation_type_id,meeting_score_computation_type_id,team_score_computation_type_id,lock_version,created_at,updated_at) VALUES 
(15354,'2016-05-15',152,'2016-05-10',0,1,'','','','','barracentroester',2,0,'FIN02','MEETING CENTRO ESTER',5,'2016',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate());

--
-- Aggiunta dati FIN 15/16 per la tabella meeting_sessions
-- 
INSERT INTO meeting_sessions (id,session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(1267,1,'2016-05-15',15354,195,'08:15:00','09:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1268,2,'2016-05-15',15354,195,'14:15:00','15:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE());

--
-- Aggiunta dati FIN 15/16 per la tabella meeting_events
-- 
INSERT INTO meeting_events (id,event_order,begin_time,is_out_of_race,user_id,meeting_session_id,event_type_id,heat_type_id,lock_version,created_at,updated_at) VALUES 
(5479,1,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15354 and t.session_order = 1),(select t.id from event_types t where t.code = '100MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5480,2,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15354 and t.session_order = 1),(select t.id from event_types t where t.code = '50DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5481,3,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15354 and t.session_order = 1),(select t.id from event_types t where t.code = '50FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5482,4,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15354 and t.session_order = 1),(select t.id from event_types t where t.code = '100SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5483,5,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15354 and t.session_order = 1),(select t.id from event_types t where t.code = '50RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5484,7,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15354 and t.session_order = 2),(select t.id from event_types t where t.code = '200SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5485,8,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15354 and t.session_order = 2),(select t.id from event_types t where t.code = '100DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5486,9,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15354 and t.session_order = 2),(select t.id from event_types t where t.code = '100RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5487,10,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15354 and t.session_order = 3),(select t.id from event_types t where t.code = '50SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE());

--
-- Aggiunta dati FIN 15/16 per la tabella meeting_events (relays)
-- 
INSERT INTO meeting_events (id,event_order,begin_time,is_out_of_race,user_id,meeting_session_id,event_type_id,heat_type_id,lock_version,created_at,updated_at) VALUES 
(5488,6,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15354 and t.session_order = 1),(select t.id from event_types t where t.code = 'S4X50SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5489,11,'00:00:00',0,3,(select t.id from meeting_sessions t where t.meeting_id = 15354 and t.session_order = 2),(select t.id from event_types t where t.code = 'S4X50MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE());
