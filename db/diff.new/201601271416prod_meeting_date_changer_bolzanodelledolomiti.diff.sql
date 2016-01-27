--
-- Changing meeting 15266-bolzanodelledolomiti from 2016-01-17 to 2016-01-24
-- 27 January 2016 15:16:57
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-01-24'
  WHERE (`id`=15266);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-24'
  WHERE (`id`=1093);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-24'
  WHERE (`id`=1094);

-- 15266-bolzanodelledolomiti date change done
-- Script ended
