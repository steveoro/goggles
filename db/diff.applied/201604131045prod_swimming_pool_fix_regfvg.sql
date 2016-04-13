-- Leega
-- 09/04/2016
-- Fix swimming pool for regionali Campania
INSERT INTO swimming_pools (id,name,phone_number,lanes_number,address,nick_name,maps_uri,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES 
(191,'Polo natatorio Bruno Bianchi','',10,'Passeggio S. Andrea, 8','triestepolonatatorio25','',1,0,0,0,0,0,'','','','','',2,(select t.id from cities t where t.name = 'TRIESTE'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());

update meeting_sessions set swimming_pool_id = 191 where meeting_id = 15276;

update meeting_programs
set pool_type_id = 1
where id > 0
	and meeting_event_id in (
      select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15276);

/*
-- Fix standard time id
-- update meeting_programs
-- set time_standard_id = 
select id, (select max(ts.id)
    from time_standards ts 
    where ts.season_id = 152 
	 and ts.pool_type_id = pool_type_id
     and ts.gender_type_id = gender_type_id 
     and ts.category_type_id = category_type_id 
     and ts.event_type_id = (select me.event_type_id from meeting_events me where me.id = meeting_event_id)) as time_standard_id
from meeting_programs
where id > 0
	and meeting_event_id in (
      select me.id 
	  from meeting_events me 
	    join meeting_sessions ms on ms.id = me.meeting_session_id 
      where ms.meeting_id = 15276);
*/