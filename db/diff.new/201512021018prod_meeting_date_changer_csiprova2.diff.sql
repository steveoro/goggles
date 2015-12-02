--
-- Changing meeting 15102-csiprova2 from 2016-01-31 to 2016-02-07
-- 02 December 2015 10:18:10
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-02-07'
  WHERE (`id`=15102);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-02-07'
  WHERE (`id`=950);

-- 15102-csiprova2 date change done
-- Script ended
