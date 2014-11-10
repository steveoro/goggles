-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Inserimento meeting programs staffette circuito CSI
insert into meeting_programs (meeting_event_id, category_type_id, pool_type_id, is_out_of_race, gender_type_id, event_order, user_id, lock_version, created_at, updated_at)
select me.id as meeting_event_id, ct.id as category_type_id, sp.pool_type_id, me.is_out_of_race, gt.id as gender_type_id,
(select max(mp2.event_order) + 1 from meeting_programs mp2 join meeting_events me2 on me2.id = mp2.meeting_event_id where me2.meeting_session_id = ms.id) as event_order, 2 as user_id, 0 as lock_version, curdate() as created_at, curdate() as updated_at
from meeting_events me
join meeting_sessions ms on ms.id = me.meeting_session_id
join meetings m on m.id = ms.meeting_id
join seasons s on s.id = m.season_id
join category_types ct on ct.season_id = s.id
join event_types et on et.id = me.event_type_id
join swimming_pools sp on sp.id = ms.swimming_pool_id
join season_types st on st.id = s.season_type_id
, gender_types gt 
where ct.is_a_relay
and et.is_a_relay
and st.code = 'MASCSI'
and me.id > 2000
and ((gt.code = 'X' and et.is_mixed_gender) or (gt.code <> 'X' and not et.is_mixed_gender))
order by m.header_date, et.code, ct.code, gt.code

COMMIT;
-- Fine script