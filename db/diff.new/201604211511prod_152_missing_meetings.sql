-- Leega
-- 21/04/2016
-- Fix some wrong meeting codes and add missing meetings

-- select m.code, m.* from meetings m where m.code like '%leone%';
update meetings set code = 'brescialeonessaditalia' where code = 'leonessa';

--
-- Dump dei dati per la tabella cities
-- 
insert into cities (id,name,zip,area,country,country_code,lock_version,created_at,updated_at) values 
(156,'POZZUOLI','?','NAPOLI','ITALIA','ITA',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella swimming_pools
-- 
INSERT INTO swimming_pools (id,name,phone_number,lanes_number,address,nick_name,maps_uri,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES 
(194,'PalaTrincone','',8,'Monterusciello','pozzuolipalatrincone25','',0,0,0,0,0,0,'','','','','',2,(select t.id from cities t where t.name = 'POZZUOLI'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());

--
-- Aggiunta dati FIN 15/16 per la tabella meetings
-- 
INSERT INTO meetings (id,header_date,season_id,entry_deadline,has_warm_up_pool,is_under_25_admitted,reference_phone,reference_e_mail,reference_name,notes,code,max_individual_events,max_individual_events_per_session,configuration_file,description,edition,header_year,user_id,edition_type_id,timing_type_id,individual_score_computation_type_id,relay_score_computation_type_id,meeting_score_computation_type_id,team_score_computation_type_id,lock_version,created_at,updated_at) VALUES 
(15352,'2015-12-05',152,'2015-11-27',1,1,'','','','','pozzuolileone',2,0,'FIN02','MEMORIAL LEONE',2,'2016',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate());

--
-- Aggiunta dati FIN 15/16 per la tabella meeting_sessions
-- 
INSERT INTO meeting_sessions (id,session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(1262,1,'2015-12-05',15352,194,'07:45:00','08:30:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1263,2,'2015-12-05',15352,194,'14:45:00','15:30:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(1264,3,'2015-12-06',15352,194,'07:45:00','08:30:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE());

--
-- Aggiunta dati FIN 15/16 per la tabella meeting_events
-- 
INSERT INTO meeting_events (id,event_order,begin_time,is_out_of_race,user_id,meeting_session_id,event_type_id,heat_type_id,lock_version,created_at,updated_at) VALUES 
(5432,1,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15352 and t.session_order = 1),(select t.id from event_types t where t.code = '200DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5433,2,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15352 and t.session_order = 1),(select t.id from event_types t where t.code = '100RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5434,3,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15352 and t.session_order = 1),(select t.id from event_types t where t.code = '200MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5435,4,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15352 and t.session_order = 1),(select t.id from event_types t where t.code = '100SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5436,5,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15352 and t.session_order = 2),(select t.id from event_types t where t.code = '100FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5437,6,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15352 and t.session_order = 2),(select t.id from event_types t where t.code = '50DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5438,7,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15352 and t.session_order = 2),(select t.id from event_types t where t.code = '50RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5439,8,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15352 and t.session_order = 2),(select t.id from event_types t where t.code = '200SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5440,9,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15352 and t.session_order = 3),(select t.id from event_types t where t.code = '50SL'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5441,10,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15352 and t.session_order = 3),(select t.id from event_types t where t.code = '50FA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5442,11,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15352 and t.session_order = 3),(select t.id from event_types t where t.code = '200RA'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5443,12,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15352 and t.session_order = 3),(select t.id from event_types t where t.code = '100DO'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE()),
(5444,13,'00:00:00',1,2,(select t.id from meeting_sessions t where t.meeting_id = 15352 and t.session_order = 3),(select t.id from event_types t where t.code = '100MI'),(select t.id from heat_types t where t.code = 'F'),0,CURDATE(),CURDATE());
