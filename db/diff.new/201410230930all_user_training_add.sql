-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;
-- Fase di cancellazione
DELETE FROM user_training_rows WHERE user_training_id = (select t.id from user_trainings t where t.description = 'MC1 Set 06.1 tecnica serale by Tino');
DELETE FROM user_training_stories WHERE user_training_id = (select t.id from user_trainings t where t.description = 'MC1 Set 06.1 tecnica serale by Tino');
DELETE FROM user_trainings WHERE description = 'MC1 Set 06.1 tecnica serale by Tino';

-- Fase di inserimento
--
-- Aggiunta dati per la tabella user_trainings
-- 
INSERT INTO user_trainings (description,user_id,lock_version,created_at,updated_at) VALUES 
('MC1 Set 06.1 tecnica serale by Tino',2,0,CURDATE(),CURDATE());
-- Fine dati tabella user_trainings

--
-- Agiunta dei dati per la tabella user_training_stories
-- 
INSERT INTO user_training_stories (swam_date,total_training_time,notes,user_training_id,swimming_pool_id,swimmer_level_type_id,user_id,lock_version,created_at,updated_at) VALUES 
('2014-10-13',2820,'Dita aperte. Pausa avanti',(select t.id from user_trainings t where t.description = 'MC1 Set 06.1 tecnica serale by Tino'),(select t.id from swimming_pools t where t.nick_name = 'reggiocomunale50'),(select t.id from swimmer_level_types t where t.code = 'MX'),2,0,CURDATE(),CURDATE());
-- Fine dati tabella user_training_stories

--
-- Aggiunta dei dati per la tabella user_training_rows
-- 
INSERT INTO user_training_rows (part_order,times,distance,start_and_rest,pause,group_id,group_times,group_start_and_rest,group_pause,user_training_id,exercise_id,training_step_type_id,arm_aux_type_id,kick_aux_type_id,body_aux_type_id,breath_aux_type_id,lock_version,created_at,updated_at) VALUES 
(1,1,400,0,0,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 06.1 tecnica serale by Tino'),(select t.id from exercises t where t.code = 'A1PIAC'),(select t.id from training_step_types t where t.code = 'R'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(2,8,50,55,0,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 06.1 tecnica serale by Tino'),(select t.id from exercises t where t.code = 'A2SLCM'),(select t.id from training_step_types t where t.code = 'A'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(3,2,50,0,15,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 06.1 tecnica serale by Tino'),(select t.id from exercises t where t.code = 'CGSFDO'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(4,2,50,0,15,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 06.1 tecnica serale by Tino'),(select t.id from exercises t where t.code = 'ECDOBG'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(5,2,50,0,15,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 06.1 tecnica serale by Tino'),(select t.id from exercises t where t.code = 'A2GGRA'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(6,2,50,0,15,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 06.1 tecnica serale by Tino'),(select t.id from exercises t where t.code = 'ESRAGS'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(7,1,100,0,15,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 06.1 tecnica serale by Tino'),(select t.id from exercises t where t.code = 'A2DOCM'),(select t.id from training_step_types t where t.code = 'D'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(8,1,100,0,15,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 06.1 tecnica serale by Tino'),(select t.id from exercises t where t.code = 'A2RACM'),(select t.id from training_step_types t where t.code = 'D'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE());

COMMIT;
-- Fine script
