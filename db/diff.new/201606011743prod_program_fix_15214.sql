-- Leega
-- 01/06/2016
-- 201606011743prod_program_fix_15214

-- select * from meeting_sessions ms where ms.meeting_id = 15214;
-- select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id join event_types et on et.id = me.event_type_id where ms.meeting_id = 15214 order by ms.session_order, me.event_order;
--
-- aggiornamento orari sessioni per il meeting 15214
-- 
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'M'), warm_up_time = '8:00:00', begin_time = '9:00:00', scheduled_date = '2016-05-14' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 1) a);
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'P'), warm_up_time = '13:30:00', begin_time = '14:30:00', scheduled_date = '2016-05-14' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 2) a);
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'M'), warm_up_time = '8:00:00', begin_time = '9:00:00', scheduled_date = '2016-05-15' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 3) a);
delete from meeting_sessions where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 4) a);

--
-- Aggiornamento programma gare per il meeting 15214
-- 
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 1), event_type_id = (select et.id from event_types et where et.code = '800SL'), event_order = 1 where id = 4067;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 2), event_type_id = (select et.id from event_types et where et.code = '200MI'), event_order = 2 where id = 4068;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 2), event_type_id = (select et.id from event_types et where et.code = '50SL'), event_order = 3 where id = 4069;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 2), event_type_id = (select et.id from event_types et where et.code = '50DO'), event_order = 4 where id = 4070;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 2), event_type_id = (select et.id from event_types et where et.code = '200SL'), event_order = 5 where id = 4071;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 2), event_type_id = (select et.id from event_types et where et.code = 'S4X50MI'), event_order = 6 where id = 4072;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 3), event_type_id = (select et.id from event_types et where et.code = '400SL'), event_order = 7 where id = 4073;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 3), event_type_id = (select et.id from event_types et where et.code = '100DO'), event_order = 8 where id = 4074;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 3), event_type_id = (select et.id from event_types et where et.code = '50RA'), event_order = 9 where id = 4075;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 3), event_type_id = (select et.id from event_types et where et.code = '50FA'), event_order = 10 where id = 4076;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 3), event_type_id = (select et.id from event_types et where et.code = '100SL'), event_order = 11 where id = 4077;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15214 and ms.session_order = 3), event_type_id = (select et.id from event_types et where et.code = 'S4X50SL'), event_order = 12 where id = 4078;
