-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Fix mixed relays
update event_types et set et.stroke_type_id = (select id from stroke_types where code = 'MX') where et.stroke_type_id = (select id from stroke_types where code = 'MI') and et.partecipants > 1;

COMMIT;
-- Fine script
