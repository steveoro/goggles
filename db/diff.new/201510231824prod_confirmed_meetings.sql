-- Leega
-- Set confirmed meetings
-- Begin script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Fix wrong header date
update meetings m set m.header_date = 20141213 where m.id = 14255;
update meeting_sessions ms set ms.scheduled_date = 20141213 where ms.meeting_id = 14255;
update meetings m set m.header_date = 20141214 where m.id = 14256;
update meeting_sessions ms set ms.scheduled_date = 20141214 where ms.meeting_id = 14256;
update meetings m set m.header_date = 20141220 where m.id = 14257;
update meeting_sessions ms set ms.scheduled_date = 20141220 where ms.meeting_id = 14257;
update meetings m set m.header_date = 20141221 where m.id = 14258;
update meeting_sessions ms set ms.scheduled_date = 20141221 where ms.meeting_id = 14258;
update meetings m set m.header_date = 20141221 where m.id = 14259;
update meeting_sessions ms set ms.scheduled_date = 20141221 where ms.meeting_id = 14259;
update meetings m set m.header_date = 20150530 where m.id = 14338;
update meeting_sessions ms set ms.scheduled_date = 20150530 where ms.meeting_id = 14338;

-- Set confirmed flag
update meetings m set m.is_confirmed = true where m.header_date < 20151001;

COMMIT;
-- End script