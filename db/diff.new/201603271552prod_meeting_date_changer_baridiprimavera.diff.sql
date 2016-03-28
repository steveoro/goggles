--
-- Changing meeting 15301-baridiprimavera from 2016-03-20 to 2016-03-13
-- 27 March 2016 17:52:07
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-03-13'
  WHERE (`id`=15301);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-03-13'
  WHERE (`id`=1159);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-03-13'
  WHERE (`id`=1160);

-- 15301-baridiprimavera date change done
-- Script ended
