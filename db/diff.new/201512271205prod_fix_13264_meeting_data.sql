/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Leega
-- 27/12/2015
-- Fix wrong meeting data for Regionali Trentino alto adige
update meetings
set code = 'regtrentinoaltoadige', description = 'REGIONALI TRENTINO-ALTO ADIGE'
where id = 13264;

commit;