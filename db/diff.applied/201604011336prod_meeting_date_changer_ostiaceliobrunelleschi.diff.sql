--
-- Changing meeting 15254-ostiaceliobrunelleschi from 2015-12-12 to 2015-12-05
-- 01 April 2016 15:36:22
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-12-05'
  WHERE (`id`=15254);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-05'
  WHERE (`id`=1071);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-06'
  WHERE (`id`=1072);

-- 15254-ostiaceliobrunelleschi date change done
-- Script ended
