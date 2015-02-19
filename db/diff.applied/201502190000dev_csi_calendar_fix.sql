-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;
SET AUTOCOMMIT=0;
START TRANSACTION;
-- Fix 2a prova CSI event types
update meeting_events set event_type_id = (select et.id from event_types et where et.code = '50FA') where id = 1575;
-- Fix 3a prova CSI swimming pool
update meeting_sessions set swimming_pool_id = 8 where id = 614;
COMMIT;
-- Fine script
