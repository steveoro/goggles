/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Leega
-- 30/11/2015
-- Fix swimmer gender

-- Fix meeting_entries first
update meeting_entries set meeting_program_id = 
  (select mp.id from meeting_programs mp where mp.meeting_event_id = 3862 and mp.category_type_id = 898 and gender_type_id = 2)
where id = 4012;
update meeting_entries set meeting_program_id = 
  (select mp.id from meeting_programs mp where mp.meeting_event_id = 3862 and mp.category_type_id = 898 and gender_type_id = 2)
where id = 4046;

-- Fix swimmer gender
update swimmers set gender_type_id = 2 where id = 21038;

commit;