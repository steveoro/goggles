-- Leega
-- 09/04/2016
-- Fix swimming pool for regionali Campania
update meeting_sessions set swimming_pool_id = 124 where meeting_id = 15278;

update swimming_pools set nick_name = 'barrafritzdennerlein258' where id = 124;

update meeting_programs
set pool_type_id = 1
where id > 0
	and meeting_event_id in (
      select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15278);

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
      where ms.meeting_id = 15278);

select ct.code, et.code, ts.*
from time_standards ts
	join event_types et on et.id = ts.event_type_id
	join category_types ct on ct.id = ts.category_type_id
where ts.season_id = 152
and ts.pool_type_id = 1
order by ts.gender_type_id, ts.category_type_id, ts.event_type_id;


select * from meeting_programs mp where id between 47616 and 47619;
*/