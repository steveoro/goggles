--
-- Changing meeting 15220-pontedera from 2016-05-14 to 2016-05-21
-- 15 May 2016 23:21:47
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-05-21'
  WHERE (`id`=15220);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-21'
  WHERE (`id`=1011);
UPDATE `meeting_sessions`
  SET `scheduled_date`='1901-01-05'
  WHERE (`id`=1012);

-- 15220-pontedera date change done
-- Script ended
