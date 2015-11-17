--
-- Changing meeting 15216-parmacoopernuoto from 2015-12-13 to 2015-12-20
--
UPDATE `meetings`
  SET `header_date`='2015-12-20'
  WHERE (`id`=15216);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-20'
  WHERE (`id`=1002);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-20'
  WHERE (`id`=1003);
-- 15216-parmacoopernuoto date changing script ended
