## HOWTO: Create queries to search db

----8<----
-- Query meeting for season 142
select m.id,
  m.description, 
  m.are_results_acquired, 
  m.header_date, 
  m.header_year, 
  m.code,
  (select count(mir.id) 
    from meeting_individual_results mir 
    join meeting_programs mp on mp.id = mir.meeting_program_id 
    join meeting_events me on me.id = mp.meeting_event_id 
    join meeting_sessions ms on ms.id = me.meeting_session_id 
    where ms.meeting_id = m.id) as result_count
from meetings m
where m.season_id = 142
order by 4
----8<----

