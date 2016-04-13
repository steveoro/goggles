--
-- Changing meeting 15263-conversanoaironclub from 2016-01-10 to 2016-01-17
-- 13 April 2016 10:04:29
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-01-17'
  WHERE (`id`=15263);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-17'
  WHERE (`id`=1088);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-17'
  WHERE (`id`=1089);

-- 15263-conversanoaironclub date change done
-- Script ended
