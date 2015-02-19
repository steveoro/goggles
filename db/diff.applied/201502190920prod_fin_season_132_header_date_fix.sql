-- Begin script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;
SET AUTOCOMMIT=0;
START TRANSACTION;

-- Fix FIN season 132, wrong header_date:
UPDATE meetings SET `header_date` = '2013-12-14' WHERE id = 13245;
UPDATE meeting_sessions SET `scheduled_date` = '2013-12-14' where meeting_id = 13245;

UPDATE meetings SET `header_date` = '2013-12-15' WHERE id IN (13246, 13248);
UPDATE meeting_sessions SET `scheduled_date` = '2013-12-15' WHERE meeting_id IN (13246, 13248);

-- Fix FIN season 132, extra meeting:
DELETE FROM meeting_sessions WHERE meeting_id = 13247;
DELETE FROM meetings WHERE id = 13247;

COMMIT;
-- End script
