--
-- Changing meeting 15260-palermoduegiornidicloro from 2015-12-20 to 2015-12-13
-- 01 April 2016 15:46:58
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-12-13'
  WHERE (`id`=15260);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-13'
  WHERE (`id`=1082);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-13'
  WHERE (`id`=1083);

-- 15260-palermoduegiornidicloro date change done
-- Script ended
