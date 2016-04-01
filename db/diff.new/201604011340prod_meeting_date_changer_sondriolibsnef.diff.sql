--
-- Changing meeting 15255-sondriolibsnef from 2015-12-12 to 2015-12-19
-- 01 April 2016 15:40:37
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-12-19'
  WHERE (`id`=15255);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-19'
  WHERE (`id`=1073);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-19'
  WHERE (`id`=1074);

-- 15255-sondriolibsnef date change done
-- Script ended
