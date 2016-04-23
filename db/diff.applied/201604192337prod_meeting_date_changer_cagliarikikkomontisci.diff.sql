--
-- Changing meeting 15318-cagliarikikkomontisci from 2016-04-17 to 2016-04-24
-- 19 April 2016 23:37:13
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-04-24'
  WHERE (`id`=15318);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-24'
  WHERE (`id`=1196);

-- 15318-cagliarikikkomontisci date change done
-- Script ended
