--
-- Changing meeting 15334-napoliilgabbiano from 2016-05-21 to 2016-05-29
-- 23 May 2016 08:05:13
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-05-29'
  WHERE (`id`=15334);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-29'
  WHERE (`id`=1226);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-29'
  WHERE (`id`=1227);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-30'
  WHERE (`id`=1228);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-30'
  WHERE (`id`=1229);

-- 15334-napoliilgabbiano date change done
-- Script ended
