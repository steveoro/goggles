--
-- Changing meeting 15106-csiprova6 from 2016-05-22 to 2016-06-06
-- 02 December 2015 10:20:59
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-06-06'
  WHERE (`id`=15106);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-06-06'
  WHERE (`id`=954);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-06-06'
  WHERE (`id`=955);

-- 15106-csiprova6 date change done
-- Script ended
