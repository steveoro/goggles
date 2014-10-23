-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;
-- Fase di cancellazione
DELETE FROM user_training_rows WHERE user_training_id = (select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2');
DELETE FROM user_training_stories WHERE user_training_id = (select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2');
DELETE FROM user_trainings WHERE description = 'MC1 Set 07.2 Timido B2';

-- Fase di inserimento
--
-- Aggiunta dati per la tabella user_trainings
-- 
INSERT INTO user_trainings (description,user_id,lock_version,created_at,updated_at) VALUES 
('MC1 Set 07.2 Timido B2',2,0,CURDATE(),CURDATE());
-- Fine dati tabella user_trainings

--
-- Agiunta dei dati per la tabella user_training_stories
-- 
INSERT INTO user_training_stories (swam_date,total_training_time,notes,user_training_id,swimming_pool_id,swimmer_level_type_id,user_id,lock_version,created_at,updated_at) VALUES 
('2014-10-21',5700,'Qualche miglioramento alluce nelle partenze',(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from swimming_pools t where t.nick_name = 'reggiocomunale25'),(select t.id from swimmer_level_types t where t.code = 'MX'),2,0,CURDATE(),CURDATE());
-- Fine dati tabella user_training_stories

--
-- Aggiunta dei dati per la tabella user_training_rows
-- 
INSERT INTO user_training_rows (part_order,times,distance,start_and_rest,pause,group_id,group_times,group_start_and_rest,group_pause,user_training_id,exercise_id,training_step_type_id,arm_aux_type_id,kick_aux_type_id,body_aux_type_id,breath_aux_type_id,lock_version,created_at,updated_at) VALUES 
(1,1,200,0,0,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'A1PIAC'),(select t.id from training_step_types t where t.code = 'R'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(2,4,50,60,0,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'ECDOBA'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(3,2,50,60,0,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'ACDOCP'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(4,2,50,0,0,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'ACDODA'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(5,4,50,65,0,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'ECRA2G'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(6,2,50,65,0,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'ACRACP'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(7,2,50,0,0,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'ACRADA'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(8,1,25,50,0,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'A2GUFA'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(9,1,25,50,0,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'A2GUDO'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(10,1,25,0,15,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'ESDORA'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(11,1,25,0,15,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'ESSLRB'),(select t.id from training_step_types t where t.code = 'T'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(12,1,50,60,0,1,2,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'A2FACM'),(select t.id from training_step_types t where t.code = 'A'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(13,1,50,75,0,1,2,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'CGSLRA'),(select t.id from training_step_types t where t.code = 'A'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(14,3,100,120,0,2,3,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'B2SLCM'),(select t.id from training_step_types t where t.code = 'C'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(15,1,100,150,0,2,3,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'A1PIAC'),(select t.id from training_step_types t where t.code = 'C'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(16,8,50,85,0,0,0,0,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'CGSLR3'),(select t.id from training_step_types t where t.code = 'C'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(17,1,50,0,0,3,3,110,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'A2SLCM'),(select t.id from training_step_types t where t.code = 'D'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE()),
(18,1,50,0,0,3,3,110,0,(select t.id from user_trainings t where t.description = 'MC1 Set 07.2 Timido B2'),(select t.id from exercises t where t.code = 'A2DOCM'),(select t.id from training_step_types t where t.code = 'D'),(select t.id from arm_aux_types t where t.code = ''),(select t.id from kick_aux_types t where t.code = ''),(select t.id from body_aux_types t where t.code = ''),(select t.id from breath_aux_types t where t.code = ''),0,CURDATE(),CURDATE());

COMMIT;
-- Fine script
