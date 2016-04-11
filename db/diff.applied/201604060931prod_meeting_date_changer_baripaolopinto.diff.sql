--
-- Changing meeting 15315-baripaolopinto from 2016-03-16 to 2016-04-16
-- 06 April 2016 09:31:01
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-04-16'
  WHERE (`id`=15315);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-16'
  WHERE (`id`=1188);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-17'
  WHERE (`id`=1189);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-17'
  WHERE (`id`=1190);

-- 15315-baripaolopinto date change done
-- Script ended
