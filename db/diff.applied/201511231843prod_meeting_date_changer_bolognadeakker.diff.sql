--
-- Changing meeting 15201-bolognadeakker from 2015-11-08 to 2015-11-15
--
UPDATE `meetings`
  SET `header_date`='2015-11-15'
  WHERE (`id`=15201);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-15'
  WHERE (`id`=956);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-15'
  WHERE (`id`=957);
-- 15201-bolognadeakker date changing script ended
