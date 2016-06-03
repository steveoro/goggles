--
-- Changing meeting 15219-prato from 2016-05-21 to 2016-05-28
-- 26 May 2016 16:46:44
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-05-28'
  WHERE (`id`=15219);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-05-28'
  WHERE (`id`=1009);
UPDATE `meeting_sessions`
  SET `scheduled_date`='1901-01-05'
  WHERE (`id`=1010);

-- 15219-prato date change done
-- Script ended
