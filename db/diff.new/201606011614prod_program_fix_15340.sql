-- Leega
-- 01/06/2016
-- Meeting program adj 

-- select * from meeting_sessions ms where ms.meeting_id = 15340;
-- select et.code from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id join event_types et on et.id = me.event_type_id where ms.meeting_id = 15340 order by me.event_order;
--
-- aggiornamento orari sessioni per il meeting 15340
-- 
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'M'), warm_up_time = '8:00:00', begin_time = '9:00:00', scheduled_date = '2016-06-02' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15340 and ms.session_order = 1) a);
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'P'), warm_up_time = '14:30:00', begin_time = '15:30:00', scheduled_date = '2016-06-02' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15340 and ms.session_order = 2) a);
delete from meeting_sessions where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15340 and ms.session_order = 3) a);
delete from meeting_sessions where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15340 and ms.session_order = 4) a);

--
-- Aggiunta eventi mancanti
-- 
INSERT INTO meeting_events (id,event_order,is_out_of_race,meeting_session_id,event_type_id,heat_type_id,user_id,lock_version,created_at,updated_at) values  (6606,9,0,(select t.id from meeting_sessions t where t.meeting_id = 15340 and t.session_order = 1),(select t.id from event_types t where t.code = 'M4X50SL'),(select t.id from heat_types t where t.code = 'F'),2,0,CURDATE(),CURDATE());

--
-- Aggiornamento programma gare per il meeting 15340
-- 
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15340 and ms.session_order = 1), event_type_id = (select et.id from event_types et where et.code = '200MI') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 1) a);
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15340 and ms.session_order = 1), event_type_id = (select et.id from event_types et where et.code = '100DO') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 2) a);
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15340 and ms.session_order = 1), event_type_id = (select et.id from event_types et where et.code = '50FA') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 3) a);
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15340 and ms.session_order = 1), event_type_id = (select et.id from event_types et where et.code = '100SL') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 4) a);
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15340 and ms.session_order = 2), event_type_id = (select et.id from event_types et where et.code = '400SL') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 5) a);
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15340 and ms.session_order = 2), event_type_id = (select et.id from event_types et where et.code = '50DO') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 6) a);
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15340 and ms.session_order = 2), event_type_id = (select et.id from event_types et where et.code = '100RA') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 7) a);
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15340 and ms.session_order = 2), event_type_id = (select et.id from event_types et where et.code = '50SL') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 8) a);
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15340 and ms.session_order = 2), event_type_id = (select et.id from event_types et where et.code = 'M4X50SL') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 9) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 10) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 11) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 12) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 13) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 14) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 15) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 16) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 17) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 18) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 19) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 20) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 21) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 22) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 23) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 24) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 25) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 26) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 27) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 28) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 29) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15340 and me.event_order = 30) a);
