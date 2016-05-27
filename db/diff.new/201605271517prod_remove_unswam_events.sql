-- Leega
-- 27/05/2016
-- Remove non swam events in acquired meetings

delete from meeting_events where id > 0 and id in (
  select a.meeting_event_id from (
	select ms.meeting_id, m.description, m.code as meeting, me.id as meeting_event_id, et.code
	from meetings m
		join meeting_sessions ms on ms.meeting_id = m.id
		join meeting_events me on me.meeting_session_id = ms.id
		join event_types et on et.id = me.event_type_id
	where m.are_results_acquired
		and not et.is_a_relay
		and not exists (select 1 from meeting_programs mp where mp.meeting_event_id = me.id)) a
  )
