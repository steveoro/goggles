--
-- Changing meeting 15325-bastiaumbra from 2016-04-30 to 2016-05-01
-- 01 May 2016 19:57:39
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-05-01'
  WHERE (`id`=15325);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-01'
  WHERE (`id`=1208);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-01'
  WHERE (`id`=1209);

-- 15325-bastiaumbra date change done
-- Script ended
