--
-- Changing meeting 15321-civitanovamarche from 2016-03-23 to 2016-04-17
-- 06 April 2016 09:25:40
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-04-17'
  WHERE (`id`=15321);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-17'
  WHERE (`id`=1201);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-18'
  WHERE (`id`=1202);

-- 15321-civitanovamarche date change done
-- Script ended
