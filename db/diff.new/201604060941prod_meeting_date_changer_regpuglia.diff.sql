--
-- Changing meeting 15274-regpuglia from 2016-01-31 to 2016-02-07
-- 06 April 2016 09:41:06
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-02-07'
  WHERE (`id`=15274);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-02-28'
  WHERE (`id`=1109);

-- 15274-regpuglia date change done
-- Script ended
