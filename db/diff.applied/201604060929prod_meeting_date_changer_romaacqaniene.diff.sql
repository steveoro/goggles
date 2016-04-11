--
-- Changing meeting 15320-romaacqaniene from 2016-03-23 to 2016-04-23
-- 06 April 2016 09:29:54
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-04-23'
  WHERE (`id`=15320);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-23'
  WHERE (`id`=1199);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-24'
  WHERE (`id`=1200);

-- 15320-romaacqaniene date change done
-- Script ended
