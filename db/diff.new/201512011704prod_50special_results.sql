/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Leega
-- 50 Special event

-- Create 50 special heat type
INSERT INTO heat_types (id,code,lock_version,created_at,updated_at) VALUES (5,'P',0,CURDATE(),CURDATE());

-- Create 50 special category type
INSERT INTO category_types (id,code,description,short_name,season_id,federation_code,group_name,age_begin,age_end,is_a_relay,is_out_of_race,lock_version,created_at,updated_at) VALUES 
(934,'50S','50 SPECIAL','50S',151,'S','MASTER',20,99,0,0,0,CURDATE(),CURDATE());
update category_types set is_out_of_race = 0 where id = 904;

-- Create meeting event
INSERT INTO meeting_events (event_order,begin_time,is_out_of_race,user_id,meeting_session_id,event_type_id,heat_type_id,lock_version,created_at,updated_at) VALUES 
(6,'00:00:00',0,2,(select t.id from meeting_sessions t where t.meeting_id = 15101 and t.session_order = 1),(select t.id from event_types t where t.code = '50DO'),(select t.id from heat_types t where t.code = 'P'),0,CURDATE(),CURDATE());

-- Create meeting programs
INSERT INTO meeting_programs (event_order,user_id,meeting_event_id,gender_type_id,category_type_id,pool_type_id,lock_version,created_at,updated_at) VALUES 
(6,2,(select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id join event_types et on et.id = me.event_type_id where ms.meeting_id = 15101 and et.code = '50DO'),(select t.id from gender_types t where t.code = 'F'),(select t.id from category_types t where t.code = '50S' and t.season_id = 151),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(6,2,(select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id join event_types et on et.id = me.event_type_id where ms.meeting_id = 15101 and et.code = '50DO'),(select t.id from gender_types t where t.code = 'M'),(select t.id from category_types t where t.code = '50S' and t.season_id = 151),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE());

-- Create meeting individual results
INSERT INTO meeting_individual_results (rank,standard_points,minutes,seconds,hundreds,team_points,swimmer_id,team_id,user_id,is_disqualified,is_out_of_race,goggle_cup_points,reaction_time,meeting_program_id,badge_id,team_affiliation_id,lock_version,created_at,updated_at) VALUES 
(1,0,0,36,70,21,1841,1,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'F' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1841 and b.team_id = 1 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE()),
(2,0,0,37,30,18,1621,5,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'F' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1621 and b.team_id = 5 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE()),
(3,0,0,42,10,15,120,4,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'F' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 120 and b.team_id = 4 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE()),
(4,0,0,43,10,12,1709,21,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'F' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1709 and b.team_id = 21 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE()),
(5,0,0,43,30,9,1674,10,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'F' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1674 and b.team_id = 10 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE()),
(6,0,0,45,70,6,1226,18,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'F' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1226 and b.team_id = 18 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE()),
(7,0,0,51,60,3,11732,35,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'F' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 11732 and b.team_id = 35 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE()),
(8,0,0,59,80,2,20998,17,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'F' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 20998 and b.team_id = 17 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE());

INSERT INTO meeting_individual_results (rank,standard_points,minutes,seconds,hundreds,team_points,swimmer_id,team_id,user_id,is_disqualified,is_out_of_race,goggle_cup_points,reaction_time,meeting_program_id,badge_id,team_affiliation_id,lock_version,created_at,updated_at) VALUES 
(1,0,0,30,10,21,4806,21,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'M' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 4806 and b.team_id = 21 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE()),
(2,0,0,30,30,18,1448,17,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'M' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1448 and b.team_id = 17 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE()),
(3,0,0,30,80,15,1496,1,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'M' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1496 and b.team_id = 1 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE()),
(4,0,0,34,20,12,1531,32,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'M' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1531 and b.team_id = 32 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE()),
(5,0,0,34,20,9,638,10,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'M' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 638 and b.team_id = 10 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE()),
(6,0,0,34,20,6,1164,5,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'M' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1164 and b.team_id = 5 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE()),
(7,0,0,37,60,3,25,4,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50DO' and ms.meeting_id = 15101 and gt.code = 'M' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 25 and b.team_id = 4 and m.id = 15101),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15101),0,CURDATE(),CURDATE());

commit;