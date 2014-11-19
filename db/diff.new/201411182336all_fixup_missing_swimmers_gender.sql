update swimmers s
  set s.user_id = 1, s.gender_type_id = (select distinct mp.gender_type_id from meeting_programs mp join meeting_individual_results mir on mir.meeting_program_id = mp.id where mir.swimmer_id = s.id)
  where exists (select 1 from meeting_individual_results mir where mir.swimmer_id = s.id) and s.gender_type_id is null;
