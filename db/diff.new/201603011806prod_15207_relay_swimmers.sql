--
-- Aggiunta dati Meeting 15207 per la tabella meeting_relay_swimmers
-- 
INSERT INTO meeting_relay_swimmers (relay_order,swimmer_id,minutes,seconds,hundreds,user_id,reaction_time,meeting_relay_result_id,badge_id,stroke_type_id,lock_version,created_at,updated_at) VALUES 
(1,1788,0,37,12,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 1788),(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(2,1409,0,36,53,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 1409),(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(3,23,0,31,55,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 23),(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(4,1843,0,33,12,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 1843),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(1,98,0,42,22,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 98),(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(2,192,0,45,52,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 192),(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(3,142,0,32,0,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 142),(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(4,1227,0,28,9,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50MI' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 1227),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(1,1016,0,33,28,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50SL' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 1016),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(2,11732,0,37,67,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50SL' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 11732),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(3,1843,0,32,17,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50SL' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 1843),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(4,1463,0,33,20,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50SL' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '120-159' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 1463),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(1,142,0,29,63,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50SL' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 142),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(2,98,0,36,4,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50SL' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 98),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(3,1788,0,29,97,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50SL' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 1788),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(4,1227,0,28,39,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'M4X50SL' and ms.meeting_id = 15207 and gt.code = 'X' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 1227),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(1,1843,0,33,78,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'S4X50SL' and ms.meeting_id = 15207 and gt.code = 'F' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 1843),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(2,11732,0,37,71,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'S4X50SL' and ms.meeting_id = 15207 and gt.code = 'F' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 11732),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(3,468,0,40,37,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'S4X50SL' and ms.meeting_id = 15207 and gt.code = 'F' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 468),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(4,1788,0,29,99,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'S4X50SL' and ms.meeting_id = 15207 and gt.code = 'F' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 1788),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(1,503,0,41,73,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'S4X50SL' and ms.meeting_id = 15207 and gt.code = 'F' and ct.code = '120-159' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 503),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(2,550,0,39,65,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'S4X50SL' and ms.meeting_id = 15207 and gt.code = 'F' and ct.code = '120-159' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 550),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(3,192,0,40,3,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'S4X50SL' and ms.meeting_id = 15207 and gt.code = 'F' and ct.code = '120-159' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 192),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(4,98,0,35,44,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'S4X50SL' and ms.meeting_id = 15207 and gt.code = 'F' and ct.code = '120-159' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 98),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(1,142,0,28,93,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'S4X50SL' and ms.meeting_id = 15207 and gt.code = 'M' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 142),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(2,1409,0,29,96,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'S4X50SL' and ms.meeting_id = 15207 and gt.code = 'M' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 1409),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(3,23,0,28,62,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'S4X50SL' and ms.meeting_id = 15207 and gt.code = 'M' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 23),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(4,1227,0,28,7,2,0,(select mrr.id from meeting_relay_results mrr join meeting_programs mp on mp.id = mrr.meeting_program_id join meeting_events me on me.id = mp.meeting_event_id join event_types et on et.id = me.event_type_id join meeting_sessions ms on ms.id = me.meeting_session_id join gender_types gt on gt.id = mp.gender_type_id join category_types ct on ct.id = mp.category_type_id where et.code = 'S4X50SL' and ms.meeting_id = 15207 and gt.code = 'M' and ct.code = '160-199' and mrr.relay_header = 'CSI Nuoto Ober Ferrari'),(select b.id from badges b where b.team_id = 1 and b.season_id = (select m.season_id from meetings m where m.id = 15207) and b.swimmer_id = 1227),(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE());
