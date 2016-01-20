-- Leega
-- 20/01/2016
-- 50 Special score fix

/* Control query
select *
from meeting_individual_results
where meeting_program_id in (
	-- select ms.meeting_id, et.code, ht.code, mp.meeting_event_id, mp.identified
	select mp.id
	from meeting_events me
		join event_types et on et.id = me.event_type_id
		join heat_types ht on ht.id = me.heat_type_id
		join meeting_sessions ms on ms.id = me.meeting_session_id
		join meeting_programs mp on mp.meeting_event_id = me.id
	where ht.code <> 'F');
*/

update meeting_individual_results
set team_points = 24
where rank = 1 
	and not is_disqualified
	and meeting_program_id in (
	-- select ms.meeting_id, et.code, ht.code, mp.meeting_event_id, mp.identified
	select mp.id
	from meeting_events me
		join event_types et on et.id = me.event_type_id
		join heat_types ht on ht.id = me.heat_type_id
		join meeting_sessions ms on ms.id = me.meeting_session_id
		join meeting_programs mp on mp.meeting_event_id = me.id
	where ht.code <> 'F'
	);
update meeting_individual_results
set team_points = 21
where rank = 2
	and not is_disqualified
	and meeting_program_id in (
	-- select ms.meeting_id, et.code, ht.code, mp.meeting_event_id, mp.identified
	select mp.id
	from meeting_events me
		join event_types et on et.id = me.event_type_id
		join heat_types ht on ht.id = me.heat_type_id
		join meeting_sessions ms on ms.id = me.meeting_session_id
		join meeting_programs mp on mp.meeting_event_id = me.id
	where ht.code <> 'F'
	);
update meeting_individual_results
set team_points = 18
where rank = 3
	and not is_disqualified
	and meeting_program_id in (
	-- select ms.meeting_id, et.code, ht.code, mp.meeting_event_id, mp.identified
	select mp.id
	from meeting_events me
		join event_types et on et.id = me.event_type_id
		join heat_types ht on ht.id = me.heat_type_id
		join meeting_sessions ms on ms.id = me.meeting_session_id
		join meeting_programs mp on mp.meeting_event_id = me.id
	where ht.code <> 'F'
	);
update meeting_individual_results
set team_points = 15
where rank = 4
	and not is_disqualified
	and meeting_program_id in (
	-- select ms.meeting_id, et.code, ht.code, mp.meeting_event_id, mp.identified
	select mp.id
	from meeting_events me
		join event_types et on et.id = me.event_type_id
		join heat_types ht on ht.id = me.heat_type_id
		join meeting_sessions ms on ms.id = me.meeting_session_id
		join meeting_programs mp on mp.meeting_event_id = me.id
	where ht.code <> 'F'
	);
update meeting_individual_results
set team_points = 12
where rank = 5
	and not is_disqualified
	and meeting_program_id in (
	-- select ms.meeting_id, et.code, ht.code, mp.meeting_event_id, mp.identified
	select mp.id
	from meeting_events me
		join event_types et on et.id = me.event_type_id
		join heat_types ht on ht.id = me.heat_type_id
		join meeting_sessions ms on ms.id = me.meeting_session_id
		join meeting_programs mp on mp.meeting_event_id = me.id
	where ht.code <> 'F'
	);
update meeting_individual_results
set team_points = 9
where rank = 6
	and not is_disqualified
	and meeting_program_id in (
	-- select ms.meeting_id, et.code, ht.code, mp.meeting_event_id, mp.identified
	select mp.id
	from meeting_events me
		join event_types et on et.id = me.event_type_id
		join heat_types ht on ht.id = me.heat_type_id
		join meeting_sessions ms on ms.id = me.meeting_session_id
		join meeting_programs mp on mp.meeting_event_id = me.id
	where ht.code <> 'F'
	);
update meeting_individual_results
set team_points = 6
where rank = 7
	and not is_disqualified
	and meeting_program_id in (
	-- select ms.meeting_id, et.code, ht.code, mp.meeting_event_id, mp.identified
	select mp.id
	from meeting_events me
		join event_types et on et.id = me.event_type_id
		join heat_types ht on ht.id = me.heat_type_id
		join meeting_sessions ms on ms.id = me.meeting_session_id
		join meeting_programs mp on mp.meeting_event_id = me.id
	where ht.code <> 'F'
	);
update meeting_individual_results
set team_points = 3
where rank = 8
	and not is_disqualified
	and meeting_program_id in (
	-- select ms.meeting_id, et.code, ht.code, mp.meeting_event_id, mp.identified
	select mp.id
	from meeting_events me
		join event_types et on et.id = me.event_type_id
		join heat_types ht on ht.id = me.heat_type_id
		join meeting_sessions ms on ms.id = me.meeting_session_id
		join meeting_programs mp on mp.meeting_event_id = me.id
	where ht.code <> 'F'
	);
update meeting_individual_results
set team_points = 0
where is_disqualified;
