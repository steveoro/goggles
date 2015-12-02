/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Leega
-- Exchange csiprova2 with csiprova3 throwing a lot of Madams
update meetings set code = 'csiprova3', description = '3A PROVA REGIONALE CSI' where id = 15102;
update meetings set code = 'csiprova2', description = '2A PROVA REGIONALE CSI' where id = 15103;

commit;