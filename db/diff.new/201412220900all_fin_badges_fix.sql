-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Fix null team affiliation in badges
update badges b
set b.team_affiliation_id = (select ta.id from team_affiliations ta where ta.team_id = b.team_id and ta.season_id = b.season_id)
where b.team_affiliation_id is null

COMMIT;
-- Fine script
