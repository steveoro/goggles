-- Leega
-- 01/06/2016
-- 201606011705prod_program_fix_15211

-- select * from meeting_sessions ms where ms.meeting_id = 15211;
-- select et.code, ms.session_order, me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id join event_types et on et.id = me.event_type_id where ms.meeting_id = 15211 order by ms.session_order, me.event_order;

--
-- Aggiunta sessioni mancanti
-- 
INSERT INTO meeting_sessions (id,session_order,meeting_id,swimming_pool_id,notes,description,user_id,lock_version,created_at,updated_at) VALUES  (1276,10,15211,(select ms.swimming_pool_id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 1),'','FINALI',2,0,CURDATE(),CURDATE());

--
-- aggiornamento orari sessioni per il meeting 15211
-- 
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'P'), warm_up_time = ':00', begin_time = ':00', scheduled_date = '2016-06-21' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 1) a);
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'M'), warm_up_time = ':00', begin_time = ':00', scheduled_date = '2016-06-22' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 2) a);
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'P'), warm_up_time = ':00', begin_time = ':00', scheduled_date = '2016-06-22' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 3) a);
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'M'), warm_up_time = ':00', begin_time = ':00', scheduled_date = '2016-06-23' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 4) a);
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'P'), warm_up_time = ':00', begin_time = ':00', scheduled_date = '2016-06-23' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 5) a);
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'M'), warm_up_time = ':00', begin_time = ':00', scheduled_date = '2016-06-24' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 6) a);
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'P'), warm_up_time = ':00', begin_time = ':00', scheduled_date = '2016-06-24' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 7) a);
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'M'), warm_up_time = ':00', begin_time = ':00', scheduled_date = '2016-06-25' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 8) a);
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'P'), warm_up_time = ':00', begin_time = ':00', scheduled_date = '2016-06-25' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 9) a);
update meeting_sessions set day_part_type_id = (select id from day_part_types where code = 'M'), warm_up_time = ':00', begin_time = ':00', scheduled_date = '2016-06-26' where id > 0 and id = (select a.id from (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 10) a);

--
-- Aggiornamento programma gare per il meeting 15211
-- 
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 1), event_type_id = (select et.id from event_types et where et.code = '800SL') where id = 4023;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 2), event_type_id = (select et.id from event_types et where et.code = '400MI') where id = 4024;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 2), event_type_id = (select et.id from event_types et where et.code = '100FA') where id = 4025;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 2), event_type_id = (select et.id from event_types et where et.code = '200DO') where id = 4026;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 3), event_type_id = (select et.id from event_types et where et.code = '400SL') where id = 4027;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 4), event_type_id = (select et.id from event_types et where et.code = '200RA') where id = 4028;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 4), event_type_id = (select et.id from event_types et where et.code = '200FA') where id = 4029;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 5), event_type_id = (select et.id from event_types et where et.code = '200SL') where id = 4030;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 6), event_type_id = (select et.id from event_types et where et.code = '200MI') where id = 4031;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 6), event_type_id = (select et.id from event_types et where et.code = '50FA') where id = 4032;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 6), event_type_id = (select et.id from event_types et where et.code = '50DO') where id = 4033;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 7), event_type_id = (select et.id from event_types et where et.code = '50RA') where id = 4034;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 7), event_type_id = (select et.id from event_types et where et.code = '100SL') where id = 4035;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 7), event_type_id = (select et.id from event_types et where et.code = 'M4X50MI') where id = 4036;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 8), event_type_id = (select et.id from event_types et where et.code = '100RA') where id = 4037;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 8), event_type_id = (select et.id from event_types et where et.code = '100DO') where id = 4038;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 8), event_type_id = (select et.id from event_types et where et.code = 'S4X50MI') where id = 4039;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 9), event_type_id = (select et.id from event_types et where et.code = '50SL') where id = 4040;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 10), event_type_id = (select et.id from event_types et where et.code = 'M4X50SL') where id = 4041;
update meeting_events set meeting_session_id = (select id from meeting_sessions ms where ms.meeting_id = 15211 and ms.session_order = 10), event_type_id = (select et.id from event_types et where et.code = 'S4X50SL') where id = 4042;
