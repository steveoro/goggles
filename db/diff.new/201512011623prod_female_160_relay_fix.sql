/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Leega
-- Fix relay order for F >160 csiprova1
update meeting_relay_results set rank = 4, meeting_points = 15 where id = 11380;
update meeting_relay_results set rank = 3, meeting_points = 18 where id = 11381;
update meeting_relay_results set rank = 2, meeting_points = 21 where id = 11382;
update meeting_relay_results set rank = 1, meeting_points = 24 where id = 11383;

commit;