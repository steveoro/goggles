## HOWTO: Create queries to search db

-- Query MIRs for meeting_id
select mir.team_points, mir.id, mir.meeting_individual_points
    from meeting_individual_results mir
    join meeting_programs mp on mp.id = mir.meeting_program_id
    join meeting_events me on me.id = mp.meeting_event_id
    join meeting_sessions ms on ms.id = me.meeting_session_id
where ms.meeting_id = 14105

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
    where ms.meeting_id = m.id) as result_count,
  (select ms.scheduled_date
    from meeting_sessions ms
    where ms.meeting_id = m.id
      and ms.session_order = 1) as first_session
from meetings m
where m.season_id = 142
order by 4;
----8<----


----8<----
-- Missing GoggleCup points
SELECT sn.description, t.name as team, s.complete_name as swimmer,
    m.id as meeting_id, m.code, m.header_date,
    et.code as event,
    mir.id as mir_id, mir.minutes, mir.seconds, mir.hundreds, mir.standard_points, mir.rank
FROM meeting_individual_results mir
	join team_affiliations ta on ta.id = mir.team_affiliation_id
    join teams t on t.id = ta.team_id
    join swimmers s on s.id = mir.swimmer_id
    join meeting_programs mp on mp.id = mir.meeting_program_id
    join meeting_events me on me.id = mp.meeting_event_id
    join meeting_sessions ms on ms.id = me.meeting_session_id
    join meetings m on m.id = ms.meeting_id
    join event_types et on et.id = me.event_type_id
    join seasons sn on sn.id = m.season_id
where not mir.is_disqualified
    and mir.goggle_cup_points = 0
    and ta.must_calculate_goggle_cup
    -- and mir.swimmer_id = 23
    -- and t.id = 1
    -- and s.id = 142
order by sn.description, t.name, s.complete_name, m.header_date;
----8<----


----8<----
-- Goggle cup details
select s.complete_name, mir.goggle_cup_points, et.code as event, ms.scheduled_date, m.description
from meeting_individual_results mir
    join swimmers s on s.id = mir.swimmer_id
    join team_affiliations ta on ta.id = mir.team_affiliation_id
    join seasons sn on sn.id = ta.season_id
    join meeting_programs mp on mp.id = mir.meeting_program_id
    join meeting_events me on me.id = mp.meeting_event_id
    join meeting_sessions ms on ms.id = me.meeting_session_id
    join meetings m on m.id = ms.meeting_id
    join event_types et on et.id = me.event_type_id

where ta.must_calculate_goggle_cup
    and sn.id = 142
    and s.id = 23
order by s.complete_name, mir.goggle_cup_points desc
----8<----


----8<----
-- Create swimmer in GASA32
select s.id, 'CSI' as tipo, s.complete_name, s.year_of_birth, gt.code as sesso, b.number as csi, '' as fin, '' as ricerca, t.name as csi_team
from swimmers s
	join gender_types gt on gt.id = s.gender_type_id
	join badges b on b.swimmer_id = s.id
	join teams t on t.id = b.team_id
where s.created_at > '20150413'
order by id desc;







