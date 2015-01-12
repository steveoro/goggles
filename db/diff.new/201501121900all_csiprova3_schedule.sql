-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Add schedule details to csi prova 3
update meeting_sessions 
set warm_up_time = '14:15:00', 
begin_time = '15:00:00', 
day_part_type_id = (select dpt.id from day_part_types dpt where dpt.code = 'P') 
where meeting_id = 14103;

-- Set meeting invitation (assumes the invitation file has been copied into the filed
update meetings set has_invitation = true where id = 14103;

COMMIT;
-- Fine script
