--
-- Changing meeting 15335-palermopinacattarinich from 2016-05-22 to 2016-04-17
-- 19 April 2016 23:34:13
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-04-17'
  WHERE (`id`=15335);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-17'
  WHERE (`id`=1230);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-17'
  WHERE (`id`=1231);

-- 15335-palermopinacattarinich date change done
-- Script ended
