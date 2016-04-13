--
-- Changing meeting 15264-buonconvento from 2016-01-16 to 2016-01-23
-- 13 April 2016 10:04:35
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-01-23'
  WHERE (`id`=15264);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-23'
  WHERE (`id`=1090);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-24'
  WHERE (`id`=1091);

-- 15264-buonconvento date change done
-- Script ended
