--
-- Changing meeting 15329-siracusa from 2016-05-15 to 2016-05-21
-- 15 May 2016 23:21:17
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-05-21'
  WHERE (`id`=15329);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-21'
  WHERE (`id`=1216);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-21'
  WHERE (`id`=1217);

-- 15329-siracusa date change done
-- Script ended
