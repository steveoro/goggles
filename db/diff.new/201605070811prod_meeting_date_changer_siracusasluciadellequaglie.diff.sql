--
-- Changing meeting 15327-siracusasluciadellequaglie from 2016-05-01 to 2016-05-21
-- 07 May 2016 08:11:16
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-05-21'
  WHERE (`id`=15327);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-21'
  WHERE (`id`=1212);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-21'
  WHERE (`id`=1213);

-- 15327-siracusasluciadellequaglie date change done
-- Script ended
