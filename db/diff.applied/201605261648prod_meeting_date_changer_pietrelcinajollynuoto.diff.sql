--
-- Changing meeting 15348-pietrelcinajollynuoto from 2016-06-05 to 2016-06-04
-- 26 May 2016 16:48:51
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-06-04'
  WHERE (`id`=15348);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-06-04'
  WHERE (`id`=1254);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-06-04'
  WHERE (`id`=1255);

-- 15348-pietrelcinajollynuoto date change done
-- Script ended
