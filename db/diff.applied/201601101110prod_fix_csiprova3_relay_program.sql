/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Leega
-- Date: 2016-01-14 13:56
-- Fix meeting program
update meeting_events set event_type_id = 33 where id = 3871;
update meeting_events set event_type_id = 30 where id = 3881;

commit;