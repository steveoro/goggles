--
-- Changing meeting 14266-bolzanodelledolomiti from 2014-01-18 to 2015-01-18
--
UPDATE `meetings`
  SET `header_date`='2015-01-18'
  WHERE (`id`=14266);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-01-18'
  WHERE (`id`=711);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-01-18'
  WHERE (`id`=745);
-- 14266-bolzanodelledolomiti date changing script ended
