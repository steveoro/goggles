--
-- Changing meeting 15314-gualdotadinorolandopinacoli from 2016-03-16 to 2016-04-09
-- 06 April 2016 09:32:41
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-04-09'
  WHERE (`id`=15314);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-09'
  WHERE (`id`=1186);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-10'
  WHERE (`id`=1187);

-- 15314-gualdotadinorolandopinacoli date change done
-- Script ended
