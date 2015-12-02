--
-- Changing meeting 15104-csiprova4 from 2016-03-27 to 2016-03-06
-- 02 December 2015 10:19:56
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-03-06'
  WHERE (`id`=15104);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-03-06'
  WHERE (`id`=952);

-- 15104-csiprova4 date change done
-- Script ended
