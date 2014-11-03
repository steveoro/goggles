-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

--
-- Correzione dati piscine
-- 
update swimming_pools sp set sp.address = 'Via Vescovara', sp.name = 'Comunale', sp.nick_name = 'osimocomunale' where sp.id = 63;
update swimming_pools sp set sp.name = 'fix meeting to 54 and remove', sp.nick_name = 'fix_meeting_to_54_and_remove' where sp.id = 65;
update swimming_pools sp set sp.address = 'Via Cesare Miola, 5', sp.name = 'Comunale', sp.nick_name = 'saronnocomunale' where sp.id = 69;
update swimming_pools sp set sp.address = 'Via Amalfi,1', sp.name = 'Stadio del Nuoto', sp.nick_name = 'albengastadiodelnuoto' where sp.id = 70;
update swimming_pools sp set sp.address = 'Viale Ferrarin, 71', sp.name = 'Comunale', sp.nick_name = 'vicenzacomunale' where sp.id = 71;
update swimming_pools sp set sp.address = 'Viale dello Sport, località Bernino', sp.name = 'Comunale', sp.nick_name = 'poggibonsicomunale' where sp.id = 72;
update swimming_pools sp set sp.address = 'Via San Gaggio, 5', sp.name = 'Sociale', sp.nick_name = 'romasociale' where sp.id = 75;
update swimming_pools sp set sp.address = 'Viale del Fante, 11', sp.name = 'Comunale', sp.nick_name = 'palermocomunale' where sp.id = 80;
update swimming_pools sp set sp.address = '', sp.name = 'Comunale', sp.nick_name = 'massarosacomunale' where sp.id = 81;
update swimming_pools sp set sp.address = 'Viale Mariano Dellepiane', sp.name = 'Mariano Dellepiane', sp.nick_name = 'tortonamarianodellepiane' where sp.id = 85;
update swimming_pools sp set sp.address = 'Via Maso della Pieve', sp.name = 'Maso della Pieve', sp.nick_name = 'bolzanomasodellapieve' where sp.id = 87;
update swimming_pools sp set sp.address = 'Via I Maggio', sp.name = 'Comunale', sp.nick_name = 'buonconventocomunale' where sp.id = 93;
update swimming_pools sp set sp.address = 'Viale Giochi del Mediterraneo', sp.name = 'F. Scandone', sp.nick_name = 'napolifscandone' where sp.id = 101;

COMMIT;
-- Fine script
