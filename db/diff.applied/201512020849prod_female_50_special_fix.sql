/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Leega
-- 02/12/2015
-- Fix female 50 special 
update meeting_individual_results set rank = 3, seconds = 39, team_points = 15 where id = 255480;
update meeting_individual_results set rank = 4, team_points = 12 where id = 255475;
update meeting_individual_results set rank = 5, team_points = 9 where id = 255476;
update meeting_individual_results set rank = 6, team_points = 6 where id = 255477;
update meeting_individual_results set rank = 7, team_points = 3 where id = 255478;
update meeting_individual_results set rank = 8, team_points = 2 where id = 255479;

commit;