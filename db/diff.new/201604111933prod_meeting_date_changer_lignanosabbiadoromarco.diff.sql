--
-- Changing meeting 15289-lignanosabbiadoromarco from 2016-02-28 to 2015-12-13
-- 11 April 2016 21:33:46
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-12-13'
  WHERE (`id`=15289);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-13'
  WHERE (`id`=1136);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-12-13'
  WHERE (`id`=1137);

-- 15289-lignanosabbiadoromarco date change done
-- Script ended
