/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Leega
-- Fix 4x50SL session for IV Trofeo Coopernuoto (15216)
update meeting_events 
set meeting_session_id = 1003, event_order = 6
where id = 4093;

commit;