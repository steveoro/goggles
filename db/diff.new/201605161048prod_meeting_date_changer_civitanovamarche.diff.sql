--
-- Changing meeting 14321-civitanovamarche from 2015-03-25 to 2015-04-25
-- 16 May 2016 12:48:00
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-04-25'
  WHERE (`id`=14321);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-04-25'
  WHERE (`id`=757);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-04-26'
  WHERE (`id`=845);

-- 14321-civitanovamarche date change done
-- Script ended
