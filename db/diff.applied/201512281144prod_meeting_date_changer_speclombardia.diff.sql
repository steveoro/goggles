--
-- Changing meeting 15232-speclombardia from 2015-11-01 to 2015-10-25
-- 28 December 2015 11:45:15
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-10-25'
  WHERE (`id`=15232);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-10-25'
  WHERE (`id`=1027);

-- 15232-speclombardia date change done
-- Script ended
