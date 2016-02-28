-- Leega
-- 09/02/2016
-- 15102 relay results

--
-- Dump dei dati per la tabella meeting_programs staffette
-- 
INSERT INTO meeting_programs (event_order,user_id,meeting_event_id,gender_type_id,category_type_id,pool_type_id,lock_version,created_at,updated_at) VALUES 
(1,2,(select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id join event_types et on et.id = me.event_type_id where ms.meeting_id = 15102 and et.code = 'M4X50MI'),(select t.id from gender_types t where t.code = 'X'),(select t.id from category_types t where t.code = '001-119' and t.season_id = 151),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(2,2,(select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id join event_types et on et.id = me.event_type_id where ms.meeting_id = 15102 and et.code = 'M4X50MI'),(select t.id from gender_types t where t.code = 'X'),(select t.id from category_types t where t.code = '120-159' and t.season_id = 151),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(3,2,(select me.id from meeting_events me join meeting_sessions ms on ms.id = me.meeting_session_id join event_types et on et.id = me.event_type_id where ms.meeting_id = 15102 and et.code = 'M4X50MI'),(select t.id from gender_types t where t.code = 'X'),(select t.id from category_types t where t.code = '160-999' and t.season_id = 151),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella meeting_relay_results
-- 
INSERT INTO meeting_relay_results (rank,meeting_points,minutes,seconds,hundreds,user_id,team_id,is_disqualified,is_out_of_race,meeting_program_id,team_affiliation_id,lock_version,created_at,updated_at) VALUES 
(1,'24',2,4,70,2,1,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '001-119'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15102),0,CURDATE(),CURDATE()),
(2,'21',2,7,70,2,17,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '001-119'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 17 and m.id = 15102),0,CURDATE(),CURDATE()),
(3,'18',2,15,70,2,11,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '001-119'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 11 and m.id = 15102),0,CURDATE(),CURDATE()),
(4,'0',2,26,40,2,17,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '001-119'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 17 and m.id = 15102),0,CURDATE(),CURDATE()),
(5,'12',2,37,50,2,18,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '001-119'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 18 and m.id = 15102),0,CURDATE(),CURDATE()),
(6,'9',2,38,30,2,290,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '001-119'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 290 and m.id = 15102),0,CURDATE(),CURDATE()),
(7,'6',2,44,10,2,826,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '001-119'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 826 and m.id = 15102),0,CURDATE(),CURDATE()),
(8,'0',3,5,80,2,18,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '001-119'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 18 and m.id = 15102),0,CURDATE(),CURDATE()),
(1,'24',2,12,80,2,17,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 17 and m.id = 15102),0,CURDATE(),CURDATE()),
(2,'21',2,16,80,2,11,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 11 and m.id = 15102),0,CURDATE(),CURDATE()),
(3,'0',2,19,10,2,17,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 17 and m.id = 15102),0,CURDATE(),CURDATE()),
(4,'15',2,19,20,2,1,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15102),0,CURDATE(),CURDATE()),
(5,'0',2,32,60,2,17,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 17 and m.id = 15102),0,CURDATE(),CURDATE()),
(6,'9',2,36,20,2,9,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 9 and m.id = 15102),0,CURDATE(),CURDATE()),
(7,'0',2,38,90,2,1,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15102),0,CURDATE(),CURDATE()),
(8,'3',3,24,90,2,18,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 18 and m.id = 15102),0,CURDATE(),CURDATE()),
(0,'0',0,0,0,2,18,1,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 18 and m.id = 15102),0,CURDATE(),CURDATE()),
(1,'24',2,15,90,2,9,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 9 and m.id = 15102),0,CURDATE(),CURDATE()),
(2,'21',2,24,10,2,1,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15102),0,CURDATE(),CURDATE()),
(3,'18',2,30,80,2,11,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 11 and m.id = 15102),0,CURDATE(),CURDATE()),
(4,'15',2,34,20,2,4,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 4 and m.id = 15102),0,CURDATE(),CURDATE()),
(5,'12',2,39,10,2,17,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 17 and m.id = 15102),0,CURDATE(),CURDATE()),
(6,'0',2,42,30,2,1,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15102),0,CURDATE(),CURDATE()),
(7,'6',2,42,80,2,18,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 18 and m.id = 15102),0,CURDATE(),CURDATE()),
(8,'0',2,47,80,2,17,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 17 and m.id = 15102),0,CURDATE(),CURDATE()),
(9,'0',2,47,80,2,11,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 11 and m.id = 15102),0,CURDATE(),CURDATE()),
(10,'2',3,5,30,2,826,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999'),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 826 and m.id = 15102),0,CURDATE(),CURDATE());