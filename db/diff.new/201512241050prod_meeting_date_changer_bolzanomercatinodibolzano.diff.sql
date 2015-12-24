--
-- Changing meeting 15252-bolzanomercatinodibolzano from 2015-12-06 to 2015-12-08
-- 24 December 2015 10:50:21
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-12-08'
  WHERE (`id`=15252);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-08'
  WHERE (`id`=1067);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-08'
  WHERE (`id`=1068);

-- 15252-bolzanomercatinodibolzano date change done
-- Script ended
