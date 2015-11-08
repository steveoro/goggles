-- Leega
-- CSI Nuoto Ober Ferarri Goggle Cup end dates
-- Begin script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

update goggle_cups gs
set gs.end_date = CAST((gs.season_year * 10000 + 731) as char(8));

COMMIT;
-- End script