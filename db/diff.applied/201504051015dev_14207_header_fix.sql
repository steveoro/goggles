-- Fix header date for 14207 meeting
update meetings m
set m.header_date = '20150215'
where m.id = 14207;

update meeting_sessions ms
set ms.scheduled_date = '20150215', 
  ms.warm_up_time = '8.00',
  ms.begin_time = '8.45',
  ms.day_part_type_id = (select dpt.id from day_part_types dpt where dpt.code = 'M')
where ms.meeting_id = 14207 and ms.session_order = 1;

update meeting_sessions ms
set ms.scheduled_date = '20150215', 
  ms.warm_up_time = '14.00',
  ms.begin_time = '14.45',
  ms.day_part_type_id = (select dpt.id from day_part_types dpt where dpt.code = 'P')
where ms.meeting_id = 14207 and ms.session_order = 2;

update meeting_sessions ms
set ms.scheduled_date = '20150222', 
  ms.warm_up_time = '8.00',
  ms.begin_time = '8.45',
  ms.day_part_type_id = (select dpt.id from day_part_types dpt where dpt.code = 'M')
where ms.meeting_id = 14207 and ms.session_order = 3;

update meeting_sessions ms
set ms.scheduled_date = '20150222', 
  ms.warm_up_time = '14.00',
  ms.begin_time = '14.45',
  ms.day_part_type_id = (select dpt.id from day_part_types dpt where dpt.code = 'P')
where ms.meeting_id = 14207 and ms.session_order = 4;

-- Fix CSI prova 5 header date according to the session
update meetings m
set m.header_date = '20150419'
where m.id = 14105;

-- Fix all first sessions without scheduled date for meetings with header date
update meeting_sessions ms
set ms.scheduled_date = (select m.header_date from meetings m where m.id = ms.meeting_id)
where ms.scheduled_date <= '19000101' and ms.session_order = 1;