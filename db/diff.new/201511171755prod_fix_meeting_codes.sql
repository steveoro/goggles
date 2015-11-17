-- Leega
-- Update meeting codes with new rules
-- Begin script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Update meeting codes with new rules for known meetings
update meetings set code = 'parmacoopernuoto' where code = 'parma';
update meetings set code = 'bolognadeakker' where code = 'bologna' and description like '%AKKER%';
update meetings set code = 'bolognanuovonuoto' where code = 'bologna' and description like '%NUOVO%';
update meetings set code = 'poggibonsi' where code like 'poggibonsi%';
update meetings set code = 'forlifanatik' where code = 'forli';
update meetings set code = 'livornoauguri' where code = 'livorno';
update meetings set code = 'bresciabrixiafidelis' where code = 'brescia' and description like '%BRIXIA%';
update meetings set code = 'bresciaeuropa' where code = 'brescia' and description like '%EUROPA%';
update meetings set code = 'bresciaeuropa' where code = 'europa' and description like '%EUROPA%';
update meetings set code = 'genovamysport' where code = 'mysport';

-- update edition on 152 season
update meetings set edition = edition + 1 where season_id = 152 and edition is not null;

COMMIT;
-- End script