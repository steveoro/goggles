--
-- Changing meeting 15205-gussago from 2016-01-23 to 2016-01-30
-- 01 February 2016 13:20:49
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-01-30'
  WHERE (`id`=15205);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-30'
  WHERE (`id`=966);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-30'
  WHERE (`id`=967);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-31'
  WHERE (`id`=968);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-01-31'
  WHERE (`id`=969);

-- 15205-gussago date change done
-- Script ended
