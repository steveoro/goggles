--
-- Changing meeting 15239-vicenzamastervicenza from 2015-11-14 to 2015-11-21
-- 08 January 2016 10:00:38
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-11-21'
  WHERE (`id`=15239);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-21'
  WHERE (`id`=1040);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-21'
  WHERE (`id`=1041);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-22'
  WHERE (`id`=1042);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-22'
  WHERE (`id`=1043);

-- 15239-vicenzamastervicenza date change done
-- Script ended
