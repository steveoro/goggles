/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Steve
-- Add managed affiliations for User #2, Team #1, season 151 & 152 (CSI & FIN)

INSERT INTO team_managers (created_at, updated_at, team_affiliation_id, user_id)
  VALUES (NOW(), NOW(), 1539, 2), (NOW(), NOW(), 1589, 2);

COMMIT;
