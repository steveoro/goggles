-- Leega
-- CSI Nuoto Ober Ferarri Goggle Cup definition for 2016
-- Begin script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

--
-- Dump dei dati del 2016 per la tabella goggle_cups
-- 
INSERT INTO goggle_cups (description,max_points,season_year,max_performance,user_id,team_id,lock_version,created_at,updated_at) VALUES 
('Ober Cup 2016',1000,2016,5,2,1,0,CURDATE(),CURDATE());

--
-- Dump dei dati 2016 per la tabella goggle_cup_definitions
-- 
INSERT INTO goggle_cup_definitions (goggle_cup_id,season_id,lock_version,created_at,updated_at) VALUES 
((select t.id from goggle_cups t where t.season_year = 2016  AND t.team_id = 1),151,0,CURDATE(),CURDATE()),
((select t.id from goggle_cups t where t.season_year = 2016  AND t.team_id = 1),152,0,CURDATE(),CURDATE()),
((select t.id from goggle_cups t where t.season_year = 2016  AND t.team_id = 1),144,0,CURDATE(),CURDATE());

COMMIT;
-- End script