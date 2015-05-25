-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Fix is_out_of_race parameter for meeting programs of out of race events
-- If an event is out of race, the related meeting programs has to be out of race too
-- select count(*)
-- from meeting_programs mp
update meeting_programs mp
set mp.is_out_of_race = true
where mp.is_out_of_race = false and (select me.is_out_of_race from meeting_events me where me.id = mp.meeting_event_id) = true;

-- Fix out of race meeting individual results 
-- If a program is out of race, the related meeting individual results has to be out of race too
-- An out of race result has 0 on all meeting scores except goggle cup
-- select count(*)
-- from meeting_individual_results mir
update meeting_individual_results mir
set mir.meeting_individual_points = 0,
	mir.team_points = 0,
	mir.is_out_of_race = true
where (select mp.is_out_of_race from meeting_programs mp where mp.id = mir.meeting_program_id) = true;

commit;