--
-- Changing meeting 15339-romaflaminiosg from 2016-05-29 to 2016-05-28
-- 26 May 2016 16:46:10
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-05-28'
  WHERE (`id`=15339);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-28'
  WHERE (`id`=1236);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-28'
  WHERE (`id`=1237);

-- 15339-romaflaminiosg date change done
-- Script ended
