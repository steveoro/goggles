-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Start list fix for Cavallo
update meeting_entries me set me.minutes = 5, me.seconds = 30 where me.id = 3073;

commit;