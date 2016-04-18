--
-- Changing meeting 15106-csiprova6 from 2016-06-06 to 2016-06-05
-- 18 April 2016 19:59:26
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-06-05'
  WHERE (`id`=15106);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-06-05'
  WHERE (`id`=954);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-06-05'
  WHERE (`id`=955);

-- 15106-csiprova6 date change done
-- Script ended
