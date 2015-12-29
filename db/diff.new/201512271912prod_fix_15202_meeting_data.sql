/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Leega
-- 27/12/2015
-- Fix meeting result error on FRIGNANI DANIELE 400MX at Riccione
update meeting_individual_results
set seconds = 53, standard_points = 817.88, rank = 3, meeting_individual_points = 817.88
where id = 256417;
update meeting_individual_results
set rank = 2
where id = 256418;

commit;