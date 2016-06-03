-- Leega
-- 27/05/2016
-- Fix Piacenza events

delete from meeting_events where id = 4019;
update meeting_events set event_type_id = (select et.id from event_types et where et.code = '400SL') where id = 4008;
update meeting_events set event_type_id = (select et.id from event_types et where et.code = '100DO') where id = 4009;
update meeting_events set event_type_id = (select et.id from event_types et where et.code = '100SL') where id = 4010;
update meeting_events set event_type_id = (select et.id from event_types et where et.code = '200FA') where id = 4011;
update meeting_events set event_type_id = (select et.id from event_types et where et.code = '100RA') where id = 4012;
update meeting_events set event_type_id = (select et.id from event_types et where et.code = '100FA') where id = 4013;
update meeting_events set event_type_id = (select et.id from event_types et where et.code = '200SL') where id = 4014;
update meeting_events set meeting_session_id = 980, event_type_id = (select et.id from event_types et where et.code = '400MI') where id = 4015;
update meeting_events set meeting_session_id = 980, event_type_id = (select et.id from event_types et where et.code = '200DO') where id = 4016;
update meeting_events set meeting_session_id = 980, event_type_id = (select et.id from event_types et where et.code = '200RA') where id = 4017;
update meeting_events set meeting_session_id = 980, event_type_id = (select et.id from event_types et where et.code = '50SL') where id = 4018;
update meeting_events set event_order = 12, meeting_session_id = 980, event_type_id = (select et.id from event_types et where et.code = '50RA') where id = 4020;
update meeting_events set event_order = 13, meeting_session_id = 980, event_type_id = (select et.id from event_types et where et.code = '50DO') where id = 4021;
update meeting_events set event_order = 14, meeting_session_id = 980, event_type_id = (select et.id from event_types et where et.code = '50FA') where id = 4022;
update meeting_sessions set warm_up_time = '08:30:00', begin_time = '09:30:00' where id = 979;
update meeting_sessions set warm_up_time = '13:30:00', begin_time = '14:30:00' where id = 980;

/*
select ms.session_order, ms.scheduled_date, ms.begin_time, me.meeting_session_id, me.event_order, et.code, me.id
from meeting_events me
	join meeting_sessions ms on ms.id = me.meeting_session_id
	join event_types et on et.id = me.event_type_id
where ms.meeting_id = 15210
order by me.id;
*/