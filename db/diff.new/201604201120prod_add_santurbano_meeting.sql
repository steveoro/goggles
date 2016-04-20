-- Leega
-- 20/04/2016
-- Add Sant'Urbano meeting

--
-- Dump dei dati per la tabella cities
-- 
insert into cities (id,name,zip,area,country,country_code,lock_version,created_at,updated_at) values 
(155,'SANT''URBANO','?','PADOVA','ITALIA','ITA',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella swimming_pools
-- 
INSERT INTO swimming_pools (id,name,phone_number,lanes_number,address,nick_name,maps_uri,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES 
(193,'Aquambiente','',8,'Via Cà Nove 7/A','santurbanoaquambiente25','',1,0,0,0,0,0,'','','','','',2,(select t.id from cities t where t.name = 'SANT''URBANO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());

--
-- Aggiunta dati FIN 15/16 per la tabella meetings
-- 
INSERT INTO meetings (id,header_date,season_id,entry_deadline,has_warm_up_pool,is_under_25_admitted,reference_phone,reference_e_mail,reference_name,notes,code,max_individual_events,max_individual_events_per_session,configuration_file,description,edition,header_year,user_id,edition_type_id,timing_type_id,individual_score_computation_type_id,relay_score_computation_type_id,meeting_score_computation_type_id,team_score_computation_type_id,lock_version,created_at,updated_at) VALUES 
(15351,'2016-01-17',152,'2016-01-10',1,1,'','','','','santurbanoaquambiente',2,0,'FIN02','TROFEO AQUAMBIENTE',1,'2016',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate());

--
-- Aggiunta dati FIN 15/16 per la tabella meeting_sessions
-- 
INSERT INTO meeting_sessions (id,session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(1260,1,'2016-01-17',15351,193,'08:30:00','09:30:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1261,2,'2016-01-17',15351,193,'13:30:00','14:30:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE());

--
-- Aggiunta dati FIN 15/16 per la tabella meeting_events
-- 
INSERT INTO meeting_events (id,event_order,begin_time,is_out_of_race,user_id,meeting_session_id,event_type_id,heat_type_id,lock_version,created_at,updated_at) VALUES 
(5424,1,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15351 and t.session_order = 1),(select t.id from event_types t where t.code = '100FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5425,2,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15351 and t.session_order = 1),(select t.id from event_types t where t.code = '100DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5426,3,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15351 and t.session_order = 1),(select t.id from event_types t where t.code = '100SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5427,5,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15351 and t.session_order = 2),(select t.id from event_types t where t.code = '100RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5428,6,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15351 and t.session_order = 2),(select t.id from event_types t where t.code = '100MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE());

--
-- Aggiunta dati FIN 15/16 per la tabella meeting_events (relays)
-- 
INSERT INTO meeting_events (id,event_order,begin_time,is_out_of_race,user_id,meeting_session_id,event_type_id,heat_type_id,lock_version,created_at,updated_at) VALUES 
(5429,4,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15351 and t.session_order = 1),(select t.id from event_types t where t.code = 'S4X100MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5430,7,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15351 and t.session_order = 2),(select t.id from event_types t where t.code = 'M4X100SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE());
