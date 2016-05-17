--
-- Changing meeting 14320-romaacqaniene from 2015-04-24 to 2015-04-25
-- 16 May 2016 12:47:51
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-04-25'
  WHERE (`id`=14320);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-04-25'
  WHERE (`id`=756);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-04-26'
  WHERE (`id`=844);

-- 14320-romaacqaniene date change done
-- Script ended
