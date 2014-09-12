/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Ripulisco in giro
delete from training_rows;
delete from trainings;

--
-- Dump dei dati per la tabella trainings
-- 
INSERT INTO trainings (id,title,description,min_swimmer_level,max_swimmer_level,user_id,lock_version,created_at,updated_at) VALUES 
(1,'Tecnica 400 SL e FA','Parte iniziale allenamento standard con due giri di tecnica da 400, SL e FA',50,450,2,0,CURDATE(),CURDATE()),
(2,'Tecnica 400 DO e RA','Parte iniziale allenamento standard con due giri di tecnica da 400, DO e RA',50,450,2,0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella training_rows
-- 
INSERT INTO training_rows (id,part_order,times,distance,start_and_rest,pause,group_id,group_times,group_start_and_rest,group_pause,training_id,exercise_id,training_step_type_id,arm_aux_type_id,kick_aux_type_id,body_aux_type_id,breath_aux_type_id,lock_version,created_at,updated_at) VALUES 
(1,1,1,300,0,0,0,0,0,0,(select t.id from trainings t where t.title = 'Tecnica 400 SL e FA'),(select t.id from exercises t where t.code = 'A1PIAC'),(select t.id from training_step_types t where t.code = 'R'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(2,2,4,50,60,0,0,0,0,0,(select t.id from trainings t where t.title = 'Tecnica 400 SL e FA'),(select t.id from exercises t where t.code = 'ECSLAA'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(3,3,2,50,60,0,0,0,0,0,(select t.id from trainings t where t.title = 'Tecnica 400 SL e FA'),(select t.id from exercises t where t.code = 'ACSLCP'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(4,4,2,50,0,0,0,0,0,0,(select t.id from trainings t where t.title = 'Tecnica 400 SL e FA'),(select t.id from exercises t where t.code = 'ACSLDA'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(5,5,4,50,60,0,0,0,0,0,(select t.id from trainings t where t.title = 'Tecnica 400 SL e FA'),(select t.id from exercises t where t.code = 'ECFABS'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(6,6,2,50,65,0,0,0,0,0,(select t.id from trainings t where t.title = 'Tecnica 400 SL e FA'),(select t.id from exercises t where t.code = 'ACFACP'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(7,7,2,50,0,0,0,0,0,0,(select t.id from trainings t where t.title = 'Tecnica 400 SL e FA'),(select t.id from exercises t where t.code = 'ACFADA'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(8,1,1,300,0,0,0,0,0,0,(select t.id from trainings t where t.title = 'Tecnica 400 DO e RA'),(select t.id from exercises t where t.code = 'A1PIAC'),(select t.id from training_step_types t where t.code = 'R'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(9,2,4,50,65,0,0,0,0,0,(select t.id from trainings t where t.title = 'Tecnica 400 DO e RA'),(select t.id from exercises t where t.code = 'ECDOPG'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(10,3,2,50,70,0,0,0,0,0,(select t.id from trainings t where t.title = 'Tecnica 400 DO e RA'),(select t.id from exercises t where t.code = 'ACDOCP'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(11,4,2,50,0,0,0,0,0,0,(select t.id from trainings t where t.title = 'Tecnica 400 DO e RA'),(select t.id from exercises t where t.code = 'ACDODA'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(12,5,4,50,70,0,0,0,0,0,(select t.id from trainings t where t.title = 'Tecnica 400 DO e RA'),(select t.id from exercises t where t.code = 'ECRASC'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(13,6,2,50,70,0,0,0,0,0,(select t.id from trainings t where t.title = 'Tecnica 400 DO e RA'),(select t.id from exercises t where t.code = 'ACRACP'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(14,7,2,50,0,0,0,0,0,0,(select t.id from trainings t where t.title = 'Tecnica 400 DO e RA'),(select t.id from exercises t where t.code = 'ACRADA'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE());

COMMIT;
