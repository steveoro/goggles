--
-- Changing meeting 15233-speclazio from 2015-11-07 to 2015-11-14
-- 29 December 2015 20:08:08
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-11-14'
  WHERE (`id`=15233);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-14'
  WHERE (`id`=1028);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-15'
  WHERE (`id`=1029);

-- 15233-speclazio date change done
-- Script ended
