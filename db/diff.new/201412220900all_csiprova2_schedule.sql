-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Add schedule details to csi prova 2
update meeting_sessions 
set warm_up_time = '14:00:00', 
begin_time = '14:50:00', 
day_part_type_id = (select dpt.id from day_part_types dpt where dpt.code = 'P') 
where meeting_id = 14102;

COMMIT;
-- Fine script
