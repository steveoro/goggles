update seasons s set s.has_individual_rank = false where s.id in (121, 131);
update meeting_entries mn set mn.is_no_time = true where mn.minutes = 0 and mn.seconds = 0 and mn.hundreds = 0;
update meeting_events me set me.has_separate_category_start_list = true where me.meeting_session_id in (
  select ms.id 
  from meeting_sessions ms 
  join meetings m on m.id = ms.meeting_id
  where m.max_individual_events > 2);
commit;