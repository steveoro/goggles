--
-- Changing meeting 15210-piacenza from 2016-05-29 to 2016-06-04
-- 26 May 2016 16:45:43
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-06-04'
  WHERE (`id`=15210);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-06-04'
  WHERE (`id`=979);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-06-04'
  WHERE (`id`=980);

-- 15210-piacenza date change done
-- Script ended
