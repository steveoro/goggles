--
-- Changing meeting 15310-strianocittadistriano from 2016-04-10 to 2016-04-17
-- 06 April 2016 09:19:40
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-04-17'
  WHERE (`id`=15310);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-17'
  WHERE (`id`=1178);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-17'
  WHERE (`id`=1179);

-- 15310-strianocittadistriano date change done
-- Script ended
