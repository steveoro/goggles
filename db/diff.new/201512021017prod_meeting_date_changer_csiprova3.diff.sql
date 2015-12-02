--
-- Changing meeting 15103-csiprova3 from 2016-02-21 to 2016-01-17
-- 02 December 2015 10:17:59
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-01-17'
  WHERE (`id`=15103);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-17'
  WHERE (`id`=951);

-- 15103-csiprova3 date change done
-- Script ended
