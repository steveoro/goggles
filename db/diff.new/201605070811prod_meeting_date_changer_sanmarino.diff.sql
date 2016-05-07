--
-- Changing meeting 15214-sanmarino from 2016-05-07 to 2016-05-14
-- 07 May 2016 08:11:32
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-05-14'
  WHERE (`id`=15214);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-14'
  WHERE (`id`=997);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-14'
  WHERE (`id`=998);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-15'
  WHERE (`id`=999);

-- 15214-sanmarino date change done
-- Script ended
