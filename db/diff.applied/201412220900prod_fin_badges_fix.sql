-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- [Steve, 20141223] Missing T.A.:
INSERT INTO `goggles`.`team_affiliations` (`id`, `lock_version`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
VALUES ('331', '0', 'ACQUAVIVA 2001', '0', '12', '132', '1', '2014-11-16 18:38:00', '2014-11-16 18:38:00', '1');
INSERT INTO `goggles`.`team_affiliations` (`id`, `lock_version`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
VALUES ('445', '0', 'AS MOLINELLA NUOTO', '0', '2', '132', '1', '2014-11-17 18:56:42', '2014-11-17 18:56:42', '1');
INSERT INTO `goggles`.`team_affiliations` (`id`, `lock_version`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
VALUES ('446', '0', 'NUOVO NUOTO', '0', '7', '132', '1', '2014-11-17 18:56:50', '2014-11-17 18:56:50', '1');


-- Fix null team affiliation in badges
update badges b
set b.team_affiliation_id = (select ta.id from team_affiliations ta where ta.team_id = b.team_id and ta.season_id = b.season_id)
where b.team_affiliation_id is null;

COMMIT;
-- Fine script
