--
-- Changing meeting 15247-albenga from 2015-11-22 to 2015-11-15
-- 29 December 2015 20:08:52
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-11-15'
  WHERE (`id`=15247);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-15'
  WHERE (`id`=1058);

-- 15247-albenga date change done
-- Script ended
