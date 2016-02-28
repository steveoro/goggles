--
-- Changing meeting 15275-reglombardia from 2016-02-06 to 2016-02-13
-- 28 February 2016 15:07:32
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-02-13'
  WHERE (`id`=15275);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-02-13'
  WHERE (`id`=1110);

-- 15275-reglombardia date change done
-- Script ended
