--
-- Changing meeting 15215-verolanuova from 2015-10-24 to 2015-10-31
-- 28 December 2015 16:26:54
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-10-31'
  WHERE (`id`=15215);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-10-31'
  WHERE (`id`=1000);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-11-01'
  WHERE (`id`=1001);

-- 15215-verolanuova date change done
-- Script ended
