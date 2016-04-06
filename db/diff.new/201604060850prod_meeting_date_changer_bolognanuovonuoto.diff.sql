--
-- Changing meeting 15208-bolognanuovonuoto from 2016-03-27 to 2016-04-03
-- 06 April 2016 08:50:14
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2016-04-03'
  WHERE (`id`=15208);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2016-04-03'
  WHERE (`id`=976);

-- 15208-bolognanuovonuoto date change done
-- Script ended
