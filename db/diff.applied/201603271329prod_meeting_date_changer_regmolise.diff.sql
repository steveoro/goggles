--
-- Changing meeting 15287-regmolise from 2016-02-28 to 2016-03-13
-- 27 March 2016 15:29:26
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-03-13'
  WHERE (`id`=15287);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-03-13'
  WHERE (`id`=1132);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-03-13'
  WHERE (`id`=1133);

-- 15287-regmolise date change done
-- Script ended
