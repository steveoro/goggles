--
-- Changing meeting 15246-mugnanoblueteam from 2015-11-22 to 2015-11-29
-- 08 January 2016 10:43:46
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-11-29'
  WHERE (`id`=15246);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-29'
  WHERE (`id`=1056);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-29'
  WHERE (`id`=1057);

-- 15246-mugnanoblueteam date change done
-- Script ended
