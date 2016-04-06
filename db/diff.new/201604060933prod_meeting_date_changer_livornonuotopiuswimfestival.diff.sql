--
-- Changing meeting 15290-livornonuotopiuswimfestival from 2016-03-06 to 2016-04-03
-- 06 April 2016 09:33:51
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-04-03'
  WHERE (`id`=15290);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-03'
  WHERE (`id`=1138);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-03'
  WHERE (`id`=1139);

-- 15290-livornonuotopiuswimfestival date change done
-- Script ended
