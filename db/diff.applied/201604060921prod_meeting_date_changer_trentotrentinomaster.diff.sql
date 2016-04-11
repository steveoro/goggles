--
-- Changing meeting 15313-trentotrentinomaster from 2016-04-16 to 2016-04-09
-- 06 April 2016 09:21:22
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-04-09'
  WHERE (`id`=15313);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-09'
  WHERE (`id`=1184);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-09'
  WHERE (`id`=1185);

-- 15313-trentotrentinomaster date change done
-- Script ended
