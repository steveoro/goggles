--
-- Changing meeting 14330-trevisoabettiol from 2015-04-22 to 2015-05-22
-- 16 May 2016 09:20:59
-- Begin script
--

UPDATE `meetings`
  SET `header_date`='2015-05-22'
  WHERE (`id`=14330);
UPDATE `meeting_sessions`
  SET `scheduled_date`='2015-05-22'
  WHERE (`id`=759);

-- 14330-trevisoabettiol date change done
-- Script ended
