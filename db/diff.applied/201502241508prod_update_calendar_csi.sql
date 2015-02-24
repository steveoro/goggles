-- Calendar for CSI prova4
update meeting_sessions ms set ms.warm_up_time = '14:15:00', ms.begin_time = '14:50:00', ms.day_part_type_id = 2 where ms.id = 615;
update meetings m set m.has_start_list = true where m.id = 14104;
