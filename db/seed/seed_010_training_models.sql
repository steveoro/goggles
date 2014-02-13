SET AUTOCOMMIT=0;
START TRANSACTION;

-- Ripulisco in giro
delete from training_rows;
delete from trainings;

--
-- Dump dei dati per la tabella trainings
-- 
INSERT INTO trainings (id,title,description,min_swimmer_level,max_swimmer_level,user_id,lock_version,created_at,updated_at) VALUES 
(1,'Allenamento tipo','Allenamento con esercizi semplici ed esercizi composti e persino con esercizi con distanza forzata',40,100,2,0,CURDATE(),CURDATE()),
(2,'Allenamento sega','Nuotata della minchia, un 1500 a piacere',20,50,2,0,CURDATE(),CURDATE()),
(3,'Aerobico tipo','Allenamento con esercizi semplici ed esercizi composti e predisposizione per i gruppi',40,100,2,0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella training_rows
-- 
INSERT INTO training_rows (id,part_order,times,distance,start_and_rest,pause,group_id,group_times,group_start_and_rest,group_pause,training_id,exercise_id,training_step_type_id,lock_version,created_at,updated_at) VALUES 
(1,1,1,300,0,0,0,0,0,0,(select t.id from trainings t where t.title = 'Allenamento tipo'),(select t.id from exercises t where t.code = 'A1PIAC'),(select t.id from training_step_types t where t.code = 'R'),0,CURDATE(),CURDATE()),
(2,2,4,50,60,0,0,0,0,0,(select t.id from trainings t where t.title = 'Allenamento tipo'),(select t.id from exercises t where t.code = 'ECSLPG'),(select t.id from training_step_types t where t.code = 'T'),0,CURDATE(),CURDATE()),
(3,3,2,50,60,0,0,0,0,0,(select t.id from trainings t where t.title = 'Allenamento tipo'),(select t.id from exercises t where t.code = 'ACSLCP'),(select t.id from training_step_types t where t.code = 'T'),0,CURDATE(),CURDATE()),
(4,4,2,50,0,0,0,0,0,0,(select t.id from trainings t where t.title = 'Allenamento tipo'),(select t.id from exercises t where t.code = 'ACSLDA'),(select t.id from training_step_types t where t.code = 'T'),0,CURDATE(),CURDATE()),
(5,5,6,50,60,0,0,0,0,0,(select t.id from trainings t where t.title = 'Allenamento tipo'),(select t.id from exercises t where t.code = 'COSLFA'),(select t.id from training_step_types t where t.code = 'A'),0,CURDATE(),CURDATE()),
(6,6,3,300,0,60,0,0,0,0,(select t.id from trainings t where t.title = 'Allenamento tipo'),(select t.id from exercises t where t.code = 'C1SLL3'),(select t.id from training_step_types t where t.code = 'C'),0,CURDATE(),CURDATE()),
(7,7,6,50,75,0,0,0,0,0,(select t.id from trainings t where t.title = 'Allenamento tipo'),(select t.id from exercises t where t.code = 'CGSLRA'),(select t.id from training_step_types t where t.code = 'D'),0,CURDATE(),CURDATE()),
(8,8,1,200,0,0,0,0,0,0,(select t.id from trainings t where t.title = 'Allenamento tipo'),(select t.id from exercises t where t.code = 'A1PIAC'),(select t.id from training_step_types t where t.code = 'D'),0,CURDATE(),CURDATE()),
(9,1,1,1500,0,0,0,0,0,0,(select t.id from trainings t where t.title = 'Allenamento sega'),(select t.id from exercises t where t.code = 'A1PIAC'),(select t.id from training_step_types t where t.code = 'C'),0,CURDATE(),CURDATE()),
(10,1,1,300,0,0,0,0,0,0,(select t.id from trainings t where t.title = 'Aerobico tipo'),(select t.id from exercises t where t.code = 'A1PIAC'),(select t.id from training_step_types t where t.code = 'R'),0,CURDATE(),CURDATE()),
(11,2,4,50,60,0,0,0,0,0,(select t.id from trainings t where t.title = 'Aerobico tipo'),(select t.id from exercises t where t.code = 'ECSLAA'),(select t.id from training_step_types t where t.code = 'T'),0,CURDATE(),CURDATE()),
(12,3,2,50,60,0,0,0,0,0,(select t.id from trainings t where t.title = 'Aerobico tipo'),(select t.id from exercises t where t.code = 'ACSLCP'),(select t.id from training_step_types t where t.code = 'T'),0,CURDATE(),CURDATE()),
(13,4,2,50,0,0,0,0,0,0,(select t.id from trainings t where t.title = 'Aerobico tipo'),(select t.id from exercises t where t.code = 'ACSLDA'),(select t.id from training_step_types t where t.code = 'T'),0,CURDATE(),CURDATE()),
(14,5,4,50,60,0,0,0,0,0,(select t.id from trainings t where t.title = 'Aerobico tipo'),(select t.id from exercises t where t.code = 'A2FACM'),(select t.id from training_step_types t where t.code = 'A'),0,CURDATE(),CURDATE()),
(15,6,1,200,210,0,1,5,0,0,(select t.id from trainings t where t.title = 'Aerobico tipo'),(select t.id from exercises t where t.code = 'A2MICM'),(select t.id from training_step_types t where t.code = 'C'),0,CURDATE(),CURDATE()),
(16,7,1,200,195,0,1,5,0,0,(select t.id from trainings t where t.title = 'Aerobico tipo'),(select t.id from exercises t where t.code = 'A2SLCM'),(select t.id from training_step_types t where t.code = 'C'),0,CURDATE(),CURDATE()),
(17,8,1,200,0,0,0,0,0,0,(select t.id from trainings t where t.title = 'Aerobico tipo'),(select t.id from exercises t where t.code = 'A1PIAC'),(select t.id from training_step_types t where t.code = 'D'),0,CURDATE(),CURDATE());

COMMIT;
