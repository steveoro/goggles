/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Leega
-- Fix wrong badge in season 1 for GIURBINO LUANA
update meeting_individual_results set badge_id = 358 where badge_id = 339;
delete from badges where id = 339;

commit;