-- Leega
-- 03/06/2016
-- Fix scripting error on program adj
	
update meeting_events set event_type_id = 26 where id = 4068;
update meeting_events set event_type_id = 25 where id = 4069;
update meeting_events set event_type_id = 23 where id = 4070;
update meeting_events set event_type_id = 2 where id = 4071;
update meeting_events set event_type_id = 15 where id = 4072;
update meeting_events set event_type_id = 4 where id = 4073;
update meeting_events set event_type_id = 5 where id = 4074;
update meeting_events set event_type_id = 16 where id = 4075;
update meeting_events set event_type_id = 19 where id = 4076;
update meeting_events set event_type_id = 11 where id = 4077;
update meeting_events set event_type_id = 3 where id = 4078;
update meeting_events set event_type_id = 12 where id = 4231;
update meeting_events set event_type_id = 17 where id = 4232;
update meeting_events set event_type_id = 5 where id = 4234;
update meeting_events set event_type_id = 15 where id = 4235;
update meeting_events set event_type_id = 11 where id = 4236;
update meeting_events set event_type_id = 19 where id = 4237;
update meeting_events set event_type_id = 2 where id = 4238;
update meeting_events set event_type_id = 3 where id = 6227;
update meeting_events set event_type_id = 23 where id = 6228;
update meeting_events set event_type_id = 16 where id = 4256;
update meeting_events set event_type_id = 20 where id = 4257;
update meeting_events set event_type_id = 7 where id = 4259;
update meeting_events set event_type_id = 15 where id = 4260;
update meeting_events set event_type_id = 11 where id = 4261;
update meeting_events set event_type_id = 2 where id = 4263;
update meeting_events set event_type_id = 25 where id = 4264;
update meeting_events set event_type_id = 4 where id = 6229;
update meeting_events set event_type_id = 16 where id = 4277;
update meeting_events set event_type_id = 12 where id = 4278;
update meeting_events set event_type_id = 20 where id = 4279;
update meeting_events set event_type_id = 3 where id = 4280;
update meeting_events set event_type_id = 23 where id = 4281;
update meeting_events set event_type_id = 15 where id = 4283;
update meeting_events set event_type_id = 11 where id = 4284;
update meeting_events set event_type_id = 19 where id = 4285;
update meeting_events set event_type_id = 2 where id = 4286;
update meeting_events set event_type_id = 28 where id = 4287;
update meeting_events set event_type_id = 16 where id = 4289;
update meeting_events set event_type_id = 22 where id = 4290;
update meeting_events set event_type_id = 20 where id = 4291;
update meeting_events set event_type_id = 3 where id = 4292;
update meeting_events set event_type_id = 7 where id = 4293;
update meeting_events set event_type_id = 15 where id = 4297;
update meeting_events set event_type_id = 11 where id = 4298;
update meeting_events set event_type_id = 2 where id = 4300;
update meeting_events set event_type_id = 6 where id = 4301;
update meeting_events set event_type_id = 20 where id = 4353;
update meeting_events set event_type_id = 23 where id = 4355;
update meeting_events set event_type_id = 5 where id = 4356;
update meeting_events set event_type_id = 16 where id = 4359;
update meeting_events set event_type_id = 12 where id = 4360;
update meeting_events set event_type_id = 20 where id = 4361;
update meeting_events set event_type_id = 3 where id = 4362;
update meeting_events set event_type_id = 23 where id = 4363;
update meeting_events set event_type_id = 15 where id = 4364;
update meeting_events set event_type_id = 11 where id = 4365;
update meeting_events set event_type_id = 19 where id = 4366;
update meeting_events set event_type_id = 2 where id = 4367;
update meeting_events set event_type_id = 17 where id = 6593;
update meeting_events set event_type_id = 13 where id = 6594;
update meeting_events set event_type_id = 21 where id = 6595;
update meeting_events set event_type_id = 4 where id = 6596;
update meeting_events set event_type_id = 24 where id = 6597;
update meeting_events set event_type_id = 5 where id = 6598;
update meeting_events set event_type_id = 25 where id = 6599;

/*
select m.id, m.code, me.id as meeting_event_id, et.code, et.id as wrong_event_type_id, 
		
		(select max(ts.event_type_id)
		from meeting_programs mp
			join time_standards ts on ts.id = mp.time_standard_id
		where mp.meeting_event_id = me.id
			and ts.event_type_id <> me.event_type_id) as right_event_type_id

from meeting_events me
	join meeting_sessions ms on ms.id = me.meeting_session_id
	join meetings m on m.id = ms.meeting_id
	join event_types et on et.id = me.event_type_id
where m.are_results_acquired
	and m.season_id = 152
	and exists (
		select 1
		from meeting_programs mp
			join time_standards ts on ts.id = mp.time_standard_id
		where mp.meeting_event_id = me.id
			and ts.event_type_id <> me.event_type_id);
*/