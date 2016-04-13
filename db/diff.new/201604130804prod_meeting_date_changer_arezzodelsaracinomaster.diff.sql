--
-- Changing meeting 15261-arezzodelsaracinomaster from 2016-01-05 to 2016-01-06
-- 13 April 2016 10:04:21
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-01-06'
  WHERE (`id`=15261);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-06'
  WHERE (`id`=1084);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-06'
  WHERE (`id`=1085);

-- 15261-arezzodelsaracinomaster date change done
-- Script ended
