-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Fix Molinella session dates
update meeting_sessions ms
set ms.scheduled_date = '20150411'
where ms.meeting_id = 14213
and ms.session_order < 4;

update meeting_sessions ms
set ms.scheduled_date = '20150412'
where ms.meeting_id = 14213
and ms.session_order > 3;

commit;