-- Leega
-- 01/06/2016
-- 201606011720prod_program_fix_15337

-- select * from meeting_sessions ms where ms.meeting_id = 15337;
-- select et.code from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id join event_types et on et.id = me.event_type_id where ms.meeting_id = 15337 order by ms.session_order, me.event_order;
--
-- aggiornamento orari sessioni per il meeting 15337
-- 
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'M'), warm_up_time = '8:30:00', begin_time = '9:30:00', scheduled_date = '2016-05-28' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15337 and ms.session_order = 1) a);
delete from meeting_sessions where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15337 and ms.session_order = 2) a);
delete from meeting_sessions where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15337 and ms.session_order = 3) a);
delete from meeting_sessions where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15337 and ms.session_order = 4) a);

--
-- Aggiornamento programma gare per il meeting 15337
-- 
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15337 and ms.session_order = 1), event_type_id = (select et.id from event_types et where et.code = '400SL') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 1) a);
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15337 and ms.session_order = 1), event_type_id = (select et.id from event_types et where et.code = '50FA') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 2) a);
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15337 and ms.session_order = 1), event_type_id = (select et.id from event_types et where et.code = '100DO') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 3) a);
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15337 and ms.session_order = 1), event_type_id = (select et.id from event_types et where et.code = '50SL') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 4) a);
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15337 and ms.session_order = 1), event_type_id = (select et.id from event_types et where et.code = '100RA') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 5) a);
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15337 and ms.session_order = 1), event_type_id = (select et.id from event_types et where et.code = '200MI') where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 6) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 7) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 8) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 9) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 10) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 11) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 12) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 13) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 14) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 15) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 16) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 17) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 18) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 19) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 20) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 21) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 22) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 23) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 24) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 25) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 26) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 27) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 28) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 29) a);
delete from meeting_events where id > 0 and id = (select a.id from (select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id where ms.meeting_id = 15337 and me.event_order = 30) a);

update meetings set description = 'MEETING CITTÀ DI GALLARATE' where id = 15337;