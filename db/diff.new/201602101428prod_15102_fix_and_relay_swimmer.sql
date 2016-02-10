-- Leega
-- 10/02/2016
-- Fix for 15102 50Special

delete from meeting_individual_results where meeting_program_id = (select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 15102 and gt.code = 'F' and ct.code = '50S');
delete from meeting_individual_results where meeting_program_id = (select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 15102 and gt.code = 'M' and ct.code = '50S');

--
-- Aggiunta dati 50Special 15102 - meeting_individual_results
-- 
INSERT INTO meeting_individual_results (rank,standard_points,minutes,seconds,hundreds,team_points,swimmer_id,team_id,user_id,is_disqualified,is_out_of_race,goggle_cup_points,reaction_time,meeting_program_id,badge_id,team_affiliation_id,lock_version,created_at,updated_at) VALUES 
(1,'0',0,34,90,'24',1491,1,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 15102 and gt.code = 'F' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1491 and b.team_id = 1 and m.id = 15102),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15102),0,CURDATE(),CURDATE()),
(2,'0',0,39,20,'21',1449,9,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 15102 and gt.code = 'F' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1449 and b.team_id = 9 and m.id = 15102),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 9 and m.id = 15102),0,CURDATE(),CURDATE()),
(3,'0',0,39,50,'18',984,11,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 15102 and gt.code = 'F' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 984 and b.team_id = 11 and m.id = 15102),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 11 and m.id = 15102),0,CURDATE(),CURDATE()),
(4,'0',0,44,0,'15',11731,17,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 15102 and gt.code = 'F' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 11731 and b.team_id = 17 and m.id = 15102),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 17 and m.id = 15102),0,CURDATE(),CURDATE()),
(5,'0',0,46,20,'12',1807,18,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 15102 and gt.code = 'F' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1807 and b.team_id = 18 and m.id = 15102),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 18 and m.id = 15102),0,CURDATE(),CURDATE()),
(6,'0',0,48,50,'9',21030,826,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 15102 and gt.code = 'F' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 21030 and b.team_id = 826 and m.id = 15102),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 826 and m.id = 15102),0,CURDATE(),CURDATE()),
(1,'0',0,34,50,'24',1060,17,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 15102 and gt.code = 'M' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1060 and b.team_id = 17 and m.id = 15102),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 17 and m.id = 15102),0,CURDATE(),CURDATE()),
(2,'0',0,35,30,'21',1531,32,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 15102 and gt.code = 'M' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1531 and b.team_id = 32 and m.id = 15102),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 32 and m.id = 15102),0,CURDATE(),CURDATE()),
(3,'0',0,37,0,'18',25,4,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 15102 and gt.code = 'M' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 25 and b.team_id = 4 and m.id = 15102),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 4 and m.id = 15102),0,CURDATE(),CURDATE()),
(4,'0',0,39,80,'15',1496,1,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 15102 and gt.code = 'M' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1496 and b.team_id = 1 and m.id = 15102),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 1 and m.id = 15102),0,CURDATE(),CURDATE()),
(5,'0',0,40,80,'12',1475,18,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 15102 and gt.code = 'M' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1475 and b.team_id = 18 and m.id = 15102),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 18 and m.id = 15102),0,CURDATE(),CURDATE()),
(6,'0',0,41,40,'9',1680,9,2,0,0,0,0,(select mp.id from meeting_programs mp join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = '50RA' and ms.meeting_id = 15102 and gt.code = 'M' and ct.code = '50S'),(select b.id from badges b join seasons s on s.id = b.season_id join meetings m on m.season_id = s.id where b.swimmer_id = 1680 and b.team_id = 9 and m.id = 15102),(select ta.id from team_affiliations ta join seasons s on s.id = ta.season_id join meetings m on m.season_id = s.id where ta.team_id = 9 and m.id = 15102),0,CURDATE(),CURDATE());

-- Recalculate meeting scores
delete from meeting_team_scores where meeting_id = 15102;

--
-- Team scores calculation for Meeting 3A PROVA REGIONALE CSI 2015/2016
-- 10 February 2016 14:21:27
-- Begin script
--

INSERT INTO `meeting_team_scores` (`id`, `sum_individual_points`, `sum_relay_points`, `team_id`, `meeting_id`, `created_at`, `updated_at`, `rank`, `user_id`, `sum_team_points`, `meeting_individual_points`, `meeting_relay_points`, `meeting_team_points`, `season_individual_points`, `season_relay_points`, `season_team_points`, `season_id`, `team_affiliation_id`)
  VALUES (NULL, 235.0, 0.0, 32, 15102, curdate(), curdate(), 0, 2, 30.0, 235.0, 0.0, 30.0, 235.0, 0.0, 30.0, 151, NULL);
INSERT INTO `meeting_team_scores` (`id`, `sum_individual_points`, `sum_relay_points`, `team_id`, `meeting_id`, `created_at`, `updated_at`, `rank`, `user_id`, `sum_team_points`, `meeting_individual_points`, `meeting_relay_points`, `meeting_team_points`, `season_individual_points`, `season_relay_points`, `season_team_points`, `season_id`, `team_affiliation_id`)
  VALUES (NULL, 883.0, 57.0, 17, 15102, curdate(), curdate(), 0, 2, 0.0, 883.0, 57.0, 0.0, 883.0, 57.0, 0.0, 151, NULL);
INSERT INTO `meeting_team_scores` (`id`, `sum_individual_points`, `sum_relay_points`, `team_id`, `meeting_id`, `created_at`, `updated_at`, `rank`, `user_id`, `sum_team_points`, `meeting_individual_points`, `meeting_relay_points`, `meeting_team_points`, `season_individual_points`, `season_relay_points`, `season_team_points`, `season_id`, `team_affiliation_id`)
  VALUES (NULL, 442.0, 33.0, 9, 15102, curdate(), curdate(), 0, 2, 18.0, 442.0, 33.0, 18.0, 442.0, 33.0, 18.0, 151, NULL);
INSERT INTO `meeting_team_scores` (`id`, `sum_individual_points`, `sum_relay_points`, `team_id`, `meeting_id`, `created_at`, `updated_at`, `rank`, `user_id`, `sum_team_points`, `meeting_individual_points`, `meeting_relay_points`, `meeting_team_points`, `season_individual_points`, `season_relay_points`, `season_team_points`, `season_id`, `team_affiliation_id`)
  VALUES (NULL, 480.0, 57.0, 11, 15102, curdate(), curdate(), 0, 2, 16.0, 480.0, 57.0, 16.0, 480.0, 57.0, 16.0, 151, NULL);
INSERT INTO `meeting_team_scores` (`id`, `sum_individual_points`, `sum_relay_points`, `team_id`, `meeting_id`, `created_at`, `updated_at`, `rank`, `user_id`, `sum_team_points`, `meeting_individual_points`, `meeting_relay_points`, `meeting_team_points`, `season_individual_points`, `season_relay_points`, `season_team_points`, `season_id`, `team_affiliation_id`)
  VALUES (NULL, 633.0, 60.0, 1, 15102, curdate(), curdate(), 0, 2, 10.0, 633.0, 60.0, 10.0, 633.0, 60.0, 10.0, 151, NULL);
INSERT INTO `meeting_team_scores` (`id`, `sum_individual_points`, `sum_relay_points`, `team_id`, `meeting_id`, `created_at`, `updated_at`, `rank`, `user_id`, `sum_team_points`, `meeting_individual_points`, `meeting_relay_points`, `meeting_team_points`, `season_individual_points`, `season_relay_points`, `season_team_points`, `season_id`, `team_affiliation_id`)
  VALUES (NULL, 450.0, 21.0, 18, 15102, curdate(), curdate(), 0, 2, 15.0, 450.0, 21.0, 15.0, 450.0, 21.0, 15.0, 151, NULL);
INSERT INTO `meeting_team_scores` (`id`, `sum_individual_points`, `sum_relay_points`, `team_id`, `meeting_id`, `created_at`, `updated_at`, `rank`, `user_id`, `sum_team_points`, `meeting_individual_points`, `meeting_relay_points`, `meeting_team_points`, `season_individual_points`, `season_relay_points`, `season_team_points`, `season_id`, `team_affiliation_id`)
  VALUES (NULL, 85.0, 8.0, 826, 15102, curdate(), curdate(), 0, 2, 27.0, 85.0, 8.0, 27.0, 85.0, 8.0, 27.0, 151, NULL);
INSERT INTO `meeting_team_scores` (`id`, `sum_individual_points`, `sum_relay_points`, `team_id`, `meeting_id`, `created_at`, `updated_at`, `rank`, `user_id`, `sum_team_points`, `meeting_individual_points`, `meeting_relay_points`, `meeting_team_points`, `season_individual_points`, `season_relay_points`, `season_team_points`, `season_id`, `team_affiliation_id`)
  VALUES (NULL, 142.0, 15.0, 4, 15102, curdate(), curdate(), 0, 2, 31.0, 142.0, 15.0, 31.0, 142.0, 15.0, 31.0, 151, NULL);
INSERT INTO `meeting_team_scores` (`id`, `sum_individual_points`, `sum_relay_points`, `team_id`, `meeting_id`, `created_at`, `updated_at`, `rank`, `user_id`, `sum_team_points`, `meeting_individual_points`, `meeting_relay_points`, `meeting_team_points`, `season_individual_points`, `season_relay_points`, `season_team_points`, `season_id`, `team_affiliation_id`)
  VALUES (NULL, 98.0, 9.0, 290, 15102, curdate(), curdate(), 0, 2, 32.0, 98.0, 9.0, 32.0, 98.0, 9.0, 32.0, 151, NULL);
INSERT INTO `meeting_team_scores` (`id`, `sum_individual_points`, `sum_relay_points`, `team_id`, `meeting_id`, `created_at`, `updated_at`, `rank`, `user_id`, `sum_team_points`, `meeting_individual_points`, `meeting_relay_points`, `meeting_team_points`, `season_individual_points`, `season_relay_points`, `season_team_points`, `season_id`, `team_affiliation_id`)
  VALUES (NULL, 36.0, 0.0, 35, 15102, curdate(), curdate(), 0, 2, 36.0, 36.0, 0.0, 36.0, 36.0, 0.0, 36.0, 151, NULL);
INSERT INTO `meeting_team_scores` (`id`, `sum_individual_points`, `sum_relay_points`, `team_id`, `meeting_id`, `created_at`, `updated_at`, `rank`, `user_id`, `sum_team_points`, `meeting_individual_points`, `meeting_relay_points`, `meeting_team_points`, `season_individual_points`, `season_relay_points`, `season_team_points`, `season_id`, `team_affiliation_id`)
  VALUES (NULL, 80.0, 0.0, 10, 15102, curdate(), curdate(), 0, 2, 34.0, 80.0, 0.0, 34.0, 80.0, 0.0, 34.0, 151, NULL);
INSERT INTO `meeting_team_scores` (`id`, `sum_individual_points`, `sum_relay_points`, `team_id`, `meeting_id`, `created_at`, `updated_at`, `rank`, `user_id`, `sum_team_points`, `meeting_individual_points`, `meeting_relay_points`, `meeting_team_points`, `season_individual_points`, `season_relay_points`, `season_team_points`, `season_id`, `team_affiliation_id`)
  VALUES (NULL, 26.0, 0.0, 827, 15102, curdate(), curdate(), 0, 2, 37.0, 26.0, 0.0, 37.0, 26.0, 0.0, 37.0, 151, NULL);

-- Team scores calculation for Meeting 3A PROVA REGIONALE CSI 2015/2016 done
-- Script ended

--
-- Aggiunta dati staffette meeting 15102
-- 
INSERT INTO meeting_relay_swimmers (relay_order,swimmer_id,minutes,seconds,hundreds,user_id,reaction_time,meeting_relay_result_id,badge_id,stroke_type_id,lock_version,created_at,updated_at) VALUES 
(1,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'ZULIANI MATTEO' and b.team_id = 1 and b.season_id = 151),0,31,12,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '001-119' and mrr.relay_header = '' and mrr.rank = 1),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'ZULIANI MATTEO' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(2,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'NASI NICOLE' and b.team_id = 1 and b.season_id = 151),0,34,18,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '001-119' and mrr.relay_header = '' and mrr.rank = 1),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'NASI NICOLE' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(3,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'VALCAVI LUCA' and b.team_id = 1 and b.season_id = 151),0,29,53,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '001-119' and mrr.relay_header = '' and mrr.rank = 1),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'VALCAVI LUCA' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(4,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'PESARE REBECCA' and b.team_id = 1 and b.season_id = 151),0,30,1,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '001-119' and mrr.relay_header = '' and mrr.rank = 1),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'PESARE REBECCA' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(1,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'PEZZI STEFANIA' and b.team_id = 1 and b.season_id = 151),0,39,10,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = '' and mrr.rank = 4),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'PEZZI STEFANIA' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(2,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'BURANI PIETRO' and b.team_id = 1 and b.season_id = 151),0,35,51,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = '' and mrr.rank = 4),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'BURANI PIETRO' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(3,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'LIGABUE MARCO' and b.team_id = 1 and b.season_id = 151),0,31,82,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = '' and mrr.rank = 4),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'LIGABUE MARCO' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(4,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'BUDASSI VALENTINA' and b.team_id = 1 and b.season_id = 151),0,32,92,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = '' and mrr.rank = 4),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'BUDASSI VALENTINA' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(1,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'SESENA BARBARA' and b.team_id = 1 and b.season_id = 151),0,43,37,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = '' and mrr.rank = 7),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'SESENA BARBARA' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(2,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'FORMENTINI DAVIDE' and b.team_id = 1 and b.season_id = 151),0,39,75,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = '' and mrr.rank = 7),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'FORMENTINI DAVIDE' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(3,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'RONZONI ALESSANDRO' and b.team_id = 1 and b.season_id = 151),0,35,26,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = '' and mrr.rank = 7),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'RONZONI ALESSANDRO' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(4,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'TOFFANETTI LAURA' and b.team_id = 1 and b.season_id = 151),0,40,66,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = '' and mrr.rank = 7),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'TOFFANETTI LAURA' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(1,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'VEZZANI GIORGIA' and b.team_id = 1 and b.season_id = 151),0,40,42,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999' and mrr.relay_header = '' and mrr.rank = 2),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'VEZZANI GIORGIA' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(2,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'BIANCHI ELENA' and b.team_id = 1 and b.season_id = 151),0,44,28,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999' and mrr.relay_header = '' and mrr.rank = 2),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'BIANCHI ELENA' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(3,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'ALLORO STEFANO' and b.team_id = 1 and b.season_id = 151),0,32,4,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999' and mrr.relay_header = '' and mrr.rank = 2),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'ALLORO STEFANO' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(4,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'BERTOZZI ORLANDO' and b.team_id = 1 and b.season_id = 151),0,27,72,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999' and mrr.relay_header = '' and mrr.rank = 2),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'BERTOZZI ORLANDO' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(1,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'SARAVO CRISTIAN' and b.team_id = 1 and b.season_id = 151),0,38,85,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999' and mrr.relay_header = '' and mrr.rank = 6),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'SARAVO CRISTIAN' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(2,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'FERRARI ALESSIA' and b.team_id = 1 and b.season_id = 151),0,44,58,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999' and mrr.relay_header = '' and mrr.rank = 6),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'FERRARI ALESSIA' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(3,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'ORLANDINI IDO PIERALDO' and b.team_id = 1 and b.season_id = 151),0,37,3,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999' and mrr.relay_header = '' and mrr.rank = 6),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'ORLANDINI IDO PIERALDO' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(4,(select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'LEONARDI ELISA' and b.team_id = 1 and b.season_id = 151),0,41,64,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15102 and gt.code = 'X' and ct.code = '160-999' and mrr.relay_header = '' and mrr.rank = 6),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15102) and b.swimmer_id = (select b.swimmer_id from badges b join swimmers s on s.id = b.swimmer_id where s.complete_name = 'LEONARDI ELISA' and b.team_id = 1 and b.season_id = 151)),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE());
