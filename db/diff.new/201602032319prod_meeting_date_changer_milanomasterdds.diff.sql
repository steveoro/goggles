--
-- Changing meeting 15262-milanomasterdds from 2016-01-09 to 2016-01-10
-- 03 February 2016 23:19:11
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-01-10'
  WHERE (`id`=15262);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-10'
  WHERE (`id`=1086);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-10'
  WHERE (`id`=1087);

-- 15262-milanomasterdds date change done
-- Script ended
