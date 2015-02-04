-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Elimino i dati vecchi
delete from meeting_team_scores where meeting_id = 14102;

--
-- Dump dei dati per la tabella meeting_team_scores
-- 
INSERT INTO meeting_team_scores (id,meeting_id,team_id,meeting_individual_points,meeting_relay_points,meeting_team_points,sum_individual_points,sum_relay_points,sum_team_points,season_individual_points,season_relay_points,season_team_points,user_id,season_id,team_affiliation_id,lock_version,created_at,updated_at) VALUES 
(1062,14101,5,'438','78','14','0','0','0','438','78','14',2,(select m.season_id from meetings m where m.id = 14101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 5 and m.id = 14101),0,CURDATE(),CURDATE()),
(1063,14101,1,'568','108','4','0','0','0','568','108','4',2,(select m.season_id from meetings m where m.id = 14101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 14101),0,CURDATE(),CURDATE()),
(1064,14101,4,'50','0','41','0','0','0','50','0','41',2,(select m.season_id from meetings m where m.id = 14101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 4 and m.id = 14101),0,CURDATE(),CURDATE()),
(1065,14101,35,'166','3','32','0','0','0','166','3','32',2,(select m.season_id from meetings m where m.id = 14101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 35 and m.id = 14101),0,CURDATE(),CURDATE()),
(1066,14101,11,'426','62','12','0','0','0','426','62','12',2,(select m.season_id from meetings m where m.id = 14101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 11 and m.id = 14101),0,CURDATE(),CURDATE()),
(1067,14101,18,'366','41','11','0','0','0','366','41','11',2,(select m.season_id from meetings m where m.id = 14101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 18 and m.id = 14101),0,CURDATE(),CURDATE()),
(1068,14101,10,'544','81','2','0','0','0','544','81','2',2,(select m.season_id from meetings m where m.id = 14101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 10 and m.id = 14101),0,CURDATE(),CURDATE()),
(1069,14101,17,'696','63','5','0','0','0','696','63','5',2,(select m.season_id from meetings m where m.id = 14101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 17 and m.id = 14101),0,CURDATE(),CURDATE()),
(1070,14101,32,'262','51','27','0','0','0','262','51','27',2,(select m.season_id from meetings m where m.id = 14101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 32 and m.id = 14101),0,CURDATE(),CURDATE()),
(1071,14101,14,'8','0','41','0','0','0','8','0','41',2,(select m.season_id from meetings m where m.id = 14101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 14 and m.id = 14101),0,CURDATE(),CURDATE()),
(1072,14101,39,'550','40','3','0','0','0','550','40','3',2,(select m.season_id from meetings m where m.id = 14101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 39 and m.id = 14101),0,CURDATE(),CURDATE()),
(1073,14101,21,'168','24','35','0','0','0','168','24','35',2,(select m.season_id from meetings m where m.id = 14101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 21 and m.id = 14101),0,CURDATE(),CURDATE()),
(1074,14101,290,'58','3','38','0','0','0','58','3','38',2,(select m.season_id from meetings m where m.id = 14101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 290 and m.id = 14101),0,CURDATE(),CURDATE());

commit;