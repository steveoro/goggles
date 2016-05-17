--
-- Changing meeting 15329-siracusa from 2016-05-21 to 2016-05-22
-- 16 May 2016 08:48:26
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-05-22'
  WHERE (`id`=15329);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-22'
  WHERE (`id`=1216);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-22'
  WHERE (`id`=1217);

-- 15329-siracusa date change done
-- Script ended
