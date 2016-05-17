--
-- Changing meeting 14314-gualdotadinorolandopinacoli from 2015-03-18 to 2015-04-18
-- 16 May 2016 13:20:54
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-04-18'
  WHERE (`id`=14314);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-04-18'
  WHERE (`id`=753);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-04-19'
  WHERE (`id`=838);

-- 14314-gualdotadinorolandopinacoli date change done
-- Script ended
