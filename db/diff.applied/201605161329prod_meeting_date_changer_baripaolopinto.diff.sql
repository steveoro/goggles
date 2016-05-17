--
-- Changing meeting 14315-baripaolopinto from 2015-03-18 to 2015-04-18
-- 16 May 2016 13:29:35
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-04-18'
  WHERE (`id`=14315);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-04-18'
  WHERE (`id`=754);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-04-19'
  WHERE (`id`=839);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-04-19'
  WHERE (`id`=917);

-- 14315-baripaolopinto date change done
-- Script ended
